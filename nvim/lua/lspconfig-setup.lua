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
  'cssls',
  'emmet_language_server',
  'eslint',
  'jsonls',
  -- xml
  'lemminx',
  -- typescript
  'ts_ls',
  -- typst
  'tinymist',
  'yamlls',

  -- 'angularls',
  -- 'html',
  -- 'lua_ls',
  -- python
  -- 'pyright',
  -- 'ruff',
  -- 'sqls'
  -- 'typos_lsp',
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, server in ipairs(languageServers) do
  lspconfig[server].setup {
    capabilities = capabilities,
  }
end

lspconfig.angularls.setup {
  capabilities = capabilities,
  cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    vim.env.XDG_DATA_HOME
    .. "/nvim/mason/packages/angular-language-server",
    "--ngProbeLocations",
    vim.env.XDG_DATA_HOME
    .. "/nvim/mason/packages/angular-language-server"
    .. "/node_modules/@angular/language-server/",
  },
  on_new_config = function(new_config)
    new_config.cmd = {
      "ngserver",
      "--stdio",
      "--tsProbeLocations",
      vim.env.XDG_DATA_HOME
      .. "/nvim/mason/packages/angular-language-server",
      "--ngProbeLocations",
      vim.env.XDG_DATA_HOME
      .. "/nvim/mason/packages/angular-language-server"
      .. "/node_modules/@angular/language-server/",
    }
  end
}

lspconfig.html.setup {
  capabilities = capabilities,
  init_options = {
    provideFormatter = false,
  },
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  },
}

lspconfig.pyright.setup {
  cmd = { 'pyright-langserver', '--stdio', '-p', '~/.config/pyright/pyrightconfig.json' },
}

lspconfig.ruff.setup {
  capabilities = capabilities,
  on_attach = function(client)
    if client.name == 'ruff' then
      client.server_capabilities.hoverProvider = false
    end
  end
}

require'lspconfig'.sqls.setup{
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr)
  end
}
