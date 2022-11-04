local hop = require 'hop'

local M = {}

local function normal(c)
    vim.cmd(":normal " .. c)
end

local function leap_return()
    normal '`l'
end

local function read_input()
    local result = vim.fn.nr2char(vim.fn.getchar())
    if result == 'i' or result == 'a' then
        result = result .. vim.fn.nr2char(vim.fn.getchar())
    end
    return result
end

local function get_target()
    local target = read_input()
    if target == 'p' then
        target = 'i' .. target
    elseif target == 'f' then
        target = 'a' .. target
    end
    return target
end

local function line_target(action)
    local tbl = { chuck = "d", yank = "y", take = "V", bring = "y", move = "d" }
    return tbl[action]
end

local line_character = "."

M.leap = function()
    normal 'ml' -- create mark at l
    hop.hint_words()
end

M.perform = function(action, target, motion)
    normal 'ml' -- create mark at l
    if target == nil then
        target = get_target()
    end
    if target == line_character then
        target = line_target(action)
    end
    if motion == "" or motion == nil then
        hop.hint_words()
    else
        normal(motion)
    end
    if action == 'take' then
        normal('v' .. target)
    elseif action == 'take' and target == line_character then
        normal('V' .. target)
    elseif action == 'chuck' then
        normal('"_d' .. target)
        leap_return()
    elseif action == 'yank' then
        normal('y' .. target)
        leap_return()
    elseif action == 'move' then
        normal('d' .. target)
        leap_return()
        normal 'P'
    elseif action == 'bring' then
        normal('y' .. target)
        leap_return()
        normal 'p'
    else
        error("invalid operation")
    end
end

return M
