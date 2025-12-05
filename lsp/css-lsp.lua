return {
  cmd = {"css-lsp"},
  filetypes = {"css"},
  root_markers = {
    ".git",
    "index.html",
    "style.css"
  },
  capabilities = require"cmp_nvim_lsp".default_capabilities()
}
