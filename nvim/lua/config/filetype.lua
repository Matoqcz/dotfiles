local M = {}

local settings = {
  -- Web development files (2 spaces)
  web = {
    filetypes = { "html", "css", "scss", "less", "javascript", "typescript", "vue", "json", "yaml", "xml" },
    options = {
      tabstop = 2,
      shiftwidth = 2,
      softtabstop = 2,
      expandtab = true,
      autoindent = true,
      smartindent = true,
    }
  },
  
  -- Python files (4 spaces - following PEP 8)
  python = {
    filetypes = { "python" },
    options = {
      tabstop = 4,
      shiftwidth = 4,
      softtabstop = 4,
      expandtab = true,
      autoindent = true,
      smartindent = true,
    }
  },
  
  -- Go files (tabs)
  go = {
    filetypes = { "go" },
    options = {
      tabstop = 4,
      shiftwidth = 4,
      softtabstop = 4,
      expandtab = false, -- Go uses tabs
      autoindent = true,
      smartindent = true,
    }
  },
  
  -- Lua files (2 spaces)
  lua = {
    filetypes = { "lua" },
    options = {
      tabstop = 2,
      shiftwidth = 2,
      softtabstop = 2,
      expandtab = true,
      autoindent = true,
      smartindent = true,
    }
  }
}

-- Function to apply settings
function M.setup()
  for _, config in pairs(settings) do
    vim.api.nvim_create_autocmd("FileType", {
      pattern = config.filetypes,
      callback = function()
        for option, value in pairs(config.options) do
          vim.opt_local[option] = value
        end
      end,
    })
  end
  
  -- Special case for CSS - add hyphen to keyword characters
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "css", "scss", "less" },
    callback = function()
      vim.opt_local.iskeyword:append("-")
    end,
  })
  
  -- Special case for HTML - enable word wrap
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.linebreak = true
    end,
  })
end

return M

