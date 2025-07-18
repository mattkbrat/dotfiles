-- lsp-zero.lua
return {
  "VonHeikemen/lsp-zero.nvim",
  -- ...
  config = function()
    -- ...
    local lsp_conf = require("lspconfig")
    -- ...
    lsp_conf.harper_ls.setup({
      settings = {
        ["harper-ls"] = {
          linters = {
            spell_check = true,
            spelled_numbers = false,
            an_a = true,
            sentence_capitalization = true,
            unclosed_quotes = true,
            wrong_quotes = false,
            long_sentences = true,
            repeated_words = true,
            spaces = true,
            matcher = true,
          },
        },
      },
    })
    -- ...
  end,
}
