local M = {}

local function nvim_map(mode, lhs, rhs, opts, bufonly)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	if bufonly then
		options = vim.tbl_extend("force", options, { buffer = true })
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

function M.map_all(mapsList, bufonly)
	for key, value in pairs(mapsList) do
		local mode, trigger = key:match("^([^|]*)|(.*)")
		nvim_map(mode, trigger, value.action, value.opts, bufonly)
	end
end

return M
