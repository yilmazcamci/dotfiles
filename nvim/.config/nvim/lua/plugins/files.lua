-- files.lua
--
-- Everything to do with handling files and directories.

-- require("nvim-tree").setup({
-- 	view = {
-- 		mappings = {
-- 			list = {
-- 				{ key = "<cr>", action = "edit_in_place" },
-- 			},
-- 		},
-- 	},
-- 	actions = {
-- 		change_dir = {
-- 			enable = false
-- 		}
-- 	}
-- })

return {
  'nvim-tree/nvim-tree.lua',
  opts = {
    view = {
      mappings = {
        list = {
          { key = "<cr>", action = "edit_in_place" },
        },
      },
    },
    actions = {
      change_dir = {
        enable = false
      }
    }
  }
}
