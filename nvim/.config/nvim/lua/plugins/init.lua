require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    -- Plenary, a dependency for almost anything xd
    use("nvim-lua/plenary.nvim")
    --
    use({ "mattn/emmet-vim", config = require("plugins.config.emmet").setup })
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = require("plugins.config.indent_blankline").setup,
    })
    use({
        "numToStr/Comment.nvim",
        config = require("plugins.config.comment").setup,
    })
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})
        end,
    })
    use({
        "andymass/vim-matchup",
        config = require("plugins.config.matchup").setup,
    })
    use("tpope/vim-surround")
    -- Lsp
    use({
        "ray-x/lsp_signature.nvim",
        config = require("plugins.config.lspsignatures").setup,
    })
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({})
        end,
    })
    use({
        "neovim/nvim-lspconfig",
        config = require("plugins.config.lspconfig").setup,
        requires = { "williamboman/mason-lspconfig.nvim" },
    })
    use({
        "ThePrimeagen/refactoring.nvim",
        config = function()
            require("refactoring").setup({})
        end,
    })
    use({
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = require("plugins.config.null_ls").setup,
        requires = { "jayp0521/mason-null-ls.nvim" },
    })
    -- CMP Section
    use({
        "hrsh7th/nvim-cmp",
        config = require("plugins.config.cmp").setup,
        requires = {
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
        },
    })
    --
    use("mhartington/formatter.nvim")
    --
    use({
        "windwp/nvim-autopairs",
        config = require("plugins.config.autopairs").setup,
    })
    --
    use({
        "kyazdani42/nvim-tree.lua",
        config = require("plugins.config.nvim_tree").setup,
    })
    use("kyazdani42/nvim-web-devicons")
    use({ "mbbill/undotree", opt = true })
    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = require("plugins.config.treesitter").setup,
        requires = {
            "p00f/nvim-ts-rainbow",
            "nvim-treesitter/nvim-treesitter-context",
            "windwp/nvim-ts-autotag",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    })
    use("nvim-treesitter/playground")
    -- Themes
    use({ "yonlu/omni.vim", opt = true })
    use({ "shaeinst/roshnivim-cs", opt = true })
    use({ "sainnhe/gruvbox-material", opt = true })
    use({ "nanotech/jellybeans.vim", opt = true })
    use({ "folke/tokyonight.nvim", opt = true })
    use({ "pineapplegiant/spaceduck", opt = true })
    use({ "rose-pine/neovim", opt = true })
    use({ "ray-x/aurora", opt = true })
    use({ "Shatur/neovim-ayu", opt = true })
    use({ "savq/melange", opt = true })
    use({ "catppuccin/nvim", as = "catppuccin" })
    -- Nvim like rest client
    use({
        "NTBBloodbath/rest.nvim",
        ft = { "http" },
        config = require("plugins.config.nvim_rest").setup,
    })
    --
    -- Lualine
    use({
        "hoob3rt/lualine.nvim",
        config = require("plugins.config.lualine").setup,
        requires = { "arkav/lualine-lsp-progress" },
    })

    use("b0o/schemastore.nvim")
    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        config = require("plugins.config.telescope").setup,
        requires = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make",
            },
        },
    })
    -- Latex environment :D
    use({
        "lervag/vimtex",
        ft = "tex",
        config = require("plugins.config.vimtex").setup,
    })
    -- Snippets
    use({
        "L3MON4D3/LuaSnip",
        config = require("plugins.config.luasnip").setup,
    })
    -- Nvim looking good af
    use("nvim-lua/popup.nvim")
    use({
        "gen740/SmoothCursor.nvim",
        config = require("plugins.config.smoothcursor").setup,
    })
    use({
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({ input = { insert_only = false } })
        end,
    })
    use("folke/lsp-colors.nvim")
    --
    use({
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({})
        end,
    })
    use({
        "rmagatti/auto-session",
        config = require("plugins.config.auto_sesion").setup,
    })
    use({
        "voldikss/vim-floaterm",
        config = require("plugins.config.floaterm").setup,
    })
    use({ "ThePrimeagen/harpoon", config = require("plugins.config.harpoon").setup })

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    })

    use({
        "nvim-neorg/neorg",
        config = require("plugins.config.neorg").setup,
        ft = { "norg" },
        requires = { "nvim-neorg/neorg-telescope", "max397574/neorg-contexts" },
    })
end)
