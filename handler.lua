local myname, ns = ...

local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
local HL = LibStub("AceAddon-3.0"):NewAddon(myname, "AceEvent-3.0")
-- local L = LibStub("AceLocale-3.0"):GetLocale(myname, true)
ns.HL = HL

local debugf = tekDebug and tekDebug:GetFrame(myname:gsub("HandyNotes_", ""))
local function Debug(...) if debugf then debugf:AddMessage(string.join(", ", tostringall(...))) end end
ns.Debug = Debug

local next = next

local ANIMA_LABEL = '|cffff8000' .. ANIMA .. '|r'

local cache_tooltip = CreateFrame("GameTooltip", "HNShadowlandsTreasuresTooltip")
cache_tooltip:AddFontStrings(
    cache_tooltip:CreateFontString("$parentTextLeft1", nil, "GameTooltipText"),
    cache_tooltip:CreateFontString("$parentTextRight1", nil, "GameTooltipText")
)
local name_cache = {}
local function mob_name(id)
    if not name_cache[id] then
        -- this doesn't work with just clearlines and the setowner outside of this, and I'm not sure why
        cache_tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
        cache_tooltip:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(id))
        if cache_tooltip:IsShown() then
            name_cache[id] = HNShadowlandsTreasuresTooltipTextLeft1:GetText()
        end
    end
    return name_cache[id]
end
local function quick_texture_markup(icon)
    -- needs less than CreateTextureMarkup
    return '|T' .. icon .. ':0:0:1:-1|t'
end
local function render_string(s)
    return s:gsub("{(%l+):(%d+):?([^}]*)}", function(variant, id, fallback)
        id = tonumber(id)
        if variant == "item" then
            local name, link, _, _, _, _, _, _, _, icon = GetItemInfo(id)
            if link and icon then
                return quick_texture_markup(icon) .. link
            end
        elseif variant == "spell" then
            local name, _, icon = GetSpellInfo(id)
            if name and icon then
                return quick_texture_markup(icon) .. name
            end
        elseif variant == "quest" then
            local name = C_QuestLog.GetTitleForQuestID(id)
            if name and name ~= "" then
                return name
            end
        elseif variant == "npc" then
            local name = mob_name(id)
            if name then
                return name
            end
        elseif variant == "currency" then
            local info = C_CurrencyInfo.GetCurrencyInfo(id)
            if info then
                return quick_texture_markup(info.iconFileID) .. info.name
            end
        end
        return fallback ~= "" and fallback or (variant .. ':' .. id)
    end)
end
local function cache_string(s)
    if not s then return end
    for variant, id, fallback in s:gmatch("{(%l+):(%d+):?([^}]*)}") do
        id = tonumber(id)
        if variant == "item" then
            C_Item.RequestLoadItemDataByID(id)
        elseif variant == "spell" then
            C_Spell.RequestLoadSpellData(id)
        elseif variant == "quest" then
            C_QuestLog.RequestLoadQuestByID(id)
        elseif variant == "npc" then
            mob_name(id)
        end
    end
end

local default_texture, npc_texture, follower_texture, currency_texture, junk_texture
local icon_cache = {}
local trimmed_icon = function(texture)
    if not icon_cache[texture] then
        icon_cache[texture] = {
            icon = texture,
            tCoordLeft = 0.1,
            tCoordRight = 0.9,
            tCoordTop = 0.1,
            tCoordBottom = 0.9,
        }
    end
    return icon_cache[texture]
end
local atlas_texture = function(atlas, scale)
    atlas = C_Texture.GetAtlasInfo(atlas)
    return {
        icon = atlas.file,
        tCoordLeft = atlas.leftTexCoord, tCoordRight = atlas.rightTexCoord, tCoordTop = atlas.topTexCoord, tCoordBottom = atlas.bottomTexCoord,
        scale = scale or 1,
    }
