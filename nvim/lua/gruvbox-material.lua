vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {}),
  pattern = 'gruvbox-material',
  callback = function()
    local config = vim.fn['gruvbox_material#get_configuration']()
    local palette = vim.fn['gruvbox_material#get_palette'](config.background, config.foreground, config.colors_override)
    local set_hl = vim.fn['gruvbox_material#highlight']

    set_hl('Search', palette.none, palette.bg_visual_yellow)
    set_hl('IncSearch', palette.none, palette.bg_visual_red)
  end
})

vim.g.gruvbox_material_foreground = 'original'
vim.g.gruvbox_material_better_performance = 1
vim.cmd('colorscheme gruvbox-material')
