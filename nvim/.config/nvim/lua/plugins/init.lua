require "paq" {
    "savq/paq-nvim",
    "mattn/emmet-vim",
    "lukas-reineke/indent-blankline.nvim",
    "numToStr/Comment.nvim",
    "tpope/vim-fugitive",
    "airblade/vim-gitgutter",
    "andymass/vim-matchup",
    "tpope/vim-surround",
    "sainnhe/gruvbox-material",
    "neovim/nvim-lspconfig",
    "glepnir/lspsaga.nvim",
    --
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-calc",
    --
    "mhartington/formatter.nvim",
    "windwp/nvim-autopairs",
    "kyazdani42/nvim-tree.lua",
    "kyazdani42/nvim-web-devicons",
    "mbbill/undotree",
    {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            vim.cmd(":TSUpdate")
        end
    },
    "nvim-treesitter/playground",
    "nanotech/jellybeans.vim",
    "folke/tokyonight.nvim",
    "folke/lsp-colors.nvim",
    "ray-x/lsp_signature.nvim",
    "NTBBloodbath/rest.nvim",
    "p00f/nvim-ts-rainbow",
    "nvim-lua/popup.nvim",
    "ThePrimeagen/harpoon",
    "hoob3rt/lualine.nvim",
    "arkav/lualine-lsp-progress",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim",
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "!make"
    },
    "rose-pine/neovim",
    "lervag/vimtex",
    "ray-x/aurora",
    "nvim-lua/plenary.nvim",
    "ThePrimeagen/refactoring.nvim",
    "savq/melange",
    "yonlu/omni.vim",
    "shaeinst/roshnivim-cs",
    "Shatur/neovim-ayu",
    "Matsuuu/pinkmare",
    "marko-cerovac/material.nvim",
    "adrian5/oceanic-next-vim",
    "L3MON4D3/LuaSnip",
    "famiu/nvim-reload",
    "folke/zen-mode.nvim",
    "stevearc/dressing.nvim",
    "rmagatti/auto-session",
    "mfussenegger/nvim-lint"
}
