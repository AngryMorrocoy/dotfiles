local M = {}

function M.setup()
    require("smoothcursor").setup(
        {
            linehl = "CursorLine",
            fancy = {
                enable = true
            }
        }
    )
end

return M
