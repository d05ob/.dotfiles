local function nnoremap(lhs, rhs, opts)
  vim.keymap.set("n", lhs, rhs, vim.tbl_extend("force", { noremap = true }, opts or {}))
end

local telescope = require('telescope.builtin')

-- Telescope mappings
nnoremap('<C-e>', telescope.find_files)
nnoremap('<C-g>', telescope.live_grep)
nnoremap('<C-f>', telescope.buffers)

-- Neotree toggle
nnoremap('<C-b>', ':Neotree toggle<CR>', { silent = true })

-- Format current buffer
nnoremap('<leader>f', ':Format<CR>', { silent = true })

-- Close current buffer
nnoremap('<leader><leader>', ':bdelete<CR>', {silent = true})

-- Buffer navigation
nnoremap('<leader><Tab>', ':bnext<CR>')
nnoremap('<leader><S-Tab>', ':bprevious<CR>')


-- Diagnostics
nnoremap('<leader>d', function()
  vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
end, { desc = "Show line diagnostics" })

nnoremap('<leader>q', vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })
