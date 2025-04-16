return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = 'markdown',
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
    ui = {
        enable = false,
    },
  },
}
