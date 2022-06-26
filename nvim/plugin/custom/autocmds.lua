local group = vim.api.nvim_create_augroup("LspExtensions", {})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.completionProvider then
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    end
    if client.server_capabilities.definitionProvider then
      vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
    end
  end,
  group = group,
})

vim.api.nvim_create_autocmd("LspDetach", {
  callback = function(_)
    vim.opt_local.tagfunc = nil
    vim.opt_local.omnifunc = nil
  end,
  group = group,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufopts = {
      buffer = args.buf,
      silent = true,
    }
    vim.keymap.set("n", "gd", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "gwa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "gwr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "gwl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "grn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "gca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "gf", vim.lsp.buf.format, bufopts)
  end,
  group = group,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    vim.api.nvim_set_current_dir(client.config.root_dir)
  end,
  group = group,
})
