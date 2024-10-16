return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            pickers = {
                find_files = {
                    hidden = true
                }
            },
            colorscheme = {
                enable_preview = true
            }
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>f', builtin.find_files, {})
        vim.keymap.set('n', '<leader><space>', builtin.commands, {})
        vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    end
}
