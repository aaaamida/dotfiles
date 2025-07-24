return {
  {
    "arnamak/stay-centered.nvim",
  },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    opts = {},
    cmd = {
      "MCstart",
      "MCvisual",
      "MCclear",
      "MCpattern",
      "MCvisualPattern",
      "MCunderCursor",
    },
    keys = {
      {
        mode = { "v", "n" },
        "<leader>m",
        "<cmd>MCunderCursor<cr>",
        desc = "Create selection",
      },
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
  },
  {
    "andweeb/presence.nvim",
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    config = function(_, _)
      require("telescope").setup(_)
      require("telescope").load_extension("undo")
    end,
    keys = {
      {
        mode = { "n", "v", "i" },
        "<leader>U",
        "<cmd>Telescope undo<cr>",
        { desc = "Toggle telescope undo tree" },
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    config = true,
    keys = {
      {
        mode = { "t", "n" },
        "<C-\\>",
        "<cmd>ToggleTerm direction=float<cr>",
        { desc = "Toggle floating terminal" },
      },
    },
  },
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup({
        nextls = { enable = true },
        elixirls = {
          enable = true,
          settings = elixirls.settings({
            dialyzerEnabled = false,
            enableTestLenses = false,
          }),
          on_attach = function(_, _)
            vim.keymap.set("n", "<leader>Ef", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "<leader>Et", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<leader>Em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        },
        projectionist = {
          enable = true,
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = true
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
}
