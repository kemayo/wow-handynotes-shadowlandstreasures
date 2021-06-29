local myname, ns = ...

local path = ns.path

local RELIC_FRAGMENT = 186685 -- relic fragment

local researched = ns.nodeMaker{
    ShouldShow = function(point)
        return select(3, GetFactionInfoByID(2472)) >= point.research
    end
}

ns.RegisterPoints(1961, { -- Korthia
    [29505345] = { -- Anima Laden Egg
        achievement=15099, criteria=52241,
        quest=64244,
        loot={
            187349, -- Anima Laden Egg
        },
    },

    [47502920] = { -- Dislodged Nest
        achievement=15099, criteria=52240,
        quest=64241,
        loot={
            {187339, toy=true}, -- Silver Shardhide Whistle
        },
        note="Get {spell:355181} from a Noxious Moth; use {spell:355131} on {npc:178547} and ride into the tree",
    },

    [50458445] = { -- Displaced Relic
        achievement=15099, criteria=52242,
        quest=64252,
        loot={
            187350, --Displaced Relic (300 research)
        },
    },

    [68902990] = { -- Forgotten Feather
        achievement=15099, criteria=52237,
        quest=64234,
        loot={
            {187051, toy=true}, -- Forgotten Feather
        },
        note="Jump down from Keeper's Respite",
    },

    [38354295] = { -- Glittering Nest Materials
        achievement=15099, criteria=52236,
        quest=64222,
    },

    [42505595] = { -- Infected Vestige
        achievement=15099, criteria=52245,
        quest=64264,
        loot={
            187354, -- Abandoned Broker Satchel
        },
        note="In cave",
    },

    [52901475] = { -- Lost Momento
        achievement=15099, criteria=52238,
        quest=64238,
    },

    [45356715] = { -- Offering Box
        achievement=15099, criteria=52246,
        quest=64268,
        requires_item=187033,
        loot={
            {187344, toy=true}, -- Offering Kit Maker
        },
        note="Find {item:187033} in the nearby ruins, on the top of the west wall",
    },
    [43556770] = path({achievement=15099, criteria=52246, quest=64268, inbag=187033, label="{item:187033}", atlas="reagents"}), -- Small Offering Key

    [56351845] = { -- Riftbound Cache
        quest=64472,
        requires_item=186731, -- Repaired Riftkey
        label="Riftbound Cache",
        loot={
            RELIC_FRAGMENT
        },
    },

    [62055550] = { -- Spectral Bound Chest
        quest=64247,
        loot={
            RELIC_FRAGMENT,
        },
        label="Spectral Bound Chest",
        currency=1767, -- x40
        note="Click 3x nearby Spectral Keys to unlock",
    },
})
-- spectral keys
ns.RegisterPoints(1961, { -- Korthia
    [57504930] = {quest=64248, atlas="warfronts-basemapicons-alliance-workshop-minimap"},
    [58204870] = {quest=64248, atlas="warfronts-basemapicons-alliance-workshop-minimap"},
    [59205670] = {quest=64248, atlas="warfronts-basemapicons-alliance-workshop-minimap"},
    [62755135] = {quest=64248, atlas="warfronts-basemapicons-alliance-workshop-minimap"},

    [50505370] = {quest=64249, atlas="warfronts-basemapicons-empty-workshop-minimap"},
    [52305320] = {quest=64249, atlas="warfronts-basemapicons-empty-workshop-minimap"},
    [52604970] = {quest=64249, atlas="warfronts-basemapicons-empty-workshop-minimap"},
    [54205060] = {quest=64249, atlas="warfronts-basemapicons-empty-workshop-minimap"},

    [59205670] = {quest=64250, atlas="warfronts-basemapicons-horde-workshop-minimap"},
    [60305650] = {quest=64250, atlas="warfronts-basemapicons-horde-workshop-minimap"},
    [61005870] = {quest=64250, atlas="warfronts-basemapicons-horde-workshop-minimap"},
    [62105770] = {quest=64250, atlas="warfronts-basemapicons-horde-workshop-minimap"},
}, {
    label = "Spectral Key",
})

