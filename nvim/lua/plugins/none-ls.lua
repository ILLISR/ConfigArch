return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      debug = true,
      sources = {
        -- Formateo
        null_ls.builtins.formatting.black, -- Formateo para Python
        null_ls.builtins.formatting.stylua, -- Formateo para Lua
        null_ls.builtins.formatting.golines, -- Fomateo para GO
        null_ls.builtins.formatting.gofumpt, -- Fomateo para GO
        null_ls.builtins.formatting.goimports, -- Fomateo para GO
        null_ls.builtins.formatting.prettierd, -- Formateo para JS, HTML, etc.
        -- Linting
        null_ls.builtins.diagnostics.mypy, -- Análisis avanzado de tipos para Python

        -- Otros lenguajes
      },
      on_attach = function(client, bufnr)
        -- Mapeo para formateo manual
        vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, { buffer = bufnr })
      end,
    })
  end,
}
