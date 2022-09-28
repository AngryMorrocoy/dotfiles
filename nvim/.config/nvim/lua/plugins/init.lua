require("packer").startup(
    function(use)
        use "wbthomason/packer.nvim"
        -- Plenary, a dependency for almost anything xd
        use "nvim-lua/plenary.nvim"
        --
        use "mattn/emmet-vim"
        use "lukas-reineke/indent-blankline.nvim"
        use "numToStr/Comment.nvim"
        use "lewis6991/gitsigns.nvim"
        use "andymass/vim-matchup"
        use "tpope/vim-surround"
        -- Lsp
        use "ray-x/lsp_signature.nvim"
        use "folke/trouble.nvim"
        use "neovim/nvim-lspconfig"
        use "ThePrimeagen/refactoring.nvim"
        -- CMP Section
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-nvim-lsp"
        use "saadparwaiz1/cmp_luasnip"
        use "hrsh7th/cmp-cmdline"
        use "hrsh7th/cmp-calc"
        --
        use "mhartington/formatter.nvim"
        --
        use "windwp/nvim-autopairs"
        --
        use "kyazdani42/nvim-tree.lua"
        use "kyazdani42/nvim-web-devicons"
        use "mbbill/undotree"
        -- Treesitter
        use "p00f/nvim-ts-rainbow"
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate"
        }
        use "nvim-treesitter/playground"
        use 'nvim-treesitter/nvim-treesitter-context'
        -- Themes
        use "yonlu/omni.vim"
        use "shaeinst/roshnivim-cs"
        use "sainnhe/gruvbox-material"
        use "nanotech/jellybeans.vim"
        use "folke/tokyonight.nvim"
        use "folke/lsp-colors.nvim"
        use "pineapplegiant/spaceduck"
        use {"catppuccin/nvim", as = "catppuccin"}
        use "rose-pine/neovim"
        use "ray-x/aurora"
        use "Shatur/neovim-ayu"
        use "savq/melange"
        -- Nvim like rest client
        use "NTBBloodbath/rest.nvim"
        --
        -- Lualine
        use "hoob3rt/lualine.nvim"
        use "arkav/lualine-lsp-progress"
        -- Telescope
        use "nvim-telescope/telescope.nvim"
        use {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make"
        }
        -- Latex environment :D
        use "lervag/vimtex"
        -- Snippets
        use "L3MON4D3/LuaSnip"
        -- Nvim looking good af
        use "nvim-lua/popup.nvim"
        use "gen740/SmoothCursor.nvim"
        use "stevearc/dressing.nvim"
        --
        use "folke/zen-mode.nvim"
        use "rmagatti/auto-session"
        use "voldikss/vim-floaterm"
        use "ThePrimeagen/harpoon"
        -- When changing too much the configuration
        use "famiu/nvim-reload"
    end
)
