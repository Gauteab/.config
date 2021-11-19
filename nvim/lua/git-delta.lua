
-- Implement delta as previewer for diffs

local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')
local conf = require('telescope.config')
local M = {}

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    -- this is for status
    -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
    -- just do an if and return a different command
    if entry.status == '??' or 'A ' then
      return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=true', 'diff', entry.value }
    end

    -- note we can't use pipes
    -- this command is for git_commits and git_bcommits
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=true', 'diff', entry.value .. '^!' }

  end
}

M.git_commits_delta = function(opts)
  opts = opts or {}
  opts.previewer = delta
  builtin.git_commits(opts)
end

M.git_bcommits_delta = function(opts)
  opts = opts or {}
  opts.previewer = delta
  builtin.git_bcommits(opts)
end

M.git_status_delta = function(opts)
  opts = opts or {}
  opts.previewer = delta
  builtin.git_status(opts)
end

local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

local m = {}

M.my_buffer = function()
  require'telescope.builtin'.buffers{
    attach_mappings = function(prompt_bufnr, map)
      local delete_buf = function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
      end

      map('i', '<c-u>', delete_buf)

      return true
    end
  }
end

return m


return M
