return {
  cmd = {"clangd"},
  filetypes = {"c", "h"},
  root_markers = {
    ".git",
    "Makefile"
  },
  capabilities = require "cmp_nvim_lsp".default_capabilities()
}
