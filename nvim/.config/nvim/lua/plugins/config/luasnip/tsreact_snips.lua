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
                [[
                {}const {}:FunctionComponent<{}> = ({}): JSX.Element => {{
                  return (
                    <{}>
                      {}
                    </{}>
                  )
                }}{}
                ]],
                {
                    d(
                        1,
                        function()
                            local lines = vim.api.nvim_buf_get_lines(0, 0, 30, false)
                            for _, line in ipairs(lines) do
                                if string.match(line, "^import.+FunctionComponent") then
                                    return sn(nil, t(""))
                                end
                            end
                            return sn(nil, t({"import { FunctionComponent } from 'react';", "", ""}))
                        end,
                        {2}
                    ),
                    i(2),
                    i(3, "any"),
                    i(4, "props"),
                    i(5, "div"),
                    i(6),
                    rep(5),
                    c(
                        7,
                        {
                            t(""),
                            f(
                                function(component_name)
                                    return {"", "", "export default " .. component_name[1][1] .. ";"}
                                end,
                                {2}
                            )
                        }
                    )
                }
            )
        )
    }
end

return M
