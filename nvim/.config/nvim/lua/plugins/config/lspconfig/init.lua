local M = {}

local lsp_configs = {
    require("plugins.config.lspconfig.sumneko_lua"),
    require("plugins.config.lspconfig.cssls"),
    require("plugins.config.lspconfig.html"),
    require("plugins.config.lspconfig.jsonls"),
    require("plugins.config.lspconfig.tsserver"),
    require("plugins.config.lspconfig.pylsp"),
    -- require('plugins.config.lspconfig.pyright'),
}

function M.setup()
    require("mason-lspconfig").setup()

    require("mason-lspconfig").setup_handlers {
        function(server_name)
            require("lspconfig")[server_name].setup {}
        end
    }

    for _, config in ipairs(lsp_configs) do
        config.setup()
    end
end

return M