end
local function work_out_label(point)
    local fallback
    if point.label then
        return (render_string(point.label))
    end
    if point.achievement then
        if point.criteria and type(point.criteria) ~= "table" then
            local criteria = GetAchievementCriteriaInfoByID(point.achievement, point.criteria)
            if criteria then
                return criteria
            end
        end
        local _, achievement = GetAchievementInfo(point.achievement)
        if achievement then
            return achievement
        end
        fallback = 'achievement:'..point.achievement
    end
    if point.follower then
        local follower = C_Garrison.GetFollowerInfo(point.follower)
        if follower then
            return follower.name
        end
        fallback = 'follower:'..point.follower
    end
    if point.npc then
        local name = mob_name(point.npc)
        if name then
            return name
        end
        fallback = 'npc:'..point.npc
    end
    if point.loot and #point.loot > 0 then
        -- handle multiples?
        local _, link = GetItemInfo(point.loot[1])
        if link then
            return link
        end
        fallback = 'item:'..point.loot[1]
    end
    if point.currency then
        if point.currency == 'ANIMA' then
            return ANIMA_LABEL
        end
        local info = C_CurrencyInfo.GetCurrencyInfo(point.currency)
        if info then
            return info.name
        end
    end
    return fallback or UNKNOWN
end
local function work_out_texture(point)
    if point.atlas then
        if not icon_cache[point.atlas] then
            icon_cache[point.atlas] = atlas_texture(point.atlas, point.scale)
        end
        return icon_cache[point.atlas]
    end
    if ns.db.icon_item or point.icon then
        if point.loot and #point.loot > 0 then
            local texture = select(10, GetItemInfo(point.loot[1]))
            if texture then
                return trimmed_icon(texture)
            end
        end
        if point.currency then
            if point.currency == 'ANIMA' then
                local texture = select(10, GetAchievementInfo(14339))
                if texture then
                    return trimmed_icon(texture)
                end
            else
                local info = C_CurrencyInfo.GetCurrencyInfo(point.currency)
                if info then
                    return trimmed_icon(info.iconFileID)
                end
            end
        end
        if point.achievement then
            local texture = select(10, GetAchievementInfo(point.achievement))
            if texture then
                return trimmed_icon(texture)
            end
        end
    else
        if point.currency then
            if not currency_texture then
                currency_texture = atlas_texture("Auctioneer", 1.5)
            end
            return currency_texture
        end
    end
    if point.follower then
        if not follower_texture then
            follower_texture = atlas_texture("GreenCross", 1.5)
        end
        return follower_texture
    end
    if point.npc then
        if not npc_texture then
            npc_texture = atlas_texture("DungeonSkull", 1)
        end
        return npc_texture
    end
    if point.junk then
        if not junk_texture then
            junk_texture = atlas_texture("VignetteLoot", 1.5)
        end
        return junk_texture
    end
    if not default_texture then
        default_texture = atlas_texture("Garr_TreasureIcon", 2.6)
    end
    return default_texture
end
local get_point_info = function(point)
    if point then
        local label = work_out_label(point)
        local icon = work_out_texture(point)
        local category = "treasure"
        if point.npc then
            category = "npc"
        elseif point.junk then
            category = "junk"
        end
        cache_string(point.note)
        return label, icon, category, point.quest, point.faction, point.scale, point.alpha or 1
    end
end
local get_point_info_by_coord = function(uiMapID, coord)
    return get_point_info(ns.points[uiMapID] and ns.points[uiMapID][coord])
end

