-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local strategies = require("codecompanion.strategies")
local keymaps = require("lazyvim.plugins.lsp.keymaps")

require("catppuccin").setup({
  no_italic = true,
  styles = {
    keywords = { "bold" },
    variables = {},
    comments = { "nocombine" },
    miscs = { "nocombine" },
  },
  color_overrides = {
    mocha = {
      text = "#F4CDE9",
      subtext1 = "#DEBAD4",
      subtext0 = "#C8A6BE",
      overlay2 = "#B293A8",
      overlay1 = "#9C7F92",
      overlay0 = "#866C7D",
      surface2 = "#705867",
      surface1 = "#5A4551",
      surface0 = "#44313B",

      base = "#352939",
      mantle = "#211924",
      crust = "#1a1016",
    },
  },
})

require("stay-centered").setup()
require("colorizer").setup()
require("rainbow-delimiters")

require("nvim-ts-autotag").setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
  per_filetype = {
    ["html"] = {
      enable_close = false,
    },
  },
})

require("codecompanion").setup({
  adapters = {
    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        schema = {
          model = {
            default = "gemini-1.5-flash",
          },
        },
      })
    end,
  },
  strategies = {
    chat = {
      keymaps = {
        send = {
          modes = {
            n = { "<C-s>" },
          },
        },
      },
    },
  },
})

vim.g.autoformat = false
vim.g.codecompanion_adapter = "gemini"

vim.cmd([[
        colorscheme catppuccin-mocha

]])
