local telescope = require("telescope")
telescope.load_extension('chezmoi')
vim.keymap.set('n', '<leader>cz', telescope.extensions.chezmoi.find_files, {})