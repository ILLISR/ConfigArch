require("vim-options")
require("config.lazy")
vim.lsp.set_log_level("debug")
-- Auto guardar la sesión al salir
vim.api.nvim_create_autocmd("VimLeave", {
    command = "mksession! ~/.config/nvim/sessions/default.vim"
})

vim.g.neo_tree_disable_restore = true

