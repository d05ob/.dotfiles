require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright",        -- Python
        "rust_analyzer",  -- Rust
        "typescript-language-server",
        "html",          -- HTML
        "cssls",          -- CSS
        "clangd",         -- C & C++
        "omnisharp",      -- C#
        "lua_ls",
    },
    automatic_installation = true,
})
