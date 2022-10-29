local M = {}

function M.setup()
    vim.cmd([[highlight IndentBlanklineCurrentContext guifg=#C678DD gui=nocombine]])

    require("indent_blankline").setup({
        -- char_list = { "│" },
        show_first_indent_level = true,
        show_trailing_blankline_indent = false,
        space_char = " ",
        space_char_blankline = " ",
        show_end_of_line = true,
        indent_blankline_buftype_exclude = { "terminal", "startify" },
        filetype_exclude = { "startify" },

        use_treesitter = true,
        show_current_context = true,
        show_current_context_start = true,

        context_patterns = {
            "class",
            "function",
            "method",
            "^if",
            "^for",
            "^while",
            "^try",
            "^catch",
            "^except",
        },
        context_highlight_list = { "TSKeyword" },
    })
end

return M
