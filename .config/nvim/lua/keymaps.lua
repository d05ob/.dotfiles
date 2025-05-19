local function nnoremap(lhs, rhs, opts)
  vim.keymap.set("n", lhs, rhs, vim.tbl_extend("force", { noremap = true }, opts or {}))
end

local telescope = require('telescope.builtin')

nnoremap('<C-e>', telescope.find_files)
nnoremap('<C-g>', telescope.live_grep)
nnoremap('<C-f>', telescope.buffers)
nnoremap('<C-b>', ':Neotree toggle<CR>', { silent = true })
nnoremap('<leader>f', ':Format<CR>', { silent = true })
nnoremap('<leader><Tab>', ':bnext<CR>')
nnoremap('<leader><S-Tab>', ':bprevious<CR>')
