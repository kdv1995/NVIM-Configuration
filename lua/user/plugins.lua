-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})
-- Only required if you have packer configured as `opt`

return packer.startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Post-install/update hook with neovim command
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  --Nvim tree lua plugins
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional
    },
  })

  -- One dark
  use("navarasu/onedark.nvim")

  --Mason
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  })

  --Formatting
  use({ "nvimtools/none-ls.nvim" })
  use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" })

  --CMP setup and completion

  use({ "hrsh7th/nvim-cmp" })        -- The completion plugin
  use({ "hrsh7th/cmp-buffer" })      -- buffer completions
  use({ "hrsh7th/cmp-path" })        -- path completions
  use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-nvim-lua" })

  -- Toggle terminal
  use({ "akinsho/toggleterm.nvim" })

  -- Snippets
  use({ "L3MON4D3/LuaSnip" })            --snippet engine
  use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

  --Autotag
  use({
    "windwp/nvim-ts-autotag",
  })

  --Telescope
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  --Lualine
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  })

  --BufferLine
  use({ "akinsho/bufferline.nvim" })

  use({ "wnkz/monoglow.nvim" })

  --iluminate
  use({ "RRethy/vim-illuminate" })

  --Auto pairs
  use({
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })
  use({ "ojroques/nvim-bufdel" })

  use({
    "okuuva/auto-save.nvim",
    tag = "v1*",
    config = function()
      require("auto-save").setup({
        {
          enabled = true,                            -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
          trigger_events = {                         -- See :h events
            immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
            defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
            cancel_deferred_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
          },
          -- function that takes the buffer handle and determines whether to save the current buffer or not
          -- return true: if buffer is ok to be saved
          -- return false: if it's not ok to be saved
          -- if set to `nil` then no specific condition is applied
          condition = nil,
          write_all_buffers = false, -- write all buffers when the current one meets `condition`
          noautocmd = false,    -- do not execute autocmds when saving
          lockmarks = false,    -- lock marks when saving, see `:h lockmarks` for more details
          debounce_delay = 1000, -- delay after which a pending save is executed
          -- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
          debug = false,
        },
      })
    end,
  })
end)
