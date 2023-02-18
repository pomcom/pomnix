local bootstrap = require('pomcom.util.bootstrap')
local packer_bootstrap = bootstrap.ensurePacker()

return require('packer').startup(
function(use)
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-surround'          -- work on brackets, quotes and tags
  use 'tpope/vim-repeat'            -- repeat plugin commands with .
  use 'dhruvasagar/vim-table-mode'  -- markdown table support


  --- Colorschemes ---
  use {
    { 'ellisonleao/gruvbox.nvim' },
    { 'sainnhe/gruvbox-material' },
    { 'sainnhe/everforest' },
    { 'Mofiqul/adwaita.nvim' },
    { 'rebelot/kanagawa.nvim' },
    { 'folke/tokyonight.nvim' },
    { 'EdenEast/nightfox.nvim' },
    { 'catppuccin/catppuccin' },
    { 'shaunsingh/oxocarbon.nvim' },
    use {
      'mcchrish/zenbones.nvim',
      requires = 'rktjmp/lush.nvim'
    }
  }

  use 'fatih/vim-go'

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      require('pomcom.plugins.telescope')
    end,
    disable = false
  }

  --- Tab View for Buffers ---
  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require ('pomcom.plugins.barbar')
    end,
  }

  -- Comment out lines with gcc and gc[motion
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }

  --- Smooth Scrolling
  use {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end,
  }

  --- Autopair Brackets
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  }

  --- File Tree
  use {
    'nvim-neo-tree/neo-tree.nvim',
    config = function()
      require('pomcom.plugins.neotree')
    end,
    branch = "v2.x",
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
  }

  --- GIT Marker in num collum
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('pomcom.plugins.gitsigns')
    end,
    requires = { 'nvim-lua/plenary.nvim' }
  }

  --- Indentation Visualizer
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('pomcom.plugins.indent-blankline')
    end,
  }

  --- Lsp
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
    },
    config = function()
      require('pomcom.lsp')
    end,
  }

  --- LSP Completion ---
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('pomcom.lsp.nvim-cmp')
    end,
    requires = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-nvim-lsp' },
      -- { 'saadparwaiz1/cmp_luasnip' },
    }
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update { with_sync = true }
    end,
  }
  -- Vimtex
  use {
    'lervag/vimtex',
    config = function()
      require('pomcom.plugins.vimtex')
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
