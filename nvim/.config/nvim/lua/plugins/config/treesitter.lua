local M = {}

function M.setup()
    vim.g.skip_ts_context_commentstring_module = true
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
            additional_vim_regex_highlighting = false,
            disable = { "latex" },
        },
        indent = {
            enable = true,
        },
        rainbow = {
            enable = true,
            extended_mode = false,
        },
        autotag = {
            enable = true,
        },
        -- context_commentstring = {
        --     enable = true,
        --     enable_autocmd = false,
        -- },
    })
    require("ts_context_commentstring").setup({})

    vim.api.nvim_set_hl(0, "@dictionary.key", { link = "TSField" })
end

return M
