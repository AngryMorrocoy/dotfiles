local manual_snips = {
    s(
        "f",
        fmt(
            [[
                {}function {}({})
                    {}
                end]],
            {
                c(1, { t("local "), t("") }),
                i(2),
                i(3),
                i(0),
            }
        )
    ),
}

local auto_snips = {
    s(
        "var",
        fmt([[{}{} = {}]], {
            c(1, { t("local "), t("") }),
            i(2),
            i(3),
        })
    ),
}

return manual_snips, auto_snips
