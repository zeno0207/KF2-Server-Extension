Class Ext_TraitTactician extends Ext_TraitBase;

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
	local int i;

	if (Perk.CurrentLevel<Default.MinLevel || Perk.CurrentPrestige<1)
		return false;

	if (Lvl==0)
	{
		i = Perk.PerkStats.Find('StatType','Damage');
		if (i>=0)
			return (Perk.PerkStats[i].CurrentValue>=30);
	}

	return true;
}

static function TraitActivate(Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data)
{
	Ext_PerkCommando(Perk).bUseProfessional = true;
}

static function TraitDeActivate(Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data)
{
	Ext_PerkCommando(Perk).bUseProfessional = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkCommando'
	TraitGroup=class'Ext_TGroupZEDTime'
	NumLevels=1
	DefLevelCosts(0)=30
	DefMinLevel=35
}