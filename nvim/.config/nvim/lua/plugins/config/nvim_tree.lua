local g = vim.g
local M = {}

function M.setup()
    local tree_cb = require("nvim-tree.config").nvim_tree_callback

    require "nvim-tree".setup {
        disable_netrw = false,
        hijack_netrw = true,
        open_on_setup = false,
        ignore_ft_on_setup = {"startify"},
        hijack_directories = {
            enable = true,
            auto_open = true
        },
        -- auto_close = true,
        open_on_tab = false,
        hijack_cursor = true,
        update_cwd = true,
        diagnostics = {
            enable = true,
            show_on_dirs = true
        },
        update_focused_file = {
            enable = false,
            update_cwd = false,
            ignore_list = {}
        },
        system_open = {
            cmd = nil,
            args = {}
        },
        view = {
            width = "18%",
            side = "right",
            adaptive_size = false,
            mappings = {
                custom_only = true,
                list = {
                    {key = {"l", "<cr>"}, cb = tree_cb("edit")},
                    {key = {"cd"}, cb = tree_cb("cd")},
                    {key = {"s", "<C-v>"}, cb = tree_cb("vsplit")},
                    {key = {"i", "<C-s>"}, cb = tree_cb("split")},
                    {key = {"t", "<C-t"}, cb = tree_cb("tabnew")},
                    {key = "<", cb = tree_cb("prev_sibling")},
                    {key = ">", cb = tree_cb("next_sibling")},
                    {key = "P", cb = tree_cb("parent_node")},
                    {key = "<BS>", cb = tree_cb("close_node")},
                    {key = "<S-CR>", cb = tree_cb("close_node")},
                    {key = "<Tab>", cb = tree_cb("preview")},
                    {key = "K", cb = tree_cb("first_sibling")},
                    {key = "J", cb = tree_cb("last_sibling")},
                    {key = "I", action = "toggle_git_ignored"},
                    {key = "H", cb = tree_cb("toggle_dotfiles")},
                    {key = "R", cb = tree_cb("refresh")},
                    {key = "a", cb = tree_cb("create")},
                    {key = "d", cb = tree_cb("remove")},
                    {key = "r", cb = tree_cb("rename")},
                    {key = "<C-r>", cb = tree_cb("full_rename")},
                    {key = "x", cb = tree_cb("cut")},
                    -- {key = "c", cb = tree_cb("copy")},
                    {key = "p", cb = tree_cb("paste")},
                    {key = "y", cb = tree_cb("copy_name")},
                    {key = "Y", cb = tree_cb("copy_path")},
                    {key = "gy", cb = tree_cb("copy_absolute_path")},
                    {key = "[c", cb = tree_cb("prev_git_item")},
                    {key = "]c", cb = tree_cb("next_git_item")},
                    {key = "-", cb = tree_cb("dir_up")},
                    {key = "q", cb = tree_cb("close")},
                    {key = "g?", cb = tree_cb("toggle_help")}
                }
            }
        },
        filters = {
            custom = {".git", "node_modules", "__pycache__"}
        }
    }

    g.nvim_tree_indent_markers = 1
    g.nvim_tree_add_trailing = 1
    g.nvim_tree_disable_window_picker = 0
end

return M
