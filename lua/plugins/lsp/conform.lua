return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			lua = { 'stylua' },
			c = { 'clang-format' },
			cpp = { 'clang-format' },
			cmake = { 'cmake_format' },
			php = { 'php_cs_fixer' },
			blade = { 'blade-formatter' },
			python = { 'black' },
			javascript = { 'prettier' },
			typescript = { 'prettier' },
			html = { 'prettier' },
			css = { 'prettier' },
			sh = { 'shfmt' },
			bash = { 'shfmt' },
			zsh = { 'shfmt' },
			go = { 'goimports' },
			json = { 'fixjson' },
			dart = { 'dart_format' },
			sql = { 'sql-formatter' },
		},
		formatters = {
			clang_format = {
				prepend_args = { '--style=file', '--fallback-style=google' },
			},
			dart_format = {
				command = 'dart',
				args = { 'format', '$FILENAME' },
				stdin = false,
			},
		},
	},
}
