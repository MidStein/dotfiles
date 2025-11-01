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
  -- python language server
  -- 'pyright',
  -- python formatting
  -- 'ruff',
  -- 'sqls'
  -- 'typos_lsp',
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, server in ipairs(languageServers) do
  vim.lsp.config(server, {
    capabilities = capabilities,
  })
  vim.lsp.enable(server)
end

vim.lsp.config('angularls', {
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
})
vim.lsp.enable('angularls')

vim.lsp.config('html', {
  capabilities = capabilities,
  init_options = {
    provideFormatter = false,
  },
})
vim.lsp.enable('html')

vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  },
})
vim.lsp.enable('lua_ls')

vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio', '-p', '~/.config/pyright/pyrightconfig.json' },
})
vim.lsp.enable('pyright')

vim.lsp.config('ruff', {
  capabilities = capabilities,
  on_attach = function(client)
    if client.name == 'ruff' then
      client.server_capabilities.hoverProvider = false
    end
  end
})
vim.lsp.enable('ruff')

vim.lsp.enable('sqls')
