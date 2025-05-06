return {
  {
    'chrisgrieser/nvim-spider',
    lazy = true,
    keys = {
      { 'w', "<cmd>lua require('spider').motion('w')<CR>", mode = { 'n', 'o', 'x' } },
      { 'e', "<cmd>lua require('spider').motion('e')<CR>", mode = { 'n', 'o', 'x' } },
      { 'b', "<cmd>lua require('spider').motion('b')<CR>", mode = { 'n', 'o', 'x' } },
    },
    config = function()
      require('spider').setup {
        skipInsignificantPunctuation = false,
      }
    end,
  },
  -- {
  --   'folke/flash.nvim',
  --   event = 'VeryLazy',
  --   ---@type Flash.Config
  --   opts = {},
  --   keys = {
  --     --   {
  --     --     '<leader><leader>',
  --     --     mode = { 'n', 'x', 'o' },
  --     --     function()
  --     --       require('flash').jump()
  --     --     end,
  --     --     desc = '(s)earch w/ Flash',
  --     --   },
  --   },
  -- },
}
