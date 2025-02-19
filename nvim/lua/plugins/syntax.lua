return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "css",
          "dockerfile",
          "go",
          "gitignore",
          "gitcommit",
          "helm",
          "html",
          "http",
          "java",
          "javascript",
          "json",
          "json5",
          "lua",
          "make",
          "python",
          "regex",
          "rust",
          "toml",
          "vim",
          "yaml",
        },
        ignore_install = {},
        sync_install = true,
        auto_install = true,
        highlight = {
          enable = true
        }
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" }
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },

}
