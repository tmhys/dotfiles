local cmp = require("cmp")
local lspkind = require("lspkind")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	completion = {
		completeopt = "menu,menuone,noselect",
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
		--expand = function(args)
		--  require('luasnip').lsp_expand(args.body)
		--end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
	},
	sorting = {},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", max_item_count = 5 },
		{ name = "nvim_lua", max_item_count = 5 },
		{ name = "tags", max_item_count = 5 },
		{ name = "cmp_tabnine", max_item_count = 5 },
		{ name = "spell", max_item_count = 5 },
		{ name = "vsnip", max_item_count = 5 }, -- For vsnip users.
		{ name = "omni", max_item_count = 5 },
		{ name = "treesitter", max_item_count = 5 },
	}, {
		{ name = "path" },
		{ name = "buffer" },
	}),
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", lspkind.presets.default[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_lua = "[LUA]",
				tags = "[TAG]",
				cmp_tabnine = "[TabNnine]",
				vsnip = "[SNIP]",
				treesitter = "[TS]",
				path = "[PATH]",
				buffer = "[BUFF]",
				omni = "[OMNI]",
				spell = "[spell]",
			})[entry.source.name]
			return vim_item
		end,
	},
	--window.documentation = "native",
	--documentation = {
	--  border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	--},
	experimental = {
		ghost_text = true,
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
		{ name = "nvim_lua" },
	}),
})

-- Setup lspconfig.
-- require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Auto pairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

---- tabnine
--local tabnine = require("cmp_tabnine.config")
--tabnine:setup({
--  max_lines = 1000,
--  max_num_results = 5,
--  sort = true,
--  run_on_every_keystroke = true,
--  snippet_placeholder = "..",
--  ignored_file_types = { -- default is not to ignore
--      -- uncomment to ignore in lua:
--      -- lua = true
--  },
--})
