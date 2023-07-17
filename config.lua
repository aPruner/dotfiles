-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.format_on_save = true;

-- Lunarvim key mappings
lvim.keys.normal_mode["<C-n>"] = ":ToggleTerm size=30 direction=horizontal<CR>"
lvim.keys.normal_mode["<Tab>"] = ":bnext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":bprev<CR>"
lvim.keys.normal_mode["<leader>t"] = ":TroubleToggle<CR>"
lvim.keys.normal_mode["<C-S-Right>"] = ":vertical resize +10<CR>"
lvim.keys.normal_mode["<C-S-Left>"] = ":vertical resize -10<CR>"

-- User Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "sitiom/nvim-numbertoggle"
  }
}

-- Core Plugin configs
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
