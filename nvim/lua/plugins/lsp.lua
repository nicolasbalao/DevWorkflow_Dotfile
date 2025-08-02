return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- OBLIGATOIRE pour Mason (installation auto des LSP)
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- OBLIGATOIRE pour l'autocomplétion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp", -- Source LSP pour nvim-cmp
    "hrsh7th/cmp-buffer", -- Source buffer (optionnel mais utile)
    "j-hui/fidget.nvim",
  },

  config = function()
    -- === PARTIE OBLIGATOIRE POUR AUTOCOMPLETION ===
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")

    -- Capabilities nécessaires pour que LSP communique avec nvim-cmp
    local capabilities = cmp_lsp.default_capabilities()

    -- === INSTALLATION LSP ===
    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities, -- IMPORTANT: connecte LSP et autocomplétion
          })
        end,
      },
    })

    -- ZLS setup
    local lspconfig = require("lspconfig")

    lspconfig.zls.setup({
      cmd = { "/usr/local/bin/zls" },
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
      settings = {
        zls = {
          enable_inlay_hints = true,
          enable_snippets = true,
          warn_style = true,
        },
      },
    })

    -- === CONFIG AUTOCOMPLETION MINIMALE ===
    cmp.setup({
      -- OBLIGATOIRE: sources d'autocomplétion
      sources = {
        { name = "nvim_lsp" }, -- Du LSP
        { name = "buffer" }, -- Du buffer actuel
      },
      window = {
        completion = cmp.config.window.bordered({
          border = "rounded",
        }),
        documentation = cmp.config.window.bordered({
          border = "rounded",
        }),
      },
      -- OBLIGATOIRE: au moins une façon de naviguer/confirmer
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      },
    })
  end,
}
