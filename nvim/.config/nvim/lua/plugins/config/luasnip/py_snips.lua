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
            "ifmain",
            fmt(
                [[
                if __name__ == "__main__":
                    {}()
                ]],
                {
                    i(0, {"main"})
                }
            )
        ),
        s("com", fmt([["""{}"""]], {i(0)})),
        s(
            "def",
            fmt(
                [[
                def {}({}):
                    {}
                ]],
                {
                    i(1),
                    i(2),
                    i(0)
                }
            )
        ),
        -- Python: Cool imports
        s(
            "imp",
            {
                c(1, {t("import "), t("from ")}),
                d(
                    2,
                    function(import_type)
                        if import_type[1][1]:match("from") then
                            return sn(
                                nil,
                                fmt(
                                    "{} import {}",
                                    {
                                        i(1),
                                        i(2)
                                    }
                                )
                            )
                        end
                        return sn(nil, i(1))
                    end,
                    {1}
                )
            }
        )
    }
end

return M
