-- Rialya's BLU Gearswap
include('organizer-lib.lua')

function get_sets()
	
	-- On Load settings
	include('rialya-commonitems.lua')
	windower.send_command('du blinking self always off; wait 8; input /lockstyleset 2; wait 1; du blinking self always on; ')
	windower.send_command('bind f10 gs c toggle Armor set')	
	
	-- Weapon Type Change
	Weapon_Index = 1
	Armor_Index = 1
	WS_Index = 1
	
	Weapon_Set_Names = {"Physical", "Magic"}
	Armor_Set_Names = {"Attack", "Accuracy", "PDT", "MDT"}
	
	sets.weapons = {}
	
	sets.weapons['Physical'] = {
		
		main={ name="Claidheamh Soluis", augments={'Accuracy+6','"Dbl.Atk."+2','DMG:+9',}},
		sub="Xiutleato",	
	}
	sets.weapons['Magic'] = {
		
		main="Gabaxorea",
		sub="Gabaxorea",
	
	}
	
	sets.standing = {}
	
	sets.standing['Attack'] = {
	    ammo="Honed Tathlum",
		body="Respite Cloak",
		hands="Iuitl wristbands +1",
		legs="Iuitl tights +1",
		feet="Iuitl gaiters +1",
		neck="Twilight Torque",
		waist="Flume belt",
		left_ear="Brutal earring",
		right_ear="Ethereal earring",
		left_ring="Shneddick ring",
		right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -3%','Magic dmg. taken -5%',}},
		back="Cheviot Cape",
	}
	
	sets.standing['Accuracy'] = {
	    ammo="Honed Tathlum",
		body="Respite Cloak",
		hands="Iuitl wristbands +1",
		legs="Iuitl tights +1",
		feet="Iuitl gaiters +1",
		neck="Twilight Torque",
		waist="Flume belt",
		left_ear="Brutal earring",
		right_ear="Ethereal earring",
		left_ring="Shneddick ring",
		right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -3%','Magic dmg. taken -5%',}},
		back="Cheviot Cape",
	}
	
	sets.standing['PDT'] = {
		
	    ammo="Honed Tathlum",
		head={ name="Iuitl Headgear +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Dbl.Atk."+2',}},
		body={ name="Iuitl Vest +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','Rng.Acc.+7',}},
		hands="Iuitl wristbands +1",
		legs="Iuitl tights +1",
		feet="Iuitl gaiters +1",
		neck="Twilight Torque",
		waist="Flume belt",
		left_ear="Brutal earring",
		right_ear="Ethereal earring",
		left_ring="Shneddick ring",
		right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -3%','Magic dmg. taken -5%',}},
		back="Cheviot Cape",
	
	}
	
	sets.standing['MDT'] = {
		
	    ammo="Honed Tathlum",
		head={ name="Iuitl Headgear +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Dbl.Atk."+2',}},
		body={ name="Iuitl Vest +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','Rng.Acc.+7',}},
		hands="Iuitl wristbands +1",
		legs="Iuitl tights +1",
		feet="Iuitl gaiters +1",
		neck="Twilight Torque",
		waist="Flume belt",
		left_ear="Brutal earring",
		right_ear="Ethereal earring",
		left_ring="Shneddick ring",
		right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -3%','Magic dmg. taken -5%',}},
		back="Mubvum. Mantle",
	
	}
	
	sets.TP = {}
	
	sets.TP['Accuracy'] = {
		
		ammo="Honed tathlum",
		head="Whirlpool mask",
		neck="Subtlety spectacles",
		left_ear="Dudgeon earring",
		right_ear="Heartseeker earring",
		body="Qaaxo harness",
		hands="Taeon gloves",
		left_ring="Adler ring",
		right_ring="Mars's Ring",
		back="Attacker's mantle",
		waist="Hurch'lan Sash",
		legs="Taeon tights",
		feet="Taeon boots",

	}
	sets.TP['Attack'] = {
	
		ammo="Honed Tathlum",
		head={ name="Iuitl Headgear +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Dbl.Atk."+2',}},
		body={ name="Qaaxo Harness", augments={'Attack+15','Evasion+15','"Dbl.Atk."+2',}},
		hands={ name="Taeon Gloves", augments={'Accuracy+12','"Triple Atk."+2',}},
		legs={ name="Taeon Tights", augments={'Accuracy+11','"Triple Atk."+2',}},
		feet={ name="Taeon Boots", augments={'Accuracy+12','"Triple Atk."+2',}},
		neck="Asperity Necklace",
		waist="Cetl belt",
		left_ear="Brutal Earring",
		right_ear="Suppanomimi",
		left_ring="Rajas Ring",
		right_ring="Mars's Ring",
		back="Atheling Mantle",

	}
	
	sets.TP['PDT'] = {
	
		ammo="Honed Tathlum",
		head={ name="Iuitl Headgear +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Dbl.Atk."+2',}},
		body={ name="Iuitl Vest +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','Rng.Acc.+7',}},
		hands={ name="Iuitl Wristbands +1", augments={'Phys. dmg. taken -4%','Accuracy+7',}},
		legs={ name="Iuitl Tights +1", augments={'Phys. dmg. taken -4%','"Mag.Def.Bns."+1',}},
		feet={ name="Iuitl Gaiters +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','"Dbl.Atk."+1',}},
		neck="Twilight Torque",
		waist="Flume Belt",
		left_ear="Brutal Earring",
		right_ear="Suppanomimi",
		left_ring="Adler Ring",
		right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -3%','Magic dmg. taken -5%',}},
		back="Cheviot Cape",
	
	}
	
	sets.TP['MDT'] = {
	
		ammo="Honed Tathlum",
		head={ name="Iuitl Headgear +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Dbl.Atk."+2',}},
		body={ name="Iuitl Vest +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','Rng.Acc.+7',}},
		hands={ name="Iuitl Wristbands +1", augments={'Phys. dmg. taken -4%','Accuracy+7',}},
		legs={ name="Iuitl Tights +1", augments={'Phys. dmg. taken -4%','"Mag.Def.Bns."+1',}},
		feet={ name="Iuitl Gaiters +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','"Dbl.Atk."+1',}},
		neck="Twilight Torque",
		waist="Flume Belt",
		left_ear="Brutal Earring",
		right_ear="Suppanomimi",
		left_ring="Adler Ring",
		right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -3%','Magic dmg. taken -5%',}},
		back="Mubvum. Mantle",
	
	}
	sets.TP.TreasureHunter = {
	
		waist="Chaac Belt",
	
	}
	sets.TP.Misc = {
	
		range="Aureole",
	}
	sets.precast = {}
	sets.precast.BLU = {
		
		head="Haruspex hat",
		left_ear="Loquacious earring",
		body="Hashishin mintan",
		back="Swith cape",
		--waist="Witful belt",
		legs="Orvail pants +1",
		feet="Chelona boots",
	
	}
	sets.midcast = {}
	sets.midcast.STR = {
		ammo="Mavi tathlum",
		head="Whirlpool mask",
		neck="Tjukurrpa medal",
		left_ear="Flame pearl",
		right_ear="Flame pearl",
		body="Assimilator's jubbah +1",
		hands="Rawhide gloves",
		left_ring="Rajas ring",
		right_ring="Ifrit ring",
		back="Cornflower Cape",
		waist="Prosilio belt",
		legs="Hashishin tayt",
		feet="Assimilator's charuqs +1",
	}
	sets.midcast.STRDEX = {
		ammo="Mavi tathlum",
		head="Taeon chapeau",
		neck="Tjukurrpa medal",
		left_ear="Flame pearl",
		right_ear="Flame pearl",
		body="Assimilator's jubbah +1",
		hands="Rawhide gloves",
		left_ring="Rajas ring",
		right_ring="Ifrit ring",
		back="Cornflower Cape",
		waist="Warwolf belt",
		legs="Hashishin tayt",
		feet="Assimilator's charuqs +1",
	}
	sets.midcast.DEX = {
		ammo="Mavi tathlum",
		head="Taeon chapeau",
		neck="Subtlety spectacles",
		left_ear="Flame pearl",
		right_ear="Flame pearl",
		body="Assimilator's jubbah +1",
		hands="Rawhide gloves",
		left_ring="Rajas ring",
		right_ring="Ramuh ring",
		back="Cornflower Cape",
		waist="Warwolf belt",
		legs="Hashishin tayt",
		feet="Assimilator's charuqs +1",
	}
	sets.midcast.STRVIT = {
		ammo="Mavi tathlum",
		head="Whirlpool mask",
		neck="Tjukurrpa medal",
		left_ear="Flame pearl",
		right_ear="Flame pearl",
		body="Assimilator's jubbah +1",
		hands="Rawhide gloves",
		left_ring="Rajas ring",
		right_ring="Spiral ring",
		back="Cornflower Cape",
		waist="Chuq'aba belt",
		legs="Hashishin tayt",
		feet="Assimilator's charuqs +1",
	}
	sets.midcast.STRMND = {
		ammo="Mavi tathlum",
		head="Taeon chapeau",
		neck="Tjukurrpa medal",
		left_ear="Flame pearl",
		right_ear="Flame pearl",
		body="Assimilator's jubbah +1",
		hands="Rawhide gloves",
		left_ring="Rajas ring",
		right_ring="Ifrit ring",
		back="Cornflower Cape",
		waist="Chuq'aba belt",
		legs="Hashishin tayt",
		feet="Assimilator's charuqs +1",
	}
	sets.midcast.AGI = {
		
		ammo="Mavi tathlum",
		head="Taeon chapeau",
		neck="Subtlety spectacles",
		left_ear="Dudgeon earring",
		right_ear="Heartseeker earring",
		body="Assimilator's jubbah +1",
		hands="Hagondes cuffs",
		left_ring="Solemn ring",
		right_ring="Breeze ring",
		back="Cornflower Cape",
		waist="Chaac belt",
		legs="Hashishin tayt",
		feet="Assimilator's charuqs +1",
	}
	sets.midcast.INT = {
		ammo="Erlene's Notebook",
		head="Hagondes Hat +1",
		body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+16',}},
		hands={ name="Helios Gloves", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Magic crit. hit rate +5',}},
		legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+23',}},
		feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +6','MP+9',}},
		neck="Eddy Necklace",
		waist="Aswang Sash",
		left_ear="Friomisi earring",
		right_ear="Novio Earring",
		left_ring="Shiva Ring",
		right_ring="Shiva Ring",
		back={ name="Cornflower Cape", augments={'MP+22','DEX+1','Accuracy+1','Blue Magic skill +10',}},
	}
	sets.midcast.CURE = {
		head="Assimilator's keffiyeh +1",
		left_ear="Lifestorm earring",
		right_ear="Mendicant's earring",
		head="Telchine cap",
		body="Telchine chasuble",
		hands="Telchine gloves",
		left_ring="Solemn ring",
		right_ring="Spiral ring",
		back="Oretania's cape",
		waist="Chuq'aba belt",
		legs="Orvail pants +1",
		feet="Assimilator's charuqs +1",
	}
	sets.midcast.MACC = {
		ammo="Mavi tathlum",
		head="Assimilator's keffiyeh +1",
		neck="Eddy necklace",
		left_ear="Lifestorm earring",
		right_ear="Psystorm earring",
		body="Hashishin mintan",
		hands="Hagondes cuffs",
		left_ring="Mediator's ring",
		right_ring="Sangoma Ring",
		back="Cornflower Cape",
		waist="Aswang sash",
		legs="Orvail pants +1",
		feet="Hashishin basmak",
	}
	sets.PHYSACC = {
		ammo="Mavi Tathlum",
		head="Assim. Keffiyeh +1",
		body="Assim. Jubbah +1",
		hands="Rawhide Gloves",
		legs="Hashishin Tayt",
		feet={ name="Luhlaza Charuqs", augments={'Enhances "Diffusion" effect',}},
		neck="Eddy Necklace",
		waist="Hurch'lan Sash",
		left_ear="Heartseeker Earring",
		right_ear="Steelflash Earring",
		left_ring="Adler Ring",
		right_ring="Mars's Ring",
		back={ name="Cornflower Cape", augments={'MP+22','DEX+1','Accuracy+1','Blue Magic skill +10',}},
	}
	sets.midcast.RECAST = {
		head="Haruspex Hat",
		body={ name="Luhlaza Jubbah", augments={'Enhances "Enchainment" effect',}},
		hands="Hashi. Bazubands",
		legs="Orvail Pants +1",
		left_ear="Loquacious earring",
		feet={ name="Taeon Boots", augments={'Accuracy+12','"Triple Atk."+2',}},
		waist="Hurch'lan Sash",
		back="Swith Cape",
	}
	sets.midcast.BLUSKILL = {
		ammo="Mavi Tathlum",
		head="Luhlaza Keffiyeh",
		body="Assim. Jubbah +1",
		hands="Rawhide Gloves",
		legs="Hashishin Tayt",
		feet={ name="Luhlaza Charuqs", augments={'Enhances "Diffusion" effect',}},
		back={ name="Cornflower Cape", augments={'MP+22','DEX+1','Accuracy+1','Blue Magic skill +10',}},
	}
	sets.midcast.HEAVYSTRIKE = {
		ammo="Honed tathlum",
		head="Whirlpool mask",
		neck="Subtlety spectacles",
		left_ear="Flame pearl",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		body="Assimilator's jubbah +1",
		hands="Iuitl wristbands +1",
		left_ring="Adler ring",
		right_ring="Mars's Ring",
		back="Cornflower cape",
		waist="Chuq'aba belt",
		legs={ name="Taeon Tights", augments={'Accuracy+11','"Triple Atk."+2',}},
		feet="Assimilator's charuqs +1",
	}
	sets.WS = {}
	sets.WS.Requiescat = {
	
		ammo="Honed Tathlum",
		head={ name="Iuitl Headgear +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Dbl.Atk."+2',}},
		body={ name="Qaaxo Harness", augments={'Attack+15','Evasion+15','"Dbl.Atk."+2',}},
		hands={ name="Taeon Gloves", augments={'Accuracy+12','"Triple Atk."+2',}},
		legs={ name="Taeon Tights", augments={'Accuracy+11','"Triple Atk."+2',}},
		feet={ name="Taeon Boots", augments={'Accuracy+12','"Triple Atk."+2',}},
		neck="Soil gorget",
		left_ear="Brutal earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Solemn ring",
		right_ring="Spiral ring",
		back="Atheling mantle",
		waist="Shadow belt",
	}
	sets.WS.Expiacion = {}
	sets.WS.SanguineBlade = {
		head="Hagondes hat +1",
		neck="Eddy necklace",
		left_ear="Friomisi earring",
		right_ear="Novio earring",
		body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+16',}},
		hands="Hagondes cuffs",
		left_ring="Shiva ring",
		right_ring="Shiva ring",
		back="Cornflower Cape",
		waist="Aswang sash",
		legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+23',}},
		feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +6','MP+9',}},
	}
	sets.WS.ChantDuCygne = {
		ammo="Jukukik Feather",
		head={ name="Taeon Chapeau", augments={'Attack+11','Crit.hit rate+3','STR+2',}},
		body={ name="Taeon Tabard", augments={'Accuracy+11','Crit.hit rate+3','HP+7',}},
		hands={ name="Taeon Gloves", augments={'Attack+14','Crit.hit rate+3','Crit. hit damage +1%',}},
		legs={ name="Taeon Tights", augments={'Accuracy+9','Crit.hit rate+3','STR+1 VIT+1',}},
		feet={ name="Taeon Boots", augments={'Attack+21','Crit.hit rate+3','STR+1 VIT+1',}},
		neck="Light Gorget",
		waist="Snow Belt",
		left_ear="Brutal Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Rajas Ring",
		right_ring="Ramuh Ring",
		back="Rancorous Mantle",
	}
	sets.WS.Realmrazer = {
		head="Whirlpool mask", 
		body="Luhlaza Jubbah", 
		neck="Flame gorget", 
		left_ear="Brutal earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		hands="Iuitl wristbands +1", 
		left_ring="Mars's Ring", 
		right_ring="Solemn ring", 
		waist="Hurch'lan Sash",
		back="Attacker's mantle", 
		legs={ name="Taeon Tights", augments={'Accuracy+11','"Triple Atk."+2',}},
		feet="Assimilator's charuqs +1",
	}	
	sets.JA = {}
	sets.JA.Diffusion = {
		feet="Luhlaza charuqs",
	}
	sets.JA.ChainAffinity = {	
		head="Hashishin kavuk",
		feet="Assimilator's charuqs +1",
	}
	sets.JA.BurstAffinity = {
		legs="Assimilator's shalwar",
		feet="Hashishin basmak",
	}
	sets.JA.Efflux = {
		legs="Hashishin tayt",
	}
	sets.JA.AzureLore = {
		hands="Mirage Bazubands +2",
	}
	--Trust Equip Swap
		sets.trust = {
	    ammo="Honed Tathlum",
		body="Respite Cloak",
		hands="Taeon gloves",
		legs="Taeon tights",
		feet="Taeon Boots",
		neck="Twilight Torque",
		waist="Chuq'aba Belt",
		left_ring="Shneddick ring",
		right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -3%','Magic dmg. taken -5%',}},
		back="Cheviot Cape",
	}
	-- Variables
	weapon_type = 'physical'
	count_aptitude = 0
end

-- Gear Lock --

--WS Change Based on Mainhand
function filtered_action(spell)
	if spell.name == "Chant du Cygne" then
		if player.equipment.main == 'Gabaxorea' then
			cancel_spell()
			send_command('input /ws "Realmrazer" <t>')
		else
			equip(sets.WS.ChantDuCygne)
			add_to_chat(158, '**Chant du Cygne Gear Equipped**')
		end
	end
	if spell.name == "Requiescat" then
		if player.equipment.main == 'Gabaxorea' then
			cancel_spell()
			send_command('input /ws "Flash Nova" <t>')
		else
			equip(sets.WS.Requiescat)
			add_to_chat(158, '**Requiescat Gear Equipped**')
		end
	end
	if spell.name == "Sanguine Blade" then
		equip(sets.WS.SanguineBlade)
		add_to_chat(158, '**Sanguine Gear Equipped**')
	end
end

function precast(spell)

	if spell.name == "Chant du Cygne" then
		equip(sets.WS.ChantDuCygne)
		add_to_chat(158, '**Chant du Cygne Gear Equipped**')
	end
	
	if spell.name == "Requiescat" then
		equip(sets.WS.Requiescat)
		add_to_chat(158, '**Requiescat Gear Equipped**')
	end
	if spell.name == "Sanguine Blade" then
		equip(sets.WS.SanguineBlade)
		add_to_chat(158, '**Sanguine Gear Equipped**')
	end
	if spell.name == "Realmrazer" then
		equip(sets.WS.Realmrazer)
		add_to_chat(158, '**Realmrazer Gear Equipped**')
	end
	if spell.name == "Savage Blade" then
		equip(sets.WS.Realmrazer)
		add_to_chat(158, '**Savage Blade Gear Equipped**')
	end
	if spell.skill == 'Blue Magic' then
		-- if spell.name == 'Sudden Lunge' then
		-- equip (sets.PHYSACC)
		-- add_to_chat(158, '**Physical Accuracy Set Equipped**')
		-- else
		equip(sets.precast.BLU)
		add_to_chat(158, '**Precast Gear Equipped**')
	elseif spell.skill == 'White Magic' then
		equip(sets.precast)
	end
	if spell.name == 'Azure Lore' then
		equip(sets.JA.AzureLore)
		add_to_chat(158, '**Azure Lore Enhanced**')
	end
end

function midcast(spell)
	if spell.type == "Trust" then
		equip(sets.trust)
		add_to_chat(158, '**Trust 119 Equipped**')
	end
	-- BLU STR Spells --
	if spell.name == 'Quadrastrike' or spell.name == 'Vertical Cleave' or spell.name == 'Death Scissors' or spell.name == 'Empty Thrash' or spell.name == 'Dimensional Death' or spell.name == 'Bloodrake' or spell.name == 'Amorphic Spikes' then 
		equip(sets.midcast.STR)
		add_to_chat(158, '**STR Gear Equipped**')
			if buffactive['Chain Affinity'] then
				equip(sets.ChainAffinity)
				add_to_chat(158, '**Chain Affinity Enhanced**')
			end
			if buffactive['Efflux'] then
				equip(sets.Efflux)
				add_to_chat(158, '**Efflux Affinity Enhanced**')
			end
	end
	-- BLU STRDEX Spells
	if spell.name == 'Disseverment' or spell.name == 'Hysteric Barrage' or spell.name == 'Frenetic Rip' or spell.name == 'Seedspray' or spell.name == 'Vanity Dive' or spell.name == 'Goblin Rush' or spell.name == 'Thrashing Assault' then
		equip(sets.midcast.STRDEX)
		add_to_chat(158, '**STRDEX Gear Equipped**')
			if buffactive['Chain Affinity'] then
				equip(sets.ChainAffinity)
				add_to_chat(158, '**Chain Affinity Enhanced**')
			end
			if buffactive['Efflux'] then
				equip(sets.Efflux)
				add_to_chat(158, '**Efflux Affinity Enhanced**')
			end
	end
	-- BLU STRVIT Spells
	if spell.name == 'Quad. Continuum' or spell.name == 'Delta Thrust' or spell.name == 'Cannonball' or spell.name == 'Glutinous Dart' then
		equip(sets.midcast.STRVIT)
		add_to_chat(158, '**STRVIT Gear Equipped**')
			if buffactive['Chain Affinity'] then
				equip(sets.ChainAffinity)
				add_to_chat(158, '**Chain Affinity Enhanced**')
			end
			if buffactive['Efflux'] then
				equip(sets.Efflux)
				add_to_chat(158, '**Efflux Affinity Enhanced**')
			end
	end
	-- BLU STRMND Spells
	if spell.name == 'Whirl of Rage' then
		equip(sets.midcast.STRMND)
		add_to_chat(158, '**STRMND Gear Equipped**')
			if buffactive['Chain Affinity'] then
				equip(sets.ChainAffinity)
				add_to_chat(158, '**Chain Affinity Enhanced**')
			end
			if buffactive['Efflux'] then
				equip(sets.Efflux)
				add_to_chat(158, '**Efflux Affinity Enhanced**')
			end
	end
	-- BLU DEX
	if spell.name == 'Sinker Drill' then 
		equip(sets.midcast.DEX)
		add_to_chat(158, '**DEX Gear Equipped**')
			if buffactive['Chain Affinity'] then
				equip(sets.ChainAffinity)
				add_to_chat(158, '**Chain Affinity Enhanced**')
			end
			if buffactive['Efflux'] then
				equip(sets.Efflux)
				add_to_chat(158, '**Efflux Affinity Enhanced**')
			end
	end
	-- BLU AGI 
	if spell.name == 'Benthic Typhoon' or spell.name == 'Final Sting' or spell.name == 'Spiral Spin' then
		equip(sets.midcast.AGI)
		add_to_chat(158, '**AGI Gear Equipped**')
			if buffactive['Chain Affinity'] then
				equip(sets.ChainAffinity)
				add_to_chat(158, '**Chain Affinity Enhanced**')
			end
			if buffactive['Efflux'] then
				equip(sets.Efflux)
				add_to_chat(158, '**Efflux Affinity Enhanced**')
			end
	end
	-- BLU Physical Accuracy
	if spell.name == 'Sweeping Gouge'  or spell.name == 'Paralyzing Triad' or spell.name == 'Sudden Lunge' then
		equip (sets.PHYSACC)
		add_to_chat(158, '**Physical Accuracy Set Equipped**')
	end
	
	-- BLU Magical Spells/INT
	if spell.name == 'Gates of Hades' or spell.name == 'Leafstorm' or spell.name == 'Firespit' or spell.name == 'Acrid Stream' or spell.name == 'Regurgitation' or spell.name == 'Corrosive Ooze' or spell.name == 'Thermal Pulse' or spell.name == 'Magic Hammer' or spell.name == 'Evryone. Grudge' or spell.name == 'Water Bomb' or spell.name == 'Dark Orb' or spell.name == 'Thunderbolt' or spell.name == 'Tem. Upheaval' or spell.name == 'Embalming Earth' or spell.name == 'Foul Waters' or spell.name == 'Rending Deluge' or spell.name == 'Droning Whirlwind' or spell.name == 'Subduction' or spell.name == 'Spectral Floe' or spell.name == 'Blinding Fulgor' or spell.name == 'Sandspin' then
		equip(sets.midcast.INT)
		add_to_chat(158, '**INT Gear Equipped**')
			if buffactive['Burst Affinity'] then
				equip(sets.JA.BurstAffinity)
				add_to_chat(158, '**Burst Affinity Enhanced**')
			end	
	end
	-- BLU Cure Spells
	if spell.name == 'Magic Fruit' or spell.name == 'Plenilune Embrace' or spell.name == 'Wild Carrot' or spell.name == 'Pollen' or spell.name == 'Cure III' or spell.name == 'Cure IV' then
		equip(sets.midcast.CURE)
		add_to_chat(158, '**Cure Gear Equipped**')
	end
	-- BLU Debuffs
	if spell.name == 'Frightful Roar' or spell.name == 'Infrasonics' or spell.name == 'Barbed Crescent' or spell.name == 'Tourbillion' or spell.name == 'Cimicine Discharge' or spell.name == 'Sub-zero smash' or spell.name == 'Filamented Hold' or spell.name == 'Mind Blast' or spell.name == 'Sandspin' or spell.name == 'Hecatomb Wave' or spell.name == 'Cold Wave' or spell.name == 'Terror Touch' or spell.name == 'Pinecone Bomb' or spell.name == 'Dream Flower' or spell.name == 'Sheep song' then  
		equip(sets.midcast.MACC)
		add_to_chat(158, '**Magic ACC Gear Equipped**')
	end
	-- BLU Offensive/Defensive Debuffs for Recast Reduction
	if spell.name == 'MP Drainkiss' or spell.name == 'Digest' or spell.name == 'Blood Saber' or spell.name == 'Blood Drain' or spell.name == 'Osmosis' or spell.name == 'Occultation' or spell.name == 'Magic Barrier' or spell.name == 'Diamondhide' or spell.name == 'Metallic Body' or spell.name == 'Retinal Glare' or spell.name == 'Cocoon' or spell.name == 'Harden Shell' or spell.name == 'Animating Wail' or spell.name == 'Battery Charge' or spell.name == 'Nat. Meditation' or spell.name == 'Carcharian Verve' or spell.name == 'O. Counterstance' or spell.name == 'Barrier Tusk' or spell.name == 'Saline Coat' or spell.name == 'Regeneration' or spell.name == 'Erratic Flutter' then
		if buffactive['Diffusion'] then
			set_combine(sets.midcast.RECAST, sets.JA.Diffusion)
			add_to_chat(158, '**Diffusion Enhanced**')
		else
		equip(sets.midcast.RECAST)
		add_to_chat(158, '**Recast Gear Equipped**')
		end
		
	end
	-- Heavy Strike 
	if spell.name == 'Heavy Strike' then
		add_to_chat(158, '**Heavy Strike Gear Equipped**')
		equip(sets.midcast.HEAVYSTRIKE)
			if buffactive['Chain Affinity'] then
				equip(sets.JA.ChainAffinity)
				add_to_chat(158, '**Chain Affinity Enhanced**')
			end
			if buffactive['Efflux'] then
				equip(sets.JA.Efflux)
				add_to_chat(158, '**Efflux Affinity Enhanced**')
			end
	end
	-- Sneak Jig --
	if spell.english == 'Spectral Jig' or spell.english == 'Sneak' and buffactive.sneak then
        send_command('cancel 71')
    end
end
function aftercast(spell)
	if player.status == 'Engaged' then
		equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
       equip(sets.TP[Armor_Set_Names[Armor_Index]])
		add_to_chat(158, '**TP ' ..Armor_Set_Names[Armor_Index]..' Equipped**')
    else
		equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
        equip(sets.standing[Armor_Set_Names[Armor_Index]])
		add_to_chat(158, '**Standing ' ..Armor_Set_Names[Armor_Index]..' Equipped**')
    end
end
function status_change(new,old)
    if new == 'Engaged' then
		equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
        equip(sets.TP[Armor_Set_Names[Armor_Index]])
		add_to_chat(158, '**TP ' ..Armor_Set_Names[Armor_Index]..' Equipped**')
    else
		equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
		equip(sets.standing[Armor_Set_Names[Armor_Index]])
		add_to_chat(158, '**Standing ' ..Armor_Set_Names[Armor_Index]..' Equipped**')
	end
end
function gear_modes()
	if player.equipment.main == 'empty' then
		equip(sets.weapon[weapon_type])
		add_to_chat(158, '**')
	end
end
function self_command(command)
	if command == 'toggle Weapon set' then
		Weapon_Index = Weapon_Index +1
		if Weapon_Index > #Weapon_Set_Names then Weapon_Index = 1 end
		send_command('@input /echo ----- Weapon Set is ' ..Weapon_Set_Names[Weapon_Index]..' ------')
		equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
	end
	if command == 'toggle Armor set' then
		Armor_Index = Armor_Index +1
		if Armor_Index > #Armor_Set_Names then Armor_Index = 1 end
		send_command('@input /echo ----- Armor Set is ' ..Armor_Set_Names[Armor_Index]..' ------')
			if player.status == 'Engaged' then
				equip(sets.TP[Armor_Set_Names[Armor_Index]])
			else
				equip(sets.standing[Armor_Set_Names[Armor_Index]])
			end
	end
end