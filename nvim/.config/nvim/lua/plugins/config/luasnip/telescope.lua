local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local session = require("luasnip.session")
local util = require("luasnip.util.util")

local function active_choice_get_choices_text()
    local choice_lines = {}

    for i, choice in ipairs(session.active_choice_node.choices) do
        choice_lines[i] = "- " .. table.concat(choice:get_docstring(), "\n")
    end

    return choice_lines
end

local function insert_snip(indx)
    local choice = indx and session.active_choice_node.choices[indx]
    if not choice then
        return
    end
    local new_active =
        util.no_region_check_wrap(
        session.active_choice_node.set_choice,
        session.active_choice_node,
        choice,
        session.current_nodes[vim.api.nvim_get_current_buf()]
    )
    session.current_nodes[vim.api.nvim_get_current_buf()] = new_active
end

local function select_snip_choice(opts)
    if not session.active_choice_node then
        print("No selections")
        return
    end

    opts = opts or {}
    pickers.new(
        opts,
        {
            prompt_title = "colors",
            finder = finders.new_table(
                {
                    results = active_choice_get_choices_text()
                }
            ),
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(prompt_bufnr, _)
                actions.select_default:replace(
                    function()
                        local selection = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)

                        insert_snip(selection["index"])
                    end
                )
                return true
            end
        }
    ):find()
end

return {
    select_snip_choice = select_snip_choice
}