local function handle_tooltip(tooltip, point)
    if point then
        -- major:
        tooltip:AddLine(work_out_label(point))
        if point.follower then
            local follower = C_Garrison.GetFollowerInfo(point.follower)
            if follower then
                local quality = BAG_ITEM_QUALITY_COLORS[follower.quality]
                tooltip:AddDoubleLine(REWARD_FOLLOWER, follower.name,
                    0, 1, 0,
                    quality.r, quality.g, quality.b
                )
                tooltip:AddDoubleLine(follower.className, UNIT_LEVEL_TEMPLATE:format(follower.level))
            end
        end
        if point.currency then
            local name
            if point.currency == 'ANIMA' then
                name = ANIMA_LABEL
            else
                local info = C_CurrencyInfo.GetCurrencyInfo(point.currency)
                name = info and info.name
            end
            tooltip:AddDoubleLine(CURRENCY, name or point.currency)
        end
        if point.achievement then
            local _, name, _, complete = GetAchievementInfo(point.achievement)
            tooltip:AddDoubleLine(BATTLE_PET_SOURCE_6, name or point.achievement,
                nil, nil, nil,
                complete and 0 or 1, complete and 1 or 0, 0
            )
            if point.criteria then
                if type(point.criteria) == "table" then
                    for _, criteria in ipairs(point.criteria) do
                        local criteria, _, complete = GetAchievementCriteriaInfoByID(point.achievement, criteria)
                        tooltip:AddDoubleLine(" ", criteria,
                            nil, nil, nil,
                            complete and 0 or 1, complete and 1 or 0, 0
                        )
                    end
                else
                    local criteria, _, complete = GetAchievementCriteriaInfoByID(point.achievement, point.criteria)
                    tooltip:AddDoubleLine(" ", criteria,
                        nil, nil, nil,
                        complete and 0 or 1, complete and 1 or 0, 0
                    )
                end
            elseif GetAchievementNumCriteria(point.achievement) == 1 then
                local criteria, _, complete, _, _, _, _, _, quantityString = GetAchievementCriteriaInfo(point.achievement, 1)
                if quantityString then
                    tooltip:AddDoubleLine(
                        criteria, quantityString,
                        complete and 0 or 1, complete and 1 or 0, 0,
                        complete and 0 or 1, complete and 1 or 0, 0
                    )
                else
                    tooltip:AddDoubleLine(" ", criteria,
                        nil, nil, nil,
                        complete and 0 or 1, complete and 1 or 0, 0
                    )
                end
            end
        end
        if point.note then
            tooltip:AddLine(render_string(point.note), nil, nil, nil, true)
        end
        if point.loot then
            for _, item in ipairs(point.loot) do
                local _, link, _, _, _, _, _, _, _, icon = GetItemInfo(item)
                if link then
                    tooltip:AddDoubleLine(ENCOUNTER_JOURNAL_ITEM, quick_texture_markup(icon) .. link)
                else
                    tooltip:AddDoubleLine(ENCOUNTER_JOURNAL_ITEM, SEARCH_LOADING_TEXT, 1, 1, 0, 0, 1, 1)
                end
            end
        end
        if point.quest and ns.db.tooltip_questid then
            local quest = point.quest
            if type(quest) == 'table' then
                quest = string.join(", ", unpack(quest))
            end
            tooltip:AddDoubleLine("QuestID", quest or UNKNOWN)
        end

        if (ns.db.tooltip_item or IsShiftKeyDown()) and (point.loot or point.npc) then
            local comparison = ShoppingTooltip1

            do
                local side
                local leftPos = tooltip:GetLeft() or 0
                local rightPos = tooltip:GetRight() or 0
                local rightDist = GetScreenWidth() - rightPos

                if (leftPos and (rightDist < leftPos)) then
                    side = "left"
                else
                    side = "right"
                end

                -- see if we should slide the tooltip
                if tooltip:GetAnchorType() and tooltip:GetAnchorType() ~= "ANCHOR_PRESERVE" then
                    local totalWidth = 0
                    if ( primaryItemShown  ) then
                        totalWidth = totalWidth + comparison:GetWidth()
                    end

                    if ( (side == "left") and (totalWidth > leftPos) ) then
                        tooltip:SetAnchorType(tooltip:GetAnchorType(), (totalWidth - leftPos), 0)
                    elseif ( (side == "right") and (rightPos + totalWidth) >  GetScreenWidth() ) then
                        tooltip:SetAnchorType(tooltip:GetAnchorType(), -((rightPos + totalWidth) - GetScreenWidth()), 0)
                    end
                end

                comparison:SetOwner(tooltip, "ANCHOR_NONE")
                comparison:ClearAllPoints()

                if ( side and side == "left" ) then
                    comparison:SetPoint("TOPRIGHT", tooltip, "TOPLEFT", 0, -10)
                else
                    comparison:SetPoint("TOPLEFT", tooltip, "TOPRIGHT", 0, -10)
                end
            end

            if point.loot and #point.loot > 0 then
                comparison:SetHyperlink(("item:%d"):format(point.loot[1]))
            elseif point.npc then
                comparison:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(point.npc))
            end
            comparison:Show()
        end
    else
        tooltip:SetText(UNKNOWN)
    end
    tooltip:Show()
end
local handle_tooltip_by_coord = function(tooltip, uiMapID, coord)
    return handle_tooltip(tooltip, ns.points[uiMapID] and ns.points[uiMapID][coord])
end

---------------------------------------------------------
-- Plugin Handlers to HandyNotes
local HLHandler = {}
local info = {}

function HLHandler:OnEnter(uiMapID, coord)
    local tooltip = GameTooltip
    if self:GetCenter() > UIParent:GetCenter() then -- compare X coordinate
        tooltip:SetOwner(self, "ANCHOR_LEFT")
    else
        tooltip:SetOwner(self, "ANCHOR_RIGHT")
    end
    handle_tooltip_by_coord(tooltip, uiMapID, coord)
