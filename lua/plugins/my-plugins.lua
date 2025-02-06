return {
	{ "aserowy/tmux.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true,
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
			inlay_hints = { enabled = false },
			servers = {
				clangd = {
					cmd = {
						"clangd",
						"--background-index",
						"--header-insertion=never",
					},
				},
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
			},
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
		opts = {},
	},
	{ "andweeb/presence.nvim" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			close_if_last_window = true,
			default_component_configs = {
				indent = {
					indent_size = 3,
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			zen = { enabled = true },
		},
		keys = {
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "Toggle Zen Mode",
			},
			{
				"<leader>Z",
				function()
					Snacks.zen.zoom()
				end,
				desc = "Toggle Zoom",
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
				auto_enable = true,
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
}
