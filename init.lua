-- Mod: Start at Night
-- Author: Stormwindsky
-- License: CC0 1.0

local function force_night()
    -- 0.0 is exactly Midnight.
    minetest.set_timeofday(0)
    minetest.log("action", "[Start at Night] Time set to Midnight.")
end

-- Force night as soon as the environment is loaded
minetest.register_on_generated(function(minp, maxp, blockseed)
    -- This ensures that as chunks generate for the first time, it's night.
    if minetest.get_timeofday() > 0.1 then
        force_night()
    end
end)

-- Backup: Force night when the first player joins
minetest.register_on_joinplayer(function(player)
    -- Check if it's the "morning" default (0.2 to 0.25)
    local t = minetest.get_timeofday()
    if t > 0.1 and t < 0.3 then
        force_night()
    end
end)
