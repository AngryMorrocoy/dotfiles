local M = {}

function M.setup()
	local lua_theme = require("theme").lualine_theme
	require("lualine").setup({
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			theme = lua_theme,
			always_show_tabline = false,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = {},
			lualine_y = {
				"lsp_progress",
				{
					function()
						local msg = "No Active Lsp"
						local buf_ft =
							vim.api.nvim_buf_get_option(
								0,
								"filetype"
							)
						local clients =
							vim.lsp.get_active_clients()
						if next(clients) == nil then
							return msg
						end
						for _, client in ipairs(clients) do
							local filetypes =
								client.config.filetypes
							if
								filetypes
								and vim.fn.index(
										filetypes,
										buf_ft
									)
									~= -1
							then
								return client.name
							end
						end
						return msg
					end,
					icon = " LSP:",
				},
			},
			lualine_z = {
				"location",
				"filetype",
			},
		},
		tabline = {
			lualine_a = {
				{
					"tabs",
					mode = 2,
				},
			},
		},
	})
end

return M
