return {
	setup = function()
		vim.api.nvim_create_user_command(
			"CopyFilePath",
			":!echo '%:p' | xclip -i -sel c",
			{}
		)

		vim.api.nvim_create_user_command(
			"T",
			"split | resize 12 | terminal",
			{}
		)
		vim.api.nvim_create_user_command(
			"Vt",
			"vertical split | vertical resize 80 | terminal",
			{}
		)

		vim.api.nvim_create_user_command(
			"CloseAllFloatingWin",
			require("core.util").close_all_float_win,
			{}
		)

		vim.api.nvim_create_user_command("FJson", function(args)
			local cur_ft = vim.bo.filetype
			if args.range == 0 and cur_ft ~= "json" then
				vim.api.nvim_notify(
					"You're not in a json file! Please run this command with a range",
					vim.log.levels.WARN,
					{}
				)
				return
			end

			local command = "%!jq"
			if args.range ~= 0 then
				command = string.format(
					"%s,%s!jq",
					args.line1,
					args.line2
				)
			end
			if args.args:match("minify") then
				command = command .. " -c"
			end

			vim.cmd(command)
		end, {
			force = true,
			range = true,
			nargs = "?",
			complete = function()
				return { "minify" }
			end,
		})

		vim.api.nvim_create_user_command("ReloadSnippets", function()
			require("luasnip.loaders.from_snipmate").load()
			require("luasnip.loaders.from_lua").load()
		end, { force = true })
	end,
}
