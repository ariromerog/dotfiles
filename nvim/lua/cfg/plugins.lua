local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })


end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 
    "catppuccin/nvim", 
    lazy = false,
    name = "catppuccin", 
    priority = 1000, 
    config = function ()
      vim.cmd([[colorscheme catppuccin]])
    end
  },
  {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", 
        "MunifTanjim/nui.nvim",
      }
  },
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp"
  }
})
