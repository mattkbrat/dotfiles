-- local M = {
--   "stevearc/oil.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
-- }
--
-- M.config = function()
--   local oil = require("oil")
--   local actions = require("oil.actions")
--   oil.setup({
--     keymaps = {
--       ["g?"] = actions.show_help.callback(),
--       ["<CR>"] = actions.select.callback(),
--       ["<C-s>"] = actions.select_vsplit.callback(),
--       ["<C-h>"] = actions.select_split.callback(),
--       ["<C-t>"] = actions.select_tab.callback(),
--       ["<C-p>"] = actions.preview.callback(),
--       ["<C-c>"] = actions.close.callback(),
--       ["<C-l>"] = actions.refresh.callback(),
--       ["-"] = actions.parent.callback(),
--       ["_"] = actions.open_cwd.callback(),
--       ["`"] = actions.cd.callback(),
--       ["~"] = actions.tcd.callback(),
--       ["gs"] = actions.change_sort.callback(),
--       ["gx"] = actions.open_external.callback(),
--       ["g."] = actions.toggle_hidden.callback(),
--       ["g\\"] = actions.toggle_trash.callback(),
--     },
--   })
-- end
-- return M

return {
  "stevearc/oil.nvim",
  opts = {},
  enabled = true,
  -- Optional dependencies
  keys = { { "<leader>e", "<cmd>Oil<cr>", desc = "File Explorer" } },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Oil",
  event = { "VimEnter */*,.*", "BufNew */*,.*" },
}
