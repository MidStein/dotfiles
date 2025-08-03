vim.keymap.set('n', '<leader><leader>a', ':wa | mks! | qa!<CR>',
  { desc = 'Save files and make session' })

vim.keymap.set('n', '<leader><leader>b', ':= vim.diagnostic.setqflist()<CR>',
  { desc = 'Put diagnostics in quickfix window' })

vim.keymap.set(
  'n',
  '<leader><leader>c',
  function()
    vim.ui.input(
      {
        prompt = "Enter statement: "
      }, function(input)
        if input then
          local print_statement = string.format('System.out.println("%s: " + %s);', input, input)
          local previous_line = vim.fn.getline(vim.api.nvim_win_get_cursor(0)[1] - 1)
          local current_line = vim.fn.getline('.')
          local indentation
          if #current_line:match("^%s*") > 0 then
            indentation = current_line:match("^%s*")
          else
            indentation = previous_line:match("^%s*")
          end
          local indented_print_statement = indentation .. print_statement
          local row = vim.api.nvim_win_get_cursor(0)[1]
          vim.api.nvim_buf_set_lines(0, row, row, false, { indented_print_statement })
          vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
        end
      end
    )
  end,
  { desc = 'Java expression print debugging' }
)

vim.keymap.set(
  'n',
  '<leader><leader>d',
  function()
    local path = vim.fn.expand('%:p')
    path = path:gsub('^/home/[^/]+', '~')
    vim.fn.system('wl-copy', path)
  end,
  { desc = 'Copy current buffer absolute filepath to clipboard' }
)

vim.keymap.set('n', '<leader><leader>e',
  function()
    local path = vim.fn.expand('%')
    vim.cmd('w')
    vim.fn.system('xmlformat --blanks --selfclose --eof-newline --overwrite '
      .. path)
    vim.cmd('e')
  end,
  { desc = 'format using xmlformatter' })

vim.keymap.set(
  'n',
  '<leader><leader>f',
  function()
    local line = vim.api.nvim_get_current_line()
    line = line:gsub('^%s+', '')
    vim.fn.setreg('+', line)
  end,
  { desc = 'Copy line without leading spaces and ending newline' }
)

vim.keymap.set(
  'n',
  '<leader><leader>g',
  function()
    local line = vim.api.nvim_get_current_line()
    local leadingSpaces = string.match(line, '^%s+')
    if leadingSpaces == nil then
      leadingSpaces = ''
    end
    vim.fn.setreg('/', '^' .. leadingSpaces .. '<')
  end,
  { desc = 'For jumping to closing html tag and back' }
)

vim.keymap.set('n', '<leader><leader>h', ':NERDTree<CR>',
  { desc = 'Open nerdtree' })

vim.keymap.set('n', '<leader><leader>i', ':so ~/tbd/temp.lua<CR>',
  { desc = 'Load lua script' })

vim.keymap.set('n', '<leader><leader>j', ':NERDTreeFind<CR>',
  { desc = ':NERDTreeFind' })

vim.keymap.set('n', '<leader><leader>k',
  function()
    local path = vim.fn.expand('%')
    vim.cmd('w')
    vim.fn.system('prettier -w ' .. path)
    vim.cmd('e')
  end,
  { desc = 'format current file using prettier' })

vim.keymap.set('n', '<leader><leader>l', ':!python %<CR>',
  { desc = 'Execute this file using python' })

vim.keymap.set(
  'n',
  '<leader><leader>m',
  function()
    local path = vim.fn.expand('%')
    vim.fn.system('wl-copy', path)
  end,
  { desc = 'Copy current buffer relative filepath to clipboard' }
)


vim.keymap.set('n', '<leader>f1', ':e ~/.config/nvim/init.lua<CR>',
  { desc = 'init.lua' })
vim.keymap.set('n', '<leader>f2', ':e ~/temp.txt<CR>',
  { desc = 'temp.txt' })
vim.keymap.set('n', '<leader>f3', ':e + ~/keep/log.md<CR>',
  { desc = 'log.md' })
vim.keymap.set('n', '<leader>f4', ':e ~/keep/lists.md<CR>',
  { desc = 'lists.md' })
vim.keymap.set('n', '<leader>f5', ':e ~/code/python/script/script.py<CR>',
  { desc = 'script.py' })
