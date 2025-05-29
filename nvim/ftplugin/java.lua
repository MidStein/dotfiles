local config = {
  cmd = {vim.env.XDG_DATA_HOME .. '/nvim/mason/bin/jdtls'},
  root_dir = vim.fs.dirname(vim.fs.find({'.git', '.gradlew', '.mvnw'}, { upward = true })[1])
}
require('jdtls').start_or_attach(config)
