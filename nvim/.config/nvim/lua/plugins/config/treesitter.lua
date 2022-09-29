local M = {}

function M.setup()
    local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

    parser_configs.http = {
        install_info = {
            url = "https://github.com/NTBBloodbath/tree-sitter-http",
            files = { "src/parser.c" },
            branch = "main",
        },
    }

    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "javascript",
            "typescript",
            "tsx",
            "lua",
            "bash",
            "python",
            "html",
            "css",
            "http",
        },
        highlight = {
            enable = true,
            custom_captures = {
                ["dictionary.key"] = "TSField",
                ["template_string.substitution"] = "TSVariable",
            },
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
        },
        rainbow = {
            enable = true,
            extended_mode = true,
        },
        autotag = {
            enable = true,
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
    })
end

return M
