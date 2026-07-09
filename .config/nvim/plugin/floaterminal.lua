-- https://www.youtube.com/watch?v=5PIiKDES_wc

local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	-- Calculate the position to center the window
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	-- Create a buffer
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	end

	-- Define window configuration
	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal", -- No borders or extra UI elements
		border = "rounded",
	}

	-- Create the floating window
	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }
end

local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		if vim.fn.mode() == "n" then
			local filename = vim.api.nvim_buf_get_name(0)
			if filename ~= "" then
				vim.cmd("write")
			end
		end
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
		vim.cmd("startinsert")
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

local toggle_terminal_with_cmd = function()
	-- Close the old window if it exists
	if vim.api.nvim_win_is_valid(state.floating.win) then
		vim.api.nvim_win_close(state.floating.win, true)
	end

	-- Delete the old terminal buffer (kills the terminal job)
	if vim.api.nvim_buf_is_valid(state.floating.buf) then
		vim.api.nvim_buf_delete(state.floating.buf, { force = true })
	end

	-- Create a fresh buffer/window
	state.floating.buf = vim.api.nvim_create_buf(false, true)
	state.floating = create_floating_window({ buf = state.floating.buf })
	vim.notify("Should show up")
	vim.api.nvim_set_current_win(state.floating.win)

	if vim.bo[state.floating.buf].buftype ~= "terminal" then
		vim.cmd.terminal()
	end
	local job_id = vim.api.nvim_buf_get_var(state.floating.buf, "terminal_job_id")
	vim.api.nvim_chan_send(job_id, "r r\n")
	vim.cmd("startinsert")
end

-- Example usage:
-- Create a floating window with default dimensions
vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, { desc = "Toggle terminal" })
vim.keymap.set({ "n", "t" }, "ù", toggle_terminal, { desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>g", toggle_terminal, { desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>r", toggle_terminal_with_cmd, { desc = "Toggle terminal and [R]un" })
vim.keymap.set("t", "<Esc><Esc>", function()
	vim.cmd("stopinsert") -- leave terminal mode
	toggle_terminal()
end)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
