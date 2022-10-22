local manual_snips = {
    s("imp", {
        c(1, {
            sn(nil, fmt("import {}", { r(1, "import") })),
            sn(nil, fmt("from {} import {}", { r(1, "import"), i(2, "*") })),
        }),
    }, {
        stored = {
            ["import"] = i(1),
        },
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
