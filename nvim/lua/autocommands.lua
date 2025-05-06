vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Fix weird bug that prevent highlighting for Astro file to show up. Filetype is good, TSModuleInfo is good, highlighting works in telescope, but it does not work in the file WTF
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'BufReadPost' }, {
  pattern = '*.astro',
  callback = function()
    vim.defer_fn(function()
      vim.cmd 'TSBufEnable highlight'
    end, 100)
  end,
})
