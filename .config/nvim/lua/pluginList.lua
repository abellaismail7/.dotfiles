return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  -- Debugging
  use 'puremourning/vimspector'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use "onsails/lspkind-nvim"
  use 'tjdevries/nlua.nvim'
  use 'tjdevries/lsp_extensions.nvim'

  -- FZF
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'
  
  -- Help please
  use "folke/which-key.nvim"
  use 'kyazdani42/nvim-tree.lua'
  use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
  -- snippet support
  use "hrsh7th/vim-vsnip"
  use "rafamadriz/friendly-snippets"
  use "windwp/nvim-autopairs"

  -- Theme
  use 'joshdick/onedark.vim'
  use 'ayu-theme/ayu-vim'
  use 'kyazdani42/nvim-web-devicons'
  use "glepnir/galaxyline.nvim"
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
end)
