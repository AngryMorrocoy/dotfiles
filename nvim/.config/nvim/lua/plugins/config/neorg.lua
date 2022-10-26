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
            ["core.integrations.telescope"] = {},
            ["core.export"] = {
                config = { -- Note that this table is optional and doesn't need to be provided
                    -- Configuration here
                },
            },
            ["external.context"] = {},
            ["core.export.markdown"] = {
                config = {
                    extensions = "all",
                },
            },
        },
    })
end

return M
