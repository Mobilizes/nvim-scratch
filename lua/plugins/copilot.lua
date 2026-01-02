return {
	{
		'github/copilot.vim',
		config = function()
			vim.g.copilot_enabled = false
			vim.g.copilot_no_tab_map = true

			vim.keymap.set('i', '<M-l>', '<Plug>(copilot-accept-word)', {
				desc = 'Accept Copilot next word',
				silent = true,
				noremap = false,
			})

			vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
				desc = 'Accept Copilot suggestion',
				silent = true,
				expr = true,
				replace_keycodes = false,
			})

			vim.keymap.set('n', '<leader>at', function()
				if vim.g.copilot_enabled then
					vim.g.copilot_enabled = false
				else
					vim.g.copilot_enabled = true
				end
			end, { desc = 'Toggle Copilot Cmd' })
		end,
	},
	{
		'CopilotC-Nvim/CopilotChat.nvim',
		enabled = true,
		dependencies = {
			{ 'nvim-lua/plenary.nvim', branch = 'master' },
		},
		build = 'make tiktoken',
		keys = {
			{
				'<leader>aa',
				function()
					local window = require('CopilotChat').chat

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
				{ '<leader>a', '', group = 'AI', icon = '' },
				{ '<leader>a', '', group = 'AI', icon = '', mode = 'v' },
			})
		end,
	},
}
