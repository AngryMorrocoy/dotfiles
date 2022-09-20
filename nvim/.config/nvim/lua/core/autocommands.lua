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
        "BufReadPre",
        {
            pattern = {"*.tex"},
            command = "let maplocalleader=','"
        }
    ) -- Fixing a bug with vimtex :c

    vim.api.nvim_create_autocmd(
        "TextYankPost",
        {
            callback = function()
                vim.highlight.on_yank({higroup = "PmenuSel", timeout = 150})
            end
        }
    )

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

    vim.api.nvim_create_autocmd(
        {"BufWritePost"},
        {
            callback = function()
                require("lint").try_lint()
            end
        }
    )

    local tmux_augroup = vim.api.nvim_create_augroup("TmuxwRenamer", {})

    vim.api.nvim_create_autocmd(
        {"VimEnter", "BufEnter", "BufWinEnter"},
        {
            group = tmux_augroup,
            callback = function()
                if vim.env.TMUX == nil then
                    return
                end

                local project_folder = vim.fn.split(vim.fn.getcwd(), "/")
                local cur_file = vim.fn.expand("%:t")

                local project_name = project_folder[#project_folder]

                local tmuxw_name = string.format("nvim@%s [%s]", project_name, cur_file)

                local command = string.format("tmux renamew '%s'", tmuxw_name)

                vim.fn.jobstart(command)
            end
        }
    )

    vim.api.nvim_create_autocmd(
        {"VimLeave"},
        {
            group = tmux_augroup,
            callback = function()
                if vim.env.TMUX == nil then
                    return
                end
                vim.fn.jobstart("tmux renamew zsh")
            end
        }
    )
end

return M
