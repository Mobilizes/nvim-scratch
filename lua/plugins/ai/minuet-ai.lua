return {
	'milanglacier/minuet-ai.nvim',
  enabled = false,
	config = function()
		require('minuet').setup({
			provider = 'gemini',
			provider_options = {
				model = 'gemini-3-flash-preview',
				api_key = 'GEMINI_API_KEY',
			},
		})
	end,
}
