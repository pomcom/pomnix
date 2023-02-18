local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

local auto_setup_servers = {
  'bashls',
  'dockerls',
  'pyright',
  'rnix',
  'gopls',
  'sumneko_lua',
  'texlab',
}

-- Setup Mason
mason.setup()
mason_lspconfig.setup {
  ensure_installed = auto_setup_servers,
}

-- Setup LspConfig
local on_attach = function()
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { buffer = true }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<C-K>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)
  vim.keymap.set('n', '<Leader>rr', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<Leader>rf', vim.lsp.buf.format, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end

-- Setup servers automatically
for _, server in ipairs(auto_setup_servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
