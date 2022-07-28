local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.load_extension('fzf')
-- telescope.load_extension('coc')

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_previewers_next,
            },
        },
        buffers = {
            ignore_current_buffer = true,
            sort_mru = true
        }
    }
}
