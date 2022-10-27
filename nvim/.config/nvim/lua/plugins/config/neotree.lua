local M = {}

function M.setup()
    -- For the icons ;)
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
    -- # --

    require("neo-tree").setup({
        close_if_last_window = true,
        default_component_configs = {
            git_status = {
                symbols = {
                    modified = "",
                },
            },
        },
        window = {
            position = "right",
            mappings = {
                ["l"] = "open",
                ["<esc>"] = "close_window",
                ["P"] = "noop",
            },
            filesystem = {
                follow_current_file = false,
                window = {
                    mappings = {
                        ["p"] = "navigate_up",
                    },
                },
            },
        },
    })
end

return M
