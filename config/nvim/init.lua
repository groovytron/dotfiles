
-- vim.api.nvim_exec(
-- [[
-- call plug#begin()
-- 
-- Plug 'hashivim/vim-terraform'
-- 
-- call plug#end()
-- ]],
-- true)
-- 
require('plugins')


-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = false,
    highlight_git = false,
  },
  git = { enable = false },
  filters = {
    dotfiles = false,
  },
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = {
      enable = true,
    }
  },
})

local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Treesitter config
require('nvim-treesitter.configs').setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "php", "html" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
})

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

-- Enable lualine (editor status bar)
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
	path = 1,
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
	'filename',
	path = 1,
      },
    },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Language server config
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- show lsp diagnostics in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- TypeScript
-- require('lspconfig').ts_ls.setup {
--   on_attach =  on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx"},
--   cmd = { "typescript-language-server", "--stdio" }
-- }

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- JavaScript
require('lspconfig').eslint.setup{
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}

-- TypeScript
require('lspconfig').ts_ls.setup{
  capabilities = capabilities,
}

-- Vue language server (volar)
require('lspconfig').volar.setup{
  capabilities = capabilities,
}

-- Emmet
require('lspconfig').emmet_language_server.setup({
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue", "htmldjango", "php", "blade" },
  init_options = {
    --- @type table<string, any> https://docs.emmet.io/customization/preferences/
    preferences = {},
    --- @type "always" | "never" defaults to `"always"`
    showexpandedabbreviation = "always",
    --- @type boolean defaults to `true`
    showabbreviationsuggestions = true,
    --- @type boolean defaults to `false`
    showsuggestionsassnippets = false,
    --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
    syntaxprofiles = {},
    --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
    variables = {},
    --- @type string[]
    excludelanguages = {},
  },
})

-- CSS
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

-- Terraform
require('lspconfig').terraformls.setup{
  capabilities = capabilities,
  filetypes = { "terraform", "terraform-vars", "hcl" }
}

require('lspconfig').tflint.setup{
  capabilities = capabilities,
}

vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = { "*.tf", "*.tfvars", "*.hcl" },
  callback = vim.lsp.buf.format
})

vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

-- Docker
require('lspconfig').dockerls.setup{
  capabilities = capabilities,
}

-- Golang
local util = require ("lspconfig/util")

require('lspconfig').gopls.setup {
  capabilities = capabilities,
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

function go_org_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()

  params.context = {only = {"source.organizeImports"}}

  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)

  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
end

vim.cmd([[autocmd BufWritePre *.go lua go_org_imports()]])
vim.api.nvim_command('autocmd BufWritePre *.go lua go_org_imports()')

-- Python
require('lspconfig').jedi_language_server.setup{
  capabilities = capabilities,
}

require'lspconfig'.pylsp.setup{
  capabilities = capabilities,
}

-- Ansible
require('lspconfig').ansiblels.setup({})

vim.filetype.add({
  pattern = {
    [".*playbook.*.ya?ml"] = "yaml.ansible",
  },
})

-- PHP
require'lspconfig'.phpactor.setup{
  capabilities = capabilities,
}

-- PHP: Inspect and format on save
require("phpcs").setup({
  phpcs = "phpcs",
  phpcbf = "phpcbf",
  standard = "PSR12"
})

vim.api.nvim_command('autocmd BufWritePost,BufReadPost,InsertLeave *.php lua require("phpcs").cs()')
-- vim.api.nvim_command('autocmd BufWritePost *.php lua require("phpcs").cbf()')

-- Laravel/Blade
parser_config.blade = {
  install_info = {
      url = "https://github.com/EmranMR/tree-sitter-blade",
      files = { "src/parser.c" },
      branch = "main",
  },
  filetype = "blade",
}

vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})

-- Languages specific formatting
vim.api.nvim_command('autocmd Filetype go,Makefile setlocal tabstop=4')
vim.api.nvim_command('autocmd Filetype yaml.ansible,c,cpp,css,hcl,html,htmldjango.twig,html.twig,javascript,json,php,pug,scss,tf,twig,ruby,yaml,vim,xml,puml,mmd set ts=2 sts=2 sw=2 expandtab')

-- Set up nvim-cmp.
local cmp = require('cmp')

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Custom vim commands for UI
vim.api.nvim_command('set number')

-- Custom key mappings
vim.keymap.set('n', '<C-n>', '<Cmd>:NvimTreeToggle<CR>')

-- Telescope
vim.keymap.set('n', '<C-p>', '<Cmd>:Telescope find_files hidden=true<CR>')
-- vim.keymap.set('n', '<C-t>', '<Cmd>:Telescope live_grep<CR>')
vim.keymap.set('n', '<C-t>', '<Cmd>:lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>')

vim.cmd("set background=dark")
vim.cmd("let g:gruvbox_material_better_performance = 1")
vim.cmd("colorscheme gruvbox-material")
-- vim.cmd("colorscheme solarized")
