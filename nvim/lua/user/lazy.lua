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


local plugins = {
    -- color schemes
    "folke/tokyonight.nvim",
    "martinsione/darkplus.nvim",

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate' },
    { 'ThePrimeagen/harpoon' },
    'williamboman/mason.nvim',
    'nvim-lualine/lualine.nvim',

    'numToStr/Comment.nvim',
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    -- LSP
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim' -- Optional
        }
    },                                -- Required
    -- Autocompletion
    'hrsh7th/nvim-cmp',               -- Required
    'hrsh7th/cmp-nvim-lsp',           -- Required
    'hrsh7th/cmp-buffer',             -- Optional
    'hrsh7th/cmp-path',               -- Optional
    'saadparwaiz1/cmp_luasnip',       -- Optional
    'hrsh7th/cmp-nvim-lua',           -- Optional

    -- Snippets
    'L3MON4D3/LuaSnip',             -- Required
    'rafamadriz/friendly-snippets', -- Optional
    -- clients
    'towolf/vim-helm',

    -- AI
    --  {'codota/tabnine-nvim', build = "./dl_binaries.sh"},
    -- { 'Exafunction/codeium.vim' },

    -- DAP
    -- Debuging
    { 'mfussenegger/nvim-dap',            dependencies = { "nvim-neotest/nvim-nio" } },
    { 'rcarriga/nvim-dap-ui',             dependencies = { "mfussenegger/nvim-dap" } },
    { 'theHamsta/nvim-dap-virtual-text' },
    { 'nvim-telescope/telescope-dap.nvim' },
    { 'mfussenegger/nvim-dap-python' },
    { 'leoluz/nvim-dap-go' },
    {
        'nvim-orgmode/orgmode',
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter', lazy = true },
        },
        event = 'VeryLazy',
        config = function()
            -- Load treesitter grammar for org
            --require('orgmode').setup_ts_grammar()

            -- Setup treesitter
            require('nvim-treesitter.configs').setup({
            --    highlight = {
            --        enable = true,
            --        additional_vim_regex_highlighting = { 'org' },
            --    },
            --  ensure_installed = 'all',
            --    ignore_install = { 'org' },
            })

            -- Setup orgmode
            require('orgmode').setup({
                org_agenda_files = '~/org/agendas/**/*',
                org_default_notes_file = '~/org/refile.org',
            })
        end,
    },
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    },
    {
        "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "/Users/bart/Library/Mobile Documents/com~apple~CloudDocs/Documents/vaults/personal",
      },
      {
        name = "work",
        path = "/Users/bart/Library/Mobile Documents/com~apple~CloudDocs/Documents/vaults/work",
      },
    },

    -- see below for full list of options 👇
  },
   -- Optional, if you keep notes in a specific subdirectory of your vault.
  notes_subdir = "notes",

  -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
  -- levels defined by "vim.log.levels.*".
  log_level = vim.log.levels.INFO,

  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "notes/dailies",
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%Y-%m-%d",
    -- Optional, if you want to change the date format of the default alias of daily notes.
    alias_format = "%B %-d, %Y",
    -- Optional, default tags to add to each new daily note created.
    default_tags = { "daily-notes" },
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = nil
  },
}
}

require("lazy").setup(plugins, opts)
