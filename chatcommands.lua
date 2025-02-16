--https://github.com/Rotfuchs-von-Vulpes/what_is_this_uwu-minetest/blob/master/help.lua
local gs_timer = 0
local gs_interval = 1
--[[
minetest.register_globalstep(function(dtime)
    gs_timer = gs_timer + dtime
    if gs_timer >= gs_interval then
        gs_timer = gs_timer - gs_interval
    end
    
    if holoschem.nodes then
        for k, v in ipairs(holoschem.nodes) do
            
        end
    end
        
    minetest.add_particle({
        pos = {x=0, y=0, z=0},
        velocity = {x=0, y=0, z=0},
        acceleration = {x=0, y=0, z=0},
        -- Spawn particle at pos with velocity and acceleration

        expirationtime = 1,
        -- Disappears after expirationtime seconds

        size = 1,
        -- Scales the visual size of the particle texture.
        -- If `node` is set, size can be set to 0 to spawn a randomly-sized
        -- particle (just like actual node dig particles).

        collisiondetection = false,
        -- If true collides with `walkable` nodes and, depending on the
        -- `object_collision` field, objects too.

        collision_removal = false,
        -- If true particle is removed when it collides.
        -- Requires collisiondetection = true to have any effect.

        object_collision = false,
        -- If true particle collides with objects that are defined as
        -- `physical = true,` and `collide_with_objects = true,`.
        -- Requires collisiondetection = true to have any effect.

        vertical = false,
        -- If true faces player using y axis only

        texture = "image.png",
        -- The texture of the particle
        -- v5.6.0 and later: also supports the table format described in the
        -- following section, but due to a bug this did not take effect
        -- (beyond the texture name).
        -- v5.9.0 and later: fixes the bug.
        -- Note: "texture.animation" is ignored here. Use "animation" below instead.

        playername = "singleplayer",
        -- Optional, if specified spawns particle only on the player's client

        animation = {"Tile Animation definition"},
        -- Optional, specifies how to animate the particle texture

        glow = 0,
        -- Optional, specify particle self-luminescence in darkness.
        -- Values 0-14.
        
        node = {name = "ignore", param2 = 0},
        -- Optional, if specified the particle will have the same appearance as
        -- node dig particles for the given node.
        -- `texture` and `animation` will be ignored if this is set.

        node_tile = 0,
        -- Optional, only valid in combination with `node`
        -- If set to a valid number 1-6, specifies the tile from which the
        -- particle texture is picked.
        -- Otherwise, the default behavior is used. (currently: any random tile)

        drag = {x=0, y=0, z=0},
        -- v5.6.0 and later: Optional drag value, consult the following section
        -- Note: Only a vector is supported here. Alternative forms like a single
        -- number are not supported.

        --jitter = {min = "...", max = "...", bias = 0},
        -- v5.6.0 and later: Optional jitter range, consult the following section

        --bounce = {min = "...", max = "...", bias = 0},
        -- v5.6.0 and later: Optional bounce range, consult the following section
    })

end)--]]
local subcmds = {
    toggle = {
        aliases = { "t" },
        func = function(params)
            holoschem.visible = not holoschem.visible
        end,
    },
    load = {
        aliases = { "l", "open" },
        func = function(params)
            if params and params[1] then
                --[[local schematic = minetest.read_schematic(tostring(params[1]) .. ".lua", {})
                if schematic then
                    holoschem.schematic = schematic
                    holoschem.schematicname = schematic
                end--]]
            end
        end
    },
}

minetest.register_chatcommand(".hs", {
    params = "",
    description = "toggle holoschem or run subcommands",
    func = function(param)
        local params = string.split(param, " +", false, -2, true)
        local p1 = params[1]
        if p1 and subcmds[p1] then
            local subcmd = subcmds[p1]
            
        end
    end
})


--[[
local p = minetest.get_player_by_name("singleplayer") for i = 1, 27 do minetest.add_item(p:get_pos(), "mcl_core:diamondblock 64") end
local p = minetest.get_player_by_name("singleplayer") for i = 1, 27 do minetest.add_item(p:get_pos(), p:get_wielded_item()) end
.lua local p = minetest.localplayer; local plookpos = vector.offset(p:get_pos(), 0, 1.625, 0); local look_horiz = p:get_last_look_horizontal() local look_vert = p:get_last_look_vertical() local last_look_dir = vector.new(math.cos(look_horiz), math.sin(look_vert), math.sin(look_horiz)) minetest.display_chat_message("last_look_dir: " .. tostring(last_look_dir)) local ray = minetest.raycast(plookpos, vector.add(plookpos, vector.multiply(last_look_dir, 16)), false, false)  local pointed_thing = ray:next() if pointed_thing then    minetest.display_chat_message("pt found") if pointed_thing.type == "node" then        local pos = pointed_thing.under local node = minetest.get_node_or_nil(pos)        if node then            local meta = core.get_meta(pos) minetest.display_chat_message(node.name)            minetest.display_chat_message(dump(meta:to_table()))        end    end end
.lua local p = minetest.localplayer; local plookpos = vector.offset(p:get_pos(), 0, 1.625, 0); local look_horiz = p:get_last_look_horizontal() local look_vert = p:get_last_look_vertical() local last_look_dir = vector.new(math.cos(look_horiz), math.sin(look_vert), math.sin(look_horiz)) minetest.display_chat_message("last_look_dir: " .. tostring(last_look_dir)) local ray = minetest.raycast(plookpos, vector.add(plookpos, vector.multiply(last_look_dir, 16)), false, false)  local pointed_thing = ray:next() if pointed_thing then    minetest.display_chat_message("pt found") if pointed_thing.type == "node" then        local pos = pointed_thing.under local node = minetest.get_node_or_nil(pos)        if node then            local meta = core.get_meta(pos) minetest.display_chat_message(node.name)            minetest.display_chat_message(dump(meta:get_string("inventory")))        end    end end
]]


