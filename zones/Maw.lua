local myname, ns = ...

local path = ns.path
local CAVE = "Cave entrance"

ns.RegisterPoints(1543, {
    -- Better to Be Lucky Than Dead
    [25903115] = { -- Adjutant Dekaris
        achievement=14744, criteria=49841,
        quest=57482,
        npc=157964,
        --loot={},
    },
    [19304170] = { -- Apholeias, Herald of Loss
        achievement=14744, criteria=49842,
        quest=60788,
        npc=170301,
        loot={
            182327, -- Dominion Etching Loss
        },
        note="Need three players to summon",
    },
    [39004120] = { -- Borr-Geth
        achievement=14744, criteria=49843,
        quest=57469,
        npc=157833,
        loot={
            184312, -- Borr-Geth's Fiery Brimstone
        },
    },
    [27751305] = { -- Conjured Death
        achievement=14744, criteria=49844,
        quest=61106,
        npc=171317,
        loot={
            183887, -- Suirhtaned, Blade of the Heir
        },
    },
    [60954805] = { -- Darithis the Bleak
        achievement=14744, criteria=49845,
        quest=62281,
        npc=160770,
        --loot={},
    },
    [49128175] = { -- Darklord Taraxis
        achievement=14744, criteria=49846,
        quest=62282,
        npc=158025,
        --loot={},
    },
    [32956645] = { -- Dolos
        achievement=14744, criteria=49847,
        quest=60909,
        npc=170711,
        --loot={},
    },
    [23755340] = { -- Eketra
        achievement=14744, criteria=49848,
        quest=60915,
        npc=170774,
        --loot={},
    },
    [42352110] = { -- Ekphoras, Herald of Grief
        achievement=14744, criteria=49849,
        quest=60666,
        npc=169827,
        loot={
            182328, -- Dominion Etching: Grief
            184105, -- Gyre
        },
        note="Need three players to summon",
    },
    [19204610] = { -- Eternas the Tormentor
        achievement=14744, criteria=49850,
        quest=57509,
        npc=154330,
        loot={
            183407, -- Contained Essence of Dread
        },
    },
    [20606935] = { -- Exos, Herald of Domination
        achievement=14744, criteria=49851,
        quest=62260,
        npc=170303,
        --loot={},
        note="Get the etching from the three other Heralds, combine into {item:182329}, and use to summon",
    },
    [30775000] = { -- Ikras the Devourer
        achievement=14744, criteria=50621,
        quest=62788,
        npc=175012,
        note="Flies around",
    },
    [16955100] = { -- Morguliax
        achievement=14744, criteria=49852,
        quest=60987,
        npc=162849,
        loot={
            184292, -- Ancient Elethium Coin
        },
    },
    [45507375] = { -- Nascent Devourer
        achievement=14744, criteria=49853,
        quest=57573,
        npc=158278,
        --loot={},
    },
    [48801830] = { -- Obolos
        achievement=14744, criteria=49854,
        quest=60667,
        npc=164064,
        --loot={},
    },
    [23702140] = { -- Orophea
        achievement=14744, criteria=49855,
        quest=61519,
        npc=172577,
        loot={
            181794, -- Orophea's Lyre
        },
        note="Fetch {spell:337150} from 26.7 29.3, use it to summon",
    },
    [26752930] = { -- Eurydea's Necklace
        achievement=14744, criteria=49855,
        quest=61519,
        label="{spell:337150}",
        note="Take to {npc:172577} at 23.7 21.4",
    },
    [30706035] = { -- Shadeweaver Zeris
        achievement=14744, criteria=49856,
        quest=60884,
        npc=170634,
        --loot={},
    },
    [35954155] = { -- Soulforger Rhovus
        achievement=14744, criteria=49857,
        quest=60834,
        npc=166398,
        --loot={},
    },
    [28701205] = { -- Talaporas, Herald of Pain
        achievement=14744, criteria=49858,
        quest=60789, -- 62722?
        npc=170302,
        loot={
            182326, -- Dominion Etching: Pain
            184107, -- Borogove Cloak
        },
        note="Need three players to summon",
    },
    [27407150] = { -- Thanassos <Death's Voice>
        achievement=14744, criteria=49859,
        quest=60914,
        npc=170731,
        --loot={},
    },
    [37656590] = { -- Yero the Skittish
        achievement=14744, criteria=49860,
        quest=61568,
        npc=172862,
        --loot={},
        note="Follow until it becomes hostile",
    },

    -- It's About Sending A Message
    [20803925] = path{
        label=CAVE,
        achievement=14660,
        criteria={49485,51058},
        quest={61136,63044},
    },
    [28204450] = { -- Agonix
        achievement=14660, criteria=49485,
        quest=61136, -- 63380
        npc=169102,
        --loot={},
    },
    [26055500] = { -- Akros
        achievement=14660, criteria=49487,
        quest=60920,
        npc=170787,
        --loot={},
    },
    [28702515] = { -- Cyrixia
        achievement=14660, criteria=49484,
        quest=61346,
        npc=168693,
        loot={
            183070, -- Mawsworn Orders
        },
    },
    [25851480] = { -- Dartanos
        achievement=14660, criteria=49476,
        quest=59230,
        npc=162452,
        --loot={},
    },
    [19205740] = { -- Dath Rezara
        achievement=14660, criteria=50410,
        quest=61140,
        npc=162844,
        loot={
            183066, -- Korrath's Grimoire: Aleketh
            183067, -- Korrath's Grimoire: Belidir
        },
    },
    [32002120] = { -- Drifting Sorrow
        achievement=14660, criteria=49475,
        quest=59183,
        npc=158314,
        --loot={},
    },
    [60456480] = { -- Houndmaster Vasanok
        achievement=14660, criteria=49490,
        quest=62209,
        npc=172523,
        --loot={},
    },
    [30846866] = { -- Krala
        achievement=14660, criteria=49486,
        quest=60903,
        npc=170692,
        --loot={},
    },
    [27301755] = { -- Malevolent Stygia
        achievement=14660, criteria=49488,
        quest=61125,
        npc=171316,
        --loot={},
    },
    [38652880] = { -- Odalrik
        achievement=14660, criteria=50408,
        quest=62618,
        npc=172207,
        --loot={},
    },
    [25354875] = { -- Orrholyn <Lord of Bloodletting>
        achievement=14660, criteria=49480,
        quest=60991,
        npc=162845,
        --loot={},
    },
    [22654225] = { -- Ratgusher
        achievement=14660, criteria=51058,
        quest=63044, -- 63388 ??
        npc=175821,
        -- loot={},
    },
    [26153745] = { -- Razkazzar
        achievement=14660, criteria=49479,
        quest=60992,
        npc=162829,
        --loot={},
    },
    [55606320] = { -- Sanngror the Torturer
        achievement=14660, criteria=49489,
        quest=62210,
        npc=172521,
        --loot={},
    },
    [55806755] = path{label=CAVE, achievement=14660, criteria=49489, quest=62210,},
    [61757795] = { -- Skittering Broodmother
        achievement=14660, criteria=49491,
        quest=62211,
        npc=172524,
        --loot={},
    },
    [59258000] = path{label=CAVE, achievement=14660, criteria=49491, quest=62211,},
    [20802970] = { -- Sorath the Sated
        achievement=14660, criteria=49481,
        quest=58918,
        npc=162965,
        --loot={},
    },
    [36253745] = { -- Soulsmith Yol-Mattar
        achievement=14660, criteria=49482,
        quest=59441,
        npc=165047,
        --loot={},
    },
    [36854480] = { -- Stygian Incinerator
        achievement=14660, criteria=50409,
        quest=62539,
        npc=156203,
        --loot={},
    },
    [40705960] = { -- Valis the Cruel
        achievement=14660, criteria=49492,
        quest=61728,
        npc=173086,
        --loot={},
    },

    -- non-achievement
    --[] = { -- Warren Mongrel
    --    quest=61124,
    --    npc=165973,
    --}
})
