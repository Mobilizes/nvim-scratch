return {
	'willothy/nvim-cokeline',
	dependencies = {
		'nvim-lua/plenary.nvim', -- Required for v0.4.0+
		'nvim-tree/nvim-web-devicons', -- If you want devicons
		'stevearc/resession.nvim', -- Optional, for persistent history
	},
	config = function()
		local function get_diagnostics(bufnr, severity)
			local diagnostics = vim.diagnostic.get(bufnr)

			local count = 0
			for _, diag in ipairs(diagnostics) do
				if diag['severity'] == severity then
					count = count + 1
				end
			end

			return count
		end

		local function fg_red(is_focused)
			return is_focused and '#FB4934' or '#CC241D'
		end

		local function fg_yellow(is_focused)
			return is_focused and '#FABD2F' or '#D79921'
		end

		require('cokeline').setup({
			show_if_buffers_are_at_least = 2,
			components = {
				{
					text = function(buffer)
						return ' ' .. buffer.devicon.icon
					end,
					fg = function(buffer)
						return buffer.devicon.color
					end,
				},
				{
					text = function(buffer)
						local text = ' ' .. buffer.filename

						if vim.lsp.get_clients({ bufnr = buffer.number }) == 0 then
							return ''
						end

						local errors = get_diagnostics(buffer.number, vim.diagnostic.severity.ERROR)
						local warnings = get_diagnostics(buffer.number, vim.diagnostic.severity.WARN)

						if errors > 0 then
							text = text .. '  ' .. errors
						end
						if warnings > 0 then
							text = text .. '  ' .. warnings
						end

						return text
					end,
					bold = function(buffer)
						return buffer.is_focused
					end,
					fg = function(buffer)
						if get_diagnostics(buffer.number, vim.diagnostic.severity.ERROR) > 0 then
							return fg_red(buffer.is_focused)
						end
						if get_diagnostics(buffer.number, vim.diagnostic.severity.WARN) > 0 then
							return fg_yellow(buffer.is_focused)
						end
					end,
				},
				{
					text = function(buffer)
						if vim.bo[buffer.number].modified then
							return ' ●'
						end

						return ''
					end,
				},
				{ text = ' ' },
			},
		})
	end,
	keys = {
		{
			'<leader>bd',
			function()
				local current_buf = vim.api.nvim_get_current_buf()

				local function is_valid_target()
					local current = vim.api.nvim_get_current_buf()
					local ft = vim.bo[current].filetype
					return current ~= current_buf and ft ~= 'NvimTree' and ft ~= 'neo-tree'
				end

				vim.cmd('normal \x0f')

				if not is_valid_target() then
					local success, _ = pcall(vim.cmd, 'buffer #')

					if not success or not is_valid_target() then
						vim.api.nvim_feedkeys(
							vim.api.nvim_replace_termcodes('<Plug>(cokeline-focus-prev)', true, false, true),
							'n',
							false
						)
					end
				end

				if vim.api.nvim_get_current_buf() ~= current_buf then
					vim.cmd('bdelete! ' .. current_buf)
				else
					vim.cmd('bdelete!')
				end
			end,
			nd,
			desc = 'Delete current buffer',
			silent = true,
		},
		{ '<S-h>', '<Plug>(cokeline-focus-prev)', silent = true },
		{ '<S-l>', '<Plug>(cokeline-focus-next)', silent = true },
	},
}
