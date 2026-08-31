local function install_query_handler_compat()
	local query = require('vim.treesitter.query')

	local html_script_type_languages = {
		importmap = 'json',
		module = 'javascript',
		['application/ecmascript'] = 'javascript',
		['text/ecmascript'] = 'javascript',
	}

	local language_aliases = {
		ex = 'elixir',
		pl = 'perl',
		sh = 'bash',
		ts = 'typescript',
		uxn = 'uxntal',
	}

	local function capture_node(match, capture_id)
		local nodes = match[capture_id]
		if type(nodes) == 'table' then
			return nodes[1]
		end
		return nodes
	end

	local function get_parser_from_info_string(injection_alias)
		local filetype = vim.filetype.match({ filename = 'a.' .. injection_alias })
		return filetype or language_aliases[injection_alias] or injection_alias
	end

	local opts = { force = true }

	query.add_predicate('nth?', function(match, _, _, pred)
		local node = capture_node(match, pred[2])
		local n = tonumber(pred[3])

		if not node or not n or not node:parent() then
			return false
		end

		local parent = node:parent()
		return parent:named_child_count() > n and parent:named_child(n) == node
	end, opts)

	query.add_predicate('is?', function(match, _, bufnr, pred)
		local node = capture_node(match, pred[2])
		if not node then
			return true
		end

		local locals = require('nvim-treesitter.locals')
		local _, _, kind = locals.find_definition(node, bufnr)
		return vim.tbl_contains({ unpack(pred, 3) }, kind)
	end, opts)

	query.add_predicate('kind-eq?', function(match, _, _, pred)
		local node = capture_node(match, pred[2])
		if not node then
			return true
		end

		return vim.tbl_contains({ unpack(pred, 3) }, node:type())
	end, opts)

	query.add_directive('set-lang-from-mimetype!', function(match, _, bufnr, pred, metadata)
		local node = capture_node(match, pred[2])
		if not node then
			return
		end

		local type_attr_value = vim.treesitter.get_node_text(node, bufnr)
		local configured = html_script_type_languages[type_attr_value]
		if configured then
			metadata['injection.language'] = configured
			return
		end

		local parts = vim.split(type_attr_value, '/', {})
		metadata['injection.language'] = parts[#parts]
	end, opts)

	query.add_directive('set-lang-from-info-string!', function(match, _, bufnr, pred, metadata)
		local node = capture_node(match, pred[2])
		if not node then
			return
		end

		local injection_alias = vim.treesitter.get_node_text(node, bufnr):lower()
		metadata['injection.language'] = get_parser_from_info_string(injection_alias)
	end, opts)

	query.add_directive('make-range!', function() end, opts)

	query.add_directive('downcase!', function(match, _, bufnr, pred, metadata)
		local capture_id = pred[2]
		local node = capture_node(match, capture_id)
		if not node then
			return
		end

		local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[capture_id] }) or ''
		metadata[capture_id] = metadata[capture_id] or {}
		metadata[capture_id].text = string.lower(text)
	end, opts)
end

return {
	'nvim-treesitter/nvim-treesitter',
	branch = 'master',
	lazy = false,
	build = ':TSUpdate',
	main = 'nvim-treesitter.configs',
	config = function(_, opts)
		require('nvim-treesitter.configs').setup(opts)
		install_query_handler_compat()
	end,
	opts = {
		ensure_installed = {
			'lua',
			'python',
			'javascript',
			'typescript',
			'html',
			'css',
			'json',
			'php',
			'bash',
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	},
}
