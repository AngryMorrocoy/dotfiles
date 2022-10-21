local M = {}

function M.setup()
    local ls = require("luasnip")
    local types = require("luasnip.util.types")

    ls.config.setup({
        enable_autosnippets = true,
        historsetup = true,
        updateevents = "TextChanged,TextChangedI",
        ext_opts = {
            [types.choiceNode] = {
                active = {
                    virt_text = { { "<- Toggle", "Debug" } },
                },
            },
        },
    })

    require("luasnip.loaders.from_snipmate").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load()
end

return M
