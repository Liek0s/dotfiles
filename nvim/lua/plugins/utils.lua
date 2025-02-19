return {
  {
    "rcarriga/nvim-notify",
    config = function ()
      require("notify").setup({
        stages = 'fade_in_slide_out',
        background_colour = 'FloatShadow',
        timeout = 3000,
      })
      vim.notify = require('notify')
    end
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup()
      telescope.load_extension("projects")
      telescope.load_extension("schema_companion")
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        manual_mode = true,
        detection_methods = { "lsp", "pattern" },
        patterns = { "=~/workspace/ovh/argocd", "Chart.yaml", ".git", "Makefile", "package.json", "requirements.txt", "poetry.lock" },
        exclude_dirs = {"~/workspace/eqx/*"}
      })
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      position = "bottom"
    },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "karb94/neoscroll.nvim",
    opts = {
      hide_cursor = false
    },
  }
}
