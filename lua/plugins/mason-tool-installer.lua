return {
	'WhoIsSethDaniel/mason-tool-installer.nvim',
	dependencies = { 'mason-org/mason.nvim' },
	opts = {
		ensure_installed = {
			'luacheck',
			'clang-format',
			'php-cs-fixer',
			'blade-formatter',
			'stylua',
			'black',
			'duster',
			'prettier',
			'shfmt',
			'goimports',
			'fixjson',
			'cmakelang',
			'sql-formatter',
		},
	},
}
