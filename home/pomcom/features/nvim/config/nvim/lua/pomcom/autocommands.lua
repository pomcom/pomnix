-- Highlight on Yank
vim.cmd [[
  augroup highlight_yank
    au!
    au TextYankPost * silent! lua vim.highlight.on_yank{ timeout=100 }
  augroup END
]]

-- Open help in vertical split
vim.cmd [[
  au FileType help wincmd L
]]

-- Set wrap and spellcheck for text files
vim.cmd [[
  augroup TextWrap
    au!
    au BufEnter *.md,*.tex,*.txt setlocal wrap spell
  augroup END
]]

-- Call PackerSync when plugins changed
vim.api.nvim_create_autocmd(
  'BufWritePost', {
    pattern = 'lua/pomcom/plugins/init.lua',
    command = 'PackerSync',
})

