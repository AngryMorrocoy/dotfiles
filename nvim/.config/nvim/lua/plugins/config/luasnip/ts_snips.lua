local M = {}

function M.setup()
    local ls = require("luasnip")
    local fmt = require("luasnip.extras.fmt").fmt
    local s = ls.s
    local i = ls.i
    local c = ls.c
    local t = ls.t
    local d = ls.d
    local sn = ls.sn

    return {
        s(
            "int",
            fmt(
                [[
                interface {} {{
                  {}
                }}
                ]],
                {
                    i(1),
                    i(2)
                }
            )
        )
    }
end

return M
