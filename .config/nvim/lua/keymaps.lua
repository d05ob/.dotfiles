
local nnoremap = vim.keymap.set
local silent = { silent = true }

-- Make ctrl-c behave like esc
nnoremap("!", "<C-c>", "<Esc>", silent)
nnoremap("n", "<C-c>", "<silent> <C-c>")

-- Make global marks resume to prev line in buffer
nnoremap('n', "'M", "'M'\"zz")
nnoremap('n', "'N", "'N'\"zz")
nnoremap('n', "'J", "'J'\"zz")
nnoremap('n', "'K", "'K'\"zz")
nnoremap('n', "'L", "'L'\"zz")
nnoremap('n', "'H", "'H'\"zz")

-- resizing splits
local splits = require("smart-splits")
nnoremap('n', '<S-h>', splits.resize_left)
nnoremap('n', '<S-j>', splits.resize_down)
nnoremap('n', '<S-k>', splits.resize_up)
nnoremap('n', '<S-l>', splits.resize_right)

-- moving between splits
nnoremap('n', '<C-h>', splits.move_cursor_left)
nnoremap('n', '<C-j>', splits.move_cursor_down)
nnoremap('n', '<C-k>', splits.move_cursor_up)
nnoremap('n', '<C-l>', splits.move_cursor_right)

-- swapping buffers between windows
nnoremap('n', '<A-h>', splits.swap_buf_left)
nnoremap('n', '<A-j>', splits.swap_buf_down)
nnoremap('n', '<A-k>', splits.swap_buf_up)
nnoremap('n', '<A-l>', splits.swap_buf_right)

-- Fuzzy finding
local telescope = require('telescope.builtin')
nnoremap('n', '<C-e>', telescope.find_files)
nnoremap('n', '<C-g>', telescope.live_grep)
nnoremap('n', '<C-f>', telescope.buffers)

-- Open file explorer
nnoremap("n", "<C-b>", ":Neotree toggle <CR>", silent)

