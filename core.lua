local myname, ns = ...

ns.merge = function(t1, t2)
    if not t2 then return t1 end
    for k, v in pairs(t2) do
        t1[k] = v
    end
end

ns.nodeMaker = function(metatable)
    return function(details)
        return setmetatable(details or {}, {__index = metatable})
    end
end

ns.path = ns.nodeMaker{
    label = "Path to treasure",
    atlas = "poi-door", -- 'PortalPurple' / 'PortalRed'?
    path = true,
    minimap = true,
    scale = 1.1,
}

ns.map_spellids = {
    -- [1533] = 0, -- Bastion
    -- [1536] = 0, -- Maldraxxus
    -- [1565] = 0, -- Ardenweald
    -- [1525] = 0, -- Revendreth
    -- [1543] = 0, -- The Maw
}

ns.points = {
    --[[ structure:
    [uiMapID] = { -- "_terrain1" etc will be stripped from attempts to fetch this
        [coord] = {
            label=[string], -- label: text that'll be the label, optional
            loot={[id]}, -- itemids
            quest=[id], -- will be checked, for whether character already has it
            currency=[id], -- currencyid
            achievement=[id], -- will be shown in the tooltip
            criteria=[id], -- modifies achievement
            junk=[bool], -- doesn't count for any achievement
            npc=[id], -- related npc id, used to display names in tooltip
            note=[string], -- some text which might be helpful
            hide_before=[id], -- hide if quest not completed
            requires_buff=[id], -- hide if player does not have buff, mostly useful for buff-based zone phasing
            requires_no_buff=[id] -- hide if player has buff, mostly useful for buff-based zone phasing
        },
    },
    --]]
}
function ns.RegisterPoints(zone, points)
    if not ns.points[zone] then
        ns.points[zone] = {}
    end
    ns.merge(ns.points[zone], points)
end
