local myname, ns = ...

ns.defaults = {
    profile = {
        default_icon = "VignetteLoot",
        show_on_world = true,
        show_on_minimap = false,
        show_junk = false,
        show_npcs = true,
        show_treasure = true,
        upcoming = true,
        found = false,
        repeatable = true,
        icon_scale = 1.0,
        icon_alpha = 1.0,
        icon_item = false,
        tooltip_item = true,
        tooltip_questid = false,
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
                found = {
                    type = "toggle",
                    name = "Show found",
                    desc = "Show waypoints for items you've already found?",
                    order = 20,
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
                show_junk = {
                    type = "toggle",
                    name = "Show non-achievement",
                    desc = "Show items which don't count for any achievement",
                    order = 40,
                },
                -- repeatable = {
                --     type = "toggle",
                --     name = "Show repeatable",
                --     desc = "Show items which are repeatable? This generally means ones which have a daily tracking quest attached",
                --     order = 40,
                -- },
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
    },
}

local player_name = UnitName("player")
local allQuestsComplete = function(quests)
    if type(quests) == 'table' then
        -- if it's a table, only count as complete if all quests are complete
        for _, quest in ipairs(quests) do
            if not C_QuestLog.IsQuestFlaggedCompleted(quest) then
                return false
            end
        end
        return true
    elseif C_QuestLog.IsQuestFlaggedCompleted(quests) then
        return true
    end
end
ns.allQuestsComplete = allQuestsComplete
local criteriaComplete = function(achievement, criteria)
    local _, _, completed, _, _, completedBy = GetAchievementCriteriaInfoByID(achievement, criteria)
    if not (completed and (not completedBy or completedBy == player_name)) then
        return false
    end
    return true
end
local allCriteriaComplete = function(achievement, criteria)
    if type(criteria) == "table" then
        -- if it's a table, only count as complete if all criteria are complete
        for _, criteriaa in ipairs(criteria) do
            if not criteriaComplete(achievement, criteriaa) then
                return false
            end
        end
        return true
    elseif criteriaComplete(achievement, criteria) then
        return true
    end
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

local player_faction = UnitFactionGroup("player")
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
    if point.outdoors_only and IsIndoors() then
        return false
    end
    if point.art and point.art ~= C_Map.GetMapArtID(currentZone) then
        return false
    end
    if ns.map_questids[currentZone] and not (point.junk or point.npc or point.follower) and C_QuestLog.IsQuestFlaggedCompleted(ns.map_questids[currentZone]) then
        return false
    end
    if point.junk and not ns.db.show_junk then
        return false
    end
    if point.faction and point.faction ~= player_faction then
        return false
    end
    if (not ns.db.found) then
        if point.quest then
            if allQuestsComplete(point.quest) then
                return false
            end
        elseif point.achievement then
            local completedByMe = select(13, GetAchievementInfo(point.achievement))
            if completedByMe then
                return false
            end
            if point.criteria and allCriteriaComplete(point.achievement, point.criteria) then
                return false
            end
        end
        if point.follower and C_Garrison.IsFollowerCollected(point.follower) then
            return false
        end
        if point.toy and point.item and PlayerHasToy(point.item) then
            return false
        end
    end
    -- if (not ns.db.repeatable) and point.repeatable then
    --     return false
    -- end
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
    if point.requires_buff and not GetPlayerAuraBySpellID(point.requires_buff) then
        return false
    end
    if point.requires_no_buff and GetPlayerAuraBySpellID(point.requires_no_buff) then
        return false
    end
    if not ns.db.upcoming then
        if point.level and point.level > UnitLevel("player") then
            return false
        end
        if point.active and point.active.quest and not C_QuestLog.IsQuestFlaggedCompleted(point.active.quest) then
            return false
        end
        if point.hide_before and not allQuestsComplete(point.hide_before) then
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
                UIDropDownMenu_AddButton(info, level)
            end

            UIDropDownMenu_AddSeparator(level)

            wipe(info)
            info.text = ACHIEVEMENTS
            info.hasArrow = true
            info.keepShownOnClick = true
            info.notCheckable = true
            info.value = "achievementsHidden"
            UIDropDownMenu_AddButton(info, level)

            info.text = ZONE
            info.value = "zonesHidden"
            UIDropDownMenu_AddButton(info, level)

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
                if (checked) then
                    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
                else
                    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
                end
                local checked = button.checked
                local value = button.value
                ns.db[section][value] = not checked
                ns.HL:Refresh()
            end
            if parent == "achievementsHidden" then
                local values = {}
                local relevant = {}
                for uiMapID, points in pairs(ns.points) do
                    for _, point in pairs(points) do
                        if point.achievement then
                            if not values[point.achievement] then
                                local _, achievement = GetAchievementInfo(point.achievement)
                                values[point.achievement] = achievement or 'achievement:'..point.achievement
                            end
                            relevant[point.achievement] = relevant[point.achievement] or (uiMapID == currentZone)
                        end
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
                local values = {}
                for uiMapID in pairs(ns.points) do
                    if not values[uiMapID] then
                        local mapinfo = C_Map.GetMapInfo(uiMapID)
                        if mapinfo and mapinfo.mapType == 3 then
                            -- zones only
                            values[uiMapID] = mapinfo.name
                        end
                    end
                end
                for _, uiMapID in iterKeysByValue(values) do
                    info.text = values[uiMapID]
                    info.value = uiMapID
                    info.checked = not ns.db.zonesHidden[uiMapID]
                    if uiMapID == currentZone then
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
