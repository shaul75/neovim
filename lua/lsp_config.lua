local lspconfig = require("lspconfig")
lspconfig.flow.setup {}
lspconfig.solargraph.setup {
  require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "single"
    }
  }),
  init_options = {
    formatting = true
  },
  settings = {
    solargraph = {
      diagnostics = true,
    }
  },
  flags = {
    debounce_text_changes = 150,
  },
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      }
    ),
  }
}
lspconfig.eslint.setup {}
