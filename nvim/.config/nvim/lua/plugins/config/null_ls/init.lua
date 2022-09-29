local M = {}

function M.setup()
    local null_ls = require("null-ls")
    require("mason-null-ls").setup {
        ensure_installed = {"black", "prettier", "stylua"}
    }

    require("mason-null-ls").setup_handlers {
        function(source_name)
            null_ls.register(null_ls.builtins.formatting[source_name])
        end,
    }

    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.prettier
        }
    })
end

return M
