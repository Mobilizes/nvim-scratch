return {
	'3rd/image.nvim',
	build = false,
	opts = {
		processor = 'magick_rock',
	},
	config = function(_, opts)
		local image = require('image')
		image.setup(opts)
		image.enable()
	end,
}
