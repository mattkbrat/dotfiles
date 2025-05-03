return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },

  { "jacoborus/tender.vim", "haystackandroid/snow" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tender",
    },
  },
}
