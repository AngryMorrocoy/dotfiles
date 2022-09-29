local null_ls = require("null-ls")

return function()
    local stylua_config = null_ls.builtins.formatting.stylua.with({
        extra_args = { "--indent-type", "spaces" },
    })

    null_ls.register(stylua_config)
end
