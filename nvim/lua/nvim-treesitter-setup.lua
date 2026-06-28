vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('nvim_treesitter_setup', {}),
  pattern = { 'lua', 'java', 'typescript', 'javascript', 'python', 'sql', 'json', 'xml', 'csv', 'yaml', 'typst', 'html', 'javascriptreact', 'typescriptreact' },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
