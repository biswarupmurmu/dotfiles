local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Open a new, empty buffer in a vertical split
map('n', '<leader>wv', '<cmd>vnew<CR>', { desc = 'New empty buffer vertically', noremap = true, silent = true })

-- Open a new, empty buffer in a horizontal split
map('n', '<leader>ws', '<cmd>new<CR>', { desc = 'New empty buffer horizontally', noremap = true, silent = true })

-- 2. Window Navigation
map('n', '<leader>wh', '<C-w>h', { desc = 'Move to left window', noremap = true, silent = true })
map('n', '<leader>wj', '<C-w>j', { desc = 'Move to bottom window', noremap = true, silent = true })
map('n', '<leader>wk', '<C-w>k', { desc = 'Move to top window', noremap = true, silent = true })
map('n', '<leader>wl', '<C-w>l', { desc = 'Move to right window', noremap = true, silent = true })

-- 1. Resize Windows (using Shift + H, J, K, L)
map('n', '<leader>wH', '<cmd>vertical resize -5<CR>', { desc = 'Decrease window width', noremap = true, silent = true })
map('n', '<leader>wL', '<cmd>vertical resize +5<CR>', { desc = 'Increase window width', noremap = true, silent = true })
map('n', '<leader>wJ', '<cmd>resize -5<CR>', { desc = 'Decrease window height', noremap = true, silent = true })
map('n', '<leader>wK', '<cmd>resize +5<CR>', { desc = 'Increase window height', noremap = true, silent = true })

-- 2. Equalize Windows
map('n', '<leader>w=', '<C-w>=', { desc = 'Equalize all window sizes', noremap = true, silent = true })
