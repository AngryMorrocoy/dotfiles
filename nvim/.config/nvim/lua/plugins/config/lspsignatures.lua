local M = {}

function M.setup()
    require("lsp_signature").setup(
        {
            bind = true,
            handler_opts = {
                border = "double"
            },
            fix_pos = true,
            auto_close_after = 3,
            extra_trigger_chars = {"(", ","},
            toggle_key = "<A-r>",
            hint_prefix = " ",
            hi_parameter = "Todo"
        }
    )
end

return M
