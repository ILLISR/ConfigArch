return{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.keymap.set('n', '<leader>e', ':Neotree toggle <CR>')
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,  -- Mostrar archivos ocultos (comenzando con .)
            hide_gitignored = false, -- Opcional: Mostrar archivos ignorados por Git
          },
        },
    })
  end
}
