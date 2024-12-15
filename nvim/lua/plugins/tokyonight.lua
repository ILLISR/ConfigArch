return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,

  config = function()
    require("tokyonight").setup({
      transparent = true, -- Hacer transparente el fondo principal
      styles = {
        sidebars = "transparent", -- Hacer transparentes los sidebars
        floats = "transparent", -- Hacer transparentes las ventanas flotantes
      },
    })

    -- Asegurar que todos los elementos tengan un fondo transparente
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "none" })
    vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

    -- Activa el esquema de color
  end,
}

