return {
  "gruvw/strudel.nvim",
  build = "npm install",
  config = function()
    require("strudel").setup()
  end,
  keys = {
    { "<leader>tl", "<cmd>StrudelLaunch<cr>", desc = "Launch Strudel.cc" },
    { "<leader>tq", "<cmd>StrudelQuit<cr>", desc = "Quit Strudel.cc" },
    { "<leader>tu", "<cmd>StrudelUpdate<cr>", desc = "Triggers code evaluation" },
    { "<leader>tt", "<cmd>StrudelToggle<cr>", desc = "Start/Stop code evaluation" },
  },
}
