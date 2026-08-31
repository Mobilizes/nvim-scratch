return {
	'WhoIsSethDaniel/mason-tool-installer.nvim',
	dependencies = { 'mason-org/mason.nvim' },
	opts = {
		ensure_installed = {
			'luacheck',
			'clang-format',
			'stylua',
			'black',
			'prettier',
			'shfmt',
			'goimports',
			'fixjson',
			'cmakelang',
		},
	},
}
