local M = {}

function M.setup()
    local null_ls = require("null-ls")
    require("mason-null-ls").setup({
        ensure_installed = { "black", "prettier", "stylua" },
        handlers = {
            function(source_name, methods)
                require("mason-null-ls.automatic_setup")(source_name, methods)
            end,
            stylua = function()
                local setup_stylua = require("plugins.config.null_ls.stylua_formatter")
                setup_stylua()
            end,
            prettier = function()
                null_ls.register(null_ls.builtins.formatting.prettier.with({
                    extra_args = { "--prose-wrap", "always" },
                }))
            end,
        }
    })

    null_ls.setup({})
end

return M
