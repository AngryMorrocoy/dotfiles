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
        s(
            "rac",
            fmt(
                [[ const {} = ({}) => {{
                  return (
                    <{}>
                      {}
                    </{}>
                  )
                }}{}
                ]],
                {
                    i(1),
                    i(2, "props"),
                    i(3, "div"),
                    i(4),
                    rep(3),
                    c(
                        5,
                        {
                            t(""),
                            f(
                                function(component_name)
                                    return {"", "", "export default " .. component_name[1][1] .. ";"}
                                end,
                                {1}
                            )
                        }
                    )
                }
            )
        )
    }
end

return M
