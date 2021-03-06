return {
    setup = function()
        vim.api.nvim_create_user_command("CopyFilePath", ":!echo '%:p' | xclip -i -sel c", {})

        vim.api.nvim_create_user_command("T", "split | resize 12 | terminal", {})
        vim.api.nvim_create_user_command("Vt", "vertical split | vertical resize 80 | terminal", {})

        vim.api.nvim_create_user_command(
            "ToggleAutoFormat",
            function()
                vim.g["formatter#autoformat"] = not vim.g["formatter#autoformat"]
            end,
            {}
        )

        vim.api.nvim_create_user_command("CloseAllFloatingWin", require("core.util").close_all_float_win, {})

        vim.api.nvim_create_user_command("Git", "FloatermNew lazygit", {})
    end
}
