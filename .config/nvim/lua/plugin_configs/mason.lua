
-- lua/plugin_configs/mason.lua
require("mason").setup()

require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",       -- Lua
    "clangd",       -- C/C++
    "pyright",      -- Python
    "rust_analyzer",-- Rust
    "gopls",        -- Go
    "html",         -- Web
    "cssls",
    "ts_ls",
  }
}
