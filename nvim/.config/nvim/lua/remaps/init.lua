local util = require("remaps.util")
vim.g.mapleader = "," -- Setting the mapleader uwu

local keyMaps = {
    -- Local stuff
    ["n|<leader>w"] = { action = "<cmd>w<cr>" }, -- Saves faster
    ["n|<leader>W"] = { action = "<cmd>wa<cr>" }, -- Saves faster
    ["n|<leader><cr>"] = { action = "<cmd>q<cr>" }, -- Quit faster
    ["n|<leader>q<cr>"] = { action = "<cmd>q!<cr>" }, -- Forces quit
    ["n|>"] = { action = ">>" }, -- Fast indentation on normal mode
    ["n|<"] = { action = "<<" }, -- ^
    -- Opens undotree
    ["n|<leader>u"] = { action = "<cmd>UndotreeToggle<cr>" },
    -- NvimTree
    ["n|<C-u>"] = { action = "<cmd>NvimTreeToggle <cr>" },
    ["n|<leader><C-u>"] = { action = "<cmd>NvimTreeFindFile <cr>" },
    -- Maximizer
    ["n|<leader>o"] = { action = "<cmd>ZenMode<cr>", opts = { silent = true } },
    -- Tab management
    ["n|tt"] = { action = "<cmd>tabnew<cr>" },
    ["n|td"] = { action = "<cmd>tabclose<cr>" },
    -- Buffs movement
    ["n|<leader>ba"] = { action = "<cmd>bnext<cr>", opts = { silent = true } },
    ["n|<leader>bo"] = { action = "<cmd>bprevious<cr>", opts = { silent = true } },
    ["n|<leader>gm"] = { action = "<cmd>Telescope buffers<cr>", opts = { silent = true } },
    -- Easy movement on terminal buffer
    ["t|<Esc>"] = { action = "<C-\\><C-n>" },
    ["t|<Esc><Esc>"] = { action = "<C-\\><C-n><C-W><C-W>" },
    -- Better movement between panes
    ["n|<C-k>"] = { action = "<C-w><C-k>" },
    ["n|<C-j>"] = { action = "<C-w><C-j>" },
    ["n|<C-h>"] = { action = "<C-w><C-h>" },
    ["n|<C-l>"] = { action = "<C-w><C-l>" },
    -- Easy resizing
    ["n|<C-w>0"] = { action = "<C-w>=" },
    ["n|<C-Right>"] = { action = "<C-w><" },
    ["n|<C-Left>"] = { action = "<C-w>>" },
    ["n|<C-Up>"] = { action = "<C-w>+" },
    ["n|<C-Down>"] = { action = "<C-w>-" },
    --
    ["n|<leader>p"] = { action = "<cmd>lua vim.lsp.buf.format({async = false})<cr>" },
    -- Telescope movements
    ["n|<leader>F"] = { action = "<cmd>Telescope<cr>", opts = { silent = true } },
    ["n|<leader>ff"] = { action = "<cmd>Telescope find_files<cr>", opts = { silent = true } },
    ["n|<leader>fs"] = { action = "<cmd>Telescope live_grep<cr>", opts = { silent = true } },
    ["n|<leader>fh"] = { action = "<cmd>Telescope help_tags<cr>", opts = { silent = true } },
    ["n|<leader>fq"] = { action = "<cmd>Telescope quickfix<cr>", opts = { silent = true } },
    ["n|<leader>fo"] = { action = "<cmd>Telescope loclist<cr>", opts = { silent = true } },
    -- Lsp
    ["n|gd"] = { action = "<C-]>", { silent = true } },
    ["n|gvd"] = { action = "<C-w>v<C-]>", { silent = true } },
    ["n|gsd"] = { action = "<cmd>split |lua vim.lsp.buf.definition() <cr>", { silent = true } },
    ["n|gr"] = { action = "<cmd>Telescope lsp_references<cr>", opts = { silent = true } },
    ["n|<leader>ac"] = { action = vim.lsp.buf.code_action, opts = { silent = true } },
    ["n|<leader>d"] = { action = vim.lsp.buf.hover, opts = { silent = true } },
    ["n|<leader>.r"] = { action = vim.lsp.buf.rename, opts = { silent = true } },
    -- Toggle recent files
    ["n|<leader><space>"] = { action = "<C-^>", opts = { silent = true } },
    -- Better movement, holy shit i need that
    ["n|k"] = { action = '(v:count > 5 ? "m\'" . v:count : "") . "k"', opts = { expr = true, silent = true } },
    ["n|j"] = { action = '(v:count > 5 ? "m\'" . v:count : "") . "j"', opts = { expr = true, silent = true } },
    -- Keeping it centered
    ["n|n"] = { action = "nzz", opts = { silent = true } },
    ["n|N"] = { action = "Nzz", opts = { silent = true } },
    ["n|<C-f>"] = { action = "<C-f>zz", opts = { silent = true } },
    ["n|<C-b>"] = { action = "<C-b>zz", opts = { silent = true } },
    -- Harpoon marks
    ["n|<leader><leader>m"] = {
        action = function()
            require("harpoon.mark").add_file()
        end,
    },
    ["n|<leader><leader>a"] = {
        action = function()
            require("harpoon.ui").nav_file(1)
        end,
    },
    ["n|<leader><leader>o"] = {
        action = function()
            require("harpoon.ui").nav_file(2)
        end,
    },
    ["n|<leader><leader>e"] = {
        action = function()
            require("harpoon.ui").nav_file(3)
        end,
    },
    ["n|<leader><leader>u"] = {
        action = function()
            require("harpoon.ui").nav_file(4)
        end,
    },
    ["n|<leader><leader>q"] = {
        action = require("harpoon.ui").toggle_quick_menu,
    },
    -- Quickfix/Loclist stuff
    ["n|<leader><c-d>"] = { action = "<cmd>cnext<cr>" },
    ["n|<leader><c-a>"] = { action = "<cmd>cprev<cr>" },
    ["n|<C-a>"] = { action = "<cmd>lprev<cr>" },
    ["n|<C-d>"] = { action = "<cmd>lnext<cr>" },
    -- Whys it isn't a default?
    ["n|Y"] = { action = "y$" },
    -- Trouble
    ["n|<leader>xx"] = { action = "<cmd>Trouble<cr>" },
    ["n|<leader>xw"] = { action = "<cmd>Trouble lsp_workspace_diagnostics<cr>" },
    ["n|<leader>xd"] = { action = "<cmd>Trouble lsp_document_diagnostics<cr>" },
    -- Refactoring
    ["v|<leader>rr"] = { action = "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>" },
    ["v|<leader>dpv"] = { action = require("refactoring").debug.print_var },
    ["n|<leader>dpv"] = { action = require("refactoring").debug.print_var },
    -- Easier out from insert mode
    ["i|<C-s>"] = { action = "<esc>", opts = { silent = true } },
    -- LuaSnips
    ["i|<Tab>"] = {
        action = require("plugins.config.luasnip.util").expand_or_jump_keymap,
    },
    ["i|<S-Tab>"] = {
        action = require("plugins.config.luasnip.util").jump_backwards,
    },
    ["i|<C-l>"] = {
        action = require("plugins.config.luasnip.util").change_choice_node,
    },
    ["i|<C-u>"] = {
        action = require("luasnip.extras.select_choice"),
    },
    ["s|<Tab>"] = {
        action = require("plugins.config.luasnip.util").expand_or_jump_keymap,
    },
    ["s|<S-Tab>"] = {
        action = require("plugins.config.luasnip.util").jump_backwards,
    },
    ["s|<C-l>"] = {
        action = require("plugins.config.luasnip.util").change_choice_node,
    },
    ["s|<C-u>"] = {
        action = require("luasnip.extras.select_choice"),
    },
    -- Quck nvim restart
    ["n|<leader><leader>s"] = { action = "<cmd>Reload<cr>" },
    -- Reload a session
    ["n|<leader><leader>r"] = { action = "<cmd>RestoreSession<cr>" },
    -- Floaterm toggle
    ["n|<leader>t"] = { action = "<cmd>FloatermToggle<cr>" },
    -- Gitsigns
    ["n|<leader>hp"] = { action = "<cmd>Gitsigns preview_hunk<cr>" },
    ["n|<leader>hu"] = { action = "<cmd>Gitsigns reset_hunk<cr>" },
    ["n|<leader>hs"] = { action = "<cmd>Gitsigns stage_hunk<cr>" },
    ["n|<leader>ha"] = { action = "<cmd>Gitsigns prev_hunk<cr>" },
    ["n|<leader>ho"] = { action = "<cmd>Gitsigns next_hunk<cr>" },
}

return {
    setup = function()
        util.map_all(keyMaps)
    end,
}
