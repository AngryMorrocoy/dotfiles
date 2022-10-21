local manual_snips = {}
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
}

return manual_snips, auto_snips
