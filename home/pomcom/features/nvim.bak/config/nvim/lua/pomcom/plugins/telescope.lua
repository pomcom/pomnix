local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local themes = require 'telescope.themes'

telescope.setup {
  defaults = {
    prompt_prefix = ' ',
  },
  -- extensions = {
  --   ['ui-select'] = {
  --     themes.get_dropdown(),
  --   },
  -- },
}

telescope.load_extension 'ui-select'

local M = {}

function M.find_files()
  builtin.find_files {
    follow = true, -- follow symlinks
    hidden = true, -- show hidden
  }
end

function M.find_home_files()
  builtin.find_files {
    cwd = '~',
    follow = true, -- follow symlinks
    hidden = true, -- show hidden
  }
end

function M.lsp_find_references()
  builtin.lsp_references(themes.get_cursor())
end

-- Keybindings
vim.keymap.set('n', '<leader>ff', M.find_files)
vim.keymap.set('n', '<leader>fp', M.find_home_files)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
-- LSP Keybindings
vim.keymap.set('n', 'gr', M.lsp_find_references)
