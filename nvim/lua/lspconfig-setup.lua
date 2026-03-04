vim.keymap.set('n', '[d',
  function()
    vim.diagnostic.jump({count=-1, float=true})
  end
)
vim.keymap.set('n', ']d',
  function()
    vim.diagnostic.jump({count=1, float=true})
  end
)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format({ async = true })
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
  'tinymist'

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
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    }
  },
})
vim.lsp.enable('lua_ls')

vim.lsp.config('pyright', {
  capabilities = capabilities,
  cmd = { 'pyright-langserver', '--stdio', '-p', '~/.config/pyright/pyrightconfig.json' }
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
