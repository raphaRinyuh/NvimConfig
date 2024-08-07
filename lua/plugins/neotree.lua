return
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup( {
        ensure_installed = {"lua", "typescript", "javascript"},
        highlight = { enable = true },
        indent = { enable = true },
      })
      require("neo-tree").setup({
        window = {
          position = "current"
        },
        close_if_last_window = true,
        container = {
          enable_character_fade = false
        },
        indent = {
          indent_size = 1
        },
        name = {
          highlight_opened_files = true
        }
      })
      vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal current<CR>', {})
      vim.keymap.set('n', '<C-b>', ':Neotree filesystem close<CR>', {})
    end
  }
