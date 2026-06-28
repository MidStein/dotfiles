local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('ctrlpvim/ctrlp.vim')
Plug('preservim/nerdtree')
Plug('mattn/emmet-vim')
Plug('simnalamburt/vim-mundo')
Plug('tpope/vim-abolish')
Plug('tpope/vim-surround')

Plug('nvim-treesitter/nvim-treesitter', {
  ['do'] = function()
    vim.cmd('TSUpdate')
  end
})
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('williamboman/mason.nvim')
Plug('L3MON4D3/LuaSnip', {
  tag = 'v2.*',
  ['do'] = function()
    vim.cmd('make install_jsregexp')
  end
})
Plug('nvim-lualine/lualine.nvim')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('numToStr/Comment.nvim')
Plug('windwp/nvim-autopairs')
Plug('rafamadriz/friendly-snippets')

Plug('mfussenegger/nvim-jdtls')
Plug('nanotee/sqls.nvim')
Plug('sainnhe/gruvbox-material')

-- cmp
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-nvim-lsp-signature-help')
Plug('hrsh7th/cmp-path')
Plug('saadparwaiz1/cmp_luasnip')

Plug('JoosepAlviste/nvim-ts-context-commentstring')
vim.call('plug#end')
