local M = {}

function M.setup()
    require("neorg").setup({
        load = {
            ["core.defaults"] = {},
            ["core.norg.completion"] = {
                config = { engine = "nvim-cmp" },
            },
            ["core.norg.concealer"] = {
                config = {
                    icon_preset = "diamond",
                    conceal = false,
                },
            },
        },
    })
end

return M
