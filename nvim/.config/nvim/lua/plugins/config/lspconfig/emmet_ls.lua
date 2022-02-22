local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local M = {}

function M.setup()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    configs.emmet_ls = {
        default_config = {
            cmd = {'emmet-ls', '--stdio'};
            filetypes = {'html', 'css', 'js', 'ts', 'htmldjango'};
            root_dir = function(fname)
                return vim.loop.cwd()
            end;
            settings = {};
        };
    }

    lspconfig.emmet_ls.setup({
        capabilities = capabilities
    })
end


return M
