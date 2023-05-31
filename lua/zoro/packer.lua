
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use { 'alexghergh/nvim-tmux-navigation', config = function()

      local nvim_tmux_nav = require('nvim-tmux-navigation')

      nvim_tmux_nav.setup {
          disable_when_zoomed = true -- defaults to false
      }

      vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)

  end
}
use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({
	  'rose-pine/neovim',
	  as='rose-pine',
	  config= function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use( 'nvim-treesitter/nvim-treesitter', {run =':TSUpdate'})
  use('theprimeagen/harpoon')
  use('tpope/vim-fugitive')
  use('windwp/nvim-ts-autotag')
  use('nvim-tree/nvim-tree.lua')
  use('nvim-tree/nvim-web-devicons')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'hrsh7th/cmp-nvim-lua'}, -- Required
    {'hrsh7th/cmp-path'}, -- Required
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-buffer'}, -- Required
    {'hrsh7th/cmp-path'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required

    --snipets
    {'rafamadriz/friendly-snippets'},
  }

}

end)



