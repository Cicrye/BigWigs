--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Deathbound Ward", "Icecrown Citadel")
if not mod then return end
mod:RegisterEnableMob(37007)
mod.toggleOptions = {{71022, "FLASHSHAKE"}}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "Shout", 71022)
	self:Death("Deaths", 37007)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

-- XXX really flash and shake here?
-- XXX what if we put up a warning when a TRAP is triggered instead of this whole module?
-- XXX what if we could put it in a separate addon instead of bigwigs?

function mod:Shout(_, spellId, _, _, spellName)
	self:Message(71022, spellName, "Personal", spellId)
	self:Bar(71022, spellName, 3, spellId)
	self:FlashShake(71022)
end

function mod:Deaths()
	--Disable when OOC, since being in combat with several is possible
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "Disable")
end

