local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- Add GitHub theme plugin
    {
      "projekt0n/github-nvim-theme",
      config = function()
        -- Use the even darker GitHub theme
        vim.cmd("colorscheme github_dark_default")
      end
    },
    -- Import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    lazy = false,
    -- It's recommended to leave version=false for now, since many plugins supporting versioning have outdated releases.
    version = false,                                     -- always use the latest git commit
  },
  install = { colorscheme = { "github_dark_default" } }, -- Install the darker GitHub theme
  checker = {
    enabled = true,                                      -- Automatically check for plugin updates
    notify = false,                                      -- Do not notify on update
  },
  performance = {
    rtp = {
      -- Disable some unnecessary rtp plugins
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
