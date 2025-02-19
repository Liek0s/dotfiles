return {
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup({})
    end,
  },
  {
    "shellRaining/hlchunk.nvim",
    lazy = false,
    -- event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          delay = 250 
        },
        blank = {
          enable = false
        },
        indent = {
          enable = true
        },
        line_num = {
          enable = true
        }
      })
    end
  },
}
