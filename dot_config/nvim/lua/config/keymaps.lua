vim.keymap.set('n', '<S-Left>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Right>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Up>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Down>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('v', 'rr', '"hy:%s/<C-r>h//g<Left><Left>', { noremap = true, silent = false, })

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('i', 'jk', '<Esc>')

vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

