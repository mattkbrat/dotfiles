-- bootstrap lazy.nvim, LazyVim and your plugins

vim.g.python_host_prog = "~/.config/python3-venv/bin/python"
vim.g.python3_host_prog = "~/.config/python3-venv/bin/python3"

require("config.lazy")
