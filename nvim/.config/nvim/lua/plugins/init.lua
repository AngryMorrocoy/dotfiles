require("packer").startup(
    function(use)
        use "wbthomason/packer.nvim"
        --
        use "mattn/emmet-vim"
        use "lukas-reineke/indent-blankline.nvim"
        use "numToStr/Comment.nvim"
        use "lewis6991/gitsigns.nvim"
        use "andymass/vim-matchup"
        use "tpope/vim-surround"
        use "sainnhe/gruvbox-material"
        use "neovim/nvim-lspconfig"
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-nvim-lsp"
        use "saadparwaiz1/cmp_luasnip"
        use "hrsh7th/cmp-cmdline"
        use "hrsh7th/cmp-calc"
        use "mhartington/formatter.nvim"
        use "windwp/nvim-autopairs"
        use "kyazdani42/nvim-tree.lua"
        use "kyazdani42/nvim-web-devicons"
        use "mbbill/undotree"
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate"
        }
        use "nvim-treesitter/playground"
        use "nanotech/jellybeans.vim"
        use "folke/tokyonight.nvim"
        use "folke/lsp-colors.nvim"
        use "ray-x/lsp_signature.nvim"
        use "NTBBloodbath/rest.nvim"
        use "p00f/nvim-ts-rainbow"
        use "nvim-lua/popup.nvim"
        use "ThePrimeagen/harpoon"
        use "hoob3rt/lualine.nvim"
        use "arkav/lualine-lsp-progress"
        use "folke/trouble.nvim"
        use "nvim-telescope/telescope.nvim"
        use {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make"
        }
        use "rose-pine/neovim"
        use "lervag/vimtex"
        use "ray-x/aurora"
        use "nvim-lua/plenary.nvim"
        use "ThePrimeagen/refactoring.nvim"
        use "savq/melange"
        use "yonlu/omni.vim"
        use "shaeinst/roshnivim-cs"
        use "Shatur/neovim-ayu"
        use "Matsuuu/pinkmare"
        use "marko-cerovac/material.nvim"
        use "adrian5/oceanic-next-vim"
        use "L3MON4D3/LuaSnip"
        use "famiu/nvim-reload"
        use "folke/zen-mode.nvim"
        use "stevearc/dressing.nvim"
        use "rmagatti/auto-session"
        use "voldikss/vim-floaterm"
        use "mfussenegger/nvim-lint"
        use "pineapplegiant/spaceduck"
        use {"catppuccin/nvim", as = "catppuccin"}
        use "gen740/SmoothCursor.nvim"
        use 'nvim-treesitter/nvim-treesitter-context'
    end
)
