local myname, ns = ...

local path = ns.path

ns.RegisterPoints(1565, { -- Ardenweald
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
})

local vulpin = {
    achievement=14313, criteria=50038, -- Playful Vulpin Befriended
    quest=61086, -- also 61080, 61081, 61084, 61085 for progress
    loot={
        180645, -- Dodger
    },
    note="Find {npc:171206:Playful Vulpin} and play with them 5 times to obtain the treasure. Use emotes related to what they're doing",
    atlas="Warfront-NeutralHero-Silver", scale=1.3,
}
ns.RegisterPoints(1565, {
    [31854363] = vulpin,
    [31764100] = vulpin,
    [32604292] = vulpin,
    [34104500] = vulpin,
    [50215353] = vulpin,
    [41312874] = vulpin,
    [40945156] = vulpin,
    [41374979] = vulpin,
    [51165507] = vulpin,
    [67162888] = vulpin,
    [70143004] = vulpin,
    [65222265] = vulpin,
    [67553191] = vulpin,
    [72393146] = vulpin,
})

-- Non-achievement treasures
ns.RegisterPoints(1565, { -- Ardenweald
    [26285897] = {
        quest=61192, -- failed:61208, 61198: passed
        loot={
            180727, -- Shimmermist Runner
        },
        note="Read the Tale of the Tangle, then follow blue lamps until you find {npc:171767:Shizgher}",
    },
    [31515302] = {quest=61192,label="Tale of the Tangle",note="Read, then follow the blue lamps to find {npc:171767:Shizgher}",atlas="poi-workorders"},
})

-- Rares
ns.RegisterPoints(1565, {
    [34606800] = { -- Deathbinder Hroth
        achievement=14309, criteria=48714,
        quest=59226,
        npc=164477,
        --loot={},
    },
    [47502845] = { -- Deifir the Untamed
        achievement=14309, criteria=48784,
        quest=59201,62271,
        npc=164238,
        loot={
            180631, -- Gorm Needler
        },
        note="Runs in circles around the area. Ride and use {spell:319566} and {spell:319575} to slow and stun it",
    },
    [48407715] = { -- Dustbrawl
        achievement=14309, criteria=48794,
        quest=58987,
        npc=163229,
        --loot={},
    },
    [57852955] = { -- Egg-Tender Leh'go
        achievement=14309, criteria=48790,
        quest=60266,
        npc=167851,
        loot={
            179539, -- Kelox's Eggbeater
        },
        note="Destroy eggs",
    },
    [68602765] = { -- Faeflayer
        achievement=14309, criteria=48798,
        quest=61184,
        npc=171688,
        loot={
            180144, -- Faeflayer's Hatchet
        },
    },
    [70403060] = path{achievement=14309, criteria=48798, quest=61184,},
    [54057600] = { -- Gormbore
        achievement=14309, criteria=48795,
        quest=59006,
        npc=163370,
        loot={
            183196, -- Lavender Nibbler
        },
    },
    [27905250] = { -- Gormtamer Tizo
        achievement=14309, criteria=48781,
        quest=59145,
        npc=164107,
        loot={
            180725, -- Spinemaw Gladechewer
        },
        note="Kill {npc:166736} until it spawns",
    },
    [32403025] = { -- Humon'gozz
        achievement=14309, criteria=48782,
        quest=59157,
        npc=164112,
        loot={
            182650, -- Arboreal Gulper
        },
        note="Loot {item:175247} and use the Damp Loam to summon"
    },
    [67455145] = { -- Hunter Vivianna
        achievement=14309, criteria=48787,
        quest=59221,
        npc=160448,
        loot={
            179596, -- Drust Mask of Dominance
            183091, -- Lifewoven Bracelet
        },
        note="Starts {quest:62246}",
    },
    [36504790] = { -- Macabre
        achievement=14309, criteria=48780,
        quest=nil,
        npc=164093,
        loot={
            180644, -- Rocky
        },
        note="Stand in a Mysterious Mushroom Ring with three players, dancing in a loop: A > B > C > A",
    },
    [62102470] = { -- Mymaen
        achievement=14309, criteria=48788,
        quest=59431,
        npc=165053,
        --loot={},
        note="Kill {npc:165050} to summon",
    },
    [50092091] = { -- Mystic Rainbowhorn
        achievement=14309, criteria=48715,
        quest=59235,
        npc=164547,
        loot={
            182179, -- Runestag Soul
        },
        note="Blow the great horn",
    },
    [62155220] = { -- Night Mare
        achievement=14309, criteria=48793,
        quest=60306,
        npc=168135,
        loot={
            180728, -- Swift Gloomhoof
        },
        note="A Night Fae player must:\n"..
            "* Loot {item:181243} at 19.7 63.5 (may need a glider)\n"..
            "* Do Night Fae quests through {quest:57871}\n",
            "* Ask {npc:165704} to repair {item:181243}\n",
            "* Get {item:178675} from {npc:160262}\n",
            "* Use {item:178675} here, and defeat the rare",
    },
    -- TODO: questid for getting the web?
    [19706350] = {achievement=14309, criteria=48793, quest=60306, loot={181243}},
    [51105740] = { -- Old Ardeite
        achievement=14309, criteria=48785,
        quest=59208,62270,
        npc=164391,
        loot={
            180643, -- Chirpy Valeshrieker
        },
        note="Get {item:174042} from {npc:160747} and {npc:160748} in Shimmerbough, use it to reach the rare",
    },
    [65104430] = { -- Rootwrithe
        achievement=14309, criteria=48791,
        quest=60273,
        npc=167726,
        loot={
            179603, -- Nettlehusk Barrier
        },
        note="Hit all the flowers",
    },
    [65702430] = { -- Rotbriar Boggart
        achievement=14309, criteria=48789,
        quest=60258,
        npc=167724,
        loot={
            175729, -- Rotbriar Sprout
        },
        note="Talk to {npc:174365} to start."
    },
    -- Relatedly... Toss a Seed to Your Hunter
    [65742291] = {
        achievement=14791,
        note="Loot {item:183902} around the zone, use the bonus action button to throw it at {npc:174364}",
    },
    [72405175] = { -- Soultwister Cero
        achievement=14309, criteria=48797,
        quest=61177,
        npc=171451,
        loot={
            180164, -- Soultwister's Scythe
        },
    },
    [37675917] = { -- Skuld Vit
        achievement=14309, criteria=48786,
        quest=59220,
        npc=164415,
        loot={
            182183, -- Wolfhawk Soul
        },
        note="Use {spell:310143} to get in",
    },
    [59304660] = { -- The Slumbering Emperor
        achievement=14309, criteria=48792,
        quest=60290,
        npc=167721,
        loot={
            175711, -- Slumberwood Band
        },
        note="Use AOE or a flare on the foggy area",
    },
    [30105535] = { -- Valfir the Unrelenting
        achievement=14309, criteria=48796,
        quest=61632,
        npc=168647,
        loot={
            180730, -- Wild Glimmerfur Prowler
            182176, -- Shadowstalker Soul (quest=62431)
        },
        note="A Night Fae player channeling the Tirna Scithe must:\n"..
            "* Pick up a {spell:338045}\n"..
            "* Use {spell:338045} to remove {spell:338038}",
    },
    [58306180] = { -- Wrigglemortis
        achievement=14309, criteria=48783,
        quest=59170,
        npc=164147,
        loot={
            179502, -- Ripvine Barb
        },
        note="Drag out of the ground",
    },
})