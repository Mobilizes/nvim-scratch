-- ~/.config/nvim/lua/plugins/illuminate.lua
-- automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
return {
	{
		'RRethy/vim-illuminate',
		opts = {
			providers = { 'lsp', 'regex' }, -- remove treesitter
		},
		config = function(_, opts)
			require('illuminate').configure(opts)
		end,
	},
}
