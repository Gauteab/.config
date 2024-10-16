return {
    "folke/tokyonight.nvim",
    config = function()
        require('tokyonight').setup({
            style = "night",
            transparent = true,
            terminal_colors = true,
            styles = {
                sidebars = "transparent", -- style for sidebars, see below
                floats = "transparent",
            }
        })
        vim.cmd("colorscheme tokyonight-moon")
    end
}
