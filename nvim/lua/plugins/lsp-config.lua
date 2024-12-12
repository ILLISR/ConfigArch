return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- Configuración de Pyright
      lspconfig.pyright.setup({
        settings = {
          pyright = {
            disableOrganizeImports = true, -- Ruff se encargará de organizar importaciones
          },
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "openFilesOnly", -- Diagnosticar solo archivos abiertos
            },
          },
        },
        on_attach = function(client, bufnr)
          -- Deshabilitar formato desde Pyright para evitar conflictos con Black
          client.server_capabilities.documentFormattingProvider = false
        end,
      })

      -- Configuración de Ruff LSP
      lspconfig.ruff.setup({
        filetypes = { "python" },
      })

      -- Configuración de otros LSPs
      lspconfig.gopls.setup({
        filetypes = { "go", "gomod" },
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({ capabilities = capabilities })
     lspconfig.ts_ls.setup({ capabilities = capabilities })
      lspconfig.tailwindcss.setup({ capabilities = capabilities })
      lspconfig.eslint.setup({ capabilities = capabilities })

      vim.o.updatetime = 100
      vim.diagnostic.config({
        virtual_text = false, -- Desactiva el texto virtual para un código más limpio
        float = {
          source = "always",
          border = "rounded",
          focusable = true, -- Permite enfocar la ventana flotante para interactuar con ella
          max_width = 50, -- Ajusta el ancho máximo para forzar el ajuste de línea
          format = function(diagnostic)
            return string.format("%s [%s]", diagnostic.message, diagnostic.source)
          end,
        },
      })

      -- Autocomando para mostrar la ventana flotante al pasar el cursor
      vim.cmd([[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus = false })
]])

      -- Mapeo de tecla para abrir el diagnóstico flotante en modo de selección visual
      vim.keymap.set("n", "<leader>sd", function()
        vim.diagnostic.open_float(nil, { focus = true }) -- Activa el enfoque en la ventana
      end, { desc = "Mostrar diagnóstico en modo interactivo" })
      -- Mapeos de teclas LSP
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
      vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, { desc = "References" })
      vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Code Action" })

      -- Mapeos para ocultar y mostrar diagnósticos
      -- vim.keymap.set("n", "<leader>hd", hide_diagnostics, { desc = "Hide Diagnostics" })
      --vim.keymap.set("n", "<leader>sd", show_diagnostics, { desc = "Show Diagnostics" })
    end,
  },
}
