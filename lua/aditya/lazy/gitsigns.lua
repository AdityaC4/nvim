return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "▁" },
        topdelete    = { text = "▔" },
        changedelete = { text = "≈" },
        untracked    = { text = "?" },
      },
      signs_staged = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "▁" },
        topdelete    = { text = "▔" },
        changedelete = { text = "≈" },
      },

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- jump hunks
        map("n", "]h", function()
          gs.nav_hunk("next")
        end, "Next hunk")

        map("n", "[h", function()
          gs.nav_hunk("prev")
        end, "Prev hunk")

        -- preview current change
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

        -- inline deleted lines
        map("n", "<leader>hd", gs.toggle_deleted, "Toggle deleted")

        -- stage/reset
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
      end,
    })
  end,
}
