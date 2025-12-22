-- // Leader Mappings // --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- // Options // --
-- Line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- Scrolling
vim.o.scrolloff = 16

-- Indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- // Lazy Plugin Manager Config // --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { "windwp/nvim-autopairs", event = "InsertEnter", opts = {}, },
  },
  -- install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
