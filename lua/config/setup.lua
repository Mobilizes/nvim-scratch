vim.lsp.enable('laravel_ls')

vim.lsp.config.clangd = {
	cmd = {
		'clangd',
		'--background-index',
		'--clang-tidy',
		'--completion-style=detailed',
		'--function-arg-placeholders',
		'--fallback-style=google',
		'--enable-config',
		'--header-insertion=never',
	},
	root_markers = { '.clangd', 'compile_commands.json' },
	filetypes = { 'c', 'cpp' },
}

vim.lsp.config('pylsp', {
	settings = {
		pylsp = {
			plugins = {
				jedi_completion = {
					include_class_objects = true,
					include_function_objects = true,
				},
				-- mccabe = {
				-- 	enabled = false,
				-- },
				-- pyflakes = {
				-- 	enabled = false,
				-- },
				-- pycodestyle = {
				-- 	enabled = false,
				-- },
			},
		},
	},
})
