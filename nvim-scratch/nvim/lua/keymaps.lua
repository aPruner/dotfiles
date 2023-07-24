-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- NvimTree
vim.keymap.set('n', '<leader>e', "<cmd>:NvimTreeToggle<CR>", {})

-- Buffer management
vim.keymap.set('n', '<Tab>', "<cmd>:bprev<CR>", {})
vim.keymap.set('n', '<S-Tab>', "<cmd>:bnext<CR>", {})

vim.keymap.set('n', '<S-x>', "<cmd>:bd<CR>", {})

-- Window split switching
vim.keymap.set('n', '<C-h>', "<cmd>:wincmd h<CR>", {silent = true})
vim.keymap.set('n', '<C-j>', "<cmd>:wincmd j<CR>", {silent = true})
vim.keymap.set('n', '<C-k>', "<cmd>:wincmd k<CR>", {silent = true})
vim.keymap.set('n', '<C-l>', "<cmd>:wincmd l<CR>", {silent = true})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


