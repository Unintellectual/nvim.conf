return -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
{
  'ggandor/lightspeed.nvim',
  dependencies = {
    'tpope/vim-repeat',
    lazy = false,
    config = function()
      require('lightspeed').setup({})
    end,
  }
}
