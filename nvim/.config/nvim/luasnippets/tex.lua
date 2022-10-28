local manual_snips = {
    s({ trig = "[%d%a]*[%d%a]+/[%d%a]+[%d%a]*", regTrig = true, desc = "Fractions ;)" }, {
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
    s({ trig = "[%d%a]*[%d%a]+%^[%w]*", regTrig = true, desc = "Raise to the power of" }, {
        d(1, function(_, parent)
            local separator_index = parent.trigger:find("%^")
            local base = string.sub(parent.trigger, 1, separator_index - 1)
            local exp = string.sub(parent.trigger, separator_index + 1)

            return sn(nil, fmt("<>^{<>}<>", { t(base), i(1, exp), i(0) }, { delimiters = "<>" }))
        end),
    }),
    s({ trig = "sym", desc = "Creates a sympy block" }, fmt("sympy {} sympy{}", { i(1), i(0) })),
    s(
        { trig = "sympy.*sympy", regTrig = true, desc = "Sympy block evaluator" },
        d(1, function(_, parent)
            -- Gets the part of the block we actually want, and replaces spaces
            -- at the beginning and at the end
            local to_eval = string.gsub(parent.trigger, "^sympy(.*)sympy", "%1")
            to_eval = string.gsub(to_eval, "^%s+(.*)%s+$", "%1")

            local Job = require("plenary.job")

            local sympy_script = string.format(
                [[
# python
from sympy import *
from sympy.parsing.sympy_parser import parse_expr
from sympy.printing.latex import print_latex
parsed = parse_expr('%s')
print_latex(parsed)
                ]],
                to_eval
            )

            sympy_script = string.gsub(sympy_script, "^[\t%s]+", "")
            local result = ""

            Job:new({
                command = "python",
                args = {
                    "-c",
                    sympy_script,
                },
                on_exit = function(j)
                    result = j:result()
                end,
            }):sync()

            return sn(nil, t(result))
        end)
    ),
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
