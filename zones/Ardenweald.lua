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
