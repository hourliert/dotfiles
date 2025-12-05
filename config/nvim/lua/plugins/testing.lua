return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-rspec",
    },
    opts = {
      discovery = {
        enabled = false, -- disable auto-discovery for large projects
      },
      adapters = {
        ["neotest-rspec"] = {
          rspec_cmd = function()
            return { "script/test", "-q" }
          end,
        },
      },
    },
  },
}
