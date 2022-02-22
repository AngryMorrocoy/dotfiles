local lspconfig = require("lspconfig")
local M = {}

function M.setup()
    lspconfig.gopls.setup(
        {
            cmd = {"gopls"}
        }
    )
end

return M
