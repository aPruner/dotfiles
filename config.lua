-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Lunarvim root object configs
lvim.format_on_save = true;

-- Lunarvim key mappings
lvim.keys.normal_mode["<C-n>"] = ":ToggleTerm size=30 direction=horizontal<CR>"
lvim.keys.normal_mode["<Tab>"] = ":bnext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":bprev<CR>"
lvim.keys.normal_mode["<leader>t"] = ":TroubleToggle<CR>"
lvim.keys.normal_mode["<C-S-Right>"] = ":vertical resize +10<CR>"
lvim.keys.normal_mode["<C-S-Left>"] = ":vertical resize -10<CR>"
lvim.keys.normal_mode["<S-x>"] = ":BufferKill<CR>"

-- User Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "sitiom/nvim-numbertoggle"
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }
}

-- Core Plugin configs

-- Gitsigns
lvim.builtin.gitsigns.opts = {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
    vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
    vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
  end,
}

-- LSP-specific configs
local lspconfig = require "lspconfig"
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver", "flow" })

-- Flow config
-- So far, it seems as though this code should work to configure flow for .js and .jsx files
-- but it seems to crash when I run :so. Ideally I'd love to never touch flow but it's for work :(
local flow_opts = {
  settings = {
    cmd = { "npx", "--no-install", "flow", "lsp" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
    root_dir = lspconfig.util.root_pattern(".flowconfig")
  },
}
require("lvim.lsp.manager").setup("flow", flow_opts)

-- tsserver config
local tsserver_opts = {
  settings = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
      hostInfo = "neovim"
    },
    root_dir = lspconfig.util.root_pattern("tsconfig.json"),
    single_file_support = true
  }
}
require("lvim.lsp.manager").setup("tsserver", tsserver_opts)
