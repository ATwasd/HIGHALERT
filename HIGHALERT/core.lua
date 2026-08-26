
UIErrorsFrame:Hide()
UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")


--Dispel UI
local LARGE_AURA_SIZE = 80
local SMALL_AURA_SIZE = 35

local CUSTOM_LARGE_SPELLS = {
    -- Death Knight
    [53338] = true,
    [48792] = true, -- Icebound Fortitude
    [48707] = true, -- Anti-Magic Shell
    -- Druid
    [22812] = true, -- Barkskin
    [61336] = true, -- Survival Instincts
    -- Hunter
    [19263] = true, -- Deterrence
    [53480] = true, -- Roar of Sacrifice
    -- Paladin
    [64205] = true, -- Divine Sacrifice
    [1044]  = true, -- Hand of Freedom
    [498]   = true, -- Divine Protection
    [642]   = true, -- Divine Shield
    [10278]  = true, -- Hand of Protection
    [31821] = true, -- Aura Mastery
    -- Priest
    [47585] = true, -- Dispersion
    [33206] = true, -- Pain Suppression
    -- Rogue
    [5277]  = true, -- Evasion
    [31224] = true, -- Cloak of Shadows
    [26889] = true, -- Vanish
    [51713] = true, -- Shadow Dance
    -- Warlock
    [7812]  = true, -- Sacrifice
    -- Warrior
    [871]   = true, -- Shield Wall
    [2565]  = true, -- Shield Block
    [23920] = true, -- Spell Reflection

    -- Shaman
    [8178]  = true, -- Grounding Totem
    -- Potions / Other
    [6615]  = true, -- Free Action Potion
    [64804] = true, -- Entrapment
    [53545] = true, -- Pin
    [5116]  = true, -- Concussive Shot
    [35101] = true, -- Concussive Barrage
    [2974]  = true, -- Wing Clip
}

hooksecurefunc("TargetFrame_UpdateAuraPositions", function(self, auraName, numAuras, numOppositeAuras, largeAuraList)
    for i = 1, numAuras do
        local aura = _G[auraName .. i]

        if aura then
            local _, _, _, _, _, _, _, _, _, _, spellId = UnitAura(self.unit, i)

            if spellId and CUSTOM_LARGE_SPELLS[spellId] then
                aura:SetWidth(LARGE_AURA_SIZE)
                aura:SetHeight(LARGE_AURA_SIZE)
            elseif largeAuraList[i] then
                aura:SetWidth(LARGE_AURA_SIZE)
                aura:SetHeight(LARGE_AURA_SIZE)
            else
                aura:SetWidth(SMALL_AURA_SIZE)
                aura:SetHeight(SMALL_AURA_SIZE)
            end
        end
    end
end)

