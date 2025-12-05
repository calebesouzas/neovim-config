return {
  cmd = {"html-lsp"},
  filetypes = {"html"},
  root_markers = {
    ".git",
    "index.html"
  },
  capabilities = require"cmp_nvim_lsp".default_capabilities()
}
