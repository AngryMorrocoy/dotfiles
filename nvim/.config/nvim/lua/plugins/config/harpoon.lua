local M = {}

function M.setup()
    require("harpoon").setup(
        {
            global_settings = {
                save_on_toggle = false,
                save_on_change = true
            }
        }
    )
end

return M
