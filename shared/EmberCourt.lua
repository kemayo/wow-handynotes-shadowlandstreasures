local myname, ns = ...

local COURT = {
    atlas="EmberCourt-32x32",
    requires=ns.conditions.Covenant(Enum.CovenantType.Venthyr),
    active=ns.conditions.QuestIncomplete(61526), -- the ember court daily
    group="embercourt",
}

ns.RegisterPoints(ns.REVENDRETH, {
    -- Necrolord
    [07507000] = {
        label="{faction:2450:Alexandros Mograine}",
        loot={
            -- Extravagant
            181330, -- Marrowfused Warglaives
            -- 181616, -- A Treatise on the Great Battles of Lordaeron
            -- Substantial
            {183860, quest=62208}, -- The Death March: An Introduction to Maldraxxi Etiquette
            -- Tribute
            -- 181615, -- Marching an Army
            {181300, mount=true}, -- Gruesome Flayedwing
            {183844, quest=62597}, -- A Letter of Introduction, The Bonesmith
            -- Trifling
            181325, -- Marrowfused Dagger
            -- Disgruntled
            181331, -- Marrowfused Shield
            181327, -- Spineforged Tenderizer
            -- 181617, -- Command the Field
        },
        note="Enjoys Safe + Humble",
    },
    [10007000] = {
        label="{faction:2446:Baroness Vashj},",
        loot={
            -- Extravagant
            181330, -- Marrowfused Warglaives
            {183860, quest=62208}, -- The Death March: An Introduction to Maldraxxi Etiquette
            -- 178894, -- Decree: Baroness Vashj's Boon
            -- Substantial
            -- 178893, -- Decree: Baroness Vashj's Esteem
            -- Tribute
            {181264, pet=true}, -- Plaguelouse Larva
            -- 178892, -- Decree: Baroness Vashj's Favo
            -- Trifling
            -- Disgruntled
            181320, -- Bonejowl Ballista
            181322, -- Bonebound Tome
            181327, -- Spineforged Tenderizer
        },
        note="Enjoys Dangerous + Decadent + Exciting",
    },
    [12507000] = {
        label="{faction:2457:Grandmaster Vole},",
        loot={
            -- Extravagant
            181330, -- Marrowfused Warglaives
            {181761, quest=62628}, -- The Grandmaster's Voucher
            -- Substantial
            {181765, quest=62626}, -- Marcel Mullby's Marker
            -- Tribute
            {183860, quest=62208}, -- The Death March: An Introduction to Maldraxxi Etiquette
            -- 181767, -- Small Coin Purse
            {181168, pet=true}, -- Corpulent Bonetusk
            -- Trifling
            -- Disgruntled
            181328, -- Marrowfused Sword
            181327, -- Spineforged Tenderizer
            181329, -- Marrowfused Claymore
        },
        note="Enjoys Clean + Formal",
    },
    [15007000] = {
        label="{faction:2461:Plague Deviser Marileth},",
        loot={
            -- Extravagant
            181330, -- Marrowfused Warglaives
            181323, -- Blightclutched Greatstaff
            -- 181621, -- Hyper-Reactive Slime Sample
            -- Substantial
            -- 181622, -- Slightly Irradiated Slime Sample
            -- Tribute
            {183860, quest=62208}, -- The Death March: An Introduction to Maldraxxi Etiquette
            181327, -- Spineforged Tenderizer
            -- 181623, -- Fluorescent Slime Sample
            {181437, quest=61453}, -- Training Dummies
            -- Trifling
            181321, -- Gem-Crowned Wand
            -- Disgruntled
            181326, -- Bloodstained Hacksaw
        },
        note="Enjoys Messy",
    },
    -- Night Fae
    [07507400] = {
        label="{faction:2454:Choofa},",
        loot={
            -- Extravagant
            179605, -- Elderwood Barrier
            -- 178899, -- Treecorn
            -- 178902, -- Rejuvenating Sprig
            -- 178901, -- Vineseed
            -- Substantial
            -- 183883, -- Bulging Collection of Random Bits
            {177233, quest=59684}, -- Bounding Shroom Seeds
            -- Tribute
            {183861, quest=62206}, -- The Winter Cycle: A Collection of Ardenweald Etiquettes and Parables
            -- 183882, -- Collection of Random Bits
            -- Trifling
            -- Disgruntled
            179499, -- Nightwillow Barb
            179548, -- Elderwood Gavel
            179563, -- Heartwood Stem
        },
        note="Enjoys Exciting",
    },
    [10007400] = {
        label="{faction:2456:Droman Aliothe},",
        loot={
            -- Extravagant
            179605, -- Elderwood Barrier
            179514, -- Ripvine Saber
            -- 172043, -- Feast of Gluttonous Hedonism
            -- Substantial
            {183861, quest=62206}, -- The Winter Cycle: A Collection of Ardenweald Etiquettes and Parables
            -- whole bunch of cooked foods
            -- Tribute
            {180628, pet=true}, -- Pearlwing Heron
            {181438, quest=61454}, -- The Wild Drum
            -- whole bunch of cooked foods
            -- Trifling
            -- Disgruntled
            179538, -- Grove Warden's Maul
            179548, -- Elderwood Gavel
        },
        note="Enjoys Relaxing",
    },
    [12507400] = {
        label="{faction:2451:Hunt-Captain Korayn},",
        loot={
            -- Extravagant
            179509, -- Grove Warden's Edge
            -- 181618, -- Gorm Quiche Platter
            179605, -- Elderwood Barrier
            {183861, quest=62206}, -- The Winter Cycle: A Collection of Ardenweald Etiquettes and Parables
            -- Substantial
            -- 181620, -- Hard Boiled Gorm Egg
            -- Tribute
            {180726, mount=true}, -- Pale Acidmaw
            {183846, quest=62599}, -- Orders to Gormsmith Cavina
            -- 181619, -- Poached Gorm Eggs
            -- Trifling
            179585, -- Nightwillow Shortbow
            179548, -- Elderwood Gavel
            -- Disgruntled
            179533, -- Grove Warden's Harvester
        },
        note="Enjoys Dangerous + Casual",
    },
    [15007400] = {
        label="{faction:2447:Lady Moonberry},",
        loot={
            -- Extravagant
            179605, -- Elderwood Barrier
            {183861, quest=62206}, -- The Winter Cycle: A Collection of Ardenweald Etiquettes and Parables
            -- 181613, -- Decree: Lady Moonberry's Boon
            -- Substantial
            -- 181607, -- Decree: Lady Moonberry's Esteem
            -- Tribute
            -- 181598, -- Decree: Lady Moonberry's Favor
            {177232, quest=59683}, -- Bewitched Wardrobe
            {180639, pet=true}, -- Dusty Sporeflutterer
            -- Trifling
            -- Disgruntled
            179516, -- Songwood Staff
            179548, -- Elderwood Gavel
        },
        note="Enjoys Messy + Exciting + Casual",
    },
    -- Venthyr
    [07507800] = {
        label="{faction:2455:Cryptkeeper Kassir},",
        loot={
            -- Extravagant
            180964, -- Ember Court Barrier
            {183862, quest=62205}, -- A Proper Soiree: A detailed account of Venthyr Etiquette by Theotar
            180956, -- Axeblade Blunderbuss
            -- Assorted sinstones
            -- Substantial
            180957, -- Batwing Glaive
            -- 172957, -- Atonement Crypt Key
            -- Tribute
            183713, -- Kassir's Crypt Mantle
            -- Trifling
            180963, -- Crypt Keeper's Vessel
            -- Disgruntled
            180954, -- Crypt Watcher's Spire
        },
        note="Enjoys Formal",
    },
    [10007800] = {
        label="{faction:2453:Rendle and Cudgelface},",
        loot={
            -- Extravagant
            180964, -- Ember Court Barrier
            -- 181780, -- An Undelivered Tradesman's Shipment
            -- Substantial
            181779, -- A "Wrapped" Weapon (16 appearances...)
            180957, -- Batwing Glaive
            -- Tribute
            {183862, quest=62205}, -- A Proper Soiree: A detailed account of Venthyr Etiquette by Theotar
            180959, -- Dredger Anklebiter
            {177237, quest=59688}, -- Dredger Party Supplies
            {183848, quest=62601}, -- Hastily Scrawled Note to Forgy
            -- 180707, -- Sticky Muck
            -- 180677, -- Discarded Medal of Valor
            -- 180710, -- Pocket Repair Kit
            -- 181778, -- Sack of Shinies
            -- Trifling
            180962, -- Sterling-Silver Cudgel
            180956, -- Axeblade Blunderbuss
            -- Disgruntled
            {181315, pet=true}, -- Bloodfeaster Spiderling
        },
        note="Enjoys Messy + Relaxing",
    },
    [12507800] = {
        label="{faction:2460:Stonehead},",
        loot={
            -- Extravagant
            180964, -- Ember Court Barrier
            -- 181771, -- Stonehead's Best Bud Bracelet
            -- Substantial
            180956, -- Axeblade Blunderbuss
            179301, -- Large Muck Stained Blade
            179302, -- Muck-Encrusted Dagger
            -- Tribute
            {183862, quest=62205}, -- A Proper Soiree: A detailed account of Venthyr Etiquette by Theotar
            183709, -- Bronze-Bound Sinstone
            {180603, pet=true}, -- Violet Dredwing Pup
            {181440, quest=61456}, -- Slippery Muck
            -- 180689, -- Pocket Embers
            -- 178128, -- Pouch of Shinies
            -- Trifling
            -- Disgruntled
            180960, -- Shiny-Metal Topped Basher
            180957, -- Batwing Glaive
            180955, -- Stonewing Halberd
        },
        note="Enjoys Casual",
    },
    [15007800] = {
        label="{faction:2449:The Countess},",
        loot={
            -- Extravagant
            180964, -- Ember Court Barrier
            -- 181566, -- Decree: The Countess's Boon
            -- Substantial
            {183862, quest=62205}, -- A Proper Soiree: A detailed account of Venthyr Etiquette by Theotar
            {182209, mount=true}, -- Desire's Battle Gargon
            180961, -- Silver-Bladed Ritual Dagger
            180957, -- Batwing Glaive
            180956, -- Axeblade Blunderbuss
            -- 181567, -- Decree: The Countess's Esteem
            -- Tribute
            180958, -- Redelev House Foil
            {181436, quest=61452}, -- Vanity Mirror
            -- 181568, -- Decree: The Countess's Favor
            -- Trifling
            -- Disgruntled
            {182696, toy=true}, -- The Countess's Parasol
        },
        note="Enjoys Decadent + Relaxing + Formal",
    },
    -- Kyrian
    [07508200] = {
        label="{faction:2458:Kleia and Pelagos},",
        loot={
            -- Extravagant
            181230, -- Pugilist's Chakram
            -- 11x green weapons
            -- Substantial
            -- Anything from the sets: Shimmerbough Armor (Recolor),  Nightcloaked Armor (Recolor), Dreamthorn Armor (Recolor), Grove Warden's Armor (Recolor)
            -- Tribute
            {183863, quest=62207}, -- The Proper Path and Etiquette for Aspirants
            {180814, pet=true}, -- Sable
            181232, -- Cupbearer's Claymore
            -- Trifling
            181233, -- Bellringer's Hammer
            181226, -- Bronze Dual-Bladed Glaive
            181225, -- Crossbow of Contemplative Calm
            -- Disgruntled
        },
        note="Enjoys Humble",
    },
    [10008200] = {
        label="{faction:2448:Mikanikos},",
        loot={
            -- Extravagant
            181230, -- Pugilist's Chakram
            {183863, quest=62207}, -- The Proper Path and Etiquette for Aspirants
            181226, -- Bronze Dual-Bladed Glaive
            -- 181563, -- Decree: Mikanikos's Boon
            -- Substantial
            {181317, mount=true}, -- Dauntless Duskrunner
            {181439, quest=61455}, -- Protective Braziers
            181227, -- Bronze Ceremonial Targe
            -- 181564, -- Decree: Mikanikos's Esteem
            -- Tribute
            181232, -- Cupbearer's Claymore
            -- 181565, -- Decree: Mikanikos's Favor
            -- Trifling
            -- Disgruntled
            181235, -- Final Arbiter's Gavel
        },
        note="Enjoys Clean + Safe + Humble",
    },
    [12508200] = {
        label="{faction:2452:Polemarch Adrestes},",
        loot={
            -- Extravagant
            181230, -- Pugilist's Chakram
            181231, -- Broadbladed Severer
            {183863, quest=62207}, -- The Proper Path and Etiquette for Aspirants
            181226, -- Bronze Dual-Bladed Glaive
            {183845, quest=62598}, -- A Short Letter to Forgelite Sophone
            -- 178897, -- Stalwart Pauldron of Resolve
            -- Substantial
            {177238, quest=59689}, -- Generous Gift
            181226, -- Bronze Dual-Bladed Glaive
            181232, -- Cupbearer's Claymore
            181228, -- Temple Guard's Partisan
            -- 178896, -- Stalwart Gloves of Resolve
            -- Tribute
            -- 178895, -- Stalwart Vambraces of Resolve
            -- Trifling
            -- Disgruntled
        },
        note="Enjoys Clean + Formal",
    },
    [15008200] = {
        label="{faction:2459:Sika},",
        loot={
            -- Extravagant
            181230, -- Pugilist's Chakram
            -- 183886, -- Sika's Rare Ore Pouch
            -- Substantial
            -- 183885, -- Sika's Spare Ore Pouch
            -- Tribute
            {183863, quest=62207}, -- The Proper Path and Etiquette for Aspirants
            {177230, quest=59681}, -- Anima-Infused Water
            {180815, pet=true}, -- Brightscale Hatchling
            -- 183884, -- Pocketful of Assorted Nuggets
            -- Trifling
            -- Disgruntled
            181229, -- Tranquil's Censer
            181232, -- Cupbearer's Claymore
            181226, -- Bronze Dual-Bladed Glaive
        },
        note="Enjoys Clean",
    },
}, COURT)
