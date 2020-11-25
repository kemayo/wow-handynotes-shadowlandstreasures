local myname, ns = ...

local path = ns.path

ns.RegisterPoints(1536, { -- Maldraxxus
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
})
ns.RegisterPoints(1649, { -- Etheric Vault
    [34565549] = {
        achievement=14312, criteria=50069, -- Forgotten Mementos
        quest=58710,
        -- loot=Random Gear,
        note="Find the Vault Portcullis at the building where the treasure is located to open the gate blocking the treasure",
    },
})

-- non-achievement treasures
ns.RegisterPoints(1536, { -- Maldraxxus
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
})