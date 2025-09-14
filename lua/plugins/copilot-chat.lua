return {
	{
		'CopilotC-Nvim/CopilotChat.nvim',
		dependencies = {
			{ 'nvim-lua/plenary.nvim', branch = 'master' },
		},
		build = 'make tiktoken',
		keys = {
			{
				'<leader>aa',
				'<cmd>CopilotChatToggle<cr>',
				desc = 'Toggle Copilot Chat',
				mode = { 'n', 'v' },
			},
		},
		config = {
			window = {
				layout = 'float',
				width = 80,
				height = 20,
				border = 'rounded',
				title = '🤖 AI Assistant',
				zindex = 100,
			},
			headers = {
				user = '👤 You',
			},
		},
	},
	{
		'folke/which-key.nvim',
		opts = function()
			local wk = require('which-key')

			wk.add({
				{ '<leader>a', '', group = 'Copilot', icon = '' },
			})
		end,
	},
}
