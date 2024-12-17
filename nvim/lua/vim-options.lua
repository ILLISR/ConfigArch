-- Configuración básica
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Mapleader
vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>m", ":tabn <CR>")
--vim.keymap.set("n", "<leader>n", ":tabp <CR>")
--vim.keymap.set("n", "<leader>c", ":tabc <CR>")
vim.keymap.set("n", "<leader>wg", ":w <CR>")
-- Moverse 10 líneas hacia abajo yg hacia arriba con Alt + j y Alt + k
vim.keymap.set("n", "<M-down>", "10j", { noremap = true, silent = true })
vim.keymap.set("n", "<M-up>", "10k", { noremap = true, silent = true })

-- Configuración para el atajo de teclado en Neovim para copiar
vim.api.nvim_set_keymap("v", "<Space>y", '"+y', { noremap = true, silent = true })
-- Configuración de estilos de texto
-- Aplica negrita e itálico a los comentarios
-- vim.cmd("higghlight Comment cterm=italic gui=italic")
-- Aplica negrita a los números
-- vim.cmd("highlight Number cterm=bold gui=bold")
-- Aplica negrita a los identificadores de variables
--vim.cmd("highlight Identifier cterm=bold gui=bold")

-- Activar numeros relativos de las lineas
vim.opt.relativenumber = true
--vim.wo.number = true
-- Configuración de keybinds para possession.nvim
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Guardar todos los buffers y luego guardar la sesión
map("n", "<leader>ps", ":wa | PossessionSave<CR>", opts)

-- Cargar una sesión guardada
map("n", "<leader>pl", ":Telescope possession list<CR>", opts) -- <leader>pl para listar y cargar la sesión

-- Mostrar todas las sesiones (con Telescope)
map("n", "<leader>pd", ":Telescope possession list<CR>", opts) -- <leader>pd para mostrar las sesiones

-- Eliminar la sesión actual
map("n", "<leader>pe", ":PossessionDelete<CR>", opts) -- <leader>pe para eliminar la sesión

-- nvim-dap keybindings
