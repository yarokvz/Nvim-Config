local status_ok, gps = pcall(require, "nvim-gps")
if not status_ok then
  return
end

gps.is_available()
gps.get_location()

local icons = require "yaro.icons"
local space = ""
vim.api.nvim_set_hl(0, "Winbar", { fg = "#6b737f" })
-- Customized config
gps.setup {

	disable_icons = false, -- Setting it to true will disable all icons

	icons = {
		["class-name"] = "%#CmpItemKindClass#" .. icons.kind.Class .. "%*" .. space, -- Classes and class-like objects
		["function-name"] = "%#CmpItemKindFunction#" .. icons.kind.Function .. "%*" .. space, -- Functions
		["method-name"] = "%#CmpItemKindMethod#" .. icons.kind.Method .. "%*" .. space, -- Methods (functions inside class-like objects)
		["container-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. space, -- Containers (example: lua tables)
		["tag-name"] = "%#CmpItemKindKeyword#" .. icons.misc.Tag .. "%*" .. " ", -- Tags (example: html tags)
		["mapping-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. space,
		["sequence-name"] = "%#CmpItemKindProperty#" .. icons.type.Array .. "%*" .. space,
		["null-name"] = "%#CmpItemKindField#" .. icons.kind.Field .. "%*" .. space,
		["boolean-name"] = "%#CmpItemKindValue#" .. icons.type.Boolean .. "%*" .. space,
		["integer-name"] = "%#CmpItemKindValue#" .. icons.type.Number .. "%*" .. space,
		["float-name"] = "%#CmpItemKindValue#" .. icons.type.Number .. "%*" .. space,
		["string-name"] = "%#CmpItemKindValue#" .. icons.type.String .. "%*" .. space,
		["array-name"] = "%#CmpItemKindProperty#" .. icons.type.Array .. "%*" .. space,
		["object-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. space,
		["number-name"] = "%#CmpItemKindValue#" .. icons.type.Number .. "%*" .. space,
		["table-name"] = "%#CmpItemKindProperty#" .. icons.ui.Table .. "%*" .. space,
		["date-name"] = "%#CmpItemKindValue#" .. icons.ui.Calendar .. "%*" .. space,
		["date-time-name"] = "%#CmpItemKindValue#" .. icons.ui.Table .. "%*" .. space,
		["inline-table-name"] = "%#CmpItemKindProperty#" .. icons.ui.Calendar .. "%*" .. space,
		["time-name"] = "%#CmpItemKindValue#" .. icons.misc.Watch .. "%*" .. space,
		["module-name"] = "%#CmpItemKindModule#" .. icons.kind.Module .. "%*" .. space,
	--	["class-name"] = icons.kind.Class .. "%", -- Classes and class-like objects
	--	["function-name"] = icons.kind.Function .. "%", -- Functions
	--	["method-name"] = icons.kind.Method .. "%", -- Methods (functions inside class-like objects)
	--	["container-name"] = icons.type.Object .. "%", -- Containers (example: lua tables)
	--	["tag-name"] = icons.misc.Tag .. "%", -- Tags (example: html tags)
	--	["mapping-name"] = icons.type.Object .. "%",
	--	["sequence-name"] = icons.type.Array .. "%",
	--	["null-name"] = icons.kind.Field .. "%",
	--	["boolean-name"] = icons.type.Boolean .. "%",
	--	["integer-name"] = icons.type.Number .. "%",
	--	["float-name"] = icons.type.Number .. "%",
	--	["string-name"] = icons.type.String .. "%",
	--	["array-name"] = icons.type.Array .. "%",
	--	["object-name"] = icons.type.Object .. "%",
	--	["number-name"] = icons.type.Number .. "%",
	--	["table-name"] = icons.ui.Table .. "%",
	--	["date-name"] = icons.ui.Calendar .. "%",
	--	["date-time-name"] = icons.ui.Table .. "%",
	--	["inline-table-name"] = icons.ui.Calendar .. "%",
	--	["time-name"] = icons.misc.Watch .. "%",
	--	["module-name"] = icons.kind.Module .. "%",
	},

	-- Add custom configuration per language or
	-- Disable the plugin for a language
	-- Any language not disabled here is enabled by default
	-- languages = {
	-- 	-- Some languages have custom icons
	languages = {
		-- Some languages have custom icons
		["json"] = {
			icons = {
				["array-name"] = ' ',
				["object-name"] = ' ',
				["null-name"] = '[] ',
				["boolean-name"] = icons.type.Boolean,
				["number-name"] = icons.type.Number,
				["string-name"] = icons.type.String
			}
		}
	},
	separator = " " .. icons.ui.ChevronRight .. " ",

	-- limit for amount of context shown
	-- 0 means no limit
	-- Note: to make use of depth feature properly, make sure your separator isn't something that can appear
	-- in context names (eg: function names, class names, etc)
	depth = 0,

	-- indicator used when context is hits depth limit
	depth_limit_indicator = "..",
}
