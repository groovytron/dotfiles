return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Gruvbox
  use 'sainnhe/gruvbox-material'

  -- Solarized
  use {
    'maxmx03/solarized.nvim',
    config = function()
      vim.o.background = 'dark'
      ---@type solarized
      local solarized = require('solarized')
      vim.o.termguicolors = true
      vim.o.background = 'light'
      solarized.setup({})
      vim.cmd.colorscheme 'solarized'
    end
  }

  -- Install without configuration
  use ({ 'projekt0n/github-nvim-theme' })

  -- Lualine (editor status bar)
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Configurations for Nvim LSP
  use 'neovim/nvim-lspconfig'

  -- Web devicons
  use 'nvim-tree/nvim-web-devicons'

  -- Telescope (fuzzy file finder)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim'},
      {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
        -- Use the following to fix the error on first installation
        -- (https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim)
        --
        -- run = function()
        --     local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        --     ts_update()
        -- end,
      },
    }
  }

  -- Telescope args extension
  use 'nvim-telescope/telescope-live-grep-args.nvim'

  -- Nvim File Explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  -- EditorConfig support plugin
  use 'gpanders/editorconfig.nvim'

  -- Autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'

  -- Laravel/Blade
  use 'EmranMR/tree-sitter-blade'

  -- PHP Code Sniffer
  use 'praem90/nvim-phpcsf'

  -- Syntax checker
  use 'dense-analysis/ale'
end)
