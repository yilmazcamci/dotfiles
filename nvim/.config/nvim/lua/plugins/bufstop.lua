-- Bufstop
--
-- Jump rapidly between most your most recently used buffers. The plugin offers several modes to jump between buffers more quickly.
return {
  "mihaifm/bufstop",
  config = function()
    -- Enable <leader><num> bindings where <num> is one of the number keys.
    vim.api.nvim_command("BufstopSpeedToggle")
  end,
}
