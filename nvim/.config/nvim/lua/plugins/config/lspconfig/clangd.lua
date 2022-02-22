local lspconfig = require('lspconfig')
local M = {}

function M.setup()
    lspconfig.clangd.setup({})
end


return M
