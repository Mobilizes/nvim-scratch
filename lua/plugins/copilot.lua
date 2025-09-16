return {
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
}
