-- Rialya's SCH GearSwap
include('organizer-lib.lua')
-- Gear Set Tables
function get_sets()
	--On Load settings
	include('rialya-commonitems.lua')
	windower.send_command('du blinking self always off; wait 8; input /lockstyleset 3; wait 1; du blinking self always on')
	-- Elemental Accuracy Change}
	Elemental_Index = 1
	--Elemental Obis
	sets.obi = {}
    sets.obi.Light = {waist='Korin Obi'}
	sets.obi.Dark = {waist='Anrin Obi'}
	sets.obi.Earth = {waist='Dorin Obi'}
	sets.obi.Water = {waist='Suirin Obi'} 
	sets.obi.Aero = {waist='Furin Obi'} 
	sets.obi.Fire = {waist='Karin Obi'}
	sets.obi.Ice = {waist='Hyorin Obi'} 
	sets.obi.Thunder = {waist='Rairin Obi'} 

	sets.JA = {}
	sets.JA.PenuryParsimony = {
		legs="Arbatel pants",
	}
	
	sets.JA.RaptureEbullience = {
		head="Arbatel bonnet",
	}
	
	sets.JA.PerpetuanceImmanence = {
		hands="Arbatel bracers",
	}
	
	sets.JA.TabulaRasa = {
		legs="Pedagogy pants",
	}
	
	sets.Magic = {}
	
	sets.Magic.STORMSURGE = {
		feet="Pedagogy loafers",
	}
	
	sets.Magic.IMPACT = {
		main="Marin Staff",
		sub="Mephitis Grip",
		range="Aureole",
		body="Twilight Cloak",
		hands={ name="Hagondes Cuffs", augments={'Phys. dmg. taken -2%','"Mag.Atk.Bns."+10',}},
		legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+23',}},
		feet="Arbatel Loafers",
		neck="Imbodla Necklace",
		waist="Aswang Sash",
		left_ear="Barkaro. Earring",
		right_ear="Gwati Earring",
		left_ring="Shiva Ring",
		right_ring="Shiva Ring",
		back="Refraction Cape",
	}
	
	sets.Magic.KLIMAFORM = {
		feet="Arbatel loafers",
	}
	
	-- Precast Sets (Gear equipped prior to casting) Grimoire = 10% RDM SubJob = Fast Cast II = -15%
	sets.precast = {
		ammo="Incantor stone",  			-- 2% Fast Cast
		head="Pedagogy mortarboard", 		-- -10% SC Time
		ear1="Loquacious earring", 			-- 2% Fast Cast
		hands="Gendewitha gages", 			-- 7% Fast Cast
		back="Swith cape", 					-- 3% Fast Cast
		waist="Witful belt", 				-- 3% Fast Cast
		legs="Artsieq Hose",				-- 5% Fast Cast
		feet="Academic's loafers",			-- 5% Fast Cast
	}
	
	sets.precast.AlacrityCelerity = {
		ammo="Incantor stone",  			-- 2% Fast Cast
		head={ name="Peda. M.Board", augments={'Enh. "Altruism" and "Focalization"',}},
		ear1="Loquacious earring", 			-- 2% Fast Cast
		hands="Gendewitha gages", 			-- 7% Fast Cast
		back="Swith cape", 					-- 3% Fast Cast
		waist="Witful belt", 				-- 3% Fast Cast
		legs="Artsieq Hose",				-- 5% Fast Cast
		feet="Pedagogy loafers",			-- 5% Fast Cast
	}
	
	
	sets.precast.OppositeSpellType = {
	
		ammo="Incantor stone",  			-- 2% Fast Cast
		head="Nahtirah hat", 				-- -10% Fast Cast
		ear1="Loquacious earring", 			-- 2% Fast Cast
		hands="Gendewitha gages", 			-- 7% Fast Cast
		back="Swith cape", 					-- 3% Fast Cast
		waist="Witful belt", 				-- 3% Fast Cast
		legs="Artsieq Hose",				-- 5% Fast Cast
		feet="Pedagogy loafers",			-- 5% Fast Cast
	
	}
	-- Midcast Sets
	--Elemental Magic
	
	sets.midcast = {}
	
	Elemental_Set_Names = {"Magic Potency", "Magic Accuracy"}
	sets.midcast.Elemental = {}
	sets.midcast.Elemental.ICE = {
		main="Keraunos", 
		}
	--Accuracy
	sets.midcast.Elemental['Magic Accuracy']= {
	
		main="Akademos",
		sub="Mephitis Grip",
		range="Aureole",
		head={ name="Peda. M.Board", augments={'Enh. "Altruism" and "Focalization"',}},
		body="Acad. Gown +1",
		hands={ name="Helios Gloves", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Magic crit. hit rate +5',}},
		legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+23',}},
		feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +6','MP+9',}},
		neck="Imbodla Necklace",
		waist="Aswang Sash",
		left_ear="Barkaro. Earring",
		right_ear="Gwati Earring",
		left_ring="Shiva Ring",
		right_ring="Shiva Ring",
		back={ name="Bookworm's Cape", augments={'INT+2','MND+2','Helix eff. dur. +19','"Regen" potency+9',}},
		
		}
	--Potency
	sets.midcast.Elemental['Magic Potency'] = {
	
		main="Akademos", 
		sub="Zuuxowu Grip", 
		ammo="Erlene's notebook", 
		head="Hagondes hat +1", 
		neck="Eddy necklace", 
		ear1="Barkarole earring",
		ear2="Friomisi earring", 
		body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+16',}},
		hands="Helios gloves", 
		ring1="Shiva ring", 
		ring2="Acumen Ring", 
		back="Bookworm's cape", 
		waist="Maniacus sash", 
		legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+23',}}, 
		feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +6','MP+9',}},
		
		}
--Helix

	sets.midcast.Helix = {
	
		main="Akademos",
		sub="Zuuxowu Grip",
		ammo="Ghastly Tathlum",
		head="Hagondes hat +1",
		body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+16',}},
		hands={ name="Helios Gloves", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Magic crit. hit rate +5',}},
		legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+23',}},
		feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +6','MP+9',}},
		neck="Eddy Necklace",
		waist="Aswang Sash",
		left_ear="Barkarole earring",
		ear2="Friomisi earring", 
		left_ring="Shiva Ring",
		right_ring="Shiva Ring",
		back={ name="Bookworm's Cape", augments={'INT+2','MND+2','Helix eff. dur. +19','"Regen" potency+9',}},
		
		}
--Healing Magic 
	--Cure Potency
	sets.midcast.CurePOT = {
	
		main="Arka iv",		-- 24% Cure Potency
		sub="Amicus grip", 				-- -3 Enmity
		ammo="Clarus stone", 			-- ConserveMP+3
		head="Gendewitha caubeen", 		-- 12% Cure Potency, -8 Enmity, MND+20
		neck="Phrenic torque", 			-- -7 Enmity
		ear1="Lifestorm earring", 		-- -1 Enmity, MND+4
		ear2="Novia earring", 			-- -7 Enmity
		body="Gendewitha Bliaut", 		-- 10% Cure Potency, MND+25
		hands="Bokwus gloves", 			-- 13% Cure Potency, MND+14
		ring1="Mediator's ring", 		-- -5 Enmity
		ring2="Ephedra ring", 			-- Healing Magic +7
		back="Vates cape", 				-- -7 Enmity
		waist="Pythia sash", 			-- -4 Enmity, MND+5, ConserveMP+4
		legs="Academic's pants +1", 	-- -4 Enmity, MND+29, Light Arts +20
		feet="Orvail souliers +1",		-- -5 Enmity, MND+18
		
		}
--Status Removal
--Enhancing Magic
	sets.midcast.Enhancing = {
	
		main="Earth staff", 
		sub="Fulcio Grip", 
		ammo="Savant's treatise", 
		head="Arbatel bonnet", 
		neck="Colossus's torque", 
		ear1="Lifestorm earring", 
		ear2="Andoaa earring", 
		body="Telchine chasuble", 
		hands="Hagondes cuffs", 
		ring1="Mediator's ring", 
		ring2="Ephedra ring", 
		back="Oretania's cape", 
		waist="Olympus sash", 
		legs="Academic's pants +1", 
		feet="Orvail souliers +1",
		
		}
--Regen
	sets.midcast.REGEN = {
	
		main="Bolelabunga", 
		ammo="Savant's treatise", 
		head="Arbatel bonnet", 
		neck="Colossus's torque", 
		ear1="Lifestorm earring", 
		ear2="Novia earring", 
		body="Telchine chasuble", 
		hands="Hagondes cuffs", 
		ring1="Mediator's ring", 
		ring2="Ephedra ring", 
		back="Bookworm's cape", 
		waist="Witful belt", 
		legs="Academic's pants +1", 
		feet="Orvail souliers +1",
		
		}
--Barspell
--Enfeebling Magic

	sets.midcast.Enfeebling = {
		
		main="Marin staff", 
		sub="Mephitis grip", 
		range="Aureole", 
		--head="", 
		neck="Imbodla Necklace", 
		ear1="Lifestorm earring", 
		ear2="Psystorm earring", 
		body="Respite cloak", 
		hands="Hagondes cuffs", 
		ring1="Mediator's ring", 
		ring2="Sangoma ring", 
		back="Refraction cape", 
		waist="Demonry sash", 
		legs="Psycloth lappas", 
		feet="Orvail souliers +1",
		
		}
		
	sets.midcast.Enfeebling.WhiteACC = {
		
		main="Marin Staff",
		sub="Mephitis Grip",
		range="Aureole",
		body="Respite Cloak",
		hands={ name="Hagondes Cuffs", augments={'Phys. dmg. taken -2%','"Mag.Atk.Bns."+10',}},
		legs="Psycloth Lappas",
		feet={ name="Uk'uxkaj Boots", augments={'Haste+2','"Snapshot"+2','MND+8',}},
		neck="Imbodla Necklace",
		waist="Demonry Sash",
		left_ear="Lifestorm Earring",
		right_ear="Psystorm Earring",
		left_ring="Mediator's Ring",
		right_ring="Sangoma Ring",
		back="Refraction Cape",
		
		}
	--Black Magic Accuracy
	sets.midcast.Enfeebling.BlackACC = {
	
		main="Marin staff", 
		sub="Mephitis grip", 
		range="Aureole", 
		neck="Imbodla Necklace", 
		ear1="Lifestorm earring", 
		ear2="Psystorm earring", 
		body="Respite cloak", 
		hands="Hagondes cuffs", 
		ring1="Shiva ring", 
		ring2="Shiva ring", 
		back="Refraction cape", 
		waist="Demonry sash", 
		legs="Psycloth lappas", 
		feet="Orvail souliers +1",
	}
	sets.midcast.Enfeebling.WhitePOT = {	
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="Savant's treatise", 
		head="", 
		neck="Imbodla Necklace", 
		ear1="Lifestorm earring", 
		ear2="Psystorm earring", 
		body="Respite cloak", 
		hands="Hagondes cuffs", 
		ring1="Shiva ring", 
		ring2="Angha Ring", 
		back="Bookworm's cape", 
		waist="Aswang sash", 
		legs="Psycloth lappas", 
		feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +6','MP+9',}},
		}
	--Black Magic Potency
	--Dark Magic
	--Accuracy
	sets.midcast.Dark = {
		
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="Savant's treatise", 
		head="Nahtirah hat", 
		neck="Imbodla Necklace", 
		ear1="Psystorm earring", 
		ear2="Lifestorm earring", 
		body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+16',}}, 
		hands="Hagondes cuffs", 
		ring1="Mediator's Ring", 
		ring2="Angha Ring", 
		back="Bookworm's cape", 
		waist="Aswang sash", 
		legs="Psycloth lappas", 
		feet="Uk'uxkaj boots",
		
		}
			
	sets.midcast.Dark.Stun = {
		
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="Savant's treatise", 
		head="Nahtirah hat", 
		neck="Imbodla Necklace", 
		ear1="Psystorm earring", 
		ear2="Lifestorm earring", 
		body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+16',}}, 
		hands="Hagondes cuffs", 
		ring1="Mediator's Ring", 
		ring2="Angha Ring", 
		back="Bookworm's cape", 
		waist="Aswang sash", 
		legs="Psycloth lappas", 
		feet="Uk'uxkaj boots",
		
		}
			
	sets.midcast.Dark.DrainAspir = {
		
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="Ombre tathlum", 
		head="Nahtirah hat", 
		neck="Imbodla Necklace", 
		ear1="Psystorm earring", 
		ear2="Lifestorm earring", 
		body="Academic's gown +1", 
		hands="Hagondes cuffs", 
		ring1="Archon Ring", 
		ring2="Excelsis ring", 
		back="Bookworm's cape", 
		waist="Fucho-no-obi", 
		legs="Psycloth lappas", 
		feet="Orvail souliers +1",
		
		}
			
-- Aftercast Sets
	--Defense/Kiting/Recovery Set
	sets.aftercast = {
		
		main="Earth Staff",
		sub="Oneiros Grip",
		ammo="Clarus Stone",
		body="Respite Cloak",
		hands={ name="Helios Gloves", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Magic crit. hit rate +5',}},
		legs="Assiduity pants +1",
		feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +6','MP+9',}},
		neck="Twilight Torque",
		waist="Fucho-no-Obi",
		left_ear="Ethereal earring",
		right_ear="Savant's Earring",
		left_ring="Shneddick Ring",
		right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -3%','Magic dmg. taken -5%',}},
		back="Cheviot Cape",
		
		}

	sets.aftercast.ItemLevel = {
	
		main="Earth Staff",
		sub="Oneiros Grip",
		ammo="Clarus Stone",
		body="Respite Cloak",
		hands={ name="Helios Gloves", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Magic crit. hit rate +5',}},
		legs="Assiduity pants +1",
		feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +6','MP+9',}},
		neck="Twilight Torque",
		waist="Fucho-no-Obi",
		right_ear="Savant's Earring",
		left_ring="Shneddick Ring",
		right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -3%','Magic dmg. taken -5%',}},
		back="Cheviot Cape",
	
	}
	
	-- Aftercast Sublimation
	sets.standing = {}
		
	sets.aftercast.sublimation = {
		
		main="Earth staff", 
		sub="Oneiros grip", 
		head="Academic's Mortarboard", 
		body="Pedagogy gown", 
		neck="Twilight torque",  
		ear2="Savant's earring", 
		hands="Helios gloves", 
		left_ring="Shneddick Ring",
		right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -3%','Magic dmg. taken -5%',}},
		waist="Fucho-no-obi",
		back="Cheviot cape", 
		legs="Assiduity pants +1", 
		feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +6','MP+9',}},
		
		}
		--Resting
	sets.resting = {
		
		main="Boonwell staff", 
		sub="Oneiros grip", 
		ammo="Clarus stone", 
		head="Orvail Corona +1", 
		neck="Grandiose chain", 
		body="Chelona blazer", 
		hands="Nares Cuffs", 
		ring2="Angha ring", 
		back="Vita cape", 
		waist="Qiqirn sash +1",
		legs="Nisse slacks", 
		feet="Chelona boots"
		
		}

end

-- Events (Casting)

function filtered_action(spell)
--Replaces spells and actions for either single target variants or related debuff on mobs	
	if spell.name == 'Barstonra' then
		cancel_spell()
		send_command('input /ma "Barstone" <me>')
	elseif spell.name == 'Baraera' then
		cancel_spell()
		send_command('input /ma "Baraero" <me>')
	elseif spell.name == 'Barwatera' then
		cancel_spell()
		send_command('input /ma "Barwater" <me>')
	elseif spell.name == 'Barfira' then
		cancel_spell()
		send_command('input /ma "Barfire" <me>')
	elseif spell.name == 'Barblizzara' then
		cancel_spell()
		send_command('input /ma "Barblizzard" <me>')
	elseif spell.name == 'Barthundra' then
		cancel_spell()
		send_command('input /ma "Barthunder" <me>')
	end
	if spell.target.type == 'MONSTER' then
		--add_to_chat(140, '**MONSTER check**')
		--Paralyze
		if spell.name == 'Paralyna' then
			cancel_spell()
			send_command('input /ma "Paralyze" <t>')
		end
		--Slow
		if spell.name == 'Haste' then
			cancel_spell()
			send_command('input /ma "Slow" <t>')
		end
		-- Silence
		if spell.name == 'Silena' then
			cancel_spell()
			send_command('input /ma "Silence" <t>')
		end
		
		if spell.name == 'Blindna' then
			cancel_spell()
			send_command('input /ma "Blind" <t>')
		end
		if spell.name == 'Stona' then
			cancel_spell()
			send_command('input /ma "Break" <t>')
		end
	end	
end

function pretarget(spell)
-- Light Arts and Dark Arts ChangeSpell
	if spell.name == 'Light Arts' and buffactive['Light Arts'] then
		cancel_spell()
		send_command('input /ja "Addendum: White" <me>')
	elseif spell.name == 'Dark Arts' and buffactive['Dark Arts'] then
		cancel_spell()
		send_command('input /ja "Addendum: Black" <me>')
	end
	-- Light Arts Strategem Spam (If one strategem is active as buff, an alternate one is used)
	if spell.name == 'Accession' and buffactive['Accession'] then
	cancel_spell()
	send_command('input /ja "Perpetuance" <me>')
	end
	-- Dark Arts Strategem Spam
	if spell.name == 'Parsimony' then
		if buffactive['Parsimony'] and buffactive['Ebullience'] then
		cancel_spell()
		send_command('input /ja "Alacrity" <me>')
		elseif buffactive['Parsimony'] then
		cancel_spell()
		send_command('input /ja "Ebullience" <me>')
		end
	end	
	--Status Removal to Enfeebling
	if spell.target.type == 'MONSTER' then
		--add_to_chat(140, '**MONSTER check**')
		--Paralyze
		if spell.name == 'Paralyna' then
			cancel_spell()
			send_command('input /ma "Paralyze" <t>')
		end
		--Slow
		if spell.name == 'Haste' then
			cancel_spell()
			send_command('input /ma "Slow" <t>')
		end
		-- Silence
		if spell.name == 'Silena' then
			cancel_spell()
			send_command('input /ma "Silence" <t>')
		end
		
		if spell.name == 'Blindna' then
			cancel_spell()
			send_command('input /ma "Blind" <t>')
		end
		
		if spell.name == 'Stona' then
			cancel_spell()
			send_command('input /ma "Break" <t>')
		end
		if spell.name == 'Cure III' then
			cancel_spell()
			add_to_chat(158, '**Spell Mismatch**')
		end
	end
end

function precast(spell)

	if spell.type == 'WhiteMagic' then
		if buffactive.celerity and spell.element == world.weather_element then
			equip(sets.precast.AlacrityCelerity)
			add_to_chat(140, '**Celerity Enhanced**')
		elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
			equip(sets.precast)
			add_to_chat(140, '**Grimore Precast Gear Equipped**')
		else
		equip(sets.precast.OppositeSpellType)
		add_to_chat(140, '**Precast Gear Equipped**')
		end
	elseif spell.type == 'BlackMagic' then
		if spell.name == 'Impact' then
			equip(sets.Magic.IMPACT)
		end
		
		if buffactive.alacrity and spell.element == world.weather_element and not (spell.skill == 'ElementalMagic' and spell.casttime <3 and buffactive.Klimaform) then
			if spell.name == 'Gravity' then
				equip(sets.midcast.enfeebling)
			else
			equip(sets.precast.AlacrityCelerity)
			add_to_chat(140, '**Alacrity Enhanced**')
			end
		elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			equip(sets.precast)
			add_to_chat(140, '**Grimore Precast Gear Equipped**')
		else
			equip(sets.precast.OppositeSpellType)
			add_to_chat(140, '**Precast Gear Equipped**')
		end
	end
	if spell.name == 'Tabula Rasa' then
		equip(sets.JA.TabulaRasa)
		add_to_chat(158, '**Tabula Rasa Enhanced**')
	end
end

function midcast(spell)
	
	if spell.skill == 'Elemental Magic' then
		if spell.name == 'Impact' then
			equip(sets.Magic.IMPACT)
		elseif string.find(spell.english,'helix') then
			equip (sets.midcast.Helix)
			add_to_chat(158, '**Helix Damage Gear Equipped**')
		else
			equip(sets.midcast.Elemental[Elemental_Set_Names[Elemental_Index]])
			add_to_chat(158, '**Elemental Damage Gear Equipped**')
				--if buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
				--equip({body="Academic's gown +1"})
				--add_to_chat(158, '**Academic Gown Equipped**')
				--end
				if spell.element == 'Stone' then
					if world.day_element == 'Stone' or  world.weather_element == 'Stone' then
					equip({waist="Dorin Obi"})
					add_to_chat(158, '**Earth Day/Weather Obi Equipped**')
					end
				elseif spell.element == 'Water' then
					if world.day_element == 'Water' or  world.weather_element == 'Water' then
					equip({waist="Suirin Obi"})
					add_to_chat(158, '**Water Day/Weather Obi Equipped**')
					end
				elseif spell.element == 'Wind' then
					if world.day_element == 'Wind' or  world.weather_element == 'Wind' then
					equip({waist="Furin Obi"})
					add_to_chat(158, '**Wind Day/Weather Obi Equipped**')
					end
				elseif spell.element == 'Fire' then
					if world.day_element == 'Fire' or  world.weather_element == 'Fire' then
					equip({waist="Karin Obi"})
					add_to_chat(158, '**Fire Day/Weather Obi Equipped**')
					end
				elseif spell.element == 'Ice' then
					equip(sets.midcast.Elemental.ICE)
					add_to_chat(158, '**Ice DMG Staff Equipped**')
					if world.day_element == 'Ice' or  world.weather_element == 'Ice' then
					equip({waist="Hyorin Obi"})
					add_to_chat(158, '**Ice Day/Weather Obi Equipped**')
					end
				elseif spell.element == 'Thunder' then
					if world.day_element == 'Thunder' or  world.weather_element == 'Thunder' then
					equip({waist="Rairin Obi"})
					add_to_chat(158, '**Lightning Day/Weather Obi Equipped**')
					end
				elseif spell.name == 'Impact' then
				equip (sets.Magic.IMPACT)
				
				end
				if buffactive['Klimaform'] and spell.element == world.weather_element then
					equip(sets.midcast.KLIMAFORM)
					add_to_chat(158, '**Klimaform Enhanced**')
				end
		end
	elseif spell.skill == 'Enfeebling Magic' then
		if spell.type == 'WhiteMagic' then
			equip(sets.midcast.Enfeebling.WhiteACC)
			add_to_chat(158, '**White Enfeebling Gear Equipped**')
		elseif spell.type == 'BlackMagic' then
			equip(sets.midcast.Enfeebling.BlackACC)
			add_to_chat(158, '**Black Enfeebling Gear Equipped**')
		end
	end
	if spell.skill == 'Dark Magic' then
		if spell.name == 'Drain' or spell.name == 'Aspir' then
			equip(sets.midcast.Dark.DrainAspir)
			add_to_chat(158, '** Drain/Aspir Gear Equipped**')
		elseif spell.name == 'Stun' then
			equip(sets.midcast.Dark.Stun)
			add_to_chat(158, '** Stun Gear Equipped**')
		else
			equip(sets.midcast.Dark)
			add_to_chat(158, '** Dark Magic Gear Equipped**')
		end
	end
	if spell.english:startswith('Cure') or spell.english:startswith('Cura') then
	equip(sets.midcast.CurePOT)
	add_to_chat(158, '**Cure Potency Gear Equipped**')
	end
	if spell.skill == 'Enhancing Magic' then
		if spell.english:startswith('Regen') then
			equip(sets.midcast.REGEN)
			add_to_chat(158, '**Regen Enhanced**')
		else
			equip(sets.midcast.Enhancing)
			add_to_chat(158, '**Enhancing Gear Equipped**')
				if string.find(spell.english,'storm') then
					equip(sets.Magic.STORMSURGE)
					add_to_chat(158, '**Storm Spells Enhanced**')
				end
		end
			if buffactive['Perpetuance'] then
				equip(sets.JA.Perpetuance)
				add_to_chat(158, '**Perpetuance Enhanced**')
			end
	end
	if spell.english == 'Sneak' and buffactive.sneak then
        send_command('@wait 1;cancel 71;')
    end
	if spell.english == 'Stoneskin' and buffactive.stoneskin then
        send_command('@wait 1;cancel stoneskin;')
    end
end
function aftercast(spell)
	equip(sets.aftercast)
	add_to_chat(158, '**Defense Gear Equipped**')
	-- Enfeebling Notification --
	if spell.english == 'Sleep' or spell.english == 'Sleepga' then
        send_command('@wait 50;input /echo ** '..spell.english..' 10 seconds **')
		send_command('@wait 57;input /echo ** '..spell.english..' 3 seconds **')
    elseif spell.english == 'Sleep II' then
        send_command('@wait 80;input /echo ** '..spell.english..' 10 seconds **')
		send_command('@wait 87;input /echo ** '..spell.english..' 3 seconds **')
	elseif spell.english == 'Paralyze'  then
		send_command('@wait 110;input /echo ** '..spell.english..' 10 seconds **')
		send_command('@wait 117;input /echo ** '..spell.english..' 3 seconds **')
	elseif spell.english == 'Frazzle'  then
		send_command('@wait 110;input /echo ** '..spell.english..' 10 seconds **')
		send_command('@wait 117;input /echo ** '..spell.english..' 3 seconds **')
	elseif spell.english == 'Distract'  then
		send_command('@wait 110;input /echo ** '..spell.english..' 10 seconds **')
		send_command('@wait 117;input /echo ** '..spell.english..' 3 seconds **')
	elseif spell.english == 'Gravity'  then
		send_command('@wait 110;input /echo ** '..spell.english..' 10 seconds **')
		send_command('@wait 117;input /echo ** '..spell.english..' 3 seconds **')
    elseif spell.english == 'Break' or spell.english == 'Bind' then
        send_command('@wait 20;input /echo ** '..spell.english..' 10 seconds **')
		send_command('@wait 27;input /echo ** '..spell.english..' 3 seconds **')
    end
end
--[[ function buff_change(status,gain_or_loss)
    if status == 'Sublimation: Complete' then 
        sets.standing = sets.aftercast
    elseif status == 'Sublimation: Activated' then
        sets.standing = sets.aftercast.sublimation
    end 
    equip(sets.standing)
end ]]
function status_change(new,old)
	if new == 'Resting' then
	equip(sets.resting)
	else
	equip(sets.aftercast)
	end
end

function self_command(command)
	if command == 'toggle Elemental set' then
		Elemental_Index = Elemental_Index +1
		if Elemental_Index > #Elemental_Set_Names then Elemental_Index = 1 end
		send_command('@input /echo ----- Elemental Set is ' ..Elemental_Set_Names[Elemental_Index]..' ------')
		equip(sets.midcast.Elemental[Elemental_Set_Names[Elemental_Index]])
	end
end
 
