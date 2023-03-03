-- bufferline
--
-- A line displaying your open buffer.
-- Interesting if you want a more VSCode type experience where you're clicking around between your open files.
return {
  'akinsho/bufferline.nvim',
  version = "v3.*",
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      show_buffer_close_icons = false,
    }
  },
}
