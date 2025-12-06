return {
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		opts = {
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
				-- flavour = "macchiato",
				float = {
					transparent = false,
					solid = false,
				},
			})
		end,
	},
	{
		"sainnhe/everforest",
		name = "everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_enable_italic = true
			vim.g.everforest_background = "medium" -- Options: "hard" (darker), "medium" (default), "soft" (lighter)                                                                                                                                                                                                                                                                              │
			vim.g.everforest_ui_contrast = "high" -- Options: "low" (default), "high" (more vibrant colors)                                                                                                                                                                                                                                                                                     │
			vim.g.everforest_diagnostic_text_highlight = 1 -- Enable colored diagnostic text                                                                                                                                                                                                                                                                                                    │
			vim.g.everforest_diagnostic_line_highlight = 1 -- Enable colored diagnostic line                                                                                                                                                                                                                                                                                                    │
			vim.g.everforest_diagnostic_virtual_text = "colored" -- Colored virtual text                                                                                                                                                                                                                                                                                                        │
		end,
	},
	{
		"arcticicestudio/nord-vim",
		name = "nord",
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			theme = "wave",
			colors = {
				theme = {
					all = { ui = { bg_gutter = "none" } },
				},
			},
			commentStyle = { italic = false },
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			transparent = false,
			dimInactive = false,
			terminalColors = true,
			compile = false,
			undercurl = true,
		},
		config = function(_, opts)
			require("kanagawa").setup(opts)
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		opts = {
			options = {
				styles = {
					comments = "NONE",
					keywords = "italic",
					types = "NONE",
					strings = "NONE",
					functions = "NONE",
					variables = "NONE",
				},
			},
		},
		config = function(_, opts)
			require("nightfox").setup(opts)
			-- Set terafox variant
			-- vim.cmd.colorscheme("terafox")
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "kanagawa",
		},
	},
}
