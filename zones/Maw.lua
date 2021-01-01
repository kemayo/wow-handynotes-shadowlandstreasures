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
        level=60,
    },
    [19304170] = { -- Apholeias, Herald of Loss
        achievement=14744, criteria=49842,
        quest=60788,
        npc=170301,
        loot={
            182327, -- Dominion Etching Loss
            184106, -- Gimble
        },
        note="Need three players to summon",
        level=60,
    },
    [39004120] = { -- Borr-Geth
        achievement=14744, criteria=49843,
        quest=57469,
        npc=157833,
        loot={
            {184312, toy=true}, -- Borr-Geth's Fiery Brimstone
        },
        level=60,
    },
    [27751305] = { -- Conjured Death
        achievement=14744, criteria=49844,
        quest=61106,
        npc=171317,
        loot={
            183887, -- Suirhtaned, Blade of the Heir
        },
        level=60,
    },
    [60954805] = { -- Darithis the Bleak
        achievement=14744, criteria=49845,
        quest=62281,
        npc=160770,
        --loot={},
        level=60,
    },
    [49128175] = { -- Darklord Taraxis
        achievement=14744, criteria=49846,
        quest=62282,
        npc=158025,
        --loot={},
        level=60,
    },
    [28106060] = { -- Dolos
        achievement=14744, criteria=49847,
        quest=60909,
        npc=170711,
        --loot={},
        level=60,
    },
    [23755340] = { -- Eketra
        achievement=14744, criteria=49848,
        quest=60915,
        npc=170774,
        --loot={},
        level=60,
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
        level=60,
    },
    [19204610] = { -- Eternas the Tormentor
        achievement=14744, criteria=49850,
        quest=57509,
        npc=154330,
        loot={
            183407, -- Contained Essence of Dread
        },
        level=60,
    },
    [20606935] = { -- Exos, Herald of Domination
        achievement=14744, criteria=49851,
        quest=62260,
        npc=170303,
        loot={
            184108, -- Vorpal Amulet
            183066, -- Korrath's Grimoire: Aleketh
            183067, -- Korrath's Grimoire: Belidir
            183068, -- Korrath's Grimoire: Gyadrek
        },
        note="Get the etching from the three other Heralds, combine into {item:182329}, and use to summon",
        level=60,
    },
    [53507950] = { -- Gorged Shadehound
        achievement=14738, criteria=49251,
        npc=174827,
        -- quest=61124,
        label="{npc:174827}",
        loot={
            {184167,mount=1304,}, -- Mawsworn Soulhunter
        },
        note="Only during the Hunt:Shadehounds event, mount is not a guaranteed drop",
    },
    [30775000] = { -- Ikras the Devourer
        achievement=14744, criteria=50621,
        quest=62788,
        npc=175012,
        note="Flies around",
        level=60,
    },
    [16955100] = { -- Morguliax
        achievement=14744, criteria=49852,
        quest=60987,
        npc=162849,
        loot={
            {184292, toy=true}, -- Ancient Elethium Coin
        },
        level=60,
    },
    [45507375] = { -- Nascent Devourer
        achievement=14744, criteria=49853,
        quest=57573,
        npc=158278,
        --loot={},
        level=60,
    },
    [48801830] = { -- Obolos
        achievement=14744, criteria=49854,
        quest=60667,
        npc=164064,
        --loot={},
        level=60,
    },
    [23702140] = { -- Orophea
        achievement=14744, criteria=49855,
        quest=61519,
        npc=172577,
        loot={
            {181794, toy=true}, -- Orophea's Lyre
        },
        note="Fetch {spell:337150} from 26.7 29.3, use it to summon",
        level=60,
    },
    [26752930] = { -- Eurydea's Necklace
        achievement=14744, criteria=49855,
        quest=61519,
        label="{spell:337150}",
        note="Take to {npc:172577} at 23.7 21.4",
        level=60,
    },
    [32956645] = { -- Shadeweaver Zeris
        achievement=14744, criteria=49856,
        quest=60884,
        npc=170634,
        loot={
            {183066,quest=63160,}, -- Korrath's Grimoire: Aleketh
            {183067,quest=63161,}, -- Korrath's Grimoire: Belidir
            {183068,quest=63162,}, -- Korrath's Grimoire: Gyadrek
            183187, -- Shadeweaver Incantation
        },
        level=60,
    },
    [35954155] = { -- Soulforger Rhovus
        achievement=14744, criteria=49857,
        quest=60834,
        npc=166398,
        loot={
            183141, -- Stygic Magma
        },
        level=60,
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
        level=60,
    },
    [27407150] = { -- Thanassos
        achievement=14744, criteria=49859,
        quest=60914,
        npc=170731,
        --loot={},
        level=60,
    },
    [37656590] = { -- Yero the Skittish
        achievement=14744, criteria=49860,
        quest=61568,
        npc=172862,
        --loot={},
        note="Follow until it becomes hostile",
        level=60,
    },

    -- It's About Sending A Message
    [20803925] = path{
        label=CAVE,
        achievement=14660,
        criteria={49485,51058},
        quest={61136,63044},
        level=60,
    },
    [28204450] = { -- Agonix
        achievement=14660, criteria=49485,
        quest=61136, -- 63380
        npc=169102,
        --loot={},
        level=60,
    },
    [34107455] = { -- Akros
        achievement=14660, criteria=49487,
        quest=60920,
        npc=170787,
        --loot={},
        level=60,
    },
    [28702515] = { -- Cyrixia
        achievement=14660, criteria=49484,
        quest=61346,
        npc=168693,
        loot={
            183070, -- Mawsworn Orders (quest: 63164)
        },
        level=60,
    },
    [25851480] = { -- Dartanos
        achievement=14660, criteria=49476,
        quest=59230,
        npc=162452,
        --loot={},
        level=60,
    },
    [19205740] = { -- Dath Rezara
        achievement=14660, criteria=50410,
        quest=61140,
        npc=162844,
        loot={
            183066, -- Korrath's Grimoire: Aleketh
            183067, -- Korrath's Grimoire: Belidir
            183068, -- Korrath's Grimoire: Gyadrek
        },
        level=60,
    },
    [32002120] = { -- Drifting Sorrow
        achievement=14660, criteria=49475,
        quest=59183,
        npc=158314,
        --loot={},
        level=60,
    },
    [60456480] = { -- Houndmaster Vasanok
        achievement=14660, criteria=49490,
        quest=62209,
        npc=172523,
        --loot={},
        level=60,
    },
    [20802970] = { -- Huwerath
        achievement=14660, criteria=49481,
        quest=58918,
        npc=162965,
        -- loot={},
        level=60,
    },
    [30846866] = { -- Krala
        achievement=14660, criteria=49486,
        quest=63381,
        npc=170692,
        --loot={},
        level=60,
    },
    [27301755] = { -- Malevolent Stygia
        achievement=14660, criteria=49488,
        quest=61125,
        npc=171316,
        --loot={},
        level=60,
    },
    [38652880] = { -- Odalrik
        achievement=14660, criteria=50408,
        quest=62618, -- 63413?
        npc=172207,
        loot={
            {183061,quest=63158,}, -- Wailing Coin
            178561, -- Runecarver's Memory
        },
        level=60,
    },
    [25354875] = { -- Orrholyn <Lord of Bloodletting>
        achievement=14660, criteria=49480,
        quest=60991,
        npc=162845,
        --loot={},
        level=60,
    },
    [22654225] = { -- Ratgusher
        achievement=14660, criteria=51058,
        quest=63044, -- 63388 ??
        npc=175821,
        -- loot={},
        level=60,
    },
    [26153745] = { -- Razkazzar
        achievement=14660, criteria=49479,
        quest=60992,
        npc=162829,
        --loot={},
        level=60,
    },
    [55606320] = { -- Sanngror the Torturer
        achievement=14660, criteria=49489,
        quest=62210,
        npc=172521,
        loot={
            {183410,pet=3040,}, -- Sharpclaw
        },
        level=60,
    },
    [55806755] = path{label=CAVE, achievement=14660, criteria=49489, quest=62210,},
    [61757795] = { -- Skittering Broodmother
        achievement=14660, criteria=49491,
        quest=62211,
        npc=172524,
        --loot={},
        level=60,
    },
    [59258000] = path{label=CAVE, achievement=14660, criteria=49491, quest=62211,},
    [36253745] = { -- Soulsmith Yol-Mattar
        achievement=14660, criteria=49482,
        quest=59441,
        npc=165047,
        --loot={},
        level=60,
    },
    [36854480] = { -- Stygian Incinerator
        achievement=14660, criteria=50409,
        quest=62539,
        npc=156203,
        --loot={},
        level=60,
    },
    [40705960] = { -- Valis the Cruel
        achievement=14660, criteria=49492,
        quest=61728,
        npc=173086,
        --loot={},
        level=60,
    },

    -- non-achievement
    --[] = { -- Warren Mongrel
    --    quest=61124,
    --    npc=165973,
    --}
})

-- lore:
ns.RegisterPoints(1543, {
    [35754555] = { -- Tormentor's Notes
        achievement=14761, criteria=49914,
        quest=63163,
        loot={
            183069, -- Tormentor's Notes
        },
        inbag=183069,
        minimap=true,
        note="Look for the body of {npc:173811}",
    },
    [19353340] = { -- Words of the Warden
        achievement=14761, criteria=49910,
        quest=63159,
        loot={
            183063, -- Word of the Warden
        },
        inbag=183063,
        minimap=true,
        note="Find a Paper Scrap hidden behind some junk",
    },
    [27702020] = ns.path{ -- To: Box of Torments
        achievement=14761, criteria=49908,
        quest=63157,
        onquest=63157,
    },
})

ns.RegisterPoints(1822, { -- Tremaculum
    [73101660] = { -- Box of Torments
        achievement=14761, criteria=49908,
        quest=63157,
        onquest=63157,
        loot={
            183060, -- Box of Torments
        },
        note="Under the Tremaculum, open {npc:173837}",
    }
})

ns.RegisterPoints(1543, {
    [42384216] = {
        label="Waystone to Oribos",
        atlas="adventures-32x32", scale=1.2,
        minimap=true,
    },
})

local riftstone = ns.nodeMaker{
    label="{npc:174962}",
    atlas="WarlockPortalHorde", scale=1.3,
    active={quest=63177},
    note="Buy access from {npc:162804}"
}
-- Chaotic Riftstones
ns.RegisterPoints(1543, {
    -- First pair
    [19204780] = riftstone{route=25201785,},
    [25201785] = riftstone{route={19204780,25201785,r=0.75,g=0,b=0},},
    -- Second pair
    [23453120] = riftstone{atlas="WarlockPortalAlliance",route=34804360,},
    [34804360] = riftstone{atlas="WarlockPortalAlliance",route={23453120,34804360,r=0,g=0,b=0.75},},
})
