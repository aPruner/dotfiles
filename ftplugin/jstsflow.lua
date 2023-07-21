local lspconfig = require "lspconfig"
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver", "flow" })


-- Flow config
-- So far, it seems as though this code should work to configure flow for .js and .jsx files
-- but it seems to crash when I run :so. Ideally I'd love to never touch flow but it's for work :(
-- local flow_opts = {
--   settings = {
--     cmd = { "npx", "--no-install", "flow", "lsp" },
--     filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
--     root_dir = lspconfig.util.root_pattern(".flowconfig")
--   },
-- }
-- require("lvim.lsp.manager").setup("flow", flow_opts)

-- tsserver config
local tsserver_opts = {
  settings = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
      hostInfo = "neovim"
    },
    root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", ".git"),
    single_file_support = true
  }
}
require("lvim.lsp.manager").setup("tsserver", tsserver_opts)
