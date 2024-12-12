-- ~/.config/nvim/lua/core/utils.lua

local M = {}

-- Example function to get highlight groups
M.get_hlgroup = function(group, fallback)
    local hl = vim.api.nvim_get_hl_by_name(group, true)
    if hl then
        return hl
    else
        return fallback or {}
    end
end

-- Example function to get the number of buffers
M.get_buffer_count = function()
    return #vim.api.nvim_list_bufs()
end

return M
