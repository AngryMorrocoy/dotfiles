local M = {}

function M.expand_or_jump_keymap()
    local ls = require("luasnip")

    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
        return
    end

    local tab_key = vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
    vim.api.nvim_feedkeys(tab_key, "n", false)
end

function M.jump_backwards()
    local ls = require("luasnip")
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end

function M.change_choice_node()
    local ls = require("luasnip")
    if ls.choice_active() then
        ls.change_choice(1)
    end
end

return M
