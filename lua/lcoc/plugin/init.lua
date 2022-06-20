local Log = require "lcoc.core.log"

local packer_available, packer = pcall(require, "packer")
if not packer_available then
  Log:warn "skipping loading plugins until Packer is installed"
  return
end

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Tmux Integration
  use {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require 'nvim-tmux-navigation'.setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
        }
      }
    end
  }

  -- Editing
  require('lcoc.plugin.tabular').init()
  use {
    'godlygeek/tabular',
    opt = true,
    cmd = { "Tabularize" }
  }
  use 'tpope/vim-abolish'

  -- Theme
  use {
    'challenger-deep-theme/vim',
    as = 'challenger_deep',
    config = function() vim.cmd 'colorscheme challenger_deep' end
  }

  -- Tools
  use {
    'rizzatti/dash.vim',
    opt = true,
    cmd = { 'Dash' }
  }

  use 'wakatime/vim-wakatime'
  use { 'kristijanhusak/vim-carbon-now-sh', opt = true, cmd = { 'CarbonNowSh' } }

  use {
    'tpope/vim-fugitive',
    opt = true,
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  }
  use { 'skanehira/gh.vim', opt = true, cmd = { 'gh' } }

  if packer_bootstrap then
    packer.sync()
  end
end)
