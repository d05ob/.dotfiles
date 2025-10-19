local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Header (your ASCII art logo)
dashboard.section.header.val = {
    "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
    "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
    "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
    "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
    "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
    "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

-- Buttons
dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
    dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
    dashboard.button("q", "󰈆 Quit", ":qa<CR>"),
}

-- Footer (fun quote or plugin info)
dashboard.section.footer.val = " Neovim loaded successfully ✨"

alpha.setup(dashboard.config)