--Relics
ns.RegisterPoints(1961, { -- Korthia
    [27305670] = researched{ -- Book of Binding: The Mad Witch
        achievement=15066, criteria=52131,
        quest=63899,
        research=2,
    },

    [45105610] = researched{ -- Celestial Shadowlands Chart
        achievement=15066, criteria=52258,
        quest=63912,
        research=2,
    },

    [41156015] = researched{ -- Gorak Claw Fetish
        achievement=15066, criteria=52268,
        quest=63924,
        requires_item=186984,
        research=2,
        note="Buy {item:186984} from {npc:178257} to unlock",
    },

    [41304330] = researched{ -- Guise of the Changeling
        achievement=15066, criteria=52255,
        quest=63909,
        requires_item=186984,
        research=2,
        loot={
            {187155, toy=true} -- Guise of the Changeling
        },
        note="Buy {item:186984} from {npc:178257} to unlock",
    },

    [33004190] = researched{ -- The Netherstar
        achievement=15066, criteria=52256,
        quest=63910,
        requires_item=186984,
        research=2,
        note="Buy {item:186984} from {npc:178257} to unlock",
    },

    [43857690] = researched{ -- Ring of Self-Reflection
        achievement=15066, criteria=52265,
        quest=63921,
        requires_item=186984,
        research=2,
        loot={
            {187140, toy=true} -- Ring of Duplicity
        },
        note="Buy {item:186984} from {npc:178257} to unlock",
    },

    [62005680] = researched{ -- Singing Steel Ingot
        achievement=15066, criteria=52257,
        quest=63911,
        research=2,
    },

    [39405240] = researched{ -- Drum of Driving
        achievement=15066, criteria=52269,
        quest=63915,
        requires_item=186718,
        research=3,
        note="Use {item:186718} from {npc:178257} on the Ancient Teleporter",
    },

    [45003550] = researched{ -- Sack of Strange Soil
        achievement=15066, criteria=52261,
        quest=63916,
        requires_item=186718,
        research=3,
        note="Use {item:186718} from {npc:178257} on the Ancient Teleporter",
    },

    [40504140] = researched{ -- Talisman of the Eternal Scholar
        achievement=15066, criteria=52126,
        quest=63860,
        research=3,
        note="In cave",
    },

    [60803490] = researched{ -- Book of Binding: The Tormented Sorcerer
        achievement=15066, criteria=52264,
        quest=63919,
        requires_item=186731,
        research=4,
        note="Buy {item:186731} from {npc:178257} to enter the rift",
    },

    [29005420] = researched{ -- Cipher of Understanding
        achievement=15066, criteria=52260,
        quest=63914,
        requires_item=186731,
        research=4,
        note="Buy {item:186731} from {npc:178257} to enter the rift",
    },

    [52005260] = researched{ -- Enigmatic Decrypting Device
        achievement=15066, criteria=52270,
        quest=63920,
        requires_item=186731,
        research=4,
        note="Buy {item:186731} from {npc:178257} to enter the rift",
    },

    [51402010] = researched{ -- Unstable Sin'dorei Explosive
        achievement=15066, criteria=52259,
        quest=63913,
        requires_item=186731,
        research=4,
        note="Buy {item:186731} from {npc:178257} to enter the rift",
    },

    [18503800] = researched{ -- Bulwark of Divine Intent
        achievement=15066, criteria=52254,
        quest=63908,
        research=5,
        note="Use the shrine to get {spell:352367} to see the altar path",
    },

    [24355660] = researched{ -- Lang Family Wood-Carving
        achievement=15066, criteria=52267,
        quest=63923,
        research=5,
        note="Use the shrine to get {spell:352367} to see the altar path",
    },

    [39404270] = researched{ -- Shadow Slicing Sword
        achievement=15066, criteria=52266,
        quest=63922,
        research=5,
        loot={
            {187159, toy=true}, -- Shadow Slicing Shortsword
        },
        note="Use the shrine to get {spell:352367} to see the altar path",
    },
})

