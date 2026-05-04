return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "vimdoc",
        "javascript",
        "typescript",
        "c",
        "lua",
        "rust",
        "jsdoc",
        "bash",
        "vim",
        "query",
        "markdown",
        "markdown_inline",
      },

      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      -- needs tree-sitter CLI installed locally
      auto_install = true,

      indent = {
        enable = true,
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function(args)
        vim.treesitter.start(args.buf)
      end,
    })
  end,
}
