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
            "f",
            fmt(
                [[
                func {}({}){} {{
                    {}
                }}
                ]],
                {
                    i(1),
                    i(2),
                    i(3),
                    i(0),
                }
            )
        ),
        s(
            "var",
            fmt("var {} {} {}{}", {
                i(1, "_"),
                i(2),
                c(3, { t("="), t("") }),
                d(4, function(assignable)
                    vim.pretty_print(assignable)
                    if assignable[1][1]:match("=") then
                        return sn(nil, { t(" "), i(0, "_") })
                    end
                    return sn(nil, t(""))
                end, {
                    3,
                }),
            })
        ),
        s(":=", fmt("{} := {}", { i(1), i(0) })),
    }
end

return M
