local manual_snips = {
    s(
        "imp",
        fmt("import {} from '{}';", {
            c(2, {
                r(nil, "user_text", i(1, "*")),
                sn(nil, { t("{"), r(1, "user_text"), t("}") }),
            }),
            i(1),
        }, {
            stored = {
                ["user_text"] = i(2, "texto defecto"),
            },
        })
    ),
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
                c(1, { t("const "), t(""), t("async ") }),
                -- Dynamic, if it is const then ask for the name
                d(2, function(func_type)
                    if func_type[1][1]:match("const") then
                        return sn(nil, {
                            i(1),
                            t(" = "),
                        })
                    end
                    return sn(nil, t(""))
                end, {
                    1,
                }),
                -- Even if const check if want it async
                d(3, function(func_type)
                    if func_type[1][1]:match("const") then
                        return sn(nil, c(1, { t(""), t("async ") }))
                    end
                    return sn(nil, t(""))
                end, {
                    1,
                }),
                -- Parameters
                i(4),
                i(0),
            }
        )
    ),
    s(
        "f",
        fmt(
            [[
                {}function {}({}){{
                  {};
                }}
                ]],
            {
                c(1, { t(""), t("async ") }),
                i(2),
                i(3),
                i(0),
            }
        )
    ),
}
local auto_snips = {}

return manual_snips, auto_snips
