local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require "cmp"
local cmp_nvim_lsp = require('cmp_nvim_lsp')


cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
	  ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn["vsnip#available"](1) == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)","")
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)","")
        end
      end, { "i", "s" }),

      ['<CR>'] = cmp.mapping.confirm({ select = true }),

    },
    sources = cmp.config.sources({
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'nvim_lsp' },
      { name = 'tags' },
      { name = 'treesitter' },
      { name = 'cmp_tabnine' },
      { name = 'nvim_lua' },

      --{ name = 'luasnip' }, -- For luasnip users.
      --{ name = 'ultisnips' }, -- For ultisnips users.
      --{ name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    }),

    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = string.format("%s %s", lspkind.presets.default[vim_item.kind], vim_item.kind)
        vim_item.menu = ({
          vsnip='[vsnip]',
          nvim_lsp='[LSP]',
          tags='[tags]',
          treesitter='[TS]',
          cmp_tabnine='[TN]',
          nvim_lua='[lua]',
        })[entry.source.name]
        return vim_item
      end
    }
  })


local nvim_lsp = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
nvim_lsp.pyright.setup{ capabilities = capabilities }
nvim_lsp.sumneko_lua.setup{ capabilities = capabilities }
nvim_lsp.vimls.setup{ capabilities = capabilities }

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
	max_lines = 1000;
	max_num_results = 5;
	sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
	ignored_file_types = { -- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	};
})

local lspkind = require('lspkind')
cmp.setup {
    formatting = {
        format = lspkind.cmp_format(),
    },
}
cmp_nvim_lsp.update_capabilities(capabilities)
