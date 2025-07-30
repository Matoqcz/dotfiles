vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.filetype").setup()
require("config.lazy")

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Other settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.updatetime = 250
vim.g.netrw_liststyle = 3
vim.g.netrw_keepdir = 0


vim.diagnostic.config({
  float = {
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    border = 'rounded',
    source = 'always',
    prefix = ' ',
    scope = 'cursor',
  },
})

-- Show diagnostics automatically on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {focus=false})
  end
})

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Go to definition (you mentioned this one)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
-- Go to declaration 
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
-- Go to implementation
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
-- Go to type definition
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition)
-- Find references
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
-- Hover documentation (you mentioned this one)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
-- Signature help (function parameters)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<space>f", function()
  vim.lsp.buf.format({ async = true })
end, opts)

-- Keybindings
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

--
-- Split windows
vim.keymap.set('n', '<leader>sv', '<C-w>v') -- vertical split
vim.keymap.set('n', '<leader>sh', '<C-w>s') -- horizontal split

-- Navigate windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Resize windows
vim.keymap.set('n', '<C-Up>', ':resize +2<cr>')
vim.keymap.set('n', '<C-Down>', ':resize -2<cr>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<cr>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<cr>')

