local config = {
  cmd = {
    vim.env.XDG_DATA_HOME .. '/nvim/mason/bin/jdtls',
    '--jvm-arg=-javaagent:' .. vim.env.XDG_DATA_HOME .. '/nvim/mason/packages/jdtls/lombok.jar'
  },
  root_dir = vim.fs.dirname(vim.fs.find({'.git', '.gradlew', '.mvnw'}, { upward = true })[1])
}
require('jdtls').start_or_attach(config)
