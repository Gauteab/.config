
require'nvim-tree'.setup()

require'git-delta'

require('neogit').setup {
    integrations = {
     use { 
       'TimUntersberger/neogit', 
       requires = { 
         'nvim-lua/plenary.nvim',
         'sindrets/diffview.nvim' 
       }
     }
    diffview = true  
  }
}

local lsp = require'lspconfig'

lsp.elmls.setup{}

require('telescope').load_extension('fzf')

-- require('lualine').setup {
--   options = {
--     -- theme = 'material-nvim',
--     sections = { 
--         lualine_f = { "filename", lsp_status.status }
--     }
--   }
-- }
