require("my.cmp")
require("my.lsp")
require("my.lualine")
require("my.telescope")
require("my.treesitter")

require("hop").setup { multi_windows = true }

require("luasnip.loaders.from_vscode").load()
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
