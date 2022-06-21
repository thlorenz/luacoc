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

  -- Navigation
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    opt = true,
    cmd = { 'NvimTreeToggle' },
    config = function()
      require('lcoc.plugin.nvim-tree').setup()
    end,
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

  -- Whichkey
  use {
    "max397574/which-key.nvim",
    config = function()
      require("lcoc.plugin.which-key").setup()
    end,
    event = "BufWinEnter"
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

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("lcoc.plugin.gitsigns").setup()
    end,
    event = "BufRead",
  }

  -- Degugging
  use {
    'mfussenegger/nvim-dap',
    config = function()
      require('lcoc.plugin.dap').setup()
    end,
  }
  use 'rcarriga/nvim-dap-ui'
  require('lcoc.plugin.dapui').setup()

  if packer_bootstrap then
    packer.sync()
  end
end)
