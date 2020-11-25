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
        [47206210] = {
            achievement=14312, criteria=50063, -- Ornate Bone Shield
            loot={
                180749, -- Hauk's Battle-Scarred Bulwark
            },
            note="On the ground near some bones",
        },
        [32702120] = {
            achievement=14311, criteria=50064, -- Kyrian Keepsake
            loot={
                180085, -- Kyrian Keepsake
            },
            note="Interact with the {npc:169664:Kyrian Corpse} at the location to obtain the treasure",
        },
        [30702870] = {
            achievement=14312, criteria=50065, -- Halis' Lunch Pail
            -- loot=Random Food,
            note="In the middle of the ring in the House of Constructs",
        },
        [59807900] = {
            achievement=14312, criteria=50066, -- Vat of Conspicuous Slime
            loot={
                181825, -- Phial of Ravenous Slime
            },
            note="Take the bottle from the nearby table and use it on the pool to obtain the treasure",
        },
        [66105040] = {
            achievement=14312, criteria=50067, -- Stolen Jar
            loot={
                182618, -- Reclaimed Vessel
            },
            note="Nothing of note",
        },
        [42302430] = {
            achievement=14312, criteria=50068, -- Necro Tome
            loot={
                182732, -- The Necronom-i-nom
            },
            note="Complete the questline starting with {quest:58619:Read Between the Lines} to eventually reach this treasure",
        },
        [22503050] = {
            achievement=14312, criteria=50069, -- Forgotten Mementos
            -- loot=Random Gear,
            note="Find the Vault Portculis at the building where the treasure is located to open the gate blocking the treasure",
        },
        [49401510] = {
            achievement=14312, criteria=50070, -- Chest of Eyes
            loot={
                183696, -- Sp-eye-glass
            },
            note="Inside the wreckage of Nurakkir in the House of Eyes",
        },
        [62405990] = {
            achievement=14312, criteria=50071, -- Misplaced Supplies
            -- loot=Random Gear,
            note="On top of a mushroom",
        },
        [72805360] = {
            achievement=14312, criteria=50072, -- Glutharn's Stash
            -- loot=Random Gear,
            note="Kill {npc:172485:Scathely} and his 2 adds to unlock the treasure",
        },
        [31707000] = {
            achievement=14312, criteria=50073, -- Runespeaker's Trove
            loot={
                183516, -- Stained Bonefused Mantle
            },
            note="Kill {npc:170563:Runespeaker Phaeton} to obtain the {item:181777:Phaeton's Key} required to unlock the treasure",
        },
        [57607580] = {
            achievement=14312, criteria=50074, -- Plaguefallen Chest
            loot={
                183515, -- Iridescent Ooze
            },
            note="Enter the tunnels at 62.4 76.5 to become {spell:330092:Plaguefallen} and unlock the treasure",
        },
        [64602470] = {
            achievement=14312, criteria=50075, -- Ritualist's Cache
            loot={
                183517, -- Page 76 of the Necronom-i-nom
            },
            note="1) Loot the {item:181558:Missing Ritual Pages} from the Bone Pile at 69.8 31.0;\n2) Use the Book of Binding Rituals at 71.7 35.4;\n3) You have 5 minutes to return to the Ritualist's Cache and unlock the treasure",
        },

        [51404840] = {
            achievement=14626,-- Harvester of Sorrow
            loot={
                180273, -- Sorrowbane
                181164, -- Oonar's Arm
            },
            note="Requires stacking several strength buffs and the world quest {quest:57205:A Few Bumps Along the Way}. Check wowhead, it's a lot",
        },
    },
    [1565] = { -- Ardenweald
        [55902100] = {
            achievement=14313, criteria=50031, -- Aerto's Body
            loot={
                180630, -- Gorm Harrier
            },
            note="A swarm of insects will attack you after looting the treasure",
        },
        [52903730] = {
            achievement=14313, criteria=50033, -- Veilwing Egg
            loot={
                180642, -- Cloudfeather Fledgling
            },
            note="On top of a branch",
        },
        [49705590] = {
            achievement=14313, criteria=50035, -- Faerie Trove
            loot={
                182673, -- Shimmerbough Hoarder
            },
            note="Inside a small alcove under the clearing",
        },
        [48203920] = {
            achievement=14313, criteria=50037, -- Hearty Dragon Plume
            loot={
                182729, -- Hearty Dragon Plume
            },
            note="Up in a tree",
        },
        [63903750] = {
            achievement=14313, criteria=50039, -- Cache of the Moon
            loot={
                180731, -- Wildseed Cradle
            },
            note="Locate 5 tools scattered around the Garden of Night (southeast of Root-Home), combine them into {item:180753:Twinklestar's Gardening Toolkit} and bring them to {npc:171360:Twinklestar} in Tirna Vaal.\nAfter this is done, talk to Twinklestar to receive the {spell:334353:Moonsight} buff",
        },
        [37603710] = {
            achievement=14313, criteria=50041, -- Dreamsong Heart
            loot={
                179510, -- Dreamsong Warglaive
            },
            note="Use a Jumping Mushroom hidden in Dreamsong Fenn to climb to the top of the tree",
        },
        [44707570] = {
            achievement=14313, criteria=50043, -- Elusive Faerie Cache
            loot={
                179512, -- Dreamsong Saber
            },
            note="Requires grabbing the {spell:333923:Faerie Lamp} buff at 46.4 70.9 to unlock the treasure",
        },
        [36106520] = {
            achievement=14313, criteria=50045, -- Darkreach Supplies
            --loot=Random Gear
            note="Use the jumping mushroom nearby to reach the treasure",
        },
        [48202030] = {
            achievement=14313, criteria=50032, -- Lost Satchel
            loot={
                182731, -- Satchel of Culexwood
            },
            note="Drop below to get to the treasure",
        },
        [76602970] = {
            achievement=14313, criteria=50034, -- Swollen Anima Seed
            loot={
                182730, -- Swollen Anima Seed
            },
            note="Nothing of note",
        },
        [67803450] = {
            achievement=14313, criteria=50036, -- Harmonic Chest
            --loot={},
            note="Requires 2 players to play the nearby harp and drums at the same time to unlock the treasure",
        },
        [41903250] = {
            achievement=14313, criteria=50040, -- Dessicated Moth
            loot={
                180640, -- Amber Glitterwing
            },
            note="Loot the {item:180784:Aromatic Flowers} at 36.4 59.5, then use the jumping mushroom near the treasure location to jump on to a tree. Use the flowers on the brazier within the tree to attract the treasure",
        },
        [36402500] = {
            achievement=14313, criteria=50042, -- Enchanted Dreamcatcher
            loot={
                183129, -- Anima-Laden Dreamcatcher
            },
            note="Carefully climb the roots in the area to reach the treasure",
        },
        [36006650] = {
            achievement=14313, criteria=50044, -- Cache of the Night
            loot={
                180637, -- Starry Dreamfoal
            },
            note="Loot {item:180654:Fae Ornament}, {item:180656:Enchanted Bough} and {item:180655:Raw Dream Fibers} scattered around Ardenweald to create the {item:180652:Fae Dreamcatcher}, which will dispell the barrier blocking the treasure</a>",
        },
    },
    [1525] = { -- Revendreth
        [37706920] = {
            achievement=14314, criteria=50076, -- Lost Quill
            loot={
                182613, -- Refilling Inkwell
            },
            note="Grab a {item:182475:Forbidden Ink} from the library below the treasure to unlock it",
        },
        [38404430] = {
            achievement=14314, criteria=50077, -- Stylish Parasol
            loot={
                182694, -- Stylish Black Parasol
            },
            note="On top of the castle walls, can be hard to reach",
        },
        [57304330] = {
            achievement=14314, criteria=50078, -- The Count
            loot={
                182612, -- The Count's Pendant
            },
            note="Requires 99 {currency:1820:Infused Ruby} to loot the treasure",
        },
        [79903700] = {
            achievement=14314, criteria=50079, -- Rapier of the Fearless
            loot={
                182689, -- Rapier of the Fearless
            },
            note="On the ground. An enemy will spawn when interacting with the treasure. Kill the mob for the sword",
        },
        [70106000] = {
            achievement=14314, criteria=50080, -- Vrytha's Dredglaive
            loot={
                177807, -- Vyrtha's Dredglaive
            },
            note="Under a bridge",
        },
        [29703720] = {
            achievement=14314, criteria=50081, -- Makeshift Muckpool
            loot={
                182780 -- Muckpool Cookpot
            },
            note="Inside the castle ruins. Requires 30 {currency:1820:Infused Ruby} to loot the treasure",
        },
        [63007210] = {
            achievement=14314, criteria=50082, -- Taskmaster's Trove
            loot={
                183986, -- Bondable Sinstone
            },
            note="Use the Ingress and Egress Rites scroll at the area, then dodge orbs to reach the treasure",
        },
        [47505530] = {
            achievement=14314, criteria=50084, -- Forbidden Chamber
            loot={
                184075, -- Stonewrought Sentry
            },
            note="Take the {spell:314749:Anima Canister} inside the building and drain anima from the {npc:173838:Silent Observer}s to reach the treasure",
        },
        [31055510] = {
            achievement=14314, criteria=50895, -- Smuggled Cache
            loot={
                182738, -- Bundle of Smuggled Parasol Components
            },
            note="Rewards 35+6 {currency:1820:Infused Ruby}",
        },
        [69357799] = {
            achievement=14314, criteria=50896, -- Chest of Envious Dreams
            loot={
                179393, -- Mirror of Envious Dreams
            },
        },
        [64197265] = {
            achievement=14314, criteria=50897, -- Filcher's Prize
            loot={
                179392, -- Orb of Burgeoning Ambition
            },
            note="Jump down from the North",
        },
        [68456446] = {
            achievement=14314, criteria=50898, -- Wayfarer's Abandoned Spoils
            loot={
                181547, -- Noble's Draught
                172230, -- soul dust
                173058, -- umbral ink
            },
            currency=1820,
            note="Jump on the mushroom at 67.9, 64.5",
        },
        [61565865] = {
            achievement=14314, criteria=50899, -- Remlate's Hidden Cache
            -- loot={},
            note="Outer wall, jump from near the flight master",
        },
        [46395817] = {
            achievement=14314, criteria=50900, -- Fleeing Soul's Bundle
            -- loot={},
            note="Outer wall",
        },
        [74975698] = {
            achievement=14314, criteria=50901, -- Gilded Plum Chest
            loot={
                179390, -- Tantalizingly Large Golden Plum
            },
            note="Kill the {npc:166680:Greedy Soul}",
        },
        [51815963] = {
            achievement=14314, criteria=50902, -- Abandoned Curios
            loot={
                182744, -- Ornate Belt Buckle
            },
        },

        [53104290] = {
            loot={
                182614, -- Blanchy's Reins
            },
            note="Nurse {npc:173468:Dead Blanchy} over the course of several days. You need items from all over the world",
        },
    },
    [1543] = { -- The Maw
    },
}

local vulpin = {
    achievement=14313, criteria=50038, -- Playful Vulpin Befriended
    loot={
        180645, -- Dodger
    },
    note="Find {npc:171206:Playful Vulpin} and play with them 5 times to obtain the treasure. Use emotes related to what they're doing",
    atlas="Warfront-NeutralHero-Silver", scale=1.3,
}
ns.points[1565][31854363] = vulpin
ns.points[1565][31764100] = vulpin
ns.points[1565][32604292] = vulpin
ns.points[1565][34104500] = vulpin
ns.points[1565][50215353] = vulpin
ns.points[1565][41312874] = vulpin
ns.points[1565][40945156] = vulpin
ns.points[1565][41374979] = vulpin
ns.points[1565][51165507] = vulpin
ns.points[1565][67162888] = vulpin
ns.points[1565][70143004] = vulpin
ns.points[1565][65222265] = vulpin
ns.points[1565][67553191] = vulpin
ns.points[1565][72393146] = vulpin
