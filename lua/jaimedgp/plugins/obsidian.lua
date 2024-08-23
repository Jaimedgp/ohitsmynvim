return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
    enabel = false,
	lazy = false,
	-- ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	keys = {
		{ "<leader>od", ":ObsidianToday<CR>", "n" },
		{ "<leader>ot", ":ObsidianTomorrow<CR>", "n" },
		{ "<leader>oy", ":ObsidianYesterday<CR>", "n" },
	},
	config = function()
		require("obsidian").setup({
			workspaces = {
				{ name = "work", path = "~/Documents/Obsidian/Predictia" },
			},
			daily_notes = {
				-- Optional, if you keep daily notes in a separate directory.
				folder = "Agenda/daily/",
				-- Optional, if you want to change the date format for the ID of daily notes.
				date_format = "%Y-%m-%d",
				-- Optional, if you want to change the date format of the default alias of daily notes.
				alias_format = "%Y-%m-%d",
				-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
				template = "YYYY-MM-DD.md",
			},
			-- Optional, for templates (see below).
			templates = {
				subdir = "Templates/",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
				-- A map for custom variables, the key should be the variable and the value a function
				substitutions = {},
			},
		})
	end,
}
