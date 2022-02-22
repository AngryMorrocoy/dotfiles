return {
    setup = function()
        vim.cmd('command! CopyFilePath :!echo "%:p" | xclip -i -sel c')
        vim.cmd("command! T split | resize 12 | terminal")
        vim.cmd("command! Vt vertical split | vertical resize 80 | terminal")

        -- FZF into commands
        vim.cmd(
            "command! TelescopeProjectGrepNoIgnore :Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--column,--no-ignore"
        )
        -- vim.g["formatter#autoformat"]
        vim.cmd("command! ToggleAutoFormat lua vim.g['formatter#autoformat'] = not vim.g['formatter#autoformat']")
        -- Clean of bugs
        vim.cmd("command! CloseAllFloatingWin lua require('core.util').close_all_float_win()")
    end
}
