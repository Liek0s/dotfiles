return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm",
        terminal_colors = true
      })
      vim.cmd([[colorscheme tokyonight]])
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "tokyonight"
        }
      })
    end
  },
  {
    "nanozuki/tabby.nvim",
    -- event = 'VimEnter', -- if you want lazy load, see below
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      -- configs...
      require("tabby").setup({})
    end,
  },
  {
    "OXY2DEV/foldtext.nvim",
    lazy = false
  }
}
