local opt = vim.opt

-------------------------------------
-- General
-------------------------------------
opt.termguicolors = true 	    -- Enable colors in terminal
opt.hlsearch = true 		    -- Set highlight on search
opt.number = true    		    -- Make line numbers default
opt.relativenumber = true 	    -- Make relative number default
opt.mouse = "n"     		    -- Enable mouse mode
opt.undofile = true     		-- Save undo history
opt.ignorecase = true   		-- Case insensitive searching unless /C or capital in search
opt.smartcase = true    		-- Smart case
opt.clipboard = "unnamedplus" 	-- Access system clipboard
opt.updatetime = 150    		-- Decrease update time
opt.timeoutlen = 400            -- Time to wait when key is press. e.g.: <leader> key

opt.textwidth = 120             -- Text Width to break line
opt.linebreak = true            -- Wrap on word boundary
opt.breakindent = true 	    	-- Enable break indent

opt.splitright = true           -- Vertical split to the right
opt.splitbelow = true           -- Horizontal split to the bottom

opt.ruler = true                -- Always show cursor position.
opt.cursorline = true           -- Highlight the line currently under cursor

opt.cmdheight = 0
opt.showmode = false            -- Don't show mode
opt.conceallevel = 1

-------------------------------------
-- Tabs, indent
-------------------------------------
opt.expandtab = true            -- Use spaces instead of tabs
opt.shiftwidth = 4              -- Shift 4 spaces when tab
opt.tabstop = 4                 -- 1 tab == 4 spaces
opt.smartindent = true          -- Autoindent new lines

opt.shiftround = true           -- Round the indentation to the nearest multiple of shiftwidth
opt.smarttab = true             -- Insert “tabstop” number of spaces when the “tab” key is pressed.

opt.foldmethod = "indent"       -- A
opt.foldnestmax = 3             -- B
opt.foldlevel = 1               -- C
opt.foldenable = false          -- D

-------------------------------------
-- Memory, CPU
-------------------------------------
opt.hidden = true               -- Enable background buffers
opt.history = 100               -- Remember N lines in history
opt.lazyredraw = true           -- Faster scrolling
opt.synmaxcol = 240             -- Max column for syntax highlight
opt.updatetime = 250            -- ms to wait for trigger an event
