return {
  "ThePrimeagen/harpoon",
  config = function()
    mark = require("harpoon.mark")
    ui = require("harpoon.ui")
  end,
  keys = {
    { "<leader>a", function() mark.add_file() end,        desc = "Add file to Harpoon" },
    { "<C-e>",     function() ui.toggle_quick_menu() end, desc = "Open Harpoon quick menu" },
    { "<leader>1", function() ui.nav_file(1) end,         desc = "Navigate to file Harpoon1" },
    { "<leader>2", function() ui.nav_file(2) end,         desc = "Navigate to file Harpoon2" },
    { "<leader>3", function() ui.nav_file(3) end,         desc = "Navigate to file Harpoon3" },
    { "<leader>4", function() ui.nav_file(4) end,         desc = "Navigate to file Harpoon4" },
    { "<leader>5", function() ui.nav_file(5) end,         desc = "Navigate to file Harpoon5" },
    { "<leader>6", function() ui.nav_file(6) end,         desc = "Navigate to file Harpoon6" },
    { "<leader>7", function() ui.nav_file(7) end,         desc = "Navigate to file Harpoon7" },
    { "<leader>8", function() ui.nav_file(8) end,         desc = "Navigate to file Harpoon8" },
    { "<leader>9", function() ui.nav_file(9) end,         desc = "Navigate to file Harpoon9" },
  }
}
