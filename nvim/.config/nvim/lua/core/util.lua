local M = {}
M.autocommands = {}
local api = vim.api
local fn = vim.fn
local cmd = vim.cmd

local function copyTable(_table)
	local _table2 = {}
	for key, value in pairs(_table) do
		_table2[key] = value
	end
	return _table2
end

function M.nvim_load_opts(opts, localonly) -- Load all the options in opts table
	-- A table of props, with the syntax
	-- key=value
	-- being the key the prop and value the value(?
	for opt, value in pairs(opts) do
		if type(value) == "function" then
			value()
		else
			if localonly then
				vim.opt_local[opt] = value
			else
				vim.opt[opt] = value
			end
		end
	end
end

function M.nvim_set_highlight(hlname, props, getstr)
	-- hlname: The name of the highlight
	-- props: A table with key:value for the props being set
	-- Sample:
	--  nvim_set_highlight('VertSplit', { ctermbg="NONE", guibg="NONE" })
	local hl_command = "highlight " .. hlname .. " "
	for prop, value in pairs(props) do
		local str_prop = prop .. "=" .. value
		hl_command = hl_command .. str_prop .. " "
	end
	if getstr then
		return hl_command
	end
	cmd(hl_command)
end

function M.close_all_float_win()
	for _, win in ipairs(api.nvim_list_wins()) do
		local config = api.nvim_win_get_config(win)
		if config.relative ~= "" then
			api.nvim_close_win(win, false)
			print("Closing window", win)
		end
	end
end

function M.autocommands:jump_to_last_known_cursor_position()
	-- Go to the last known cursor position
	local lastline = fn.line("'\"")
	local filetype = vim.bo.filetype:match("commit")
	if
		lastline >= 1
		and lastline <= fn.line("$")
		and filetype ~= "commit"
	then
		cmd("normal " .. lastline .. "gg")
	end
end

function M.autocommands:load_syntax_specific_opts()
	local syntaxes = require("core.syntax")
	local keymap_all = require("remaps.util").map_all
	local current_ft = vim.bo.filetype

	for regexs, config in pairs(syntaxes) do
		for _, regx in ipairs(fn.split(regexs, "|")) do
			if current_ft:match(regx) then
				config = copyTable(config)
				local maps = config.maps
				local run = config.run
				config.maps = nil
				config.run = nil
				M.nvim_load_opts(config, true)
				if maps then
					keymap_all(maps, true)
				end
				if run then
					run()
				end
				return ""
			end
		end
	end
end

function M.concat_tables(table_of_tables)
	if #table_of_tables == 1 then
		return table_of_tables[1]
	end

	local retornable = table_of_tables[1]
	for i = 2, #table_of_tables do
		local table2 = table_of_tables[i]
		for j = 1, #table2 do
			retornable[#retornable + 1] = table2[j]
		end
	end

	return retornable
end

return M
