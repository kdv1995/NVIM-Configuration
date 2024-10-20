require("user.keymaps")
require("user.options")
require("user.plugins")
require("user.nvim-tree")
require("user.treesitter")
require("user.colorscheme")
require("user.lsp")
require("user.cmp")
require("user.toggle-term")
require("user.lualine")
require("user.bufferline")
require("user.lsp.which-key-custom-key-map")
require('bufdel').setup {
  next = 'tabs',
  quit = true,  -- quit Neovim when last buffer is closed
}
