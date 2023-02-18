require'indent_blankline'.setup {
  space_char_blankline = ' ',
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = false,
}

vim.opt.list = true
vim.opt.listchars:append('eol:·')

-- TODO: do you need that?
-- vim.cmd[[au VimEnter * highlight IndentBlanklineContextChar guifg=#bdae93 gui=nocombine]]

