local g = vim.g
local M = {}

function M.setup()
    g.VimuxOrientation = "v"
    g.VimuxHeight = "25"
    g.VimuxPromptString = "-> "
end

return M
