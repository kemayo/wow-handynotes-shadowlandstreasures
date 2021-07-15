local myname, ns = ...

ns.defaults = {
    profile = {
        default_icon = "VignetteLoot",
        show_on_world = true,
        show_on_minimap = false,
        show_junk = false,
        show_npcs = true,
        show_treasure = true,
        show_routes = true,
        upcoming = true,
        found = false,
        collectablefound = true,
        achievedfound = true,
        questfound = true,
        icon_scale = 1.0,
        icon_alpha = 1.0,
        icon_item = false,
        tooltip_pointanchor = false,
        tooltip_item = true,
        tooltip_questid = false,
        groupsHidden = {},
        zonesHidden = {},
        achievementsHidden = {},
        worldmapoverlay = true,
    },
    char = {
        hidden = {
            ['*'] = {},
        },
    },
}

ns.options = {
    type = "group",
    name = myname:gsub("HandyNotes_", ""),
    get = function(info) return ns.db[info[#info]] end,
    set = function(info, v)
        ns.db[info[#info]] = v
        ns.HL:Refresh()
    end,
    args = {
        icon = {
            type = "group",
            name = "Icon settings",
            inline = true,
            order = 10,
            args = {
                desc = {
                    name = "These settings control the look and feel of the icon.",
                    type = "description",
                    order = 0,
                },
                icon_scale = {
                    type = "range",
                    name = "Icon Scale",
                    desc = "The scale of the icons",
                    min = 0.25, max = 2, step = 0.01,
                    order = 20,
                },
                icon_alpha = {
                    type = "range",
                    name = "Icon Alpha",
                    desc = "The alpha transparency of the icons",
                    min = 0, max = 1, step = 0.01,
                    order = 30,
                },
                show_on_world = {
                    type = "toggle",
                    name = "World Map",
                    desc = "Show icons on world map",
                    order = 40,
                },
                show_on_minimap = {
                    type = "toggle",
                    name = "Minimap",
                    desc = "Show all icons on the minimap",
                    order = 50,
                },
                default_icon = {
                    type = "select",
                    name = "Default Icon",
                    values = {
                        VignetteLoot = CreateAtlasMarkup("VignetteLoot", 20, 20) .. " Chest",
                        VignetteLootElite = CreateAtlasMarkup("VignetteLootElite", 20, 20) .. " Chest with star",
                        Garr_TreasureIcon = CreateAtlasMarkup("Garr_TreasureIcon", 20, 20) .. " Shiny chest",
                    },
                    order = 60,
                },
                worldmapoverlay = {
                    type = "toggle",
                    name = "Add button to world map",
                    desc = "Put a button on the world map for quick access to these options",
                    set = function(info, v)
                        ns.db[info[#info]] = v
                        WorldMapFrame:RefreshOverlayFrames()
                    end,
                    order = 70,
                },
            },
        },
        display = {
            type = "group",
            name = "What to display",
            inline = true,
            order = 20,
            args = {
                icon_item = {
                    type = "toggle",
                    name = "Use item icons",
                    desc = "Show the icons for items, if known; otherwise, the achievement icon will be used",
                    order = 0,
                },
                tooltip_item = {
                    type = "toggle",
                    name = "Use item tooltips",
                    desc = "Show the full tooltips for items",
                    order = 10,
                },
                tooltip_pointanchor = {
                    type = "toggle",
                    name = "Anchor tooltips to points",
                    desc = "Whether to anchor the tooltips to the individual points or to the map",
                    order = 15,
                },
                -- the "found" cluster
                found = {
                    type = "toggle",
                    name = "Show found",
                    desc = "Show waypoints for items you've already found?",
                    order = 20,
                },
                achievedfound = {
                    type = "toggle",
                    name = "Count achievement-complete as found",
                    desc = "For nodes which are repeatable on a daily quest *and* tied to an achievement, only consider the achievement",
                    order = 21,
                },
                collectablefound = {
                    type = "toggle",
                    name = "Count collectables as found",
                    desc = "For account-level items like mounts, pets, and toys, count them being known as this being found",
                    order = 22,
                },
                questfound = {
                    type = "toggle",
                    name = "Count tracking quest as found",
                    desc = "Lots of things have a hidden quest that tracks whether you've looted them this day / week /ever and thus whether you can loot them again",
                    order = 23,
                },
                upcoming = {
                    type = "toggle",
                    name = "Show inaccessible",
                    desc = "Show waypoints for items you can't get yet (max level, gated quests, etc); they'll be tinted red to indicate this",
                    order = 25,
                },
                show_npcs = {
                    type = "toggle",
                    name = "Show NPCs",
                    desc = "Show rare NPCs to be killed, generally for items or achievements",
                    order = 30,
                },
                show_treasure = {
                    type = "toggle",
                    name = "Show treasure",
                    desc = "Show treasure that can be looted",
                    order = 30,
                },
                show_routes = {
                    type = "toggle",
                    name = "Show routes",
                    desc = "Show relevant routes between points ",
                    disabled = function() return not ns.RouteWorldMapDataProvider end,
                    order = 31,
                },
                show_junk = {
                    type = "toggle",
                    name = "Show non-achievement",
                    desc = "Show items which don't count for any achievement",
                    order = 40,
                },
                tooltip_questid = {
                    type = "toggle",
                    name = "Show quest ids",
                    desc = "Show the internal id of the quest associated with this node. Handy if you want to report a problem with it.",
                    order = 40,
                },
                unhide = {
                    type = "execute",
                    name = "Reset hidden nodes",
                    desc = "Show all nodes that you manually hid by right-clicking on them and choosing \"hide\".",
                    func = function()
                        for _, coords in pairs(ns.hidden) do
                            wipe(coords)
                        end
                        ns.HL:Refresh()
                    end,
                    order = 50,
                },
            },
        },
        achievementsHidden = {
            type = "multiselect",
            name = "Show achievements",
            desc = "Toggle whether you want to show points for a given achievement",
            get = function(info, key) return not ns.db[info[#info]][key] end,
            set = function(info, key, value)
                ns.db[info[#info]][key] = not value
                ns.HL:Refresh()
            end,
            values = function(info)
                local values = {}
                for uiMapID, points in pairs(ns.points) do
                    for coord, point in pairs(points) do
                        if point.achievement and not values[point.achievement] then
                            local _, achievement = GetAchievementInfo(point.achievement)
                            values[point.achievement] = achievement or 'achievement:'..point.achievement
                        end
                    end
                end
                -- replace ourself with the built values table
                info.option.values = values
                return values
            end,
            hidden = function(info)
                for uiMapID, points in pairs(ns.points) do
                    for coord, point in pairs(points) do
                        if point.achievement then
                            info.option.hidden = false
                            return false
                        end
                    end
                end
                info.option.hidden = true
                return true
            end,
            order = 30,
        },
        zonesHidden = {
            type = "multiselect",
            name = "Show in zones",
            desc = "Toggle whether you want to show points in a given zone",
            get = function(info, key) return not ns.db[info[#info]][key] end,
            set = function(info, key, value)
                ns.db[info[#info]][key] = not value
                ns.HL:Refresh()
            end,
            values = function(info)
                local values = {}
                for uiMapID in pairs(ns.points) do
                    if not values[uiMapID] then
                        local info = C_Map.GetMapInfo(uiMapID)
                        if info and info.mapType == 3 then
                            -- zones only
                            values[uiMapID] = info.name
                        end
                    end
                end
                -- replace ourself with the built values table
                info.option.values = values
                return values
            end,
            order = 35,
        },
        groupsHidden = {
            type = "multiselect",
            name = "Show groups",
            desc = "Toggle whether to show certain groups of points",
            get = function(info, key) return not ns.db[info[#info]][key] end,
            set = function(info, key, value)
                ns.db[info[#info]][key] = not value
                ns.HL:Refresh()
            end,
            values = function(info)
                local values = {}
                for uiMapID, points in pairs(ns.points) do
                    for coord, point in pairs(points) do
                        if point.group and not values[point.group] then
                            values[point.group] = ns.groups[point.group] or point.group
                        end
                    end
                end
                -- replace ourself with the built values table
                info.option.values = values
                return values
            end,
            hidden = function(info)
                for uiMapID, points in pairs(ns.points) do
                    for coord, point in pairs(points) do
                        if point.group then
                            info.option.hidden = false
                            return false
                        end
                    end
                end
                info.option.hidden = true
                return true
            end,
            order = 40,
        }
    },
}

local function doTestAll(test, input, ...)
    for _, value in ipairs(input) do
        if not test(value, ...) then
            return false
        end
    end
    return true
end
local function doTestAny(test, input, ...)
    for _, value in ipairs(input) do
        if test(value, ...) then
            return true
        end
    end
    return false
end
local function doTest(test, input, ...)
    if type(input) == "table" then
        if input.any then
            return doTestAny(test, input, ...)
        end
        return doTestAll(test, input, ...)
    else
        return test(input, ...)
    end
end
ns.doTest = doTest
local function testMaker(test, override)
    return function(...)
        return (override or doTest)(test, ...)
    end
end

local itemInBags = testMaker(function(item) return GetItemCount(item, true) > 0 end)
local allQuestsComplete = testMaker(function(quest) return C_QuestLog.IsQuestFlaggedCompleted(quest) end)
ns.allQuestsComplete = allQuestsComplete

local allCriteriaComplete = testMaker(function(criteria, achievement)
    local _, _, completed, _, _, completedBy = (criteria < 40 and GetAchievementCriteriaInfo or GetAchievementCriteriaInfoByID)(achievement, criteria)
    if not (completed and (not completedBy or completedBy == ns.playerName)) then
        return false
    end
    return true
end)

local brokenItems = {
    -- itemid : {appearanceid, sourceid}
    [153268] = {25124, 90807}, -- Enclave Aspirant's Axe
}
local function GetAppearanceAndSource(itemLinkOrID)
    local itemID = GetItemInfoInstant(itemLinkOrID)
    if not itemID then return end
    local appearanceID, sourceID = C_TransmogCollection.GetItemInfo(itemLinkOrID)
    if not appearanceID then
        -- sometimes the link won't actually give us an appearance, but itemID will
        -- e.g. mythic Drape of Iron Sutures from Shadowmoon Burial Grounds
        appearanceID, sourceID = C_TransmogCollection.GetItemInfo(itemID)
    end
    if not appearanceID and brokenItems[itemID] then
        -- ...and there's a few that just need to be hardcoded
        appearanceID, sourceID = unpack(brokenItems[itemID])
    end
    return appearanceID, sourceID
end
local canLearnCache = {}
local function CanLearnAppearance(itemLinkOrID)
    local itemID = GetItemInfoInstant(itemLinkOrID)
    if not itemID then return end
    if canLearnCache[itemID] then
        return canLearnCache[itemID]
    end
    -- First, is this a valid source at all?
    local canBeChanged, noChangeReason, canBeSource, noSourceReason = C_Transmog.CanTransmogItem(itemID)
    if not canBeSource then
        canLearnCache[itemID] = false
        return false
    end
    local appearanceID = GetAppearanceAndSource(itemLinkOrID)
    if not appearanceID then
        canLearnCache[itemID] = false
        return false
    end
    if not C_TransmogCollection.GetAppearanceSources(appearanceID) then
        -- This returns nil for inappropriate appearances
        canLearnCache[itemID] = false
        return false
    end
    canLearnCache[itemID] = true
    return true
end
local hasAppearanceCache = {}
local function HasAppearance(itemLinkOrID)
    local itemID = GetItemInfoInstant(itemLinkOrID)
    if not itemID then
        return
    end
    if hasAppearanceCache[itemID] ~= nil then
        return hasAppearanceCache[itemID]
    end
    local appearanceID, sourceID = GetAppearanceAndSource(itemLinkOrID)
    if not appearanceID then
        hasAppearanceCache[itemID] = false
        return false
    end
    local _, _, _, _, sourceKnown = C_TransmogCollection.GetAppearanceSourceInfo(sourceID)
    if sourceKnown then
        hasAppearanceCache[itemID] = true
        return true
    end
    local sources = C_TransmogCollection.GetAppearanceSources(appearanceID)
    if not sources then
        hasAppearanceCache[itemID] = false
        return false
    end
    for _, source in pairs(sources) do
        if source.isCollected == true then
            hasAppearanceCache[itemID] = true
            return true
        end
    end
    return false
end

local function PlayerHasMount(mountid)
    return (select(11, C_MountJournal.GetMountInfoByID(mountid)))
end
local function PlayerHasPet(petid)
    return (C_PetJournal.GetNumCollectedInfo(petid) > 0)
end
ns.itemRestricted = function(item)
    if type(item) ~= "table" then return false end
    if item.covenant and item.covenant ~= C_Covenants.GetActiveCovenantID() then
        return true
    end
    if item.class and ns.playerClass ~= item.class then
        return true
    end
    return false
end
ns.itemIsKnowable = function(item)
    if type(item) == "table" then
        return (item.toy or item.mount or item.pet or item.quest or CanLearnAppearance(item[1])) and not ns.itemRestricted(item)
    end
    return CanLearnAppearance(item)
end
ns.itemIsKnown = function(item)
    -- returns true/false/nil for yes/no/not-knowable
    if type(item) == "table" then
        -- TODO: could arguably do transmog here, too. Since we're mostly
        -- considering soulbound things, the restrictions on seeing appearances
        -- known cross-armor-type wouldn't really matter...
        if item.toy then return PlayerHasToy(item[1]) end
        if item.mount then return PlayerHasMount(item.mount) end
        if item.pet then return PlayerHasPet(item.pet) end
        if item.quest then return C_QuestLog.IsQuestFlaggedCompleted(item.quest) or C_QuestLog.IsOnQuest(item.quest) end
        if CanLearnAppearance(item[1]) then return HasAppearance(item[1]) end
    elseif CanLearnAppearance(item) then
        return HasAppearance(item)
    end
end
local hasKnowableLoot = testMaker(ns.itemIsKnowable, doTestAny)
local allLootKnown = testMaker(function(item)
    -- This returns true if all loot is known-or-unknowable
    -- If the "no knowable loot" case matters this should be gated behind hasKnowableLoot
    local known = ns.itemIsKnown(item)
    if known == nil then
        return true
    end
    return known
end)

local function everythingFound(point)
    local ret
    if ns.db.collectablefound and point.loot and hasKnowableLoot(point.loot) then
        if not allLootKnown(point.loot) then
            return false
        end
        ret = true
    end
    if ns.db.achievedfound and point.achievement then
        if point.criteria then
            if not allCriteriaComplete(point.criteria, point.achievement) then
                return false
            end
        else
            local completedByMe = select(13, GetAchievementInfo(point.achievement))
            if not completedByMe then
                return false
            end
        end
        ret = true
    end
    if point.follower then
        if not C_Garrison.IsFollowerCollected(point.follower) then
            return false
        end
        ret = true
    end
    return ret
end

local zoneHidden
zoneHidden = function(uiMapID)
    if ns.db.zonesHidden[uiMapID] then
        return true
    end
    local info = C_Map.GetMapInfo(uiMapID)
    if info and info.parentMapID then
        return zoneHidden(info.parentMapID)
    end
    return false
end
local achievementHidden = function(achievement)
    if not achievement then return false end
    return ns.db.achievementsHidden[achievement]
end

local checkPois
do
    local poi_expirations = {}
    local poi_zone_expirations = {}
    local pois_byzone = {}
    local function refreshPois(zone)
        local now = time()
        if not poi_zone_expirations[zone] or now > poi_zone_expirations[zone] then
            pois_byzone[zone] = wipe(pois_byzone[zone] or {})
            for _, poi in ipairs(C_AreaPoiInfo.GetAreaPOIForMap(zone)) do
                pois_byzone[zone][poi] = true
                poi_expirations[poi] = now + (C_AreaPoiInfo.GetAreaPOISecondsLeft(poi) or 60)
            end
            poi_zone_expirations[zone] = now + 1
        end
    end
    function checkPois(pois)
        for _, data in ipairs(pois) do
            local zone, poi = unpack(data)
            local now = time()
            if now > (poi_expirations[poi] or 0) then
                refreshPois(zone)
                poi_expirations[poi] = poi_expirations[poi] or (now + 60)
            end
            if pois_byzone[zone][poi] then
                return true
            end
        end
    end
end

ns.should_show_point = function(coord, point, currentZone, isMinimap)
    if isMinimap and not ns.db.show_on_minimap and not point.minimap then
        return false
    elseif not isMinimap and not ns.db.show_on_world then
        return false
    end
    if zoneHidden(currentZone) then
        return false
    end
    if achievementHidden(point.achievement) then
        return false
    end
    if ns.hidden[currentZone] and ns.hidden[currentZone][coord] then
        return false
    end
    if point.group and ns.db.groupsHidden[point.group] then
        return false
    end
    if point.ShouldShow and not point:ShouldShow() then
        return false
    end
    if point.outdoors_only and IsIndoors() then
        return false
    end
    if point.art and point.art ~= C_Map.GetMapArtID(currentZone) then
        return false
    end
    if point.poi and not checkPois(point.poi) then
        return false
    end
    if point.junk and not ns.db.show_junk then
        return false
    end
    if point.faction and point.faction ~= ns.playerFaction then
        return false
    end
    if not ns.db.found and not point.always then
        if everythingFound(point) == true then
            return false
        end
        if ns.db.questfound and point.quest and allQuestsComplete(point.quest) then
            return false
        end
        -- the rest are proxies for the actual "found" status:
        if point.inbag and itemInBags(point.inbag) then
            return false
        end
        if point.onquest and C_QuestLog.IsOnQuest(type(point.onquest) == "number" and point.onquest or point.quest) then
            return false
        end
        if point.hide_quest and C_QuestLog.IsQuestFlaggedCompleted(point.hide_quest) then
            -- This is distinct from point.quest as it's supposed to be for
            -- other trackers that make the point not _complete_ but still
            -- hidden (Draenor treasure maps, so far):
            return false
        end
    end
    if not point.follower then
        if point.npc then
            if not ns.db.show_npcs then
                return false
            end
        else
            -- Not an NPC, not a follower, must be treasure
            if not ns.db.show_treasure then
                return false
            end
        end
    end
    if point.requires_buff and not doTest(GetPlayerAuraBySpellID, point.requires_buff) then
        return false
    end
    if point.requires_no_buff and doTest(GetPlayerAuraBySpellID, point.requires_no_buff) then
        return false
    end
    if point.requires_item and not itemInBags(point.requires_item) then
        return false
    end
    if point.requires_worldquest and not C_TaskQuest.IsActive(point.requires_worldquest) then
        return false
    end
    if point.covenant and point.covenant ~= C_Covenants.GetActiveCovenantID() then
        return false
    end
    if not ns.db.upcoming or point.upcoming == false then
        if not ns.point_active(point) then
            return false
        end
        if ns.point_upcoming(point) then
            return false
        end
    end
    return true
end

local function hideTextureWithAtlas(atlas, ...)
    for i=1, select("#", ...) do
        local region = select(i, ...)
        if region:IsObjectType("Texture") and region:GetAtlas() == atlas then
            region:Hide()
        end
    end
end
local defaultSort = function(a, b) return a < b end
local function iterKeysByValue(tbl, sortFunction)
    local keys = {}
    for key in pairs(tbl) do
        table.insert(keys, key)
    end
    table.sort(keys, function(a, b)
        return (sortFunction or defaultSort)(tbl[a], tbl[b])
    end)
    return ipairs(keys)
end
local OptionsDropdown = {}
do
    function OptionsDropdown.node(options, ...)
        local node = options
        for i=1, select('#', ...) do
            node = options.args[select(i, ...)]
        end
        return node
    end
    local info = {}
    function OptionsDropdown.makeInfo(options, ...)
        local node = OptionsDropdown.node(options, ...)
        wipe(info)
        info.options = options
        info.option = node
        info.arg = node.arg
        info.type = node.type
        info.handler = node.handler
        info.uiType = "dropdown"
        info.uiName = "HandyNotesTreasures-Dropdown"
        info[0] = "" -- not a slashcommand
        for i=1, select('#', ...) do
            info[i] = select(i, ...)
        end
        return info
    end
    local function nodeValueOrFunc(key, options, ...)
        local node = OptionsDropdown.node(options, ...)
        if type(node[key]) == "function" then
            return node[key](OptionsDropdown.makeInfo(options, ...))
        end
        return node[key]
    end
    function OptionsDropdown.isHidden(options, ...)
        return nodeValueOrFunc('hidden', options, ...)
    end
    function OptionsDropdown.values(options, ...)
        return nodeValueOrFunc('values', options, ...)
    end
end
function ns.SetupMapOverlay()
    local frame = WorldMapFrame:AddOverlayFrame("WorldMapTrackingOptionsButtonTemplate", "DROPDOWNTOGGLEBUTTON", "TOPRIGHT", WorldMapFrame:GetCanvasContainer(), "TOPRIGHT", -68, -2);
    frame.Icon:SetAtlas("VignetteLootElite")
    frame.Icon:SetPoint("TOPLEFT", 6, -5)
    hideTextureWithAtlas("MapCornerShadow-Right", frame:GetRegions())
    frame.Refresh = function(self)
        local uiMapID = self:GetParent():GetMapID()
        local info = C_Map.GetMapInfo(uiMapID)
        local parentMapID = info and info.parentMapID or 0
        if ns.db.worldmapoverlay and (ns.points[uiMapID] or ns.points[parentMapID]) then
            self:Show()
        else
            self:Hide()
        end
    end
    frame.OnMouseUp = function(self)
        self.Icon:SetPoint("TOPLEFT", 6, -5)
        self.IconOverlay:Hide()
    end
    frame.InitializeDropDown = function(self, level)
        local info = UIDropDownMenu_CreateInfo()
        level = level or 1
        if level == 1 then
            info.isTitle = true
            info.notCheckable = true
            info.text = "HandyNotes - " .. myname:gsub("HandyNotes_", "")
            UIDropDownMenu_AddButton(info, level)

            info.isTitle = nil
            info.disabled = nil
            info.notCheckable = nil
            info.isNotRadio = true
            info.keepShownOnClick = true
            info.tooltipOnButton = true
            info.func = function(button)
                local checked = button.checked
                local value = button.value
                if (checked) then
                    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
                else
                    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
                end
                local option = ns.options.args.display.args[value]
                local db = ns.db
                if option.type == "execute" then
                    option.func()
                else
                    db[value] = checked
                end
                ns.HL:Refresh()
            end

            local sorted = {}
            for key in pairs(ns.options.args.display.args) do
                table.insert(sorted, key)
            end
            table.sort(sorted, function(a, b)
                return (ns.options.args.display.args[a].order or 0) < (ns.options.args.display.args[b].order or 0)
            end)
            for _, key in ipairs(sorted) do
                local option = ns.options.args.display.args[key]
                info.text = option.name
                info.tooltipTitle = option.desc
                info.value = key
                if option.type == "toggle" then
                    info.notCheckable = nil
                    info.checked = ns.db[key]
                elseif option.type == "execute" then
                    info.notCheckable = true
                    info.checked = nil
                end
                if option.disabled then
                    info.disabled = option.disabled()
                else
                    info.disabled = nil
                end
                UIDropDownMenu_AddButton(info, level)
            end

            UIDropDownMenu_AddSeparator(level)

            wipe(info)
            info.hasArrow = true
            info.keepShownOnClick = true
            info.notCheckable = true

            if not OptionsDropdown.isHidden(ns.options, "achievementsHidden") then
                info.text = ACHIEVEMENTS
                info.value = "achievementsHidden"
                UIDropDownMenu_AddButton(info, level)
            end

            info.text = ZONE
            info.value = "zonesHidden"
            UIDropDownMenu_AddButton(info, level)

            if not OptionsDropdown.isHidden(ns.options, "groupsHidden") then
                info.text = GROUPS
                info.value = "groupsHidden"
                UIDropDownMenu_AddButton(info, level)
            end

            UIDropDownMenu_AddSeparator(level)

            info.text = "Open HandyNotes options"
            info.hasArrow = nil
            info.keepShownOnClick = nil
            info.func = function(button)
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory('HandyNotes')
                LibStub('AceConfigDialog-3.0'):SelectGroup('HandyNotes', 'plugins', myname:gsub("HandyNotes_", ""))
            end
            UIDropDownMenu_AddButton(info, level)

        elseif level == 2 then
            local parent = UIDROPDOWNMENU_MENU_VALUE
            local currentZone = WorldMapFrame.mapID
            info.arg1 = parent
            info.isTitle = nil
            info.disabled = nil
            info.notCheckable = nil
            info.isNotRadio = true
            info.keepShownOnClick = true
            info.tooltipOnButton = true
            info.func = function(button, section)
                local checked = button.checked
                local value = button.value
                if (checked) then
                    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
                else
                    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
                end
                ns.db[section][value] = not checked
                ns.HL:Refresh()
            end
            local values = OptionsDropdown.values(ns.options, parent)
            if parent == "achievementsHidden" then
                local relevant = {}
                for _, point in pairs(ns.points[currentZone] or {}) do
                    if point.achievement then
                        relevant[point.achievement] = true
                    end
                end
                for _, achievementid in iterKeysByValue(values) do
                    info.text = values[achievementid]
                    info.value = achievementid
                    info.checked = not ns.db.achievementsHidden[achievementid]
                    if relevant[achievementid] then
                        info.text = BRIGHTBLUE_FONT_COLOR:WrapTextInColorCode(info.text) .. " " .. CreateAtlasMarkup("VignetteKill", 0)
                    end
                    UIDropDownMenu_AddButton(info, level)
                end
            elseif parent == "zonesHidden" then
                for _, uiMapID in iterKeysByValue(values) do
                    info.text = values[uiMapID]
                    info.value = uiMapID
                    info.checked = not ns.db.zonesHidden[uiMapID]
                    if uiMapID == currentZone then
                        info.text = BRIGHTBLUE_FONT_COLOR:WrapTextInColorCode(info.text) .. " " .. CreateAtlasMarkup("VignetteKill", 0)
                    end
                    UIDropDownMenu_AddButton(info, level)
                end
            elseif parent == "groupsHidden" then
                local relevant = {}
                for _, point in pairs(ns.points[currentZone] or {}) do
                    if point.group then
                        relevant[point.group] = true
                    end
                end
                for _, group in iterKeysByValue(values) do
                    info.text = values[group]
                    info.value = group
                    info.checked = not ns.db.groupsHidden[group]
                    if relevant[group] then
                        info.text = BRIGHTBLUE_FONT_COLOR:WrapTextInColorCode(info.text) .. " " .. CreateAtlasMarkup("VignetteKill", 0)
                    end
                    UIDropDownMenu_AddButton(info, level)
                end
            end
        end
    end
    frame.OnSelection = function(self, value, checked, arg1, arg2) end
    UIDropDownMenu_SetInitializeFunction(frame.DropDown, function(self, ...) frame:InitializeDropDown(...) end)
end
