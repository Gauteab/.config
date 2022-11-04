require 'lualine'.setup {
    options = { theme = 'material-nvim' },
    sections = {
        lualine_a = {
            { 'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
        },
        lualine_c = {},
        lualine_x = { "filetype" },
        lualine_y = {}
    }
}