--Rares
ns.RegisterPoints(1961, { -- Korthia
    [58201775] = { -- Assault Supply Carriage
        npc=180246,
        quest=64258, -- 64439?
        achievement=15107, criteria=52290,
        loot={
            187370, -- Carriage Crusher's Padded Slippers
            187391, -- Yarxhov's Rib-Cage
        },
    },

    [39405240] = { -- Chamber of Knowledge
        achievement=15107, criteria=52295,
        achievement=15066, criteria=52262,
        quest=64257,
        npc=179802,
        requires_item=186718,
        loot={
            {187103, quest=63917}, -- Everliving Statuette
            187366, -- Fallen Vault Guardian's Spire
        },
        note="Use {item:186718} from {npc:178257} on the Ancient Teleporter",
    },

    [44903550] = { -- Chamber of Wisdom
        achievement=15107, criteria=52296,
        achievement=15066, criteria=52263,
        quest=64278,
        npc=179859,
        requires_item=186718,
        loot={
            {186538, pet=3140}, -- Gnashtooth
            {187104, quest=63918}, -- Obelisk of Dark Tidings
            187387, -- Pauldrons of the Unknown Beyond
        },
        note="Use {item:186718} from {npc:178257} on the Ancient Teleporter",
    },

    [51154165] = { -- Consumption
        achievement=15107, criteria=52285,
        quest=64243,
        npc=179768,
        loot={
            187245, -- Death-Enveloped Spires
            187246, -- Death-Enveloped Pauldrons
            187247, -- Death-Enveloped Shoulder Spikes
        },
    },

    [59954370] = { -- Corpse Heap
        achievement=15107, criteria=52299,
        quest=64349,
        npc=180042,
        covenant=Enum.CovenantType.Necrolord,
        loot={
            187372, -- Miasma Filtering Headpiece
            {186489, mount=1449, covenant=Enum.CovenantType.Necrolord}, -- Lord of the Corpseflies
        },
        note="Talk to {npc:180079}",
    },

    [59355220] = { -- Deadsoul Hatcher
        achievement=15107, criteria=52275,
        quest=64285,
        npc=179913,
        requires_item=186731,
        loot={
            {187174, toy=true}, -- Shaded Judgement Stone
        },
        note="Buy {item:186731} from {npc:178257} to enter the rift",
    },


    [51802080] = { -- Dominated Protector
        achievement=15107, criteria=52277,
        quest=63830,
        npc=177903,
        loot={
            187390, -- Dominated Protector's Helm
        },
    },

    [33103930] = { -- Escaped Wilderling
        achievement=15107, criteria=52298,
        quest=64320,
        npc=180014,
        covenant=Enum.CovenantType.NightFae,
        loot={
            {186492, mount=1487, covenant=Enum.CovenantType.NightFae}, -- Summer Wilderling
        },
        note="Click on the {npc:180014} to start",
    },

    [60652315] = { -- Hunting the Hunter
        achievement=15107, criteria=52283,
        quest=64233,
        npc=179684,
        loot={
            {186645, mount=1506} -- Crimson Shardhide
        },
        note="Talk to {npc:179729} to gain {spell:355078} and follow footprints",
    },
    [44202950] = {label="Fleshy Remains", note="Get {spell:355078} @ 60.6, 23.1"}, -- fleshy remains

    [59203580] = { -- Kroke the Tormented
        achievement=15107, criteria=52304,
        quest=64428,
        npc=179108,
        loot={
            187394, -- Tormented Giant's Legplates
            187250, -- Kroke's Wingspiked Pauldrons
            187248, -- Kroke's Gleaming Spaulders
        },
        route={
            59203580, 60893687, 62273605, 61313445, 59953388,
            59053603, 58253784, 57033778, 56863623, 57923572,
            loop=true,
            r=1, g=1, b=0,
        },
    },

    [46507950] = { -- No Stoneborn Left Behind
        achievement=15107, criteria=52276,
        quest=64313,
        npc=179985,
        covenant=Enum.CovenantType.Venthyr,
        loot={
            184790, -- Archdruid Van-Yali's Greenthumbs
            -- {186479, mount=, covenant=Enum.CovenantType.Venthyr}, -- Mastercraft Gravewing
        },
        note="Talk to {npc:179974}",
    },

    [50307590] = { -- Observer Yorik
        achievement=15107, criteria=52294,
        quest=64369,
        npc=179914,
        requires_item=186731,
        loot={
            {187420, toy=true}, -- Maw-Ocular Viewfinder
        },
        note="Buy {item:186731} from {npc:178257} to enter the rift",
    },

    [56853235] = { -- Popo's Potion Patrol
        achievement=15107, criteria=52300,
        quest=64338,
        npc=180032,
        covenant=Enum.CovenantType.Kyrian,
        loot={
            {187176, toy=true}, -- Vesper of Harmony
            {186483, mount=1493, covenant=Enum.CovenantType.Kyrian}, -- Foresworn Aquilon
        },
        note="Talk to {npc:180028}",
    },

    [22604140] = { -- Relic Breaker Krelva
        achievement=15107, criteria=52291,
        quest=64291,
        npc=179931,
        loot={
            187403, -- Relic Breaker's Drape
        },
    },

    [56256615] = { -- Reliwik the Defiant
        achievement=15107, criteria=52318,
        quest=64455,
        npc=180160,
        loot={
            {186652, mount=1509}, -- Garnet Razorwing
        },
        note="Summon with the uncorrupted razorwing egg",
    },

    [44604240] = { -- Screaming Shade
        achievement=15107, criteria=52273,
        quest=64263,
        npc=179608,
        requires_item=186731,
        note="Buy {item:186731} from {npc:178257} to enter the rift",
    },

    [57607040] = { -- Silent Soulstalker
        achievement=15107, criteria=52274,
        quest=64284,
        npc=179911,
        requires_item=186731,
        note="Buy {item:186731} from {npc:178257} to enter the rift",
    },

    [27755885] = { -- Zelnithop
        achievement=15107, criteria=52301,
        quest=64442,
        npc=177336,
        loot={
            {186542, pet=3136}, --Korthian Specimen
        },
        note="In cave",
    },
    [30305480] = path({achievement=15107, criteria=52301, quest=64442,}),

    -- the many-spawn ones

    [10008000] = { -- Konthrogz the Obliterator
        achievement=15107, criteria=52303,
        quest=64246, -- 64280?
        npc=179472,
        loot={
            {187183, mount=1514}, -- Rampaging Mauler
            187375, -- Bound Worldeater Tendrils
            187378, -- Visage of the Obliterator
            187384, -- Konthrogz's Scaled Handguards
            187397, -- Vambraces of the In-Between
        },
        note="Spawns in a devourer portal event",
    },
    [12008000] = { -- Towering Exterminator
        achievement=15107, criteria=52302,
        quest=64245,
        npc=179760,
        loot={
            187241, -- Watchful Eye of the Damned
            187242, -- Exterminator's Crest of the Damned
            187373, -- Soul-Enveloping Leggings
            187376, -- Mawsworn Lieutenant's Treads
        },
        note="Spawns in a mawsworn portal event",
    },
    [14008000] = { -- Ve'rayn (Pop Quiz)
        achievement=15107, criteria=52319,
        quest=64457,
        npc=180162,
        loot={
            {187264, quest=64513}, -- Ve'rayn's Head
            187369, -- Ve'rayn's Formal Robes
            187404, -- Cartel Ve Amulet
        },
        note="Find and use the Abandoned Veilstaff, then talk to {npc:180162}",
    },
})
