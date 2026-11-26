return {
	{
		"danymat/neogen",
		keys = {
			{
				"<leader>cc",
				function()
					require("neogen").generate({})
				end,
				desc = "Neogen Comment",
			},
		},
		opts = { snippet_engine = "luasnip" },
	},

	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},

	-- {
	--   "ThePrimeagen/refactoring.nvim",
	--   keys = {
	--     {
	--       "<leader>R",
	--       function(e)
	--         require("refactoring").select_refactor(e)
	--       end,
	--       mode = "v",
	--       noremap = true,
	--       silent = true,
	--       expr = false,
	--     },
	--   },
	--   opts = {},
	-- },

	-- Go forward/backward with square brackets
	{
		"nvim-mini/mini.bracketed",
		event = "BufReadPost",
		config = function()
			local bracketed = require("mini.bracketed")
			bracketed.setup({
				file = { suffix = "" },
				window = { suffix = "" },
				quickfix = { suffix = "" },
				yank = { suffix = "" },
				treesitter = { suffix = "n" },
			})
		end,
	},

	{
		"monaqa/dial.nvim",
		keys = {
			{
				"<C-a>",
				function()
					return require("dial.map").inc_normal()
				end,
				expr = true,
				desc = "Increment",
			},
			{
				"<C-x>",
				function()
					return require("dial.map").dec_normal()
				end,
				expr = true,
				desc = "Decrement",
			},
		},
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		cmd = "SymbolsOutline",
		opts = {
			position = "right",
		},
	},
	{
		"nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				debug = true,
				mapping = {
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(8),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},
				snippet = {
					expand = function(args)
						local luasnip = require("luasnip")
						if luasnip then
							luasnip.lsp_expand(args.body)
						else
							print("Snippet engine not available")
						end
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
