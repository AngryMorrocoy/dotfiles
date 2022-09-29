local M = {}

M.plugs_config = {
    require("plugins.config.lspconfig"),
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
    require("plugins.config.floaterm"),
    require("plugins.config.auto_sesion"),
    require("plugins.config.comment"),
    require("plugins.config.smoothcursor"),
    require("plugins.config.null_ls"),
}

function M.setup_all()
    require("mason").setup()

    for _, plugin in ipairs(M.plugs_config) do
        plugin.setup()
    end

    require("trouble").setup({})
    require("refactoring").setup({})
    require("zen-mode").setup({})
    require("dressing").setup({ input = { insert_only = false } })
    require("gitsigns").setup({})
end

return M
