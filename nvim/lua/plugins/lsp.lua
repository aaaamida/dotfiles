return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      servers = {
        tinymist = {
          settings = {
            exportPdf = "onType",
            outputPath = "$root/$dir/$name",
          }
        },
      },
    },
  },
}
