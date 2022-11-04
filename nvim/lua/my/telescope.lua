local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.load_extension('fzf')
-- telescope.load_extension('coc')
telescope.load_extension("ui-select")
telescope.load_extension('media_files')

telescope.setup {
    defaults = {
        pickers = {
            find_files = {
                hidden = true
            }
        },
        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_previewers_next,
            },
        },
        buffers = {
            ignore_current_buffer = true,
            sort_mru = true
        }
    },
    extensions = {
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    },
}
