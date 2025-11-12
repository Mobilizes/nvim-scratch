vim.api.nvim_create_user_command("LspDetach", function()
  for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
    vim.lsp.buf_detach_client(0, client.id)
    print("Detached LSP:", client.name)
  end
end, {})

