local core_utils = require("core.util")

local M = {}

function M.setup()
    vim.api.nvim_create_autocmd(
        "BufReadPost",
        {
            callback = core_utils.autocommands.jump_to_last_known_cursor_position
        }
    ) -- Put the cursor on the last known position

    vim.api.nvim_create_autocmd("BufWritePost", {command = "%s:\\s\\+$::e"}) -- Fuck trailing withespaces

    vim.api.nvim_create_autocmd(
        "BufWritePre",
        {
            callback = core_utils.autocommands.autoformat
        }
    )

    vim.api.nvim_create_autocmd(
        "Colorscheme",
        {
            command = core_utils.nvim_set_highlight("VertSplit", {ctermbg = "NONE", guibg = "NONE", guifg = "fg"}, true)
        } -- For viewing a very nice vertsplit
    )

    vim.api.nvim_create_autocmd(
        "Filetype",
        {
            callback = core_utils.autocommands.load_syntax_specific_opts
        }
    ) -- Load all the syntax specific configs

    vim.api.nvim_create_autocmd(
        "BufEnter",
        {
            pattern = {"*.http", "*.rest"},
            command = "set filetype=http"
        }
    ) -- To set coloring in rest files

    vim.api.nvim_create_autocmd(
        "TextYankPost",
        {
            callback = function()
                vim.highlight.on_yank({higroup = "PmenuSel", timeout = 150})
            end
        }
    )

    -- vim.api.nvim_create_autocmd(
    --     "BufWritePost",
    --     {
    --         callback = require("lint").try_lint
    --     }
    -- )

    local terminalAuGroup = vim.api.nvim_create_augroup("TermStuff", {})

    vim.api.nvim_create_autocmd(
        "TermOpen",
        {
            group = terminalAuGroup,
            callback = function()
                core_utils.nvim_load_opts({bh = "hide"})
            end
        }
    )
    vim.api.nvim_create_autocmd(
        "TermOpen",
        {
            group = terminalAuGroup,
            command = "startinsert"
        }
    )
    vim.api.nvim_create_autocmd(
        "BufLeave",
        {
            group = terminalAuGroup,
            pattern = "term://*",
            command = "stopinsert"
        }
    )
end

return M
