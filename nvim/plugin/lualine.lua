local lualine_ok, lualine = pcall(require, 'lualine')
if not lualine_ok then
	print('Lualine not found')
	return
end

local tabline_ok, tabline = pcall(require, 'tabline')
if not tabline_ok then
	print('Tabline not found')
	return
end

local function readBatteryInfo(info_name)
	local handle, errMsg = io.popen("cat /sys/class/power_supply/BAT1/" .. info_name, "r")
	if handle == nil or errMsg ~= nil then
		return nil, tostring("Not possible to read battery " .. info_name .. ": " .. errMsg)
	end
	local info = handle:read("l")
	handle:close()
	return tostring(info), ""
end

function GetBatteryStatus()
	local status, statusError = readBatteryInfo("status")
	local capacityText, capacityError = readBatteryInfo("capacity")

	if status == nil or capacityText == nil then
		print(statusError .. " " .. capacityError)
		return "󰂑 "
	end
	local capacity = tonumber(capacityText, 10)

	local iconsNotCharging = { "󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹" }
	local iconsCharging = { "󰢟", "󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅" }
	local icons = status == "Charging" or status == "Full" and iconsCharging or iconsNotCharging
	local index = math.floor(capacity / 100 * 10) + 1

	return icons[index] .. " " .. capacity .. "%%"
end

tabline.setup({
	enable = true,
	options = {
		section_separators = { '', '' },
		component_separators = { '', '' },
		max_bufferline_percent = 80, -- set to nil by default, and it uses vim.o.columns * 2/3
		show_tabs_always = false,  -- show tabs even when there only one tab unamed
		show_devicons = true,      -- show devicons in buffer section
		show_bufnr = false,        -- append [bufnr] to buffer section,
		show_filename_only = true, -- shows base filename only instead of relative path in filename
		modified_icon = "● ",    -- change the default modified icon
		modified_italic = false,   -- set to true by default; this determines whether the filename turns italic if modified
		show_tabs_only = false,    -- this shows only tabs instead of tabs + buffers
	}
})

lualine.setup({
	options = {
		theme = 'nord',
		icons_enabled = true,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { 'filename' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'searchcount' },
		lualine_x = { "diagnostics" },
		lualine_y = { { "filetype", icon_only = true } },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	-- tabline = {},
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { tabline.tabline_buffers },
		lualine_x = { tabline.tabline_tabs },
		lualine_y = { "GetBatteryStatus()" },
		lualine_z = { { 'datetime', style = '%a %e %b  %Hh%M' } },
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
})

-- Keybinds
local keybinds_ok, keybinds = pcall(require, 'keybinds')
if keybinds_ok then
	keybinds('n', '<M-b>', ':TablineBufferNext<Return>', { silent = true })
	keybinds('n', '<M-B>', ':TablineBufferPrevious<Return>', { silent = true })
else
	print('It was not possible to set keybinds for Lualine/Tabline')
end
