local M = {}

function M.setup()
    local lua_theme = require("theme").lua_theme
    require("lualine").setup(
        {
            options = {
                section_separators = {"", ""},
                component_separators = {"", ""},
                theme = lua_theme
            },
            tabline = {
                lualine_a = {"filename"},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {"tabpagenr"}
            },
            extensions = {
                "quickfix"
            }
        }
    )
end

return M
