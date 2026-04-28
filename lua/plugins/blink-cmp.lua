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
}
