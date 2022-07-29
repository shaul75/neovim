require("nvim-tree").setup {
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
}
