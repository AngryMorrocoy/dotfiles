local M = {}

function M.setup()
    local ls = require("luasnip")
    local fmt = require("luasnip.extras.fmt").fmt
    local s = ls.s
    local i = ls.i
    local c = ls.c
    local t = ls.t

    return {
        s(
            "f",
            fmt(
                [[
                {}function {}({})
                    {}
                end]],
                {
                    c(1, {t("local "), t("")}),
                    i(2),
                    i(3),
                    i(0)
                }
            )
        )
    }
end

return M
