local M = {}

function M.load_snippets()
    local ls = require("luasnip")

    ls.snippets = {
        lua = require("plugins.config.luasnip.lua_snips").setup(),
        javascript = require("plugins.config.luasnip.js_snips").setup(),
        typescript = require("plugins.config.luasnip.js_snips").setup(),
        python = require("plugins.config.luasnip.py_snips").setup(),
    }
end

function M.setup()
    local ls = require("luasnip")
    local types = require("luasnip.util.types")

    ls.config.set_config(
        {
            history = true,
            updateevents = "TextChanged,TextChangedI",
            ext_opts = {
                [types.choiceNode] = {
                    virt_text = {{"<-", "Error"}}
                }
            }
        }
    )
end

M.load_snippets()

return M
