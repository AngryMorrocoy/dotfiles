local M = {}

local opts = {
    -- Var with all the settings
    encoding = "utf-8", -- Encoding :v
    number = true, -- Show numbers
    relativenumber = true, -- Show relative numbers
    fillchars = "vert:¦",
    termguicolors = true, -- Enable colors
    mouse = "n", -- Use the mouse in normal mode
    clipboard = "unnamedplus", -- Enable global clipboard
    backup = false, -- Fuck backups
    undofile = true, -- Enable undofiles
    undodir = vim.env["HOME"] .. "/.local/share/vim/undodir/", -- Directory for undo files
    backspace = {"indent", "eol", "start"}, -- What can delete a backspace
    history = 50, -- Only 50 lines of cmd history
    ruler = false, -- Disable the ruler, already using airline lol
    splitright = true, -- Disable the sick default splits of vim
    splitbelow = true, -- ^
    smartindent = true, -- Smart indentation (duhh?)
    expandtab = true, -- Tabs are spaces
    shiftwidth = 4, -- 4 spaces width tab
    tabstop = 4, -- ^
    ignorecase = true, -- Case insensitive search
    smartcase = true, -- Unless there is at least one capital letter
    hlsearch = false, -- Doesn't highlight search by default
    showtabline = 2, -- Always show the tabline
    numberwidth = 3, -- 3 numbers width column
    cursorline = true, -- Highlight current line
    scrolloff = 10, -- 10 lines of scroll off
    conceallevel = 1, -- Can't remember the existence of this line
    title = true, -- The file can change the title of the terminal
    laststatus = 2, -- For airline compatibility
    showmode = false, -- Doesn't show the mode airline stuff
    showcmd = false, -- Doesn't show the command that was send by a keymap
    completeopt = {"menuone", "noselect"},
    foldmethod = "syntax", -- Fold by syntax
    foldenable = false, -- Disable folding by default
    filetype = "on", -- Detect filetypes
    syntax = "on", -- Enable syntax detection
    runtimepath = function()
        vim.opt.rtp:append {"/usr/bin/fzf"}
    end, -- Loads fzf
    wildignore = "**/node_modules/**,**/__pycache__/**,**/.next/**",
    list = true,
    listchars = {eol = ""}
}

function M.setup()
    require("plugins") -- Load the plugins
    require("plugins.config").setup_all()

    require("core.autocommands").setup() -- Load the autocommands
    require("core.commands").setup() -- Load the commands

    local util = require("core.util")

    util.nvim_load_opts(opts) -- Load all the settings uwu
    require("remaps").setup() -- Load the mappings
end

return M
