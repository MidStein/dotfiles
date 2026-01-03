vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'java', 'typescript', 'javascript', 'python', 'sql', 'json', 'xml', 'csv', 'yaml', 'typst' },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
