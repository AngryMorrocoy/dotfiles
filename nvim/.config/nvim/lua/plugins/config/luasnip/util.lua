local M = {}

function M.expand_or_jump_keymap()
    local ls = require("luasnip")
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
        return
    end

    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local line = vim.api.nvim_get_current_line()
    local new_line = line:sub(0, cursor_pos[2]) .. "\t" .. line:sub(cursor_pos[2] + 1)

    vim.api.nvim_set_current_line(new_line)
    vim.api.nvim_win_set_cursor(0, {cursor_pos[1], cursor_pos[2] + 1})
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
