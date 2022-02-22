local M = {}

local lsp_configs = {
    require("plugins.config.lspconfig.sumneko_lua"),
    require("plugins.config.lspconfig.emmet_ls"),
    require("plugins.config.lspconfig.cssls"),
    require("plugins.config.lspconfig.html"),
    require("plugins.config.lspconfig.jsonls"),
    require("plugins.config.lspconfig.tsserver"),
    require("plugins.config.lspconfig.pylsp"),
    -- require('plugins.config.lspconfig.pyright'),
    require("plugins.config.lspconfig.clangd"),
    require("plugins.config.lspconfig.texlab"),
    require("plugins.config.lspconfig.gopls"),
    require("plugins.config.lspconfig.dockerls")
}

function M.setup()
    for _, config in ipairs(lsp_configs) do
        config.setup()
    end
end

return M
