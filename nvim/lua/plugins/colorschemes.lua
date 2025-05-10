return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    init = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
  {
    'folke/tokyonight.nvim',
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
}
