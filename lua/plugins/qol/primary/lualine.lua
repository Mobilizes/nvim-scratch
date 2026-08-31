return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local function StatusLineCopilot()
			if vim.fn['copilot#Enabled']() == 1 then
				return ' '
			else
				return ''
			end
		end

		require('lualine').setup({
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch' },
				lualine_c = { { 'filename', path = 1 } },
				lualine_x = { StatusLineCopilot, 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' },
			},
		})
	end,
}
