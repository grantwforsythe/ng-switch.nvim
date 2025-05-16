local M = {}

---@class NgSwitchConfig
--- Indicates whether files should be opened side by side in the editor.
--- If set to true, files will open in a split view; otherwise, they will open in the current window.
---@field is_vsplit boolean
--- A list of stylesheet extensions that the plugin will work with.
--- By default, it includes "scss", "css", "sass", and "less". It will use whichever comes first in that order.
---@field style_formats string[]

---@type NgSwitchConfig 
local defaults = {
	is_vsplit = false,
	style_formats = { "scss", "css", "sass", "less" },
}
--- Returns a string based on the provided file extension.
---@param ext string
---@return string|nil
local function get_file_extension(ext)
	local full_path = vim.api.nvim_buf_get_name(0)
	-- HACK: This is a workaround for the issue where the file name is not always available in the buffer.
	local base = vim.fn.fnamemodify(full_path, ":r"):gsub("%.spec$", "") 
	local file = base .. "." .. ext
	if vim.fn.filereadable(file) == 0 then
		return nil
	end

	return file
end

local function open_file(file)
	if M.config.openSideBySide then
		vim.cmd("vsplit " .. file)
	else
		vim.cmd("edit " .. file)
	end
end

-- TODO: Handle different types of stylesheets (CSS, SCSS, SASS)
vim.api.nvim_create_user_command("NgSwitchHTML", function()
	local file = get_file_extension("html")
	if file then
		open_file(file)
	end
end, { force = true })

vim.api.nvim_create_user_command("NgSwitchTS", function()
	local file = get_file_extension("ts")
	if file then
		open_file(file)
	end
end, { force = true })

-- BUG: When trying to switching to anothe file from a spec
vim.api.nvim_create_user_command("NgSwitchSpec", function()
	local file = get_file_extension("spec.ts")
	if file then
		open_file(file)
	end
end, { force = true })

vim.api.nvim_create_user_command("NgSwitchCSS", function()
	for _, ext in ipairs(M.config.style_formats) do
		local file = get_file_extension(ext)

		if file then
			open_file(file)
			break
		end
	end
end, { force = true })

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", defaults, opts or {})
end

return M
