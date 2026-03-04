require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox_light'
  },
  sections = {
    lualine_b = { 'diagnostics' },
    lualine_x = {}
  }
}
