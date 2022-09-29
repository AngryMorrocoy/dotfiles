local M = {}

function M.setup()
    require("auto-session").setup(
        {
            auto_restore_enabled = false
        }
    )
end

return M
