-- Fidget is an unintrusive window in the corner of your editor that manages its own lifetime. Its goals are:
--   to provide a UI for Neovim's $/progress handler
--   to provide a configurable vim.notify() backend
--   to support basic ASCII animations (Fidget spinners!) to indicate signs of life
--   to be easy to configure, sane to maintain, and fun to hack on
return {
	'j-hui/fidget.nvim',
	opts = {
		progress = {
			display = {
				render = function(msgs)
					local lines = {}
					for _, msg in ipairs(msgs) do
						if msg.percentage then
							local bar_length = 20
							local filled = math.floor(msg.percentage / 100 * bar_length)
							local bar = string.rep('█', filled) .. string.rep('░', bar_length - filled)
							table.insert(
								lines,
								string.format('[%s] %s %d%%', bar, msg.title or '', msg.percentage)
							)
						else
							table.insert(lines, msg.title or '')
						end
					end
					return lines
				end,
			},
		},
	},
}
