local function toggle_terminal()
	-- Helper function to find terminal window
	local function find_terminal_window()
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			local buf = vim.api.nvim_win_get_buf(win)
			local buf_type = vim.api.nvim_buf_get_option(buf, "buftype")
			if buf_type == "terminal" then
				return win
			end
		end
		return nil
	end

	local terminal_win = find_terminal_window()
	local current_win = vim.api.nvim_get_current_win()

	-- If terminal window exists but we're not in it, focus it and enter terminal mode
	if terminal_win and current_win ~= terminal_win then
		vim.api.nvim_set_current_win(terminal_win)
		vim.cmd("startinsert")
		return
	end

	-- Otherwise, toggle the terminal (open if closed, close if open)
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
