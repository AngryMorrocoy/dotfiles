local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { "nvim-lua/plenary.nvim" },
        {
            "mattn/emmet-vim",
            config = require("plugins.config.emmet").setup,
        },
        {
            "lukas-reineke/indent-blankline.nvim",
            config = require("plugins.config.indent_blankline").setup,
        },
        {
            "numToStr/Comment.nvim",
            config = require("plugins.config.comment").setup,
        },
        {
            "numToStr/Comment.nvim",
            config = require("plugins.config.comment").setup,
        },
        -- new
        {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("gitsigns").setup({})
            end,
        },

        { "tpope/vim-surround" },

        -- Package manager
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },
        -- Formatting
        {
            -- Null ls is archived, but still works
            "jose-elias-alvarez/null-ls.nvim",
            config = function()
                -- local null_ls = require("null-ls")
                -- null_ls.setup()
                -- require("mason-null-ls").setup({
                --     ensure_installed = {},
                --     handlers = {},
                -- })
            end,
            dependencies = { "jay-babu/mason-null-ls.nvim" },
        },
        -- LSP
        {
            "neovim/nvim-lspconfig",
            config = require("plugins.config.lspconfig").setup,
            dependencies = { "williamboman/mason-lspconfig.nvim" },
        },
        {
            "ray-x/lsp_signature.nvim",
            config = require("plugins.config.lspsignatures").setup,
            event = "VeryLazy",
        },
        {
            "folke/trouble.nvim",
            config = function()
                require("trouble").setup({})
            end,
        },
        --

        {
            "hrsh7th/nvim-cmp",
            config = require("plugins.config.cmp").setup,
            dependencies = {
                "hrsh7th/cmp-calc",
                "hrsh7th/cmp-cmdline",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
            },
        },

        {
            "windwp/nvim-autopairs",
            config = require("plugins.config.autopairs").setup,
        },

        {
            {
                "nvim-neo-tree/neo-tree.nvim",
                branch = "v3.x",
                dependencies = {
                    "nvim-lua/plenary.nvim",
                    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                    "MunifTanjim/nui.nvim",
                },
                config = function ()
                    require("neo-tree").setup({
                        window = {
                            mappings = {
                                ["l"] = "open"
                            }
                        }
                    })
                end
            },
        },

        { "kyazdani42/nvim-web-devicons" },

        {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = require("plugins.config.treesitter").setup,
            dependencies = {
                "p00f/nvim-ts-rainbow",
                "nvim-treesitter/nvim-treesitter-context",
                "windwp/nvim-ts-autotag",
                "JoosepAlviste/nvim-ts-context-commentstring",
            },
        },

        { "nvim-treesitter/playground" },
        { "sainnhe/gruvbox-material",    lazy = true },
        { "folke/tokyonight.nvim",       lazy = true },
        { "Shatur/neovim-ayu",           lazy = true },
        {
            "catppuccin/nvim",
            lazy = true,
            name = "catppuccin",
        },
        { "tanvirtin/monokai.nvim", lazy = true },

        {
            "NTBBloodbath/rest.nvim",
            ft = { "http" },
            config = require("plugins.config.nvim_rest").setup,
        },

        {
            "hoob3rt/lualine.nvim",
            config = require("plugins.config.lualine").setup,
            dependencies = { "arkav/lualine-lsp-progress" },
        },

        { "b0o/schemastore.nvim" },

        {
            "nvim-telescope/telescope.nvim",
            config = require("plugins.config.telescope").setup,
            dependencies = {
                {
                    "nvim-telescope/telescope-fzf-native.nvim",
                    build = "make",
                },
            },
        },

        {
            "lervag/vimtex",
            ft = "tex",
            config = require("plugins.config.vimtex").setup,
        },

        {
            "L3MON4D3/LuaSnip",
            config = require("plugins.config.luasnip").setup,
        },

        { "nvim-lua/popup.nvim" },

        {
            "stevearc/dressing.nvim",
            config = function()
                require("dressing").setup({
                    input = { insert_only = false },
                })
            end,
        },

        { "folke/lsp-colors.nvim" },

        {
            "folke/zen-mode.nvim",
            config = function()
                require("zen-mode").setup({})
            end,
        },

        {
            "rmagatti/auto-session",
            config = require("plugins.config.auto_sesion").setup,
        },

        {
            "voldikss/vim-floaterm",
            config = require("plugins.config.floaterm").setup,
        },

        {
            "ThePrimeagen/harpoon",
            config = require("plugins.config.harpoon").setup,
        },

        {
            "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            setup = function()
                vim.g.mkdp_filetypes = {
                    "markdown",
                }
            end,
            ft = { "markdown" },
        },

        { "j-morano/buffer_manager.nvim" },
        --
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = false },
})
