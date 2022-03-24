local g = vim.g
local M = {}

function M.setup()
    g.matchup_matchparen_deferred = 1
    g.matchup_matchparen_hi_surround_always = 1
    g.matchup_matchparen_offscreen = {method = "popup"}
end

return M
