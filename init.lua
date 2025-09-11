vim.cmd('set expandtab')
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set nu rnu')
vim.cmd('set clipboard=unnamedplus')

vim.diagnostic.config({
	virtual_text = {
		prefix = '●', -- could be "●", "▎", "x", etc.
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require('config.lazy')
require('config.setup')
require('config.autocmds')
require('config.keymaps')

vim.cmd('colorscheme catppuccin-mocha')

local function hsv_to_hex(h, s, v)
	local c = v * s
	local x = c * (1 - math.abs((h / 60) % 2 - 1))
	local m = v - c

	local r_, g_, b_

	if h < 60 then
		r_, g_, b_ = c, x, 0
	elseif h < 120 then
		r_, g_, b_ = x, c, 0
	elseif h < 180 then
		r_, g_, b_ = 0, c, x
	elseif h < 240 then
		r_, g_, b_ = 0, x, c
	elseif h < 300 then
		r_, g_, b_ = x, 0, c
	else
		r_, g_, b_ = c, 0, x
	end

	local r = math.floor((r_ + m) * 255 + 0.5)
	local g = math.floor((g_ + m) * 255 + 0.5)
	local b = math.floor((b_ + m) * 255 + 0.5)

	return string.format('#%02X%02X%02X', r, g, b)
end

local hue = 0
local function animate()
	hue = (hue + 5) % 360
	local color = hsv_to_hex(hue, 1, 1)
	vim.api.nvim_set_hl(0, 'CursorLine', { fg = color })
	vim.api.nvim_set_hl(0, 'LineNr', { fg = color })

	vim.defer_fn(animate, 100)
end

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#45454d' })
animate()
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#45454d' })
