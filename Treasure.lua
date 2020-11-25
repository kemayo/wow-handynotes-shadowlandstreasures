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
            quest=58298,
            loot={
                173984, -- Scroll of Aeons
            },
            note="Loot 2x {item:173973:Purian} around Aspirant's Crucible and put them in tribute bowls",
        },
        [58507150] = {
            achievement=14311, criteria=50048, -- Vesper of Virtues
            quest=60478,
            loot={
                179982, -- Kyrian Bell
            },
            note="Located inside a building in the Temple of Purity",
        },
        [52008600] = {
            achievement=14311, criteria=50049, -- Purifying Draught
            quest=58329,
            loot={
                174007, -- Purifying Draught
            },
            note="Near an angel's statue",
        },
        [59306080] = {
            achievement=14311, criteria=50050, -- Lost Disciple's Notes
            quest=61048,
            loot={
                182693, -- Lost Disciple's Notes
            },
            note="Jump from the cliff on top to reach the treasure",
        },
        [55506080] = {
            achievement=14311, criteria=50051, -- Larion Tamer's Harness
            quest=61049,
            loot={
                182652, -- Larion Tamer's Harness
                182653, -- Larion Treats
            },
            note="Located at the end of the cavern",
        },
        [55704290] = path{quest=61049},
        [40404980] = {
            achievement=14311, criteria=50052, -- Stolen Equipment
            quest=61044,
            loot={
                182561, -- Fallen Disciple's Cloak
            },
            note="Random BOE uncommon / rare item",
        },
        [44604650] = {
            achievement=14311, criteria=50053, -- Abandoned Stockpile
            quest=61006,
            -- loot=Random Greens/Materials,
            note="Entrance is hidden behind some bushes",
        },
        [51401790] = {
            achievement=14311, criteria=50054, -- Experimental Construct Part
            quest=61052,
            loot={
                183609, -- Re-Powered Golliath Fists
            },
            note="Requires {item:180534:Unstable Construct Anima} to interact; drops from nearby mobs",
        },
        [35804810] = {
            achievement=14311, criteria=50055, -- Windsmith's Tools
            quest=61053,
            loot={
                180064, -- Ascended Flute
            },
            note="Requires {item:180536:Broken Kyrian Flute} to unlock the treasure, dropped from {npc:159610:Agitated Etherwyrm} nearby",
        },
        [56501720] = {
            achievement=14311, criteria=50056, -- Memorial Offering
            quest=61150,
            -- loot={},
            note="Purchase {item:180788:Memorial Wine} from {npc:171526:Kobri} and use it on the drink tray near the treasure to obtain the {item:180797:Memorial Offering Key} and unlock the treasure",
        },
        [34006650] = {quest=61150, label="Kobri", atlas="food", scale=1.1, path=true, note="Buy {item:180788:Memorial Wine}, go to 56.5 17.2"}, -- Kobri (Cliffs of Respite)
        [43603225] = {quest=61150, label="Kobri", atlas="food", scale=1.1, path=true, note="Buy {item:180788:Memorial Wine}, go to 56.5 17.2"}, -- Kobri (Sagehaven)
        [47957400] = {quest=61150, label="Kobri", atlas="food", scale=1.1, path=true, note="Buy {item:180788:Memorial Wine}, go to 56.5 17.2"}, -- Kobri (Aspirant's Rest)
        [51804640] = {quest=61150, label="Kobri", atlas="food", scale=1.1, path=true, note="Buy {item:180788:Memorial Wine}, go to 56.5 17.2"}, -- Kobri (Hero's Rest)
        [52154710] = {quest=61150, label="Kobri", atlas="food", scale=1.1, path=true, note="Buy {item:180788:Memorial Wine}, go to 56.5 17.2"}, -- Kobri (Hero's Rest)
        [53508035] = {quest=61150, label="Kobri", atlas="food", scale=1.1, path=true, note="Buy {item:180788:Memorial Wine}, go to 56.5 17.2"}, -- Kobri (Aspirant's Crucible)
        [35105800] = {
            achievement=14311, criteria=50058, -- Gift of Agthia
            quest=60893,
            loot={
                180063, -- Unearthly Chime
            },
            note="Obtain the {spell:333063:Proof of Courage} by interacting with {spell:333365:Agthia's Flame} at 39.1 54.4 and completing her test to unlock the treasure",
        },
        [65207030] = {
            achievement=14311, criteria=50059, -- Gift of Vesiphone
            quest=60890,
            loot={
                180859, -- Purity
            },
            note="Obtain {spell:332785:Proof of Purity} by ringing the bell near the chest and standing under the nearby waterfall to unlock the treasure",
        },
        [70503650] = {
            achievement=14311, criteria=50060, -- Gift of Chyrus
            quest=60892,
            loot={
                183988, -- Bondable Val'kyr Diadem
            },
            note="Obtain the {spell:333045:Proof of Humility} by using /kneel in front of the treasure to unlock it",
        },
        [40201820] = {
            achievement=14311, criteria=50061, -- Gift of Thenios
            quest=60894,
            loot={
                181290, -- Harmonious Sigil of the Archon
            },
            note="Obtain the {spell:333068:Proof of Wisdom} by using the teleporter near the chest and lighting the incenses in the correct order:\n* Incense of Patience\n* Incense of Knowledge\n* Click Incense of Insight\n* Anima Orb\n* Incense of Judgement",
        },
        [27602170] = {
            achievement=14311, criteria=50062, -- Gift of Devos
            quest=60895,
            loot={
                179977, -- Benevolent Gong
            },
            note="Obtain the {spell:333070:Proof of Loyalty} by taking the {spell:333912:Flame of Devotion} at 23.9 24.8 and bringing it to the nearby brazier",
        },
        -- Shard Labor
        [57931852] = path{quest=61698},
        [36012652] = {
            quest=61183,
            label="Vesper of Silver Wind",
            loot={
                180772, -- Silverwind Larion
            },
            note="Forge the {item:180858:Crystal Mallet of Heralds} and then ring the vesper",
        },
        [59343144] = {
            quest=61229,
            loot={
                180858, -- Crystal Mallet of Heralds
            },
            note="Collect 50 Anima Shards and give them to {npc:171732:Forgelite Hephaesius}",
        },
        [39057704] = {quest=61225,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [43637622] = {quest=61235,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [48427273] = {quest=61236,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [52677555] = {quest=61237,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [53317362] = {quest=61238,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [53498060] = {quest=61239,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [55968666] = {quest=61241,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [61048566] = {quest=61244,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [58108008] = {quest=61245,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [56877498] = {quest=61247,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [65527192] = {quest=61249,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [58156391] = {quest=61250,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [54005970] = {quest=61251,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [46706595] = {quest=61253,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [50685614] = {quest=61254,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [34846578] = {quest=61257,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [51674802] = {quest=61258,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [47084923] = {quest=61260,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [41394663] = {quest=61261,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [40045912] = {quest=61263,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [38525326] = {quest=61264,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [57645567] = {quest=61270,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [65254288] = {quest=61271,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [72384029] = {quest=61273,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [66892692] = {quest=61274,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [57553827] = {quest=61275,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [52163939] = {quest=61277,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [49993826] = {quest=61278,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [48483491] = {quest=61279,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [56722884] = {quest=61280,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [56201731] = {quest=61281,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [59881391] = {quest=61282,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [52440942] = {quest=61283,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [46691804] = {quest=61284,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [44942845] = {quest=61285,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [42302402] = {quest=61286,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [37102468] = {quest=61287,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [42813321] = {quest=61288,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [42713940] = {quest=61289,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [33033762] = {quest=61290,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [31002747] = {quest=61291,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [30612373] = {quest=61292,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [24642298] = {quest=61293,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [26152262] = {quest=61294,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [24371821] = {quest=61295,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        -- non-achievement
        [61041511] = {
            quest=61698,
            label="Cloudwalker's Coffer",
            note="Bounce on the clouds",
        },
    },
    [1666] = { -- Necrotic Wake
        [52508860] = {quest=61296,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [36202280] = {quest=61297,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
    },
    [1693] = { -- Spires of Ascension (Gardens of Repose)
        [46605310] = {quest=61298,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
        [69403870] = {quest=61299,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
    },
    [1694] = { -- Spires of Ascension (Font of Fealty)
        [49804690] = {quest=61300,label="Anima Shard",achievement=14339,level=60,atlas="azeriteready"},
    },
    [1536] = { -- Maldraxxus
        [47206210] = {
            achievement=14312, criteria=50063, -- Ornate Bone Shield
            quest=59358,
            loot={
                180749, -- Hauk's Battle-Scarred Bulwark
            },
            note="On the ground near some bones",
        },
        [32702120] = {
            achievement=14311, criteria=50064, -- Kyrian Keepsake
            quest=60587,
            loot={
                180085, -- Kyrian Keepsake
                175708, -- Reconstructed Family Locket
            },
            note="Interact with the {npc:169664:Kyrian Corpse} at the location to obtain the treasure",
        },
        [30702870] = {
            achievement=14312, criteria=50065, -- Halis' Lunch Pail
            quest=60730,
            -- loot=Random Food,
            note="In the middle of the ring in the House of Constructs",
        },
        [59807900] = {
            achievement=14312, criteria=50066, -- Vat of Conspicuous Slime
            quest=61444,
            loot={
                181825, -- Phial of Ravenous Slime
            },
            note="Take the bottle from the nearby table and use it on the pool to obtain the treasure",
        },
        [66105040] = {
            achievement=14312, criteria=50067, -- Stolen Jar
            quest=61451,
            loot={
                182618, -- Reclaimed Vessel
            },
            note="Gives the quest {quest:62085:...Why Me?}",
        },
        [42302430] = {
            achievement=14312, criteria=50068, -- Necro Tome
            quest=61470,
            loot={
                182732, -- The Necronom-i-nom
            },
            note="Complete the questline starting with {quest:58619:Read Between the Lines} to eventually reach this treasure",
        },
        [22503050] = {
            achievement=14312, criteria=50069, -- Forgotten Mementos
            quest=58710,
            -- loot=Random Gear,
            note="Find the Vault Portcullis at the building where the treasure is located to open the gate blocking the treasure",
        },
        [49401510] = {
            achievement=14312, criteria=50070, -- Chest of Eyes
            quest=59244,
            loot={
                183696, -- Sp-eye-glass
            },
            note="Inside the wreckage of Nurakkir in the House of Eyes",
        },
        [62405990] = {
            achievement=14312, criteria=50071, -- Misplaced Supplies
            quest=59245,
            -- loot=Random Gear,
            note="On top of a mushroom",
        },
        [72805360] = {
            achievement=14312, criteria=50072, -- Glutharn's Stash
            quest=61484,
            -- loot=Random Gear,
            note="Kill {npc:172485:Scathely} and his 2 adds to unlock the treasure",
        },
        [31707000] = {
            achievement=14312, criteria=50073, -- Runespeaker's Trove
            quest=61491,
            loot={
                183516, -- Stained Bonefused Mantle
            },
            note="Kill {npc:170563:Runespeaker Phaeton} to obtain the {item:181777:Phaeton's Key} required to unlock the treasure",
        },
        [57607580] = {
            achievement=14312, criteria=50074, -- Plaguefallen Chest
            quest=61474,
            loot={
                183515, -- Iridescent Ooze / Reanimated Plague
            },
            note="Enter the tunnels at 62.4 76.5 to become {spell:330092:Plaguefallen} and unlock the treasure",
        },
        [64602470] = {
            achievement=14312, criteria=50075, -- Ritualist's Cache
            quest=61514,
            loot={
                183517, -- Page 76 of the Necronom-i-nom
            },
            note="1) Loot the {item:181558:Missing Ritual Pages} from the Bone Pile at 69.8 31.0;\n2) Use the Book of Binding Rituals at 71.7 35.4;\n3) You have 5 minutes to return to the Ritualist's Cache and unlock the treasure",
        },
        [51404840] = {
            achievement=14626,-- Harvester of Sorrow
            quest=61128, -- also 61127 for the arm
            loot={
                180273, -- Sorrowbane
                181164, -- Oonar's Arm
            },
            note="Requires stacking several strength buffs and the world quest {quest:57205:A Few Bumps Along the Way}. Check wowhead, it's a lot",
        },
        -- non-achievement
        [44103990] = {
            quest=60368,
            label="Blackhound Cache",
        },
        -- [36807860] = {
        --     quest=nil,
        --     label="Bladesworn Supply Cache",
        -- },
        [41511953] = {
            quest=62602,
            label="Giant Cache of Epic Treasure",
            pet=3047,
            note="Click the bug, get a pet",
        },
        [55893897] = {
            quest=59428, -- later 59429
            label="Strange Growth",
            loot={
                182606, -- Bloodlouse Larva
            },
            note="Loot a {item:182607:Hairy Egg} and wait three days for your pet to hatch",
        }
    },
    [1649] = { -- Etheric Vault
        [34565549] = {
            achievement=14312, criteria=50069, -- Forgotten Mementos
            quest=58710,
            -- loot=Random Gear,
            note="Find the Vault Portcullis at the building where the treasure is located to open the gate blocking the treasure",
        },
    },
    [1565] = { -- Ardenweald
        [55902100] = {
            achievement=14313, criteria=50031, -- Aerto's Body
            quest=61072,
            loot={
                180630, -- Gorm Harrier
            },
            note="A swarm of insects will attack you after looting the treasure",
        },
        [52903730] = {
            achievement=14313, criteria=50033, -- Veilwing Egg
            quest=61065,
            loot={
                180642, -- Cloudfeather Fledgling
            },
            note="On top of a branch",
        },
        [49705590] = {
            achievement=14313, criteria=50035, -- Faerie Trove
            quest=61073,
            loot={
                182673, -- Shimmerbough Hoarder
            },
            note="Inside a small alcove under the clearing",
        },
        [48203920] = {
            achievement=14313, criteria=50037, -- Hearty Dragon Plume
            quest=61067,
            loot={
                182729, -- Hearty Dragon Plume
            },
            note="Up in a tree",
        },
        [63903750] = {
            achievement=14313, criteria=50039, -- Cache of the Moon
            quest=61074,
            loot={
                180731, -- Wildseed Cradle
            },
            note="Locate 5 tools scattered around the Garden of Night (southeast of Root-Home), combine them into {item:180753:Twinklestar's Gardening Toolkit} and bring them to {npc:171360:Twinklestar} in Tirna Vaal.\nAfter this is done, talk to Twinklestar to receive the {spell:334353:Moonsight} buff",
        },
        [38995696] = {quest=61074,achievement=14313, criteria=50039,label="Diary of the Night",atlas="vehicle-hammergold",minimap=true},
        [39755440] = {quest=61074,achievement=14313, criteria=50039,label="Gardener's Hammer",atlas="vehicle-hammergold",minimap=true},
        [40315262] = {quest=61074,achievement=14313, criteria=50039,label="Gardener's Basket",atlas="vehicle-hammergold",minimap=true},
        [38495808] = {quest=61074,achievement=14313, criteria=50039,label="Gardener's Flute",atlas="vehicle-hammergold",minimap=true},
        [38856010] = {quest=61074,achievement=14313, criteria=50039,label="Gardener's Wand",atlas="vehicle-hammergold",minimap=true},
        [37603710] = {
            achievement=14313, criteria=50041, -- Dreamsong Heart
            quest=61070,
            loot={
                179510, -- Dreamsong Warglaive
            },
            note="Use a Jumping Mushroom hidden in Dreamsong Fenn to climb to the top of the tree",
        },
        [44707570] = {
            achievement=14313, criteria=50043, -- Elusive Faerie Cache
            quest=61175,
            loot={
                179512, -- Dreamsong Saber
                184490, -- Fae Pipes
            },
            note="Requires grabbing the {spell:333923:Faerie Lamp} buff at 46.4 70.9 to unlock the treasure",
        },
        [46407090] = {quest=61175,achievement=14313,criteria=50043,label="Faerie Lamp",note="Take to 44.7 75.7"},
        [36106520] = {
            achievement=14313, criteria=50045, -- Darkreach Supplies
            quest=61068,
            loot={
                179594, -- Witherscorn Guise
            },
            note="Use the jumping mushroom nearby to reach the treasure",
        },
        [48202030] = {
            achievement=14313, criteria=50032, -- Lost Satchel
            quest=62187,
            loot={
                182731, -- Satchel of Culexwood
            },
            note="Drop below. Starts {quest:62187:Satchel of Culexwood}",
        },
        [76602970] = {
            achievement=14313, criteria=50034, -- Swollen Anima Seed
            quest=62186,
            loot={
                182730, -- Swollen Anima Seed
            },
            note="Starts {quest:62186:Swollen Anima Seed}",
        },
        [67803450] = {
            achievement=14313, criteria=50036, -- Harmonic Chest
            quest=61165,
            loot={
                184489, -- Fae Harp
                179565, -- Songwood Stem
            },
            note="Requires 2 players to play the nearby harp and drums at the same time",
        },
        [41903250] = {
            achievement=14313, criteria=50040, -- Dessicated Moth
            quest=61147,
            loot={
                180640, -- Amber Glitterwing
            },
            note="Loot the {item:180784:Aromatic Flowers} at 36.4 59.5, then use the jumping mushroom near the treasure location to jump on to a tree. Use the flowers on the brazier within the tree to attract the treasure",
        },
        [36405950] = {quest=61147,achievement=14313, criteria=50040,label="Aromatic Flowers",note="Take to the Dessicated Moth at 41.9 32.5",},
        [36402500] = {
            achievement=14313, criteria=50042, -- Enchanted Dreamcatcher
            quest=62259,
            loot={
                183129, -- Anima-Laden Dreamcatcher
            },
            note="Carefully climb the roots in the area. Starts {quest:62259:Anima-Laden Dreamcatcher}",
        },
        [36006650] = {
            achievement=14313, criteria=50044, -- Cache of the Night
            quest=61110,
            loot={
                180637, -- Starry Dreamfoal
                179549, -- Nightwillow Cudgel
            },
            note="Loot {item:180654:Fae Ornament}, {item:180656:Enchanted Bough} and {item:180655:Raw Dream Fibers} scattered around Ardenweald to create the {item:180652:Fae Dreamcatcher}, which will dispell the barrier blocking the treasure</a>",
        },
        [42414672] = {quest=61110,achievement=14313,criteria=50044,label="Enchanted Bough",atlas="greencross",note="Combine to unlock the Cache of the Night at 36,66"},
        [51556160] = {quest=61110,achievement=14313,criteria=50044,label="Fae Ornament",atlas="greencross",note="Combine to unlock the Cache of the Night at 36,66"},
        [36982983] = {quest=61110,achievement=14313,criteria=50044,label="Raw Dream Silk",atlas="greencross",note="Combine to unlock the Cache of the Night at 36,66"},
        -- non-achievement
        [26285897] = {
            quest=61192, -- failed:61208, 61198: passed
            loot={
                180727, -- Shimmermist Runner
            },
            note="Read the Tale of the Tangle, then follow blue lamps until you find {npc:171767:Shizgher}",
        },
        [31515302] = {quest=61192,label="Tale of the Tangle",note="Read, then follow the blue lamps to find {npc:171767:Shizgher}",atlas="poi-workorders"},
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
    quest=61086, -- also 61080, 61081, 61084, 61085 for progress
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
