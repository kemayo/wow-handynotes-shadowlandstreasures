local myname, ns = ...

local path = ns.path

ns.RegisterPoints(1525, { -- Revendreth
    [37706920] = {
        achievement=14314, criteria=50076, -- Lost Quill
        quest=61990,
        loot={
            182613, -- Refilling Inkwell
        },
        note="Grab a {item:182475:Forbidden Ink} from the library below",
    },
    [38404430] = {
        achievement=14314, criteria=50077, -- Stylish Parasol
        --quest=,
        loot={
            182694, -- Stylish Black Parasol
        },
        note="On top of the castle walls, can be hard to reach",
    },
    [57304330] = {
        achievement=14314, criteria=50078, -- The Count
        quest=62063,
        loot={
            182612, -- The Count's Pendant
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
            182780 -- Muckpool Cookpot
        },
        note="Inside the castle ruins. Requires 30 {currency:1820:Infused Ruby}",
    },
    [63007210] = {
        achievement=14314, criteria=50082, -- Taskmaster's Trove
        quest=62199,
        loot={
            183986, -- Bondable Sinstone
        },
        note="Use the Ingress and Egress Rites scroll at the area, then dodge orbs",
    },
    [47505530] = {
        achievement=14314, criteria=50084, -- Forbidden Chamber
        quest=62243,
        loot={
            184075, -- Stonewrought Sentry
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
            179393, -- Mirror of Envious Dreams
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
            180993, -- Bat Visage Bobber
        },
    },
    [53104290] = {
        quest=62050, -- progress:62038, 62042, 62047, 62049, 62048; daily-done is 62107
        loot={
            182614, -- Blanchy's Reins
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
