local manual_snips = {
    s({ trig = "[%d%a]*[%d%a]+/[%d%a]+[%d%a]*", regTrig = true }, {
        f(function(_, parent)
            local fraction = parent.trigger
            local bar_index = fraction:find("/")

            local numerator = string.sub(fraction, 1, bar_index - 1)
            local denominator = string.sub(fraction, bar_index + 1)

            return string.format("\\frac{%s}{%s}", numerator, denominator)
        end, {}),
    }, {}),
    s(
        "sq",
        fmt("\\sqrt<>{<>}", {
            c(1, {
                t(""),
                sn(nil, { t("["), i(1), t("]") }),
            }),
            i(0),
        }, { delimiters = "<>" })
    ),
    s({ trig = "[%d%a]*[%d%a]+%^[%w]*", regTrig = true }, {
        d(1, function(_, parent)
            local separator_index = parent.trigger:find("%^")
            local base = string.sub(parent.trigger, 1, separator_index - 1)
            local exp = string.sub(parent.trigger, separator_index + 1)

            return sn(nil, fmt("<>^{<>}<>", { t(base), i(1, exp), i(0) }, { delimiters = "<>" }))
        end),
    }),
}
local auto_snips = {
    s({ trig = "$", wordTrig = false }, {
        t("$"),
        i(1),
        t("$"),
        f(function(args)
            local first_char = string.sub(args[1][1], 1, 1)
            for _, char in ipairs({ ",", ".", "?", "-", " " }) do
                if first_char == char then
                    return ""
                end
            end
            return " "
        end, { 2 }),
        i(2),
    }, {
        condition = function(line_to_cursor)
            local last_char = string.sub(line_to_cursor, #line_to_cursor - 1, #line_to_cursor - 1)
            return last_char ~= "$"
        end,
    }),
    s({ trig = "[%d%a]_", regTrig = true, wordTrig = false }, {
        d(1, function(_, parent)
            local trigger = parent.trigger
            -- %d_{${1}} ${0}
            return sn(nil, { t(trigger), t("{"), i(1), t("} "), i(0) })
        end, {}),
    }),
}

return manual_snips, auto_snips
