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
        -- Javascript: functions
        s(
            "f",
            fmt(
                [[
                {}function {}({}){{
                  {};
                }}
                ]],
                {
                    c(1, {t(""), t("async ")}),
                    i(2),
                    i(3),
                    i(0)
                }
            )
        ),
        -- Javascript: Arrow functions
        s(
            "af",
            fmt(
                [[
                {}{}{}({}) => {{
                  {}
                }}
                ]],
                {
                    -- To choose if its anonymous or save it in a variable
                    c(1, {t("const "), t(""), t("async ")}),
                    -- Dynamic, if it is const then ask for the name
                    d(
                        2,
                        function(func_type)
                            if func_type[1][1]:match("const") then
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
                    -- Even if const check if want it async
                    d(
                        3,
                        function(func_type)
                            if func_type[1][1]:match("const") then
                                return sn(nil, c(1, {t(""), t("async ")}))
                            end
                            return sn(nil, t(""))
                        end,
                        {1}
                    ),
                    -- Parameters
                    i(4),
                    i(0)
                }
            )
        ),
        -- Javascript: For loops
        s(
            "for",
            fmt(
                [[
                for (let {} = {}; {} {}; {}) {{
                  {}
                }}
                ]],
                {
                    i(1, {"i"}),
                    i(2, {"0"}),
                    rep(1),
                    i(3),
                    i(4),
                    i(0)
                }
            )
        ),
        s(
            {trig = "[lc][eo][tn]s?t?", regTrig = true},
            fmt(
                [[{} {} = {};]],
                {
                    f(
                        function(_, snip)
                            return snip.trigger
                        end
                    ),
                    i(1),
                    i(2)
                }
            )
        ),
        s(
            "imp",
            fmt(
                [[
                import {} from '{}';
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
