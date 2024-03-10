return {
	{
		"cljoly/telescope-repo.nvim",
		config = function()
			list = {
				search_dirs = "~/projects",
			}
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"nvim-telescope/telescope-project.nvim",
			"cljoly/telescope-repo.nvim",
			"1riz/telescope-macros.nvim",
			-- "nvim-telescope/telescope-media-files.nvim"
		},
		keys = {
			{ "<leader>f", ":Telescope<CR>", mode = "n" },
			{ "<leader>fg", ":Telescope repo list<CR>", mode = "n" },
			{ "<leader>fr", ":Telescope oldfiles<CR>", mode = "n" },
			{ "<leader>ft", ":Telescope live_grep<CR>", mode = "n" },
			{ "<leader>ff", ":Telescope file_browser<CR>", mode = "n" },
			{ "<leader>fF", ":Telescope find_files<CR>", mode = "n" },
			{ "<leader>fc", ":Telescope neoclip<CR>", mode = "n" },
			{ "<leader>fm", ":Telescope macros<CR>", mode = "n" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					-- Default configuration for telescope goes here:
					-- config_key = value,
					-- layout_strategy = "vertical",
					theme = "dropdown",
					layout_config = {
						-- width = 0.7,
						preview_width = 0.55,
					},
					mappings = {},
				},
				extensions = {
					-- media_files = {
					--     -- filetypes whitelist
					--     -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					--     filetypes = {"png", "webp", "jpg", "jpeg"},
					--     -- find command (defaults to `fd`)
					--     find_cmd = "rg"
					-- },
					macros = {
						prompt_title = "Macros de Jaimedgp",
						num_registers = 22,
						theme = "dropdown",
						layout_strategy = "center",
						layout_config = {
							height = 0.20,
							width = 0.50,
						},
					},
					file_browser = {
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
					},
					project = {
						base_dirs = {
							"~/projects",
						},
					},
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					repo = {
						list = {
							search_dirs = { "~/projects/", "~/Desktop" },
							fd_opts = { "--no-ignore-vcs" },
						},
					},
				},
			})
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("project")
			require("telescope").load_extension("repo")
			require("telescope").load_extension("macros")
		end,
	},
}
