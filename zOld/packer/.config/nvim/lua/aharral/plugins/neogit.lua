-- import lualine plugin safely
local status, neogit = pcall(require, "neogit")
if not status then
  return
end


-- configure lualine with modified theme
neogit.setup{}
