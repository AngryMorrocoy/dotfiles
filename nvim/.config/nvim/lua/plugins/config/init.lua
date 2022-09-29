local M = {}

M.plugs_config = {
    require("plugins.config.lspconfig"),
    require("plugins.config.formatter"),
    require("plugins.config.autopairs"),
    require("plugins.config.cmp"),
    require("plugins.config.emmet"),
    require("plugins.config.indent_blankline"),
    require("plugins.config.lspsignatures"),
    require("plugins.config.matchup"),
    require("plugins.config.nvim_tree"),
    require("plugins.config.treesitter"),
    require("plugins.config.nvim_rest"),
    require("plugins.config.harpoon"),
    require("plugins.config.lualine"),
    require("plugins.config.telescope"),
    require("plugins.config.luasnip"),
    require("plugins.config.floaterm")
}

function M.setup_all()
    for _, plugin in ipairs(M.plugs_config) do
        plugin.setup()
    end

    require("trouble").setup({})
    require("refactoring").setup({})
    require("Comment").setup(
        {
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
        }
    )
    require("zen-mode").setup({})
    require("dressing").setup({input = {insert_only = false}})
    require("gitsigns").setup({})
    require("auto-session").setup(
        {
            auto_restore_enabled = false
        }
    )
    require("smoothcursor").setup(
        {
            linehl = "CursorLine",
            fancy = {
                enable = true
            }
        }
    )
end

return M
