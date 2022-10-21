local M = {}

function M.load_snippets()
    local ls = require("luasnip")
    local concat_tables = require("core.util").concat_tables

    local snippets = {
        -- typescript = concat_tables({
        --     require("plugins.config.luasnip.ts_snips").setup(),
        --     require("plugins.config.luasnip.js_snips").setup(),
        -- }),
        -- typescriptreact = concat_tables({
        --     require("plugins.config.luasnip.js_snips").setup(),
        --     require("plugins.config.luasnip.tsreact_snips").setup(),
        --     require("plugins.config.luasnip.ts_snips").setup(),
        -- }),
    }

    for ft, snips in pairs(snippets) do
        ls.add_snippets(ft, snips)
    end
end

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
