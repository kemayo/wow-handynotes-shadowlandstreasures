local myname, ns = ...

local path = ns.path

ns.RegisterPoints(1525, { -- Revendreth
    [37706920] = {
        achievement=14314, criteria=50076, -- Lost Quill
        quest=61990,
        loot={
            {182613, pet=3008}, -- Refilling Inkwell
        },
        note="Grab a {item:182475:Forbidden Ink} from the library below",
    },
    [38404430] = {
        achievement=14314, criteria=50077, -- Stylish Parasol
        quest=61999,
        loot={
            {182694, toy=true}, -- Stylish Black Parasol
        },
        note="On top of the castle walls, can be hard to reach",
    },
    [57304330] = {
        achievement=14314, criteria=50078, -- The Count
        quest=62063,
        loot={
            {182612, pet=3009}, -- The Count's Pendant
        },
        note="Requires 99 {currency:1820:Infused Ruby}",
    },
    [79903700] = {
        achievement=14314, criteria=50079, -- Rapier of the Fearless
        quest=62156,
        loot={
            182689, -- Rapier of the Fearless
        },
        note="On the ground. An enemy will spawn when interacting with the treasure. Kill the mob for the sword",
    },
    [70106000] = {
        achievement=14314, criteria=50080, -- Vrytha's Dredglaive
        quest=62164,
        loot={
            177807, -- Vyrtha's Dredglaive
        },
        note="Under a bridge",
    },
    [29703720] = {
        achievement=14314, criteria=50081, -- Makeshift Muckpool
        quest=62198,
        loot={
            {182780, toy=true}, -- Muckpool Cookpot
        },
        note="Inside the castle ruins. Requires 30 {currency:1820:Infused Ruby}",
    },
    [63007210] = {
        achievement=14314, criteria=50082, -- Taskmaster's Trove
        quest=62199,
        loot={
            {183986, toy=true}, -- Bondable Sinstone
        },
        note="Use the Ingress and Egress Rites scroll at the area, then dodge orbs",
    },
    [47505530] = {
        achievement=14314, criteria=50084, -- Forbidden Chamber
        quest=62243,
        loot={
            {184075, toy=true}, -- Stonewrought Sentry
        },
        note="Take the {spell:314749:Anima Canister} inside the building and drain anima from the {npc:173838:Silent Observer}s to reach the treasure",
    },
    [31055510] = {
        achievement=14314, criteria=50895, -- Smuggled Cache
        quest=59889,
        loot={
            182738, -- Bundle of Smuggled Parasol Components
        },
        note="Rewards 35+6 {currency:1820:Infused Ruby}, after {quest:62189:Parasol Components}",
    },
    [69357799] = {
        achievement=14314, criteria=50896, -- Chest of Envious Dreams
        quest=59833,
        loot={
            {179393, toy=true}, -- Mirror of Envious Dreams
        },
    },
    [64197265] = {
        achievement=14314, criteria=50897, -- Filcher's Prize
        quest=59883,
        loot={
            179392, -- Orb of Burgeoning Ambition
        },
        note="Jump down from the North",
    },
    [68456446] = {
        achievement=14314, criteria=50898, -- Wayfarer's Abandoned Spoils
        quest=59884,
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
        quest=59885,
        -- loot={},
        note="Outer wall, jump from near the flight master",
    },
    [46395817] = {
        achievement=14314, criteria=50900, -- Fleeing Soul's Bundle
        quest=59886,
        -- loot={},
        note="Outer wall",
    },
    [74975698] = {
        achievement=14314, criteria=50901, -- Gilded Plum Chest
        quest=61990,
        loot={
            179390, -- Tantalizingly Large Golden Plum
        },
        note="Kill the {npc:166680:Greedy Soul} wandering on the road",
    },
    [51815963] = {
        achievement=14314, criteria=50902, -- Abandoned Curios
        quest=59888,
        loot={
            182744, -- Ornate Belt Buckle
        },
    },
})

