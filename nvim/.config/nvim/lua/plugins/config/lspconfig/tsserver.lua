local lspconfig = require("lspconfig")
local M = {}

function M.setup()
	lspconfig.ts_ls.setup({})
end

return M
