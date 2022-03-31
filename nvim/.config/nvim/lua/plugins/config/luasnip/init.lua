local M = {}

function M.load_snippets()
    local ls = require("luasnip")
    local concat_tables = require("core.util").concat_tables

    ls.snippets = {
        lua = require("plugins.config.luasnip.lua_snips").setup(),
        javascript = require("plugins.config.luasnip.js_snips").setup(),
        javascriptreact = concat_tables(
            {
                require("plugins.config.luasnip.js_snips").setup(),
                require("plugins.config.luasnip.jsreact_snips").setup()
            }
        ),
        typescriptreact = concat_tables(
            {
                require("plugins.config.luasnip.js_snips").setup(),
                require("plugins.config.luasnip.tsreact_snips").setup(),
                require("plugins.config.luasnip.ts_snips").setup()
            }
        ),
        typescript = concat_tables(
            {
                require("plugins.config.luasnip.ts_snips").setup(),
                require("plugins.config.luasnip.js_snips").setup()
            }
        ),
        python = require("plugins.config.luasnip.py_snips").setup(),
        tex=require("plugins.config.luasnip.tex_snips").setup(),
    }
end

function M.setup()
    local ls = require("luasnip")
    local types = require("luasnip.util.types")

    ls.config.setup(
        {
            historsetup = true,
            updateevents = "TextChanged,TextChangedI",
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = {{"<- Toggle", "Debug"}}
                    }
                }
            }
        }
    )
end

M.load_snippets()

return M