-- non-achievement treasures
ns.RegisterPoints(1525, {
    [73597539] = {
        quest=62196,
        label="Forgotten Angler's Rod",
        loot={
            {180993, toy=true}, -- Bat Visage Bobber
        },
    },
    -- Loyal Gorger
    [59305700] = {
        label="{npc:173499}",
        icon=3601543,
        quest={
            61839, -- Nipping at the Undergrowth
            61840, -- Vineroot on the Menu
            61842, -- Vineroot Will Not Do
            61844, -- Hungry Hungry Gorger
            62044, -- Standing Toe to Toe
            62045, -- Ready for More
            62046  -- A New Pack
        },
        hide_before=58259, -- Worldedge Gorger
        loot={
            {182589, mount=1391}, -- Loyal Gorger
        },
        note="Kill {npc:160821}, do 7 days of dailies for {npc:173499}, get a mount",
    },
    -- Blanchy
    [53104290] = {
        quest=62050, -- progress:62038, 62042, 62047, 62049, 62048; daily-done is 62107
        loot={
            {182614, mount=1414}, -- Blanchy's Reins
        },
        atlas="stablemaster",scale=1.2,
        note="Nurse {npc:173468:Dead Blanchy} over the course of several days. You need items from all over the world:\n"..
            "Day 1: 8x {item:182581} from Westfall\n"..
            "Day 2: {item:182585} from {npc:173570} in Darkhaven\n"..
            "Day 3: 4x {item:182595} from the roads around Darkhaven\n"..
            "Day 4: Fill {item:182620} near {npc:173570} with water from Bastion or Ardenweald\n"..
            "Day 5: {item:182597} from {npc:171808} near the Night Market\n"..
            "Day 6: 3x {item:179271} from {npc:167815} by the Hole in the Wall\n",
    },
})

-- Rares

