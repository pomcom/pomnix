-- NVIM-CMP SETUP

local cmp = require 'cmp'
-- TODO
-- local luasnip = require 'luasnip'

local confirm_mapping = cmp.mapping.confirm {
  behavior = cmp.ConfirmBehavior.Replace,
  select = true,
}

cmp.setup {
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ['<Down>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    ['<Up>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = confirm_mapping,
  },
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    -- { name = 'luasnip' }, TODO
    { name = 'treesitter' },
    { name = 'buffer', keyword_length = 5 },
  },
  snippet = {
    expand = function(args)
      -- TODO
      -- luasnip.lsp_expand(args.body)
    end,
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  }
}

