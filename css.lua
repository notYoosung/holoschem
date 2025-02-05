local function inventorycube(img1, img2, img3)
    if not img1 then return '' end

    img2 = img2 or img1
    img3 = img3 or img1

    img1 = img1 .. '^[resize:16x16'
    img2 = img2 .. '^[resize:16x16'
    img3 = img3 .. '^[resize:16x16'

    return "[inventorycube" ..
        "{" .. img1:gsub("%^", "&") ..
        "{" .. img2:gsub("%^", "&") ..
        "{" .. img3:gsub("%^", "&")
end

local function get_node_tiles(node_name)
    local node_definition = core.get_node_def(node_name) or core.get_item_def(node_name)

    if not node_definition then
        return 'ignore', 'node', false
    end

    if node_definition.groups['not_in_creative_inventory'] then
        drop = node_definition.drop
        if drop and type(drop) == 'string' then
            node_name = drop
            node_definition = minetest.registered_nodes[drop]
            if not node_definition then
                node_definition = minetest.registered_craftitems[drop]
            end
        end
    end

    if not node_definition or (not node_definition.tiles and not node_definition.inventory_image) then
        return 'ignore', 'node', false
    end

    local tiles = node_definition.tiles

    --[[local mod_name, item_name = what_is_this_uwu.split_item_name(node_name)]]

    if node_definition.inventory_image:sub(1, 14) == '[inventorycube' then
        return node_definition.inventory_image .. '^[resize:146x146', 'node', node_definition
    elseif node_definition.inventory_image ~= '' then
        return node_definition.inventory_image .. '^[resize:16x16', 'craft_item', node_definition
    elseif tiles then
        if not tiles[1] then
            return '', 'node', node_definition
        end

        tiles[3] = tiles[3] or tiles[1]
        tiles[6] = tiles[6] or tiles[3]

        if type(tiles[1]) == 'table' then
            tiles[1] = tiles[1].name
        end
        if type(tiles[3]) == 'table' then
            tiles[3] = tiles[3].name
        end
        if type(tiles[6]) == 'table' then
            tiles[6] = tiles[6].name
        end

        return inventorycube(tiles[1], tiles[6], tiles[3]), 'node', node_definition
    end
end

minetest.add_particle({
    pos = { x = 17930, y = 17, z = -1417 },
    velocity = { x = 0, y = 0, z = 0 },
    acceleration = { x = 0, y = 0, z = 0 },
    expirationtime = 5,
    size = 3,
    collisiondetection = false,
    collision_removal = false,
    object_collision = false,
    vertical = false,
    texture = get_node_tiles("mcl_core:dirt_with_grass"),
    glow = 14,
})


return "done"