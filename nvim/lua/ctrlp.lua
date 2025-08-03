vim.g.ctrlp_map = '<c-e>'
vim.g.ctrlp_cmd = 'CtrlPMixed'
vim.g.ctrlp_switch_buffer = 0
vim.g.ctrlp_working_path_mode = 'w'
vim.g.ctrlp_use_caching = 0
vim.g.ctrlp_show_hidden = 1
vim.g.ctrlp_match_current_file = 1
vim.g.ctrlp_mruf_max = 0

if vim.fn.getcwd() == vim.fn.expand('~') then
  vim.g.ctrlp_cmd = 'CtrlPBuffer'
end
