return {
  {
    "towolf/vim-helm",
    ft = "helm",
  },
  {
    "b0o/schemastore.nvim",
  },
  {
    "cenk1cenk2/schema-companion.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("schema-companion").setup({
        matchers = {
          require("schema-companion.matchers.kubernetes").setup({ version = "master" }),
        },
        schemas = {
          {
            name = "Kustomization",
            uri = "https://json.schemastore.org/kustomization.json"
          },
        }
      })
    end,
  }, 
}

