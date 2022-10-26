-- This file is for setting specific opts for languages
local syntaxes = {}

syntaxes["^c$|^cpp$"] = {
    expandtab = false,
    shiftwidth = 4,
    tabstop = 4,
    smartindent = true,
}

syntaxes["^css$|^scss$"] = {
    shiftwidth = 2,
    tabstop = 2,
}

syntaxes["html*"] = {
    shiftwidth = 2,
    tabstop = 2,
    expandtab = true,
    foldmethod = "indent",
}

syntaxes["^javascript|^typescript"] = {
    shiftwidth = 2,
    tabstop = 2,
    expandtab = true,
    colorcolumn = "80",
    maps = {
        ["n|<leader>r"] = { action = '<cmd>!node "%"<cr>' },
    },
}

syntaxes["^json$"] = {
    shiftwidth = 2,
    tabstop = 2,
    expandtab = true,
}

syntaxes["^python$"] = {
    shiftwidth = 4,
    tabstop = 4,
    smartindent = true,
    foldmethod = "indent",
    colorcolumn = "80",
    maps = {
        ["n|<leader>r"] = { action = '<cmd>!python3 "%"<cr>' },
        ["n|<leader>dr"] = { action = '<cmd>!python3 "%"<cr>' },
    },
}

syntaxes["^lua$"] = {
    shiftwidth = 4,
    tabstop = 4,
}

syntaxes["^http$"] = {
    maps = {
        ["n|<leader>r"] = {
            action = function()
                require("rest-nvim").run()
            end,
            opts = { silent = true },
        },
    },
}

syntaxes["^tex$"] = {
    conceallevel = 1,
    textwidth = 80,
}

syntaxes["^go$"] = {
    shiftwidth = 4,
    tabstop = 4,
}

syntaxes["^norg$"] = {
    shiftwidth = 2,
    tabstop = 2,
    textwidth = 80,
    maps = {
        ["n|<leader>ct"] = { action = "<cmd>Neorg toggle-concealer<cr>" },
    },
}

return syntaxes
