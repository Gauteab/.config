

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
