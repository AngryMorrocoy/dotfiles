local M = {}

function M.expand_or_jump_keymap()
    local ls = require("luasnip")
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
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

function M.concat_tables(table_of_tables)
    if #table_of_tables == 1 then
        return table_of_tables[1]
    end

    local retornable = table_of_tables[1]
    for i = 2, #table_of_tables do
        local table2 = table_of_tables[i]
        for j = 1, #table2 do
            retornable[#retornable + 1] = table2[j]
        end
    end

    return retornable
end

return M
