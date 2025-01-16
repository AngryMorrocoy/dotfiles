local lspconfig = require("lspconfig")
local M = {}

function M.setup()
	lspconfig.pylsp.setup({})
end

return M
