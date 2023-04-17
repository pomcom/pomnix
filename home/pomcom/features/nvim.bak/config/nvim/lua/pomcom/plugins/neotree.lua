local neotree = require('neo-tree')

neotree.setup {
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
    }
  },
  window = {
    mappings = {
      ['o'] = 'open',
      ['<cr>'] = 'open',
      ['v'] = 'open_vsplit',
    }
  }
}

vim.fn.sign_define("DiagnosticSignError",
  {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
  {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
  {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
  {text = "", texthl = "DiagnosticSignHint"})

-- Keybindings
vim.keymap.set('n', '<C-i>', '<C-i>') -- this is necessary to use <Tab> and <C-i> separately
vim.keymap.set('n', '<TAB>', '<CMD>NeoTreeFocusToggle<CR>')
vim.keymap.set('n', '<S-TAB>', '<CMD>NeoTreeRevealToggle<CR>')
vim.keymap.set('n', 'Q', '<CMD>NeoTreeFloatCR>')

