local core_utils = require("core.util")
local nvim_set_autocmd = core_utils.nvim_set_autocmd
local nvim_create_augroup = core_utils.nvim_create_augroup

local M = {}

local function callUtilAutoCommand(command, params)
    local util_autocommand = 'call v:lua.require("core.util").autocommands'
    if params then
        return util_autocommand .. "." .. command .. "(" .. params .. ")"
    else
        return util_autocommand .. "." .. command .. "()"
    end
end

local function callUtilCommand(command, params)
    local util_command = 'call v:lua.require("core.util")'
    if params then
        return util_command .. "." .. command .. "(" .. params .. ")"
    else
        return util_command .. "." .. command .. "()"
    end
end

function M.setup()
    nvim_set_autocmd({"BufWritepre", "*", callUtilAutoCommand("autoformat")}) -- Fuck ugly code xd

    nvim_set_autocmd({"BufWritePost", "*", "%s:\\s\\+$::e"}) -- Fuck trailing withespaces
    -- Put the cursor on the last known position
    nvim_set_autocmd({"BufReadPost", "*", callUtilAutoCommand("jump_to_last_known_cursor_position")})
    nvim_set_autocmd(
        {
            "Colorscheme",
            "*", -- For viewing a very nice vertsplit
            core_utils.nvim_set_highlight("VertSplit", {ctermbg = "NONE", guibg = "NONE", guifg = "fg"}, true)
        }
    )

    nvim_create_augroup(
        "TermStuff", -- Augroup for terminal autocommands
        {
            -- Disable number and relativenumber on terminal buffers
            {
                "TermOpen",
                "*",
                callUtilCommand("nvim_load_opts", '{"bh": "hide"}')
            },
            -- Startinsert when enters a terminal buffer
            {"TermOpen", "*", "startinsert"},
            -- Stopinsert when leaving a terminal buffer
            {"BufLeave", "term://*", "stopinsert"}
        }
    )

    -- Load all the syntax specific configs
    nvim_set_autocmd({"FileType", "*", callUtilAutoCommand("load_syntax_specific_opts")})
    nvim_set_autocmd({"BufEnter", "*.http,*.rest", "set filetype=http"})
    nvim_set_autocmd({"TextYankPost", "*", "silent!", "lua vim.highlight.on_yank {higroup='PmenuSel', timeout=150}"})
    -- vim.api.nvim_command("au BufWritePost * lua require('lint').try_lint()")
    nvim_set_autocmd({"BufWritePost", "*", "lua require('lint').try_lint()"})
end

return M
