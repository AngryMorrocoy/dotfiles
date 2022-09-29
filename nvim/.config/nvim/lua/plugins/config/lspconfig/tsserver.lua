local lspconfig = require("lspconfig")
local M = {}

function M.setup()
    lspconfig.tsserver.setup({})
end

return M
