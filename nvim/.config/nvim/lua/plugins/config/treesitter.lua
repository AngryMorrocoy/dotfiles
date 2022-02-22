local M = {}

function M.setup()
    local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
    parser_configs.http = {
        install_info = {
            url = "https://github.com/NTBBloodbath/tree-sitter-http",
            files = {"src/parser.c"},
            branch = "main"
        }
    }

    require("nvim-treesitter.configs").setup(
        {
            ensure_installed = {
                "javascript",
                "typescript",
                "lua",
                "bash",
                "python",
                "c",
                "cpp",
                "html",
                "css",
                "http"
            },
            highlight = {
                enable = true,
                custom_captures = {
                    ["dictionary.key"] = "TSField",
                    ["template_string.substitution"] = "TSVariable"
                },
                additional_vim_regex_highlighting = false
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm"
                }
            },
            rainbow = {
                enable = true,
                extended_mode = true
            }
            -- matchup = {
            --     enable = true
            -- }
        }
    )
end

return M
