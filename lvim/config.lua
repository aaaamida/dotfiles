-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


lvim.builtin.lualine.style = "default"

-- plugins
lvim.plugins = {
        {
                "EdenEast/nightfox.nvim"
        },
        {
                "arnamak/stay-centered.nvim"
        },
        {
                "norcalli/nvim-colorizer.lua"
        },
        {
                "xiyaowong/transparent.nvim"
        },
        {
                "projekt0n/github-nvim-theme"
        },
        {
                "smoka7/multicursors.nvim",
                event = "VeryLazy",
                dependencies = {
                        'nvimtools/hydra.nvim'
                },
                opts = {},
                cmd = {
                        "MCstart", "MCvisual", "MCclear",
                        "MCpattern", "MCvisualPattern", "MCunderCursor"
                },
                keys = {
                        {
                                mode = { 'v', 'n' },
                                "<leader>m",
                                "<cmd>MCunderCursor<cr>",
                                desc = "Create selection",
                        },
                },
        },
        {
                "catppuccin/nvim",
                name = "catppuccin",
                priority = 1000
        },
        {
                'akinsho/flutter-tools.nvim',
                lazy = false,
                dependencies = {
                        'nvim-lua/plenary.nvim',
                        'stevearc/dressing.nvim',
                },
                config = true,
        },
        {
                "lervag/vimtex",
                lazy = false,
        }
}

-- init commands
vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*" },
        command = "set nowrap rnu tabstop=8 shiftwidth=8 expandtab autoindent smartindent"
})


lvim.builtin.which_key.mappings["t"] = {
        name = "Toggle terminal",
        h = {
                "<cmd>ToggleTerm direction=horizontal size=15<cr>",
                "Toggle terminal horizontally"
        },
        t = {
                "<cmd>ToggleTerm direction=float<cr>",
                "Toggle floating terminal window"
        }
}

lvim.keys.normal_mode[";"] = ":"

lvim.colorscheme = "catppuccin-mocha"

-- plugins setup
require('colorizer').setup()
require('stay-centered').setup()
require('flutter-tools').setup {}
