local starry = {
  "ray-x/starry.nvim",
  enabled = false,
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
    end
  end,
}

return starry
