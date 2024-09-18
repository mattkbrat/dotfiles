return {
		"aaditeynair/conduct.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		cmd = {
			"ConductNewProject",
			"ConductLoadProject",
			"ConductLoadLastProject",
			"ConductLoadProjectConfig",
			"ConductReloadProjectConfig",
			"ConductDeleteProject",
			"ConductRenameProject",
			"ConductProjectNewSession",
			"ConductProjectLoadSession",
			"ConductProjectDeleteSession",
			"ConductProjectRenameSession",
		},
		opts = {
			functions = {
				run = function()
					local termname = require("termnames")

					if not termname.terminal_exists("server") then
						termname.create_terminal("server")
					end

					termname.run_terminal_cmd({ "server", "exa -al" })
				end,
			},
			presets = {
				node = {
					keybinds = {
						["<leader>hi"] = "TermOpen control ls ${flags}",
					},
				},
			},
			hooks = {
				before_session_save = function()
					require("sidebar-nvim").close()
					require("termnames").save_terminal_data()
				end,
				before_session_load = function()
					vim.cmd("silent %bwipeout!")
				end,
				after_session_load = function()
					require("termnames").update_term_bufnr()
				end,
			},
		},
	}
