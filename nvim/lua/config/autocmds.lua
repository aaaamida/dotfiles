-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
  pattern = { "*" },
  callback = function()
    local ft = vim.bo.filetype
    if
      ft == "elixir"
      or ft == "elm"
      or ft == "lua"
      or ft == "yaml"
      or ft == "toml"
      or ft == "json"
      or ft == "jsonc"
      or ft == "xml"
    then
      vim.cmd([[set nowrap rnu tabstop=2 shiftwidth=2 autoindent smartindent]])
    elseif ft == "typst" then
      vim.cmd([[set nowrap rnu tabstop=6 shiftwidth=6 autoindent smartindent]])
    elseif ft == "blade" then
      vim.cmd([[set nowrap rnu tabstop=8 shiftwidth=8 autoindent smartindent ft=html]])
    else
      vim.cmd([[set nowrap rnu tabstop=8 shiftwidth=8 autoindent smartindent]])
    end
  end,
})

autocmd("CursorHold", {
  group = vim.api.nvim_create_augroup("LspHover", { clear = true }),
  callback = function()
    local diagnostic = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
    if #diagnostic > 0 then
      vim.diagnostic.open_float(nil, {
        scope = "cursor",
        focusable = false,
        border = "rounded",
        close_events = {
          "CursorMoved",
          "BufLeave",
        },
      })
      return
    end
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
