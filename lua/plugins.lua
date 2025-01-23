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

    }

}
