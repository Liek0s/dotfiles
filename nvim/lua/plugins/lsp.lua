return {
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local mason = require("mason")
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local schemas = require("schema-companion")

      mason.setup()

      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
      })

      lspconfig.dockerls.setup({
        capabilities = capabilities,
      })

      lspconfig.helm_ls.setup(schemas.setup_client({
        capabilities = capabilities,
        settings = {
          ['helm-ls'] = {
            valuesFiles = {
              mainValuesFile = "values.yaml",
              -- lintOverlayValuesFile = "values.lint.yaml",
              additionalValuesFilesGlobPattern = "values/*.yaml"
            },
            yamlls = {
              enabled = true,
              path = "yaml-language-server",
              enabledForFilesGlob = "*.{yaml,yml}",
              diagnosticsLimit = 50,
              showDiagnosticsDirectly = false,
              schemas = require('schemastore').yaml.schemas(),
            }
          }
        }
      }))

      lspconfig.yamlls.setup(schemas.setup_client({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          yaml = {
            schemaStore = {
              -- You must disable built-in schemaStore support if you want to use
              -- this plugin and its advanced options like `ignore`.
              enable = false,
              -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
              url = "",
            },
            schemas = require('schemastore').yaml.schemas(),
            format = { enable = false },
            validate = true,
            completion = true,
            hover = true,
          },
        }
      }))
    end
  },
}
