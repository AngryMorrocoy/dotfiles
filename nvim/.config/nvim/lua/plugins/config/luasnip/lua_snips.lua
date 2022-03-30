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
        ),
        s(
            "req",
            fmt(
                [[{}{}require("{}")]],
                {
                    c(1, {t(""), t("local ")}),
                    d(
                        2,
                        function(req_type)
                            if req_type[1][1]:match("local") then
                                return sn(
                                    nil,
                                    {
                                        i(1),
                                        t(" = ")
                                    }
                                )
                            end
                            return sn(nil, t(""))
                        end,
                        {1}
                    ),
                    i(3)
                }
            )
        ),
        s(
            "loc",
            fmt(
                [[{}{} = {}]],
                {
                    c(1, {t("local "), t("")}),
                    i(2),
                    i(3)
                }
            )
        )
    }
end

return M
