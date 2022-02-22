require("core").setup() -- Starts the load of config

local function loadTheme()
    local theme_loader_filename = vim.env["HOME"] .. "/.config/nvim/lua/theme.lua"
    local theme_loader_file = io.open(theme_loader_filename, "r")

    if theme_loader_file == nil then
        theme_loader_file = io.open(theme_loader_filename, "w")
        theme_loader_file:write(
            [[
        local function colorscheme(colo)
            vim.cmd("colorscheme " .. colo)
        end

        return {
            lua_theme = "everforest",
            load_theme = function ()
                colorscheme default
            end
        }
        ]]
        )
        theme_loader_file:close()
    else
        theme_loader_file:close()
    end
    require("theme").load_theme()
end

loadTheme()
