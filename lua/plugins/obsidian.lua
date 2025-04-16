return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
        {
            name = "epita",
            path = "~/Documents/github/backup-obs-epita",
        },
    },
  },
}
