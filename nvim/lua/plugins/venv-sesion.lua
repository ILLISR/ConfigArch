return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", -- opcional
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  lazy = false,
  branch = "regexp", -- Esta es la rama de expresión regular, usa esta para la nueva versión
  config = function()
    require('venv-selector').setup({
      auto_select_venv = true,  -- Habilitar selección automática del venv
      search = true,            -- Permite buscar el entorno virtual en directorios padres
    })
  end,
  keys = {
    { ",v", "<cmd>VenvSelect<cr>" },  -- Atajo para seleccionar el venv manualmente
  },
}

