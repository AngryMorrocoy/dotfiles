local M = {}

function M.setup()
    local cmp = require("cmp")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))

    cmp.setup(
        {
            mapping = {
                ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
                ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
                ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
                ["<C-y>"] = cmp.config.disable,
                ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
                ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
                ["<CR>"] = cmp.mapping.confirm({select = true})
            },
            sources = cmp.config.sources(
                {
                    {name = "nvim_lsp"}
                },
                {
                    {name = "buffer"}
                }
            )
        }
    )
end

return M
