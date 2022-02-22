local M = {}

function M.setup()
    require('lspsaga').init_lsp_saga {
        finder_action_keys = {
            open = '<cr>',
            vsplit = '<C-v>',
            split = '<C-s>',
            quit = '<Esc>',
            scroll_down = '<C-f>',
            scroll_up = '<C-b>'
        },
        code_action_keys={
            quit = '<Esc>'
        },
        rename_action_keys={
            quit = '<Esc>'
        },
    }
end


return M
