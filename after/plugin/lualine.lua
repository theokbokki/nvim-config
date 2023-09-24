local ok, lualine = pcall(require, 'lualine')

if not ok then return end

local colors = {
	black        = '#232136',
	white        = '#e0def4',
	red          = '#eb6f92',
	green        = '#9ccfd8',
	blue         = '#3e8fb0',
	yellow       = '#f6c177',
	gray         = '#393552',
	darkgray     = '#2a273f',
	lightgray    = '#6e6a86',
	inactivegray = '#908caa',
}

local rosepine_moon = {
	normal = {
		a = { bg = colors.gray, fg = colors.white, gui = 'bold' },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.darkgray, fg = colors.white }
	},
	insert = {
		a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.lightgray, fg = colors.white }
	},
	visual = {
		a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.inactivegray, fg = colors.black }
	},
	replace = {
		a = { bg = colors.red, fg = colors.black, gui = 'bold' },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.black, fg = colors.white }
	},
	command = {
		a = { bg = colors.green, fg = colors.black, gui = 'bold' },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.inactivegray, fg = colors.black }
	},
	inactive = {
		a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
		b = { bg = colors.darkgray, fg = colors.gray },
		c = { bg = colors.darkgray, fg = colors.gray }
	}
}

lualine.setup {
	options = {
		theme = rosepine_moon,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
	}
}
