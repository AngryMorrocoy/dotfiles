local g = vim.g
local M = {}

function M.setup()
    g.UltiSnipsExpandTrigger = "<tab>"
    g.UltiSnipsListSnippets = ""
    g.UltiSnipsJumpForwardTrigger = "<tab>"
    g.UltiSnipsJumpBackwardTrigger = "<S-tab>"
end

return M
