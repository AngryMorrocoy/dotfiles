local M = {}

function M.setup()
	local cmp = require("cmp")
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")

	cmp.event:on(
		"confirm_done",
		cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
	)

	require("cmp").setup.cmdline("/", {
		sources = cmp.config.sources({
			{ name = "buffer" },
		}),
	})

	cmp.setup({
		mapping = {
			["<A-b>"] = cmp.mapping(
				cmp.mapping.scroll_docs(-4),
				{ "i", "c" }
			),
			["<A-f>"] = cmp.mapping(
				cmp.mapping.scroll_docs(4),
				{ "i", "c" }
			),
			["<C-Space>"] = cmp.mapping(
				cmp.mapping.complete(),
				{ "i", "c" }
			),
			["<C-y>"] = cmp.config.disable,
			["<C-j>"] = cmp.mapping(
				cmp.mapping.select_next_item(),
				{ "i", "c" }
			),
			["<C-k>"] = cmp.mapping(
				cmp.mapping.select_prev_item(),
				{ "i", "c" }
			),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
		}, {
			{ name = "luasnip" },
		}, {
			{ name = "buffer" },
		}, {
			{ name = "calc" },
		}, {
			{ name = "neorg" },
		}),
	})
end

return M
