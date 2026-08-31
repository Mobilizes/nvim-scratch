return {
	'MagicDuck/grug-far.nvim',
	keys = {
		{
			'<leader>sr',
			function()
				local grug = require('grug-far')
				-- TODO: i legit have no idea how to make the search window go in the right like in lazyvim
				grug.open({
					openTargetWindow = {
						preferredLocation = 'right',
					},
				})
			end,
			desc = 'Grep workspace',
			silent = true,
		},
	},
}
