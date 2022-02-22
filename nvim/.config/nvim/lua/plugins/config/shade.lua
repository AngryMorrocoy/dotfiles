local M = {}

function M.setup()
    require("shade").setup(
        {
            overlay_opacity = 60,
            opacity_step = 5,
            keys = {
                brightness_up = "<C-Up>",
                brightness_down = "<C-Down>",
                toggle = "<leader>s"
            }
        }
    )
end

return M
