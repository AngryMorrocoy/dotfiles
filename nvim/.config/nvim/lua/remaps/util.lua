local this = {}
local api = vim.api

local function nvim_map(mode, lhs, rhs, opts, bufonly)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    if bufonly then
        api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
    else
        api.nvim_set_keymap(mode, lhs, rhs, options)
    end
end

function this.map_all(mapsList, bufonly)
    for key, value in pairs(mapsList) do
        local mode, trigger = key:match("^([^|]*)|(.*)")
        nvim_map(mode, trigger, value.action, value.opts, bufonly)
    end
end

return this
