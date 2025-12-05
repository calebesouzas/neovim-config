return {
  cmd = {"rust-analyzer"},
  filetypes = {"rs"},
  root_markers = {
    "Cargo.toml",
    "src",
    "main.rs"
  },
  capabilities = require"cmp_nvim_lsp".default_capabilities()
}
