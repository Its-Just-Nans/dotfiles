local toggle_explorer = function()
	if vim.fn.mode() == "n" then
		local filename = vim.api.nvim_buf_get_name(0)
		if filename ~= "" and vim.bo.filetype ~= "netrw" then
			vim.cmd("write")
		end
	end

	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)

		if vim.bo[buf].filetype == "netrw" then
			vim.api.nvim_win_close(win, true)
			return
		end
	end

	vim.cmd("Lexplore " .. vim.fn.fnameescape(vim.fn.expand("%:p:h")))
end

vim.keymap.set("n", "<leader>e", toggle_explorer, { desc = "Explore" })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
