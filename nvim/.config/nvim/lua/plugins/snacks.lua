local function toggle_terminal()
	-- Try snacks first
	local ok_snacks, snacks = pcall(require, "snacks")
	if ok_snacks and snacks and snacks.terminal and snacks.terminal.toggle then
		snacks.terminal.toggle()
		return
	end

	-- Fallback: try LazyVim's terminal toggle
	local ok_util, util = pcall(require, "lazyvim.util")
	if ok_util and util and util.terminal and util.terminal.toggle then
		util.terminal.toggle()
		return
	end

	-- Last resort: use built-in terminal command
	vim.cmd("Terminal")
end

-- Make function accessible globally for terminal mode keymap
_G.toggle_terminal = toggle_terminal

return {
	"folke/snacks.nvim",
	opts = {
		terminal = {
			win = {
				position = "right",
				width = 0.25,
			},
		},
		lazygit = {
			win = {
				position = "float",
				width = 0.9,
				height = 0.9,
			},
		},
	},
}
