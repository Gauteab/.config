-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- OR setup with some options
return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        local tree = require("nvim-tree").setup {
            sort = { sorter = "case_sensitive", },
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            } }
        vim.keymap.set('n', '<leader>e', ':NvimTreeOpen\n')
    end
}
