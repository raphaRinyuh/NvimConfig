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
      } )
      vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {}) 
    end
  }
