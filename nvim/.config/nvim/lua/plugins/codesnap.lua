return {
	{
		"mistricky/codesnap.nvim",
		tag = "v2.0.5", -- v2 ships precompiled binaries, so no build step needed
		cmd = {
			"CodeSnap",
			"CodeSnapSave",
			"CodeSnapASCII",
			"CodeSnapHighlight",
			"CodeSnapSaveHighlight",
		},
		keys = {
			-- Under <leader>c but on free keys: <leader>c is LazyVim's crowded code/LSP
			-- group (ca/cA code action, cC codelens, cr rename, ...). "p" = picture.
			{ "<leader>cp", "<cmd>CodeSnap<cr>", mode = "x", desc = "Copy code snapshot to clipboard" },
			{
				"<leader>cP",
				function()
					-- CodeSnapSave takes an explicit path; save a timestamped PNG to ~/Pictures.
					local file = ("~/Pictures/codesnap-%s.png"):format(os.date("%Y%m%d-%H%M%S"))
					vim.cmd("CodeSnapSave " .. file)
				end,
				mode = "x",
				desc = "Save code snapshot to ~/Pictures",
			},
		},
		opts = {
			show_line_number = true,
			snapshot_config = {
				theme = "nordic", -- matches the nordic colorscheme; file lives in assets/codesnap-themes/
				themes_folders = { vim.fn.stdpath("config") .. "/assets/codesnap-themes" },
				code_config = {
					font_family = "JetBrainsMono Nerd Font", -- installed Nerd Font (Maple Mono NF isn't installed)
					breadcrumbs = {
						enable = true,
						font_family = "JetBrainsMono Nerd Font",
					},
				},
				watermark = { content = "" }, -- no watermark
				background = "#242933", -- solid nordic.nvim background (gray0)
				window = {
					mac_window_bar = false, -- hide the red/yellow/green traffic-light dots
					margin = { x = 0, y = 0 }, -- no outer padding -> tighter/smaller image
					shadow = { radius = 0, color = "#00000000" }, -- no shadow (would clip at margin 0)
					title_config = {
						font_family = "JetBrainsMono Nerd Font",
					},
				},
			},
		},
	},
}
