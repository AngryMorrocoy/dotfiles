local M = {}

function M.setup()
    vim.g.matchup_matchparen_deferred = 1
    vim.g.matchup_matchparen_hi_surround_always = 1
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
end

return M
