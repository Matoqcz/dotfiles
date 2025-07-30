return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({

        ensure_installed = { 
          "python", "lua", "vim", "vimdoc", "query",
          "vue",           -- Vue Single File Components
          "typescript",    -- TypeScript support in Vue
          "javascript",    -- JavaScript support in Vue
          "html",          -- HTML template syntax
          "css",           -- CSS styling in Vue
          "scss",          -- SCSS support (optional)
          "json"           -- JSON support for package.json, etc.
        },
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-backspace>",
          },
        },
      })
    end,
  },
}
