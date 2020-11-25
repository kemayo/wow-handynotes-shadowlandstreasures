local myname, ns = ...

local merge = function(t1, t2)
    if not t2 then return t1 end
    for k, v in pairs(t2) do
        t1[k] = v
    end
end
ns.merge = merge

local CHEST = 'Treasure Chest'
local CHEST_SM = 'Small Treasure Chest'

local path_meta = {__index = {
    label = "Path to treasure",
    atlas = "map-icon-SuramarDoor.tga", -- 'PortalPurple'
    path = true,
    scale = 1.1,
}}
local path = function(details)
    return setmetatable(details or {}, path_meta)
end
ns.path = path

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
    [1533] = { -- Bastion
        [53508030] = {
            achievement=14311, criteria=50047, -- Scroll of Aeons
            loot={
                173984, -- Scroll of Aeons
            },
            note="Loot 2x {item:173973:Purian} around Aspirant's Crucible and put them in tribute bowls",
        },
        [58507150] = {
            achievement=14311, criteria=50048, -- Vesper of Virtues
            loot={
                179982, -- Kyrian Bell
            },
            note="Located inside a building in the Temple of Purity",
        },
        [52008600] = {
            achievement=14311, criteria=50049, -- Purifying Draught
            loot={
                174007, -- Purifying Draught
            },
            note="Near an angel's statue",
        },
        [59306080] = {
            achievement=14311, criteria=50050, -- Lost Disciple's Notes
            loot={
                182693, -- Lost Disciple's Notes
            },
            note="Jump from the cliff on top to reach the treasure",
        },
        [55506080] = {
            achievement=14311, criteria=50051, -- Larion Tamer's Harness
            loot={
                -- 182652, -- Larion Tamer's Harness
                182653, -- Larion Treats
            },
            note="Located at the end of the cavern",
        },
        [40404980] = {
            achievement=14311, criteria=50052, -- Stolen Equipment
            -- loot=Random Green/Blue,
            note="Random BOE uncommon / rare item",
        },
        [44604650] = {
            achievement=14311, criteria=50053, -- Abandoned Stockpile
            -- loot=Random Greens/Materials,
            note="Entrance is hidden behind some bushes",
        },
        [51401790] = {
            achievement=14311, criteria=50054, -- Experimental Construct Part
            loot={
                183609, -- Re-Powered Golliath Fists
            },
            note="Requires {item:180534:Unstable Construct Anima} to interact; drops from nearby mobs",
        },
        [35804810] = {
            achievement=14311, criteria=50055, -- Windsmith's Tools
            loot={
                180064, -- Ascended Flute
            },
            note="Requires {item:180536:Broken Kyrian Flute} to unlock the treasure, dropped from {npc:159610:Agitated Etherwyrm} nearby",
        },
        [56501720] = {
            achievement=14311, criteria=50056, -- Memorial Offering
            -- loot={},
            note="Purchase {item:180788:Memorial Wine} from {npc:171526:Kobri} and use it on the drink tray near the treasure to obtain the {item:180797:Memorial Offering Key} and unlock the treasure",
        },
        [35105800] = {
            achievement=14311, criteria=50058, -- Gift of Agthia
            loot={
                180063, -- Unearthly Chime
            },
            note="Obtain the {spell:333063:Proof of Courage} by interacting with {spell:333365:Agthia's Flame} at 39.1 54.4 and completing her test to unlock the treasure",
        },
        [65207030] = {
            achievement=14311, criteria=50059, -- Gift of Vesiphone
            loot={
                180859, -- Purity
            },
            note="Obtain {spell:332785:Proof of Purity} by ringing the bell near the chest and standing under the nearby waterfall to unlock the treasure",
        },
        [70503650] = {
            achievement=14311, criteria=50060, -- Gift of Chyrus
            -- loot={},
            note="Obtain the {spell:333045:Proof of Humility} by using /kneel in front of the treasure to unlock it",
        },
        [40201820] = {
            achievement=14311, criteria=50061, -- Gift of Thenios
            -- loot={},
            note="Obtain the {spell:333068:Proof of Wisdom} by using the teleporter near the chest and lighting the incenses in the correct order:\n* Incense of Patience\n* Incense of Knowledge\n* Click Incense of Insight\n* Anima Orb\n* Incense of Judgement",
        },
        [27602170] = {
            achievement=14311, criteria=50062, -- Gift of Devos
            loot={
                179977, -- Benevolent Gong
            },
            note="Obtain the {spell:333070:Proof of Loyalty} by taking the {spell:333912:Flame of Devotion} at 23.9 24.8 and bringing it to the nearby brazier",
        },
    },
    [1536] = { -- Maldraxxus
    },
    [1565] = { -- Ardenweald
    },
    [1525] = { -- Revendreth
    },
    [1543] = { -- The Maw
    },
}
