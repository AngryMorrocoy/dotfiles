local lspconfig = require("lspconfig")
local M = {}

function M.setup()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.jsonls.setup(
        {
            capabilities = capabilities,
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = {enable = true}
                }
            }
        }
    )
end

return M
