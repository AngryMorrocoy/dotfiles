local null_ls = require("null-ls")

local function stylua_config_exists()
    local cwd = vim.fn.getcwd()
    local stylua_config_file = io.open(cwd .. "/stylua.toml", "r")

    return stylua_config_file ~= nil
end

return function()
    local config = null_ls.builtins.formatting.stylua.with({
        extra_args = { "--indent-type", "spaces" },
    })

    -- Ignore my preference for spaces instead of tabs if stylua.toml exists
    if stylua_config_exists() then
        config = null_ls.builtins.formatting.stylua
    end

    null_ls.register(config)
end