end

local function createWaypoint(button, uiMapID, coord)
    if TomTom then
        local x, y = HandyNotes:getXY(coord)
        TomTom:AddWaypoint(uiMapID, x, y, {
            title = get_point_info_by_coord(uiMapID, coord),
            persistent = nil,
            minimap = true,
            world = true
        })
    end
end

local function hideNode(button, uiMapID, coord)
    ns.hidden[uiMapID][coord] = true
    HL:Refresh()
end

local function closeAllDropdowns()
    CloseDropDownMenus(1)
end

do
    local currentZone, currentCoord
    local function generateMenu(button, level)
        if (not level) then return end
        wipe(info)
        if (level == 1) then
            -- Create the title of the menu
            info.isTitle      = 1
            info.text         = "HandyNotes - " .. myname:gsub("HandyNotes_", "")
            info.notCheckable = 1
            UIDropDownMenu_AddButton(info, level)
            wipe(info)

            if TomTom then
                -- Waypoint menu item
                info.text = "Create waypoint"
                info.notCheckable = 1
                info.func = createWaypoint
                info.arg1 = currentZone
                info.arg2 = currentCoord
                UIDropDownMenu_AddButton(info, level)
                wipe(info)
            end

            -- Hide menu item
            info.text         = "Hide node"
            info.notCheckable = 1
            info.func         = hideNode
            info.arg1         = currentZone
            info.arg2         = currentCoord
            UIDropDownMenu_AddButton(info, level)
            wipe(info)

            -- Close menu item
            info.text         = "Close"
            info.func         = closeAllDropdowns
            info.notCheckable = 1
            UIDropDownMenu_AddButton(info, level)
            wipe(info)
        end
    end
    local HL_Dropdown = CreateFrame("Frame", myname.."DropdownMenu")
    HL_Dropdown.displayMode = "MENU"
    HL_Dropdown.initialize = generateMenu

    function HLHandler:OnClick(button, down, uiMapID, coord)
        currentZone = uiMapID
        currentCoord = coord
        -- given we're in a click handler, this really *should* exist, but just in case...
        local point = ns.points[currentZone] and ns.points[currentZone][currentCoord]
        if button == "RightButton" and not down then
            ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
        end
    end
end

function HLHandler:OnLeave(uiMapID, coord)
    GameTooltip:Hide()
    ShoppingTooltip1:Hide()
end

do
    -- This is a custom iterator we use to iterate over every node in a given zone
    local currentZone, isMinimap
    local function iter(t, prestate)
        if not t then return nil end
        local state, value = next(t, prestate)
        while state do -- Have we reached the end of this zone?
            if value and ns.should_show_point(state, value, currentZone, isMinimap) then
                local label, icon, _, _, _, scale, alpha = get_point_info(value)
                scale = (scale or 1) * (icon and icon.scale or 1) * ns.db.icon_scale
                return state, nil, icon, scale, ns.db.icon_alpha * alpha
            end
            state, value = next(t, state) -- Get next data
        end
        return nil, nil, nil, nil
    end
    function HLHandler:GetNodes2(uiMapID, minimap)
        Debug("GetNodes2", uiMapID, minimap)
        currentZone = uiMapID
        isMinimap = minimap
        if minimap and ns.map_spellids[uiMapID] then
            if ns.map_spellids[uiMapID] == true then
                return iter
            end
            if GetPlayerAuraBySpellID(ns.map_spellids[uiMapID]) then
                return iter
            end
        end
        return iter, ns.points[uiMapID], nil
    end
end

---------------------------------------------------------
-- Addon initialization, enabling and disabling

function HL:OnInitialize()
    -- Set up our database
    self.db = LibStub("AceDB-3.0"):New(myname.."DB", ns.defaults)
    ns.db = self.db.profile
    ns.hidden = self.db.char.hidden
    -- Initialize our database with HandyNotes
    HandyNotes:RegisterPluginDB(myname:gsub("HandyNotes_", ""), HLHandler, ns.options)

    -- watch for LOOT_CLOSED
    self:RegisterEvent("LOOT_CLOSED", "Refresh")
    self:RegisterEvent("ZONE_CHANGED_INDOORS", "Refresh")
end

function HL:Refresh()
    self:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", ""))
end
