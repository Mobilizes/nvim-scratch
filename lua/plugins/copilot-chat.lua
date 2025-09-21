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
				function()
					local window = require('CopilotChat').chat
					local floater = require('customs.floater')
					if floater:visible() then
						floater:hide()
					end

					if window:visible() and window:focused() then
						vim.cmd('CopilotChatClose')
						vim.cmd('stopinsert')
					elseif window:visible() then
						window:focus()
						vim.cmd('startinsert')
					else
						vim.cmd('CopilotChatOpen')
						vim.cmd('startinsert')
					end
				end,
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
