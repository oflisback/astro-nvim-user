return {
  {
    -- Maybe solves: https://github.com/ThePrimeagen/git-worktree.nvim/pull/106
    "brandoncc/git-worktree.nvim",
    branch = "catch-and-handle-telescope-related-error",
    -- "ThePrimeagen/git-worktree.nvim",
    lazy = true,
    config = function() require("telescope").load_extension "git_worktree" end,
  },
}
