local M = {}

function M.setup()
    require("telescope").setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                },
                n = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                },
            },
            scroll_strategy = "limit",
            file_ignore_patterns = { "node_modules/.*", "__pycache__/.*" },
            layout_config = {
                prompt_position = "bottom",
            },
            prompt_prefix = " "
        },
        pickers = {
            find_files = {
                no_ignore = true,
            },
            live_grep = {
                max_results = 500,
            },
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "ignore_case", -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
        },
    })

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("refactoring")
end

return M
