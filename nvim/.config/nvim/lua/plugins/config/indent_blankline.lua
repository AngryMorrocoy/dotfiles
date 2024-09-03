local M = {}

function M.setup()
    -- vim.cmd([[highlight IndentBlanklineCurrentContext guifg=#C678DD gui=nocombine]])
    require("ibl").setup()
end

return M
