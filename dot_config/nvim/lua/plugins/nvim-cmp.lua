return {
  {
    "L3MON4D3/LuaSnip",
    enabled = false,
  },

  {
    "SirVer/ultisnips",
    dependencies = {
      {
        "honza/vim-snippets",
      },
    },
    -- init = function()
    -- vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips" }
    -- end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "quangnguyen30192/cmp-nvim-ultisnips",
      { "saadparwaiz1/cmp_luasnip", enabled = false },
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      }
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        --{ name = "luasnip" },
        { name = "ultisnips" },
        { name = "buffer" },
        { name = "path" },
      })
    end,
  },
}
