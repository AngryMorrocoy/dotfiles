local M = {}

M.plugs_config = {
    require("plugins.config.lspconfig"),
    require("plugins.config.formatter"),
    require("plugins.config.autopairs"),
    require("plugins.config.cmp"),
    require("plugins.config.emmet"),
    require("plugins.config.indent_blankline"),
    require("plugins.config.lspsaga"),
    require("plugins.config.lspsignatures"),
    require("plugins.config.matchup"),
    require("plugins.config.nvim_tree"),
    require("plugins.config.startify"),
    require("plugins.config.polyglot"),
    require("plugins.config.treesitter"),
    -- require("plugins.config.ultisnippets"),
    require("plugins.config.nvim_rest"),
    require("plugins.config.harpoon"),
    require("plugins.config.vimux"),
    require("plugins.config.lualine"),
    require("plugins.config.telescope"),
    require("plugins.config.luasnip")
}

function M.setup_all()
    for _, plugin in ipairs(M.plugs_config) do
        plugin.setup()
    end

    require("trouble").setup({})
    require("refactoring").setup({})
end

return M
