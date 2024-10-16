
vim.g.mapleader = " "

-- search with 's'
vim.keymap.set("n", "s", "/")
vim.keymap.set("n", "S", "?")

-- windowing
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>vs", ":vs\n")
vim.keymap.set("n", "<leader>sp", ":sp\n")

vim.keymap.set("n", "<C-q>", ":quit\n")

vim.keymap.set("n", "<leader>so", ":w\n:so\n")

vim.keymap.set('n', '√', vim.diagnostic.goto_next)
vim.keymap.set('n', 'ª', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
