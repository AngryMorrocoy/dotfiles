local M = {}

function M.setup()
	require("rest-nvim").setup({
		result_split_horizontal = false,
	})
end

return M
