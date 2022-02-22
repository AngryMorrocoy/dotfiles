-- This file is for setting specific opts for languages
local syntaxes = {}

syntaxes["^c$|^cpp$"] = {
    expandtab = false,
    shiftwidth = 4,
    tabstop = 4,
    smartindent = true
}

syntaxes["^css$|^scss$"] = {
    shiftwidth = 2,
    tabstop = 2
}

syntaxes["html*"] = {
    shiftwidth = 4,
    tabstop = 4,
    expandtab = true,
    foldmethod = "indent"
}

syntaxes["^javascript|^typescript"] = {
    shiftwidth = 2,
    tabstop = 2,
    expandtab = true,
    colorcolumn = "80",
    maps = {
        ["n|<leader>r"] = {action = '<cmd>!node "%"<cr>'}
    }
}

syntaxes["^json$"] = {
    shiftwidth = 4,
    tabstop = 4,
    expandtab = true
}

syntaxes["^python$"] = {
    shiftwidth = 4,
    tabstop = 4,
    smartindent = true,
    foldmethod = "indent",
    colorcolumn = "79",
    maps = {
        ["n|<leader>r"] = {action = '<cmd>!python3 "%"<cr>'},
        ["n|<leader>dr"] = {action = '<cmd>!python3 "%"<cr>'}
    }
}

syntaxes["^nerdtree$"] = {
    shiftwidth = 2,
    tabstop = 2,
    run = function()
        vim.cmd("IndentLinesEnable")
    end
}

syntaxes["^lua$"] = {
    shiftwidth = 4,
    tabstop = 4
}

syntaxes["^http$"] = {
    maps = {
        ["n|<leader>r"] = {action = "<cmd>call v:lua.require('rest-nvim').run()<cr>", opts = {silent = true}}
    }
}

syntaxes["^tex$"] = {
    conceallevel = 0,
    maps = {},
    run = function()
        vim.cmd("let maplocalleader=','")
    end
}

return syntaxes
