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
        rust_analyzer = {
          settings = {
            cargo = {
              features = "all",
            },
            procMacro = {
              ignored = {
                leptos_macro = {
                  "component",
                  "server"
                }
              }
            }
          }
        },
        -- clangd = {
        --   cmd = {
        --     "clangd",
        --     "--background-index",
        --     "--clang-tidy",
        --     "--header-insertion=iwyu",
        --     "--completion-style=detailed",
        --     "--function-arg-placeholders",
        --     "--fallback-style=llvm",
        --     "--query-driver=$(which clang)"
        --   }
        -- }
      },
    },
  },
}