ns.RegisterPoints(1525, {
    [53257300] = { -- Amalgamation of Filth
        achievement=14310, criteria=48814,
        quest=59854,
        npc=166393,
        loot={
            183729, -- Filth-Splattered Headcover
        },
        note="When {quest:57443:Dirty Job Demolition Detail} world quest is up, open a Rubbish Box and use {spell:324115} into the water",
    },
    [25304850] = { -- Amalgamation of Light
        achievement=14310, criteria=48811,
        quest=59584,
        npc=164388,
        loot={
            179924, -- Light-Infused Jacket
            179926, -- Light-Infused Tunic
            179653, -- Light-Infused Hauberk
            179925, -- Light-Infused Breastplate
            180688, -- Infused Remnant of Light
        },
        note="Move 3x Mirror Traps to summon",
    },
    [65802915] = { -- Amalgamation of Sin
        achievement=14310, criteria=50029,
        quest=60836,
        npc=170434,
        loot={
            183730, -- Sinstone-Studded Greathelm
        },
        note="During {quest:60656:Summon Your Sins} choose Catalyst of Power",
    },
    [35807050] = { -- Azgar
        achievement=14310, criteria=48816,
        quest=59893,
        npc=166576,
        loot={
            183731, -- Smolder-Tempered Legplates
        },
    },
    [35003230] = { -- Bog Beast
        achievement=14310, criteria=48818,
        quest=59823,
        npc=166292,
        loot={
            {180588, pet=2896}, -- Bucket of Primordial Sludge
        },
        note="Up during {quest:59808}",
    },
    [66555945] = { -- Endlurker
        achievement=14310, criteria=48810,
        quest=59582,
        npc=165206,
        loot={
            179927, -- Glowing Endmire Stinger
        },
        note="Use {spell:321827} to summon",
    },
    [65406030] = path{achievement=14310, criteria=48810,quest=59582,},
    [37104740] = { -- Executioner Aatron
        achievement=14310, criteria=48819,
        quest=59913,
        npc=166710,
        loot={
            180696, -- Legion Wing Insignia
            183737, -- Aatron's Stone Girdle
        },
    },
    [43055185] = { -- Executioner Adrastia
        achievement=14310, criteria=48807,
        quest=58441,
        npc=161310,
        loot={
            180502, -- Adrastia's Executioner Gloves
        },
        note="Flies around the area",
    },
    [62504715] = { -- Famu the Infinite
        achievement=14310, criteria=48815,
        quest=59869,
        npc=166521,
        loot={
            {180582, mount=1379}, -- Endmire Flyer Tether
            183739, -- Endmire Wristwarmers
        },
        note="Talk to {npc:166483}",
    },
    [32651545] = { -- Forgemaster Madalav
        quest=61618,
        npc=159496,
        loot={
            180939, -- Mantle of the Forgemaster's Dark Blades
        },
        note="A Venthyr player channeling Dominance Keep must click the hammer",
    },
    [20485300] = { -- Grand Arcanist Dimitri
        achievement=14310, criteria=48821,
        quest=60173,
        npc=167464,
        loot={
            180708, -- Mirror of Despair
            180503, -- Grand Arcanist's Soulblade
        },
        note="Kill {npc:167467}",
    },
    [45857920] = { -- Harika the Horrid
        quest=59612,
        npc=165290,
        loot={
            183720, -- Dredbatskin Jerkin
            {180461, mount=1310}, -- Horrid Brood Dredwing
        },
        note="A Venthyr player channeling Wanecrypt Hill must fire the Dredterror Ballista; fetch the bolt from 42.7 73.4",
    },
    [42757340] = {
        quest=59612,
        loot={176397}, -- Dredhollow Bolt
        note="Be Venthyr, take to {npc:165327} at 46.3, 77.7",
    },
    [52005180] = { -- Hopecrusher
        achievement=14310, criteria=48817,
        quest=59900,
        npc=166679,
        loot={
            {180581, mount=1298}, -- Hopecrusher Gargon
        },
    },
    [61707950] = { -- Huntmaster Petrus
        achievement=14310, criteria=48820,
        quest=60022,
        npc=166993,
        loot={
            180874, -- Gargon Whistle
            180705, -- Gargon Training Manual (hunter)
            180405, -- Rusty Gargon Chain
        },
    },
    [21803590] = { -- Innervus
        achievement=14310, criteria=48801,
        quest=58210,
        npc=160640,
        loot={
            183735, -- Rogue Sinstealer's Mantle
        },
        note="Get a {item:177223} from {npc:160375}",
    },
    [68008180] = { -- Leeched Soul
        achievement=14310, criteria=48809,
        quest=59580,
        npc=165152,
        loot={
            183736, -- Pride Resistant Handwraps
        },
        note="Finish the crypt event",
    },
    [76006160] = { -- Lord Mortegore
        achievement=14310, criteria=48808,
        quest=58633,
        npc=161891,
        loot={
            180501, -- Skull-Formed Headcage
        },
        note="Use {item:174378} from nearby mobs to activate 4x {npc:161870}",
    },
    [49003490] = { -- Manifestation of Wrath
        achievement=14310, criteria=48822,
        quest=60729,
        npc=170048,
        loot={
            {180585, pet=2897}, -- Bottled Up Rage
        },
        note="During {quest:60654} bring ~10x {npc:169916} to {npc:169917}",
    },
    [38306915] = { -- Scrivener Lenua
        achievement=14310, criteria=48800,
        quest=58213,
        npc=160675,
        loot={
            {180587, pet=2893}, -- Animated Tome
        },
        note="Bring 4x {npc:160753} to the library",
    },
    [67453050] = { -- Sinstone Hoarder
        achievement=14310, criteria=50030,
        quest=62252,
        npc=162481,
        loot={
            183732, -- Sinstone-Linked Greaves
        },
        note="Use the Catacombs Cache inside a broken golem",
    },
    [34055555] = { -- Sire Ladinas
        achievement=14310, criteria=48806,
        quest=58263,
        npc=160857,
        loot={
            {180873, toy=true}, -- Smolderheart
        },
        note="Use {spell:313065} on {npc:157733}",
    },
    [78954975] = { -- Soulstalker Doina
        achievement=14310, criteria=48799,
        quest=58130,
        npc=160392,
        loot={
            180692, -- Box of Stalker Traps
        },
        note="Follow when it runs away",
    },
    [31302325] = { -- Stonefist
        achievement=14310, criteria=48803,
        quest=62220,
        npc=159503,
        loot={
            180488, -- Fist-Forged Breastplate
        },
    },
    [66507080] = { -- Tollkeeper Varaboss
        achievement=14310, criteria=48812,
        quest=59595,
        npc=165253,
        loot={
            179363, -- 'Misplaced' Anima Tolls
        },
    },
    [43007910] = { -- Tomb Burster
        achievement=14310, criteria=48802,
        quest=56877,
        npc=155779,
        loot={
            {180584, pet=2891}, -- Blushing Spiderling
        },
        note="Destroy {npc:155769} near {npc:155777}",
    },
    [38607200] = { -- Worldedge Gorger
        achievement=14310, criteria=48805,
        quest=58259,
        npc=160821,
        loot={
            180583, -- Impressionable Gorger Spawn
        },
        note="Use {item:173939} from nearby mobs near braziers",
    },
})
