return {
  {
    "frankroeder/parrot.nvim",
    dependencies = {"nvim-telescope/telescope.nvim", "rcarriga/nvim-notify", "nvim-lua/plenary.nvim" },
    config = function()
      require("parrot").setup {
        -- Providers must be explicitly added to make them available.
        providers = {
          mistral = {
            api_key = os.getenv "MISTRAL_API_KEY",
          },
        },
      }
    end,
  }
}
