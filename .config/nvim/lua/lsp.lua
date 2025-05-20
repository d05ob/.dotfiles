-- lua/lsp.lua

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then desc = "LSP: " .. desc end
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")

  vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.enable({
  capabilities = capabilities,
  on_attach = on_attach,
  servers = {
    lua_ls = {
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    },
    clangd = {},
    pyright = {},
    rust_analyzer = {},
    gopls = {},
    html = {},
    cssls = {},
    ts_ls = {},
  },
})

vim.o.signcolumn = "yes" 

vim.diagnostic.config({
  virtual_text = true,     -- show error/warning text inline 
})

