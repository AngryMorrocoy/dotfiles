local M = {}

function M.setup()
    local ls = require("luasnip")
    local fmt = require("luasnip.extras.fmt").fmt
    local rep = require("luasnip.extras").rep
    local s = ls.s
    local i = ls.i
    local c = ls.c
    local t = ls.t
    local f = ls.f
    local d = ls.d
    local sn = ls.sn

    return {
        s("beg", fmt([[
        \begin{{{}}}
          {}
        \end{{{}}}
        ]], {i(1), i(2), rep(1)})),
        s(
            "start",
            fmt(
                [[
        % arara: pdflatex
        \documentclass{{article}}
        % TODO: Imports
        \usepackage[utf8]{{inputenc}}
        {}
        % ---

        % TODO: Commands
        % ---

        \begin{{document}}
          {}
        \end{{document}}
        ]],
                {i(1), i(2)}
            )
        )
    }
end

return M
