return {
	"goolord/alpha-nvim",
    event = "VimEnter",
	-- lazy = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local status_ok, alpha = pcall(require, "alpha")
		if not status_ok then
			return
		end

		local dashboard = require("alpha.themes.dashboard")
		local function header()
			return {
				-- [[]], [[]], [[]], [[]], [[]], [[]], [[]], [[]], [[]],
				-- [[]], [[]], [[]], [[]], [[]], [[]], [[]], [[]], [[]],
				-- [[      v                               m          ]], -- [[      v                               m          ]],
				-- [[    vvvvv                             mmm        ]], -- [[    v...v                             m´m        ]],
				-- [[  vvvvvvvvv                           mmmmm      ]], -- [[  v.......v                           m´´´m      ]],
				-- [[ nvvvvvvvvvvv                         mmmmmmm    ]], -- [[ nv.........v                         m´´´´´m    ]],
				-- [[ nnvvvvvvvvvvv                        mmmmmmmmm  ]], -- [[ nnv.........v                        m´´´´´´´m  ]],
				-- [[ nnnnvvvvvvvvvvv                      mmmmmmmmmm ]], -- [[ n::nv.........v                      m´´´´´´´´m ]],
				-- [[ nnnnnnvvvvvvvvvvv                    mmmmmmmmmm ]], -- [[ n::::nv.........v                    m´´´´´´´´m ]],
				-- [[ nnnnnnnnvvvvvvvvvv                   mmmmmmmmmm ]], -- [[ n::::::nv........v                   m´´´´´´´´m ]],
				-- [[ nnnnnnnnnnvvvvvvvvvvv                mmmmmmmmmm ]], -- [[ n::::::::nv.........v                m´´´´´´´´m ]],
				-- [[ nnnnnnnnnn  vvvvvvvvvvv              mmmmmmmmmm ]], -- [[ n::::::::n  v.........v              m´´´´´´´´m ]],
				-- [[ nnnnnnnnnn    vvvvvvvvvvv            mmmmmmmmmm ]], -- [[ n::::::::n    v.........v            m´´´´´´´´m ]],
				-- [[ nnnnnnnnnn      vvvvvvvvvvv          mmmmmmmmmm ]], -- [[ n::::::::n      v.........v          m´´´´´´´´m ]],
				-- [[ nnnnnnnnnn        vvvvvvvvvvv        mmmmmmmmmm ]], -- [[ n::::::::n        v.........v        m´´´´´´´´m ]],
				-- [[ nnnnnnnnnn          vvvvvvvvvvv      mmmmmmmmmm ]], -- [[ n::::::::n          v.........v      m´´´´´´´´m ]],
				-- [[ nnnnnnnnnn            vvvvvvvvvvv    mmmmmmmmmm ]], -- [[ n::::::::n            v.........v    m´´´´´´´´m ]],
				-- [[ nnnnnnnnnn              vvvvvvvvvvv  mmmmmmmmmm ]], -- [[ n::::::::n              v.........v  m´´´´´´´´m ]],
				-- [[ nnnnnnnnnn                vvvvvvvvvvvmmmmmmmmmm ]], -- [[ n::::::::n                v.........vm´´´´´´´´m ]],
				-- [[ nnnnnnnnnn                  vvvvvvvvvmmmmmmmmmm ]], -- [[ n::::::::n                  v........m´´´´´´´´m ]],
				-- [[  nnnnnnnnn                   vvvvvvvvmmmmmmmmm  ]], -- [[  n:::::::n                   v.......m´´´´´´´m  ]],
				-- [[    nnnnnnn                     vvvvvvmmmmmmm    ]], -- [[    n:::::n                     v.....m´´´´´m    ]],
				-- [[      nnnnn                       vvvvmmmmm      ]], -- [[      n:::n                       v...m´´´m      ]],
				-- [[        nnn                         vvmmm        ]], -- [[        n:n                         v.m´m        ]],
				-- [[          n                           m          ]], -- [[          n                           m          ]],
				[[      v              m                                                                          ]],
				[[    vvvvv            mmm                                                                        ]],
				[[  nvvvvvvvv          mmmmm                                                                      ]],
				[[ nnnnnvvvvvvv        mmmmmm                                                                     ]],
				[[ nnnnnnvvvvvvvv      mmmmmm                                                                     ]],
				[[ nnnnnn  vvvvvvvv    mmmmmm                                                                     ]],
				[[ nnnnnn    vvvvvvvv  mmmmmm    eeeeeee       ooooooo  vvvvv   vvvvv iiiii mmmmm mmmmm  mmmmmm   ]],
				[[ nnnnnn      vvvvvvv mmmmmm   eee   eee     ooo   ooo   vvv     vvv   iii   mmmm    mmmm    mmm ]],
				[[ nnnnnn        vvvvvvmmmmmm  eee     eee   ooo     ooo  vvv     vvv   iii   mmm     mmm     mmm ]],
				[[ nnnnnn          vvvvmmmmmm eeeeeeeeeeeee ooo       ooo vvv     vvv   iii   mmm     mmm     mmm ]],
				[[  nnnnn            vvmmmmm   eee           ooo     ooo  vvv    vvv    iii   mmm     mmm     mmm ]],
				[[    nnn             vmmm      eee   eee     ooo   ooo   vvv   vvv     iii   mmm     mmm     mmm ]],
				[[      n              m         eeeeeee       ooooooo    vvvvvvv       iii   mmm     mmm     mmm ]],
			}
		end

		dashboard.section.header.val = header()

		-- button("e", "  New file", "<cmd>ene <CR>"),
		-- button("SPC f f", "󰈞  Find file"),
		-- button("SPC f h", "󰊄  Recently opened files"),
		-- button("SPC f r", "  Frecency/MRU"),
		-- button("SPC f g", "󰈬  Find word"),
		-- button("SPC f m", "  Jump to bookmarks"),
		-- button("SPC s l", "󰈬  Open last session"),

		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("g", "  Search Git Repo", ":Telescope repo list<CR>"),
			dashboard.button("f", "  Browse Files", ":Telescope file_browser<CR>"),
			dashboard.button("F", "󰈞  Fuzzy Finder", ":Telescope find_files<CR>"),
			dashboard.button("d", "  Daily Note", ":ObsidianToday<CR>"),
			dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
			dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
			dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
		}

		local function footer()
			-- Number of plugins
			-- local total_plugins = #vim.tbl_keys(packer_plugins)
			local datetime = os.date(" %d-%m-%Y  %H:%M:%S")
			-- local plugins_text = "\t" .. total_plugins .. " plugins " .. datetime
			local plugins_text = "\t" .. datetime

			-- Quote
			-- local fortune = require "alpha.fortune"
			-- local quote = table.concat(fortune(number), "\n")
			local quote = ""

			return plugins_text .. "\n" .. quote
		end

		dashboard.section.footer.val = footer()

		dashboard.section.footer.opts.hl = "Constant"
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Function"
		dashboard.section.buttons.opts.hl_shortcut = "Type"
		dashboard.opts.opts.noautocmd = true

		alpha.setup(dashboard.opts)
	end,
}
