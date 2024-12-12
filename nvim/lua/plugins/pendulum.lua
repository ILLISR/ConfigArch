return {
  "SunnyTamang/pendulum.nvim",
  config = function()
    require "pendulum".setup({
      lualine = true,       --Enables displaying the timer in Lualine (if lualine installed)
    })
  end,
  vim.keymap.set('n', 'timer' , ':TimerStart<CR>', { desc = 'Start the timer', callback = start_timer_with_prompt, noremap = true, silent = true }),
vim.keymap.set('n', '<leader>ts', ':TimerStop<CR>', { desc = 'Stop the timer' }),
vim.keymap.set('n', '<leader>tp', ':TimerPause<CR>', { desc = 'Pause the timer' }),
vim.keymap.set('n', '<leader>tr', ':TimerResume<CR>', { desc = 'Resume the timer' }),
vim.keymap.set('n', '<leader>tre', ':TimerRestart<CR>', { desc = 'Restart  the timer' }),
vim.keymap.set('n', '<leader>tt', ':TimerTemplate<CR>', { desc = 'select timer template' }),
vim.keymap.set('n', '<leader>sct', ':StartYourCustomTimer<CR>', { desc = 'start your custom timer'}),
}
