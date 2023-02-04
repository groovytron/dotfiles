require('plugins')


-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = false,
  },
  git = { enable = false },
  filters = {
    dotfiles = false,
  },
})

-- Enable lualine (editor status bar)
require('lualine').setup()

-- Language server config
require('lspconfig').tsserver.setup {
  on_attach =  on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx"},
  cmd = { "typescript-language-server", "--stdio" }
}

vim.keymap.set('n', '<C-n>', '<Cmd>:NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-p>', '<Cmd>:Telescope find_files<CR>')
vim.keymap.set('n', '<C-f>', '<Cmd>:Telescope live_grep<CR>')

vim.cmd("set background=dark")
vim.cmd("let g:gruvbox_material_better_performance = 1")
vim.cmd("colorscheme gruvbox-material")
