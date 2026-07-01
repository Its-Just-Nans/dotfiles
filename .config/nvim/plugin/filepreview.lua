-- file preview

local preview_files = function()
	local width = vim.o.columns
	local max_width = 100
	require("telescope.builtin").find_files({
		cwd = ".",
		layout_strategy = width > max_width and "horizontal" or "vertical",
		layout_config = width > max_width and { width = 0.8, height = 0.8 } or { width = 0.5 },
		initial_mode = "normal",
		hidden = true,
		file_ignore_patterns = { ".git/" },
	})
end

-- Example usage:
-- Create a floating window with default dimensions
vim.api.nvim_create_user_command("PreviewFiles", preview_files, {})
vim.keymap.set("n", "<leader>sf", preview_files, { desc = "[S]earch [F]iles" })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
