local gitsigns = require 'gitsigns'

gitsigns.setup()

vim.keymap.set('n', '<Leader>g?', function() gitsigns.blame_line{full=true} end)
vim.keymap.set('n', '<Leader>gs', gitsigns.stage_hunk)
vim.keymap.set('n', '<Leader>gu', gitsigns.reset_hunk)
vim.keymap.set('n', '<Leader>gn', gitsigns.next_hunk)
vim.keymap.set('n', '<Leader>gp', gitsigns.prev_hunk)

