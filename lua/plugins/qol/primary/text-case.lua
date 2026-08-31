return {
	'johmsalas/text-case.nvim',
	config = function()
		require('textcase').setup({})
	end,
	keys = {
		'ga', -- Default invocation prefix
	},
}
