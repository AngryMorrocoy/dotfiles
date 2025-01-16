local lspconfig = require("lspconfig")
local M = {}

function M.setup()
	lspconfig.pyright.setup({})
end

return M
