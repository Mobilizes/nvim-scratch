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
