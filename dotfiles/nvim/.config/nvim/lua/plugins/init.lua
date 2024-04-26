require("lazy").setup({
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", opts = {} },

  require("plugins/gitsigns"),

  require("plugins/which-key"),

  require("plugins/telescope"),

  require("plugins/lspconfig"),

  require("plugins/conform"),

  require("plugins/cmp"),

  require("plugins/colorscheme"),

  require("plugins/todo-comments"),

  require("plugins/mini"),

  require("plugins/treesitter"),

  require("plugins/neotree"),

  -- { import = 'custom.plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
