vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.exrc = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.visualbell = true
vim.opt.wildignorecase = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 5

vim.opt.background = 'light'
vim.opt.colorcolumn = '80'
vim.opt.signcolumn = 'yes'

vim.opt.foldopen:remove 'block'
vim.opt.nrformats:remove 'octal'

vim.opt.clipboard:append 'unnamedplus'
vim.opt.nrformats:append 'unsigned'
vim.opt.path:append '**'
vim.opt.wildignore:append '.git,node_modules'

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
    data_dir ..
    '/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"')
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
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'

Plug('nvim-treesitter/nvim-treesitter', {
  ['do'] = function()
    vim.cmd('TSUpdate')
  end
})
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
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

Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'sainnhe/gruvbox-material'
vim.call('plug#end')


vim.g.ctrlp_map = '<c-e>'
vim.g.ctrlp_show_hidden = 1
vim.g.ctrlp_working_path_mode = 'w'
vim.g.ctrlp_cmd = 'CtrlPMixed'
vim.g.ctrlp_mruf_max = 0


require('nvim-treesitter.configs').setup {
  ensure_installed =
    { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
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
  -- 'efm',
  'emmet_language_server',
  'eslint',
  'hls',
  'html',
  'jsonls',
  -- 'lua_ls',
  'pyright',
  'rust_analyzer',
  'texlab',
  'typos_lsp',
  'tsserver',
  'yamlls'
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, server in ipairs(languageServers) do
  lspconfig[server].setup {
    capabilities = capabilities
  }
end

lspconfig.efm.setup {
  init_options = { documentFormatting = true },
  settings = {
    languages = {
      css = {
        {
          formatCommand =
            './node_modules/.bin/prettier --stdin-filepath ${INPUT}',
          formatStdin = true
        }
      },
      html = {
        {
          formatCommand =
            './node_modules/.bin/prettier --stdin-filepath ${INPUT}',
          formatStdin = true
        }
      },
      markdown = {
        {
          lintCommand = 'markdownlint -s',
          lintStdin = true,
          lintFormats = {
            '%f:%l:%c %m'
          }
        }
      }
    }
  }
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}


local cmp = require('cmp')

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' }
  })
})


local luasnip = require('luasnip')

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
    :sub(col, col)
    :match("%s") == nil
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' }
  })
}


require('lualine').setup {
  options = {
    theme = 'gruvbox_light'
  }
}

require('ibl').setup {}

require('Comment').setup {
  ignore = '^$'
}

require('nvim-autopairs').setup {}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

require('luasnip.loaders.from_vscode').lazy_load()

local treesitter_textobjects = require 'nvim-treesitter.configs'

treesitter_textobjects.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["as"] = "@scope",
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V',  -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },
  },
}

treesitter_textobjects.setup {
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
}

treesitter_textobjects.setup {
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
        --
        -- You can use regex matching (i.e. lua pattern) and/or pass a list in
        -- a "query" key to group multiple queries.
        ["]o"] = "@loop.*",
        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        --
        -- You can pass a query group to use query from
        -- `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They
        -- also provide highlights.scm and indent.scm.
        ["]s"] = { query = "@scope", query_group = "locals",
          desc = "Next scope" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}

treesitter_textobjects.setup {
  textobjects = {
    lsp_interop = {
      enable = true,
      border = 'none',
      floating_preview_opts = {},
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
}

vim.g.gruvbox_material_foreground = 'original'
vim.g.gruvbox_material_better_performance = 1
vim.cmd('colorscheme gruvbox-material')

vim.keymap.set('n', '<leader><leader>a', ':wa | mks! | qa!<CR>',
  { desc = 'Save files and make session' })
vim.keymap.set('n', '<leader><leader>b', ':= vim.diagnostic.setqflist()<CR>',
  { desc = 'Put diagnostics in quickfix window' })
vim.keymap.set('n', '<leader><leader>c', ':w | Make<CR>',
  { desc = 'Asynchronous Make' })
vim.keymap.set(
  'n',
  '<leader><leader>d',
  ':= vim.fn.system(Clip, vim.fn.expand("%:p"))<CR>',
  { desc = 'Copy current buffer filepath to clipboard' }
)

vim.keymap.set('n', '<leader>f1', ':e ~/.config/nvim/init.lua<CR>',
  { desc = 'init.lua' })
vim.keymap.set('n', '<leader>f2', ':e ~/temp.txt<CR>',
  { desc = 'temp.txt' })
vim.keymap.set('n', '<leader>f3', ':e +$ ~/keep/notes.md<CR>',
  { desc = 'notes.md' })
vim.keymap.set('n', '<leader>f4', ':e ~/keep/lists.md<CR>',
  { desc = 'lists.md' })
vim.keymap.set('n', '<leader>f5', ':e ~/keep/college.md<CR>',
  { desc = 'college.md' })
