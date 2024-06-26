Class Ext_TraitMachineGunner extends Ext_TraitBase;

var localized string GroupDescription;

function string GetPerkDescription()
{
	local string S;

	S = Super.GetPerkDescription();
	S $= "|"$GroupDescription;
	return S;
}

static function bool MeetsRequirements(byte Lvl, Ext_PerkBase Perk)
{
	if (Perk.CurrentLevel<Default.MinLevel || Perk.CurrentPrestige<2)
		return false;

	return true;
}

static function TraitActivate(Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data)
{
	Ext_PerkCommando(Perk).bUseMachineGunner = true;
}

static function TraitDeActivate(Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data)
{
	Ext_PerkCommando(Perk).bUseMachineGunner = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkCommando'
	TraitGroup=class'Ext_TGroupZEDTime'
	NumLevels=1
	DefLevelCosts(0)=60
	DefMinLevel=55
}