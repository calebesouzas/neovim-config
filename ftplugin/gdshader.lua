vim.lsp.config("gdshader_lsp", {
  cmd = { "gdshader-lsp", "--stdio" },
  filetypes = { "gdshader", "gdshaderinc" },
  root_markers = { "project.godot", ".git" }
})

vim.lsp.enable("gdshader_lsp")
