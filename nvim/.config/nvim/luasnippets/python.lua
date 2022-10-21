local manual_snips = {
    s("imp", {
        c(1, { t("import "), t("from ") }),
        d(2, function(import_type)
            if import_type[1][1]:match("from") then
                return sn(
                    nil,
                    fmt("{} import {}", {
                        i(1),
                        i(2),
                    })
                )
            end
            return sn(nil, i(1))
        end, {
            1,
        }),
    }),
    s(
        "class",
        fmt(
            [[
                class {}:

                    {}
                ]],
            {
                i(1),
                c(2, {
                    t(""),
                    sn(nil, {
                        t("def __init__(self"),
                        i(1),
                        t("):"),
                        t({ "", "\t\t" }),
                        i(0, "pass"),
                    }),
                }),
            }
        )
    ),
}
local auto_snips = {}

return manual_snips, auto_snips
