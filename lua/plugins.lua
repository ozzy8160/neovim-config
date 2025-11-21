return{

    {
    	"Alexis12119/nightly.nvim",
    	lazy = false,
    	priority = 1000,
    	config = function()
      		vim.cmd.colorscheme "nightly"
    	end,
    },

    {
    	"nvim-lua/plenary.nvim",
        "mbbill/undotree",
    	"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
    },

    {
	    'nvim-telescope/telescope.nvim', tag = '0.1.8',
	    dependencies = { "nvim-lua/plenary.nvim" }
    },

    {
    	"ThePrimeagen/harpoon",
    	branch = "harpoon2",
    	dependencies = { "nvim-lua/plenary.nvim" }
    },

    {
      "nvim-lualine/lualine.nvim",
      dependencies = { 'nvim-tree/nvim-web-devicons' }

    },

    {
      "folke/which-key.nvim"
    },
  
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/LuaSnip/" } })
        end,
      },
    },

    {
      "dundalek/lazy-lsp.nvim",
      dependencies = {
        "neovim/nvim-lspconfig",
        {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
      },
      config = function()
        local lsp_zero = require("lsp-zero")
        lsp_zero.on_attach(function(client, bufnr)
          -- see :help lsp-zero-keybindings to learn the available actions
          lsp_zero.default_keymaps({
            buffer = bufnr,
            preserve_mappings = false
          })
        end)
        require("lazy-lsp").setup {
          use_vim_lsp_config = true, -- Requires Neovim 0.11+
          -- By default all available servers are set up. Exclude unwanted or misbehaving servers.
          excluded_servers = {
            "ccls", "zk",
          },
          -- Alternatively specify preferred servers for a filetype (others will be ignored).
          preferred_servers = {
            markdown = {},
            python = { "pyright" },
          },
          -- Default config passed to all servers to specify on_attach callback and other options.
          default_config = {
            flags = {
              debounce_text_changes = 150,
            },
            -- on_attach = on_attach,
            -- capabilities = capabilities,
          },
          -- Override config for specific servers that will passed down to lspconfig setup.
          -- Note that the default_config will be merged with this specific configuration so you don't need to specify everything twice.
          configs = {
            lua_ls = {
              settings = {
                Lua = {
                  diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                  },
                },
              },
            },
          },
          prefer_local = true, -- Prefer locally installed servers over nix-shell (default: true)
        }
      end,
    },

}
