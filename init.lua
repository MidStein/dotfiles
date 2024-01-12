vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.visualbell = true
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildignorecase = true

vim.opt.shiftwidth = 2
vim.opt.scrolloff = 5

vim.opt.signcolumn = 'yes'
vim.opt.background = 'light'

vim.opt.foldopen:remove 'block'
vim.opt.nrformats:remove 'octal'

vim.opt.clipboard:append 'unnamedplus'
vim.opt.nrformats:append 'unsigned'
vim.opt.path:append '**'

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_preview = 1
vim.g.netrw_alto = 0
vim.g.netrw_winsize = 15

local data_dir
if vim.fn.has('nvim') == 1 then
  data_dir = vim.fn.stdpath('data') .. '/site'
else
  data_dir = '~/.vim'
end
if vim.fn.empty(vim.fn.glob(data_dir .. '/autoload/plug.vim')) == 1 then
  vim.cmd('silent execute "!curl -fLo ' ..
    data_dir .. '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"')
  vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    vim.cmd('PlugInstall --sync | source $MYVIMRC')
  })
end

local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'

Plug('nvim-treesitter/nvim-treesitter', {
  ['do'] = function()
    vim.cmd('TSUpdate')
  end
})
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug('L3MON4D3/LuaSnip', {
  tag = 'v2.*',
  ['do'] = function()
    vim.cmd('make install_jsregexp')
  end
})
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'rafamadriz/friendly-snippets'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'sainnhe/gruvbox-material'
vim.call('plug#end')


vim.g.ctrlp_map = '<c-e>'
vim.g.ctrlp_show_hidden = 1
vim.g.ctrlp_working_path_mode = 'w'
vim.g.ctrlp_cmd = 'CtrlPMixed'
vim.g.ctrlp_mruf_max = 0


require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
}


local lspconfig = require('lspconfig')

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


local languageServers = {
  'bashls',
  'clangd',
  'cssls',
  'docker_compose_language_service',
  'dockerls',
  'emmet_language_server',
  'eslint',
  'html',
  'jsonls',
  -- 'lua_ls',
  'pyright',
  'rust_analyzer',
  'texlab',
  'typos_lsp',
  -- 'tsserver',
  -- 'yamlls'
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, server in ipairs(languageServers) do
  lspconfig[server].setup({
    capabilities = capabilities
  })
end

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lspconfig.tsserver.setup({
  capabilities = capabilities,
})

lspconfig.yamlls.setup({
  capabilities = capabilities,
  settings = {
    redhat = {
      telemetry = {
        enabled = false
      }
    }
  }
})


local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  })
})


require('lualine').setup({
  options = {
    theme = 'gruvbox_light'
  }
})

require('ibl').setup {}

require('Comment').setup({
  ignore = '^$'
})

require('nvim-autopairs').setup {}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

require('luasnip.loaders.from_vscode').lazy_load()

vim.g.gruvbox_material_foreground = 'original'
vim.g.gruvbox_material_better_performance = 1
vim.cmd('colorscheme gruvbox-material')


vim.keymap.set('n', '<Leader><Leader>a', ':wa | mks! | qa!<CR>', { desc = 'Save changes, make session and close' })
vim.keymap.set('n', '<Leader><Leader>b', ':=vim.diagnostic.setqflist()<CR>',
  { desc = 'Put diagnostics in quickfix window' })

vim.keymap.set('n', '<leader><leader>z', ':e ~/.config/nvim/init.lua<CR>', { desc = 'Open init file' })
vim.keymap.set('n', '<leader><leader>y', ':e +$ ~/keep/notes.md<CR>', { desc = 'Open notes file' })
vim.keymap.set('n', '<leader><leader>x', ':e ~/temp.txt<CR>', { desc = 'Open temporary text file' })
vim.keymap.set('n', '<leader><leader>w', ':e ~/keep/active-lists.md<CR>', { desc = 'Open lists file' })
vim.keymap.set('n', '<leader><leader>v', ':e ~/.bashrc<CR>', { desc = 'Open .bashrc' })
vim.keymap.set('n', '<leader><leader>u', ':e ~/scripts/tmux.sh<CR>', { desc = 'Open tmux script' })

