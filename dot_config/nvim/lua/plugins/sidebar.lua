return {
		"sidebar-nvim/sidebar.nvim",
		cmd = { "SidebarNvimToggle", "SidebarNvimClose" },
		config = function()
			local harpoon = require("harpoon")

			local base_info = {
				title = "Info",
				icon = "",
				draw = function()
					local lines = {}

					-- Mode
					local modes = {
						["n"] = "Normal",
						["no"] = "N·Operator Pending",
						["v"] = "Visual",
						["V"] = "V·Line",
						[""] = "V·Block",
						["s"] = "Select",
						["S"] = "S·Line",
						[""] = "S·Block",
						["i"] = "Insert",
						["R"] = "Replace",
						["Rv"] = "V·Replace",
						["c"] = "Command",
						["cv"] = "Vim Ex",
						["ce"] = "Ex",
						["r"] = "Prompt",
						["rm"] = "More",
						["r?"] = "Confirm",
						["!"] = "Shell",
						["t"] = "Terminal",
					}
					local mode = vim.fn.mode()
					local mode_name = modes[mode]
					table.insert(lines, "mode: " .. (mode_name and mode_name or "undefined"))

					-- Git branch
					if vim.fn.isdirectory(".git") then
						local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
						if branch ~= "" then
							table.insert(lines, "branch: " .. branch)
						end
					end

					-- Project Stuff
					local current_project = require("conduct").current_project.name
					if current_project ~= nil then
						table.insert(lines, "project: " .. current_project)
						local current_session = require("conduct").current_session
						table.insert(lines, "session: " .. current_session)
					end

					return {
						lines = lines,
					}
				end,
			}

			local buffers = {
				title = "Buffers",
				icon = "",
				draw = function()
					local lines = {}
					local cwd = vim.fn.getcwd() .. "/"

					local all_buffers = vim.fn.getbufinfo()
					for _, buf in ipairs(all_buffers) do
						if buf.name:find("^term://") ~= nil or buf.name == "" then
							goto continue
						end

						if buf.listed == 1 then
							local buf_name = vim.fn.substitute(buf.name, "^" .. vim.fn.escape(cwd, "/-"), "", "")
							if buf.name == vim.api.nvim_buf_get_name(0) then
								table.insert(lines, "> " .. buf_name)
							else
								table.insert(lines, "  " .. buf_name)
							end
						end

						::continue::
					end

					return {
						lines = lines,
					}
				end,
			}

			local terms = {
				title = "Terminals",
				icon = "",
				draw = function()
					local lines = {}
					local terminal_data = require("termnames").get_terminals()
					if terminal_data then
						local current_bufnr = vim.api.nvim_win_get_buf(0)
						for _, term in ipairs(terminal_data) do
							if term.bufnr == current_bufnr then
								table.insert(lines, "> " .. term.name)
							else
								table.insert(lines, "  " .. term.name)
							end
						end
					end
					return {
						lines = lines,
					}
				end,
			}

			local harpoon_marks = {
				title = "Harpoon Marks",
				icon = "",
				draw = function()
					local marks = harpoon.get_mark_config().marks
					local keymaps = { "H ", "T ", "M ", "L " }
					local lines = {}

					for idx = 1, #marks do
						if idx > 4 then
							table.insert(lines, "  " .. marks[idx].filename)
						else
							table.insert(lines, keymaps[idx] .. marks[idx].filename)
						end
					end

					return {
						lines = lines,
					}
				end,
			}

			-- vim.api.nvim_set_hl(0, "SidebarNvimSectionTitle", { fg = "#f9f5d7" })

			require("sidebar-nvim").setup({
				sections = { base_info, buffers, terms, harpoon_marks },
				update_interval = 0,
				hide_statusline = true,
			})

			vim.api.nvim_create_autocmd(
				{ "BufAdd", "BufDelete", "BufEnter", "TabEnter", "ModeChanged", "DiagnosticChanged" },
				{
					callback = function()
						require("sidebar-nvim").update()
					end,
				}
			)
		end,
	}
