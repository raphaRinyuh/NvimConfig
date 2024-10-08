return
  {
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep , {})

        require("telescope").setup {
          defaults = {
            path_display = { "truncate" }
          }
        }
      end
    },
    {
      'nvim-telescope/telescope-ui-select.nvim',
      config = function()
        require("telescope").setup {
          defaults = {
            file_ignore_patterns = {"var", "node_modules", "public", "dist"}
          },
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {
              }
            },
            ["harpoon"] = {

            }
          }
        }
        require("telescope").load_extension("ui-select")
      end
    }
  }
