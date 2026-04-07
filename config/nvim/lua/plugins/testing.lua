return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-rspec",
      "marilari88/neotest-vitest",
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
        ["neotest-vitest"] = {
          filter_dir = function(name)
            return name ~= "node_modules"
          end,
        },
      },
    },
  },
}
