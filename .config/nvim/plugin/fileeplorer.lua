local toggle_explorer = function()
	if vim.fn.mode() == "n" then
		local filename = vim.api.nvim_buf_get_name(0)
		if filename ~= "" then
			vim.cmd("write")
		end
	end

	vim.cmd("Explore")
end

vim.keymap.set("n", "<leader>e", toggle_explorer, { desc = "Explore" })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
