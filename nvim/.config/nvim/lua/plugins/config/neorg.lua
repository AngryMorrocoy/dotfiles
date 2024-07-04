local M = {}

function M.setup()
    require("neorg").setup({
        load = {
            ["core.defaults"] = {},
            ["core.completion"] = {
                config = { engine = "nvim-cmp" },
            },
            ["core.concealer"] = {
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

    local neorg_callbacks = require("neorg.callbacks")

    neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
        -- This keymaps, just bc telescope integration remaps my luasnip trigger function :c
        keybinds.map_to_mode("norg", {
            i = {
                { "<tab>", require("plugins.config.luasnip.util").expand_or_jump_keymap },
                { "<s-tab>", require("plugins.config.luasnip.util").jump_backwards },
                { "<C-l>", require("plugins.config.luasnip.util").change_choice_node },
            },
        }, { silent = true, noremap = true })
    end)
end

return M
