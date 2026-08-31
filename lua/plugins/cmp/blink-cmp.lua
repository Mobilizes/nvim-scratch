return {
	'saghen/blink.cmp',
	-- enabled = false,
	-- optional: provides snippets for the snippet source
	-- dependencies = { 'rafamadriz/friendly-snippets' },

	version = '1.*',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = 'default',

			['<C-k>'] = { 'show', 'fallback' },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = 'mono',
		},

		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
			ghost_text = { enabled = false },

			menu = {
				border = 'rounded',
				draw = {
					columns = {
						{ 'kind_icon', 'kind', gap = 1 },
						{ 'label', 'label_description', gap = 1 },
					},
					components = {
						kind_icon = {
							ellipsis = false,
							text = function(ctx)
								-- Hardcode the space to avoid the 'nil' error
								return ctx.kind_icon .. ' '
							end,
							highlight = function(ctx)
								return 'BlinkCmpKind' .. ctx.kind
							end,
						},
						kind = {
							ellipsis = false,
							text = function(ctx)
								return ctx.kind
							end,
							highlight = function(ctx)
								return 'BlinkCmpKind' .. ctx.kind
							end,
						},
					},
				},
			},
		},

		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},

		fuzzy = { implementation = 'prefer_rust_with_warning' },
	},
	opts_extend = { 'sources.default' },
	config = function(_, opts)
		require('blink.cmp').setup(opts)

		local set_hl = vim.api.nvim_set_hl

		set_hl(0, 'BlinkCmpMenu', { bg = '#1e222a', fg = '#abb2bf' })
		set_hl(0, 'BlinkCmpMenuBorder', { fg = '#3e4452', bg = '#1e222a' })
		set_hl(0, 'BlinkCmpMenuSelection', { bg = '#3e4452', fg = 'NONE', bold = true })
		set_hl(0, 'BlinkCmpKindFunction', { fg = '#c678dd' })
		set_hl(0, 'BlinkCmpKindVariable', { fg = '#e06c75' })
		set_hl(0, 'BlinkCmpKindKeyword', { fg = '#56b6c2' })
		set_hl(0, 'BlinkCmpKindSnippet', { fg = '#d19a66' })
	end,
}
