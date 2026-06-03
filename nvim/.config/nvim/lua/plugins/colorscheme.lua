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
		opts = {
			theme = "wave",
			colors = {
				theme = {
					all = { ui = { bg_gutter = "none" } },
				},
			},
			commentStyle = { italic = false },
			keywordStyle = { italic = false },
			statementStyle = { bold = true },
			transparent = false,
			dimInactive = false,
			terminalColors = true,
		},
		config = function(_, opts)
			require("kanagawa").setup(opts)
		end,
	},
	{
		"sainnhe/sonokai",
		name = "sonokai",
		lazy = false,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				bold_keywords = true,
				italic_comments = false,
				transparent = {
					bg = false,
					float = false,
				},
				cursorline = {
					theme = "light",
					blend = 0.6,
				},
				visual = {
					theme = "light",
					blend = 1.0,
				},
				noice = {
					style = "classic",
				},
				telescope = {
					style = "classic",
				},
				on_highlight = function(highlights, palette)
					highlights.FloatBorder = { fg = palette.gray5 }
					highlights.Comment = { fg = palette.gray5, italic = true }

					-- More saturated syntax (nordic's `dim` variants are more saturated than `base`)
					highlights.Type = { fg = palette.yellow.dim, bold = true }
					highlights.Keyword = { fg = palette.orange.dim, bold = true }
					highlights.String = { fg = palette.green.dim }
					highlights.Constant = { fg = palette.magenta.dim }

					-- Yellow folders in neo-tree only
					highlights.NeoTreeDirectoryName = { fg = palette.yellow.base }
					highlights.NeoTreeDirectoryIcon = { fg = palette.yellow.base }
				end,
			})
			require("nordic").load()
			vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#EBCB8B", bold = true })
			-- Brighter ANSI black so apps like lazygit (which render inactive text in ANSI black)
			-- stay readable inside nvim's embedded terminal
			vim.g.terminal_color_0 = "#3B4252"
			vim.g.terminal_color_8 = "#4C566A"
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "nordic",
		},
	},
}
