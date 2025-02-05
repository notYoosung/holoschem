local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)



local files = {
    "main",
    "render",
    "checkplace",
    "chatcommands",
}


for _, filename in ipairs(files) do
    dofile(modpath .. "/" .. filename .. ".lua")
end
