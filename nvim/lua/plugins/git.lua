return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require("gitsigns").setup({
        linehl = true
      })
    end
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    config = function()
      require("gitlinker").setup({
        router = {
          browse = {
            ["^gitlab%.tooling%.ovh%.kube%.qwant%.ninja"] = require('gitlinker.routers').gitlab_browse,
          },
          blame = {
            ["^gitlab%.tooling%.ovh%.kube%.qwant%.ninja"] = require('gitlinker.routers').gitlab_blame,
          }
        }
      })
    end
  },
}
