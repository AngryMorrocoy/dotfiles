local M = {}

function M.setup()
    require("nvim-autopairs").setup({
        map_cr = true,
    })
end

return M
