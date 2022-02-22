local M = {}

function M.setup()
    require("lsp_signature").setup(
        {
            bind = true,
            handler_opts = {
                border = "single"
            },
            fix_pos = true,
            auto_close_after = 15,
            extra_trigger_chars = {","},
            toggle_key = "<A-r>"
        }
    )
end

return M
