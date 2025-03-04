local starry = {
  "ray-x/starry.nvim",
  lazy = false,
  config = function()
    local starry = require("starry")
    if starry ~= nil then
      starry.setup({
        custom_highlights = {
          BufferLineBackground = {
            italic = true,
          },
        },
      })
      vim.cmd("colorscheme oceanic")
    end
  end,
}

return starry
