local core_utils = require("core.util")

local M = {}

function M.setup()
    vim.api.nvim_create_autocmd("BufReadPost", {
        callback = core_utils.autocommands.jump_to_last_known_cursor_position,
    }) -- Put the cursor on the last known position

    vim.api.nvim_create_autocmd("BufWritePost", { command = "%s:\\s\\+$::e" }) -- Fuck trailing withespaces

    vim.api.nvim_create_autocmd(
        "Colorscheme",
        {
            command = core_utils.nvim_set_highlight(
                "VertSplit",
                { ctermbg = "NONE", guibg = "NONE", guifg = "fg" },
                true
            ),
        } -- For viewing a very nice vertsplit
    )

    vim.api.nvim_create_autocmd("Filetype", {
        callback = core_utils.autocommands.load_syntax_specific_opts,
    }) -- Load all the syntax specific configs

    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*.http", "*.rest" },
        command = "set filetype=http",
    }) -- To set coloring in rest files


    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*.yuck" },
        command = "set filetype=yuck",
    }) -- To set yuck filetype

    vim.api.nvim_create_autocmd("BufReadPre", {
        pattern = { "*.tex" },
        command = "let maplocalleader=','",
    }) -- Fixing a bug with vimtex :c

    vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
            vim.highlight.on_yank({ higroup = "PmenuSel", timeout = 150 })
        end,
    })

    local terminalAuGroup = vim.api.nvim_create_augroup("TermStuff", {})

    vim.api.nvim_create_autocmd("TermOpen", {
        group = terminalAuGroup,
        callback = function()
            core_utils.nvim_load_opts({ bh = "hide" })
        end,
    })
    vim.api.nvim_create_autocmd("TermOpen", {
        group = terminalAuGroup,
        command = "startinsert",
    })

    vim.api.nvim_create_autocmd("BufLeave", {
        group = terminalAuGroup,
        pattern = "term://*",
        command = "stopinsert",
    })

    local tmux_augroup = vim.api.nvim_create_augroup("TmuxwRenamer", {})

    vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter", "BufWinEnter" }, {
        group = tmux_augroup,
        callback = function()
            if vim.env.TMUX == nil then
                return
            end

            local cur_file = vim.fn.expand("%:p")
            local path_splitted = vim.fn.split(cur_file, vim.fn.getcwd())

            cur_file = path_splitted[#path_splitted]

            if cur_file and vim.fn.matchstr(cur_file, '^/') then
                cur_file = string.sub(cur_file, 2)
            end

            local tmuxw_name = string.format("@%s", cur_file or "Empty")

            local command = string.format("tmux renamew '%s'", tmuxw_name)

            vim.fn.jobstart(command)
        end,
    })

    vim.api.nvim_create_autocmd({ "VimLeave" }, {
        group = tmux_augroup,
        callback = function()
            vim.fn.jobstart("tmux renamew zsh")
        end,
    })

    local folds_group = vim.api.nvim_create_augroup("OpenFolds", {})

    vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
        pattern = "*",
        group = folds_group,
        command = "normal zR",
    })
end

return M
