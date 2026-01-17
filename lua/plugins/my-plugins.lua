return {
	{ "aserowy/tmux.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			transparent_background = not vim.g.neovide,
			auto_integrations = true,
		},
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 100,
		opts = {
			terminalColors = false,
			commentStyle = { italic = false },
			statementStyle = { bold = false },
		},
	},
	{
		"AlexvZyl/nordic.nvim",
		priority = 1000,
		opts = {
			transparent = {
				bg = true,
			},
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			-- inlay_hints = { enabled = false },
			servers = {
				clangd = {
					cmd = {
						"clangd",
						"--background-index",
						"--header-insertion=never",
						"--function-arg-placeholders=false",
					},
				},
				-- Necessary for eslint on windows
				eslint = {
					on_new_config = function(config, new_root_dir)
						config.settings.workspaceFolder = {
							uri = vim.uri_from_fname(new_root_dir),
							name = vim.fn.fnamemodify(new_root_dir, ":t"),
						}
					end,
				},
			},
			diagnostics = {
				update_in_insert = true,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			indent = { enable = false },
		},
	},
	{
		"saghen/blink.cmp",
		opts = {
			appearance = {
				nerd_font_variant = "normal",
			},
			keymap = {
				preset = "super-tab",
				["<Tab>"] = {
					require("blink.cmp.keymap.presets").get("super-tab")["<Tab>"][1],
					require("lazyvim.util.cmp").map({ "snippet_forward", "ai_accept" }),
					"fallback",
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{ "p00f/clangd_extensions.nvim" },
	{
		"Civitasv/cmake-tools.nvim",
		enabled = false,
		opts = {},
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {
			settings = {
				tsserver_max_memory = 10240,
				tsserver_file_preferences = {
					includeCompletionsForModuleExports = true,
				},
			},
		},
	},
	{
		"nvim-mini/mini.icons",
		opts = {
			file = {
				[".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
				[".node-version"] = { glyph = "", hl = "MiniIconsGreen" },
				[".prettierrc"] = { glyph = "", hl = "MiniIconsPurple" },
				[".yarnrc.yml"] = { glyph = "", hl = "MiniIconsBlue" },
				["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
				["package.json"] = { glyph = "", hl = "MiniIconsGreen" },
				["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" },
				["tsconfig.build.json"] = { glyph = "", hl = "MiniIconsAzure" },
				["yarn.lock"] = { glyph = "", hl = "MiniIconsBlue" },
			},
		},
	},
	{
		"vyfor/cord.nvim",
		opts = {
			display = {
				theme = "atom",
			},
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = true,
		opts = {
			close_if_last_window = true,
			default_component_configs = {
				indent = {
					with_markers = false,
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
			window = {
				width = 50,
			},
		},
	},
	{
		"numToStr/Comment.nvim",
	},
	---@module "neominimap.config.meta"
	{
		"Isrothy/neominimap.nvim",
		version = "v3.*.*",
		enabled = true,
		lazy = false, -- NOTE: NO NEED to Lazy load
		-- Optional
		keys = {
			-- Global Minimap Controls
			{ "<leader>nm", "<cmd>Neominimap toggle<cr>", desc = "Toggle global minimap" },
			{ "<leader>no", "<cmd>Neominimap on<cr>", desc = "Enable global minimap" },
			{ "<leader>nc", "<cmd>Neominimap off<cr>", desc = "Disable global minimap" },
			{ "<leader>nr", "<cmd>Neominimap refresh<cr>", desc = "Refresh global minimap" },

			-- Window-Specific Minimap Controls
			{ "<leader>nwt", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
			{ "<leader>nwr", "<cmd>Neominimap winRefresh<cr>", desc = "Refresh minimap for current window" },
			{ "<leader>nwo", "<cmd>Neominimap winOn<cr>", desc = "Enable minimap for current window" },
			{ "<leader>nwc", "<cmd>Neominimap winOff<cr>", desc = "Disable minimap for current window" },

			-- Tab-Specific Minimap Controls
			{ "<leader>ntt", "<cmd>Neominimap tabToggle<cr>", desc = "Toggle minimap for current tab" },
			{ "<leader>ntr", "<cmd>Neominimap tabRefresh<cr>", desc = "Refresh minimap for current tab" },
			{ "<leader>nto", "<cmd>Neominimap tabOn<cr>", desc = "Enable minimap for current tab" },
			{ "<leader>ntc", "<cmd>Neominimap tabOff<cr>", desc = "Disable minimap for current tab" },

			-- Buffer-Specific Minimap Controls
			{ "<leader>nbt", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
			{ "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>", desc = "Refresh minimap for current buffer" },
			{ "<leader>nbo", "<cmd>Neominimap bufOn<cr>", desc = "Enable minimap for current buffer" },
			{ "<leader>nbc", "<cmd>Neominimap bufOff<cr>", desc = "Disable minimap for current buffer" },

			---Focus Controls
			{ "<leader>nf", "<cmd>Neominimap focus<cr>", desc = "Focus on minimap" },
			{ "<leader>nu", "<cmd>Neominimap unfocus<cr>", desc = "Unfocus minimap" },
			{ "<leader>ns", "<cmd>Neominimap toggleFocus<cr>", desc = "Switch focus on minimap" },
		},
		init = function()
			-- The following options are recommended when layout == "float"
			vim.opt.wrap = false
			vim.opt.sidescrolloff = 36 -- Set a large value

			--- Put your configuration here
			---@type Neominimap.UserConfig
			vim.g.neominimap = {
				auto_enable = false,
			}
		end,
	},
	{
		"mistricky/codesnap.nvim",
		build = "make",
		keys = {
			{ "<leader>csc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
			{ "<leader>css", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
		},
		opts = {
			save_path = "~/Pictures",
			has_breadcrumbs = true,
			bg_theme = "grape",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = function()
			local icons = LazyVim.config.icons

			vim.o.laststatus = vim.g.lualine_laststatus

			local opts = {
				options = {
					theme = "auto",
					globalstatus = vim.o.laststatus == 3,
					disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
					lualine_b = { "branch" },

					lualine_c = {
						LazyVim.lualine.root_dir(),
						{
							"diagnostics",
							symbols = {
								error = icons.diagnostics.Error,
								warn = icons.diagnostics.Warn,
								info = icons.diagnostics.Info,
								hint = icons.diagnostics.Hint,
							},
						},
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ LazyVim.lualine.pretty_path() },
					},
					lualine_x = {
						Snacks.profiler.status(),
						{
							function()
								return require("noice").api.status.command.get()
							end,
							cond = function()
								return package.loaded["noice"] and require("noice").api.status.command.has()
							end,
							color = function()
								return { fg = Snacks.util.color("Statement") }
							end,
						},
						{
							function()
								return require("noice").api.status.mode.get()
							end,
							cond = function()
								return package.loaded["noice"] and require("noice").api.status.mode.has()
							end,
							color = function()
								return { fg = Snacks.util.color("Constant") }
							end,
						},
						{
							function()
								return "  " .. require("dap").status()
							end,
							cond = function()
								return package.loaded["dap"] and require("dap").status() ~= ""
							end,
							color = function()
								return { fg = Snacks.util.color("Debug") }
							end,
						},
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
							color = function()
								return { fg = Snacks.util.color("Special") }
							end,
						},
						{
							"diff",
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
							source = function()
								local gitsigns = vim.b.gitsigns_status_dict
								if gitsigns then
									return {
										added = gitsigns.added,
										modified = gitsigns.changed,
										removed = gitsigns.removed,
									}
								end
							end,
						},
					},
					lualine_y = {
						{ "progress", separator = " ", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						{
							function()
								return " " .. os.date("%R")
							end,
							separator = { left = "", right = "" },
							left_padding = 2,
						},
					},
				},
				extensions = { "neo-tree", "lazy", "fzf" },
			}

			-- do not add trouble symbols if aerial is enabled
			-- And allow it to be overriden for some buffer types (see autocmds)
			if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
				local trouble = require("trouble")
				local symbols = trouble.statusline({
					mode = "symbols",
					groups = {},
					title = false,
					filter = { range = true },
					format = "{kind_icon}{symbol.name:Normal}",
					hl_group = "lualine_c_normal",
				})
				table.insert(opts.sections.lualine_c, {
					symbols and symbols.get,
					cond = function()
						return vim.b.trouble_lualine ~= false and symbols.has()
					end,
				})
			end

			return opts
		end,
	},
	{
		"snacks.nvim",
		opts = {
			-- zen = {
			-- 	show = {
			-- 		tabline = true,
			-- 	},
			-- },
			scroll = {
				enabled = false,
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				separator_style = "thin",

				buffer_close_icon = "",
				close_icon = "",

				indicator = {
					style = "none",
				},

				always_show_bufferline = true,
			},
		},
	},
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {},
	},
	{
		"lopi-py/luau-lsp.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"lambdalisue/vim-suda",
	},
}
