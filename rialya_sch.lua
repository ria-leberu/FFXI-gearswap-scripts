-- Rialya's SCH GearSwap
include('organizer-lib.lua')
-- Gear Set Tables
function get_sets()
	--On Load settings
	include('rialya-commonitems.lua')
	windower.send_command('du blinking self always off; wait 8; input /lockstyleset 3; wait 1; du blinking self always on')
	
	--Binds Single Key Press to replace macros
	--Single Number Key
	windower.send_command('bind %1 input /ma "Cure III" <t>')
	windower.send_command('bind %2 input /ma "Cure IV" <t>')
	--windower.send_command('bind %3 input /ma "Cure V" <t>')
	--windower.send_command('bind %4 input ')
	windower.send_command('bind %5 input /ma "Haste" <t>')
	--windower.send_command('bind %6 input ')
	--windower.send_command('bind %7 input ')
	--windower.send_command('bind %8 input ')
	windower.send_command('bind %9 input /ja "Light Arts" <me>')
	windower.send_command('bind %0 input /ja "Dark Arts" <me>')
	
	--CTRL + Number Key
	windower.send_command('bind %^1 input /ma "Thunder V" <t>')
	windower.send_command('bind %^2 input /ma "Blizzard V" <t>')
	windower.send_command('bind %^3 input /ma "Thunder III" <t>')
	windower.send_command('bind %^4 input /ma "Blizzard III" <t>')
	--windower.send_command('bind %^5 input /ma "Curaga V" <t>')
	windower.send_command('bind %^6 input /ja "Penury" <me>')
	windower.send_command('bind %^7 input /ja "Accession" <me>')
	windower.send_command('bind %^8 input /ja "Rapture" <me>')
	--windower.send_command('bind %^9 input ')
	--windower.send_command('bind %^0 input ')
	
	--ALT + Number Key
	windower.send_command('bind %!1 input /ma "Sleep" <t>')
	windower.send_command('bind %!2 input /ma "Sleep II" <t>')
	windower.send_command('bind %!3 input /ma "Gravity" <t>')
	windower.send_command('bind %!4 input /ma "Bind" <t>')
	windower.send_command('bind %!5 input /ma "Break" <t>')
	windower.send_command('bind %!6 input /ja "Celerity" <me>')
	windower.send_command('bind %!7 input /ja "Perpetuance" <me>')
	--windower.send_command('bind %!8 input ')
	windower.send_command('bind %!9 input /ma "Aspir" <t>')
	windower.send_command('bind %!0 input /ma "Drain" <t>')
	
	--Misc Keys
	windower.send_command('bind %z input /ja "Sublimation" <me>')
	--windower.send_command('bind %q input /ja "Divine Caress" <me>')
	
	
	-- Elemental Accuracy Change}
	Elemental_Index = 1
	--Weapon
	sets.weapons = {}
	sets.weapons.dispelga = { 
	main="Daybreak",
	}
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
	sets.magic = {}
	sets.magic.STORMSURGE = {
		feet="Pedagogy loafers",
	}
	sets.magic.IMPACT = {
		head="",
		body="Twilight Cloak",	
	}
	sets.magic.KLIMAFORM = {
		feet="Arbatel loafers",
	}
	
	-- Aftercast Sets
	--Defense/Kiting/Recovery Set
	sets.aftercast = {
		main="Malignance Pole",
		sub="Alber Strap",
		ammo="Staunch Tathlum",
		head="Befouled Crown",
		body="Acad. Gown +1",
		hands="Amalric gages +1",
		legs="Assid. Pants +1",
		feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +6','MP+9',}},
		neck="Loricate Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Odnowa Earring +1",
		right_ear="Savant's Earring",
		left_ring="Shneddick Ring",
		right_ring="Defending Ring",
		back="Umbra Cape",
		}
	-- Aftercast Sublimation
	sets.standing = {}
	sets.aftercast.sublimation = {
		main="Malignance pole", 
		sub="", 
		head="Academic's Mortarboard", 
		body="Pedagogy gown", 
		neck="Loricate torque +1",  
		ear2="Savant's earring", 
		--hands="", 
		left_ring="Shneddick Ring",
		right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -3%','Magic dmg. taken -5%',}},
		waist="Fucho-no-obi",
		--back="", 
		legs="Assiduity pants +1", 
		feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +6','MP+9',}},
		}
	sets.resting = { --Resting
		main="Boonwell staff", 
		sub="", 
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
	Elemental_Set_Names = {"Magic Potency", "Magic Accuracy", "60 Cap"}
	sets.midcast.Elemental = {}
	sets.midcast.Elemental['Magic Accuracy']= { --ElementalAccuracy
		main={ name="Akademos", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20',}},
		sub="Tokko Grip",
		ammo="Elis Tome",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +1",
		feet="Amalric nails +1",
		neck="Eddy Necklace",
		waist="Maniacus Sash",
		left_ear="Barkaro. Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring",
		right_ring="Jhakri Ring",
		back={ name="Bookworm's Cape", augments={'INT+2','MND+2','Helix eff. dur. +19','"Regen" potency+9',}},
		}
	--Potency
	sets.midcast.Elemental['Magic Potency'] = {
		main={ name="Akademos", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20',}},
		sub="Tokko Grip",
		ammo="Elis Tome",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Amalric slops +1",
		feet="Amalric nails +1",
		neck="Eddy Necklace",
		waist="Maniacus Sash",
		left_ear="Barkaro. Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring",
		right_ring="Jhakri Ring",
		back={ name="Bookworm's Cape", augments={'INT+2','MND+2','Helix eff. dur. +19','"Regen" potency+9',}},
		}
	--60 Cap
		sets.midcast.Elemental['60 Cap'] = {
		main="Iridal staff",
		sub="Tokko Grip",
		ammo="Elis Tome",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +1",
		feet="Amalric nails +1",
		neck="Eddy Necklace",
		waist="Maniacus Sash",
		left_ear="Barkaro. Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring",
		right_ring="Jhakri Ring",
		back={ name="Bookworm's Cape", augments={'INT+2','MND+2','Helix eff. dur. +19','"Regen" potency+9',}},
		}
--Helix
	sets.midcast.Helix = {
		main={ name="Akademos", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20',}},
		sub="Tokko Grip",
		ammo="Elis Tome",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +1",
		feet="Amalric nails +1",
		neck="Eddy Necklace",
		waist="Maniacus Sash",
		left_ear="Barkaro. Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring",
		right_ring="Jhakri Ring",
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
		main="Malignance pole", 
		sub="Fulcio Grip", 
		ammo="Savant's treatise", 
		head="Arbatel bonnet", 
		neck="Colossus's torque", 
		ear1="Lifestorm earring", 
		ear2="Andoaa earring", 
		body="Telchine chasuble", 
		hands="Amalric gages +1",
		ring1="Mediator's ring", 
		ring2="Ephedra ring", 
		back="Oretania's cape", 
		waist="Olympus sash", 
		legs="Academic's pants +1", 
		feet="Orvail souliers +1",
		}
	sets.midcast.EnhancingDuration = {
		main="Malignance Pole",
		sub="Fulcio Grip",
		ammo="Savant's Treatise",
		head={ name="Telchine Cap", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +9',}},
		body={ name="Telchine Chas.", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		neck="Colossus's Torque",
		waist="Embla Sash",
		left_ear="Lifestorm Earring",
		right_ear="Andoaa Earring",
		left_ring="Mediator's Ring",
		right_ring="Ephedra Ring",
		back="Oretania's Cape",
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
		hands="Amalric gages +1",
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
		body="", 
		hands="Amalric gages +1",
		ring1="Mediator's ring", 
		ring2="Sangoma ring", 
		back="Refraction cape", 
		waist="", 
		legs="Psycloth lappas", 
		feet="Orvail souliers +1",
		}
	sets.midcast.Enfeebling.WhiteACC = {
		main="Marin Staff",
		sub="Mephitis Grip",
		range="Aureole",
		body="",
		hands="Amalric gages +1",
		legs="Psycloth Lappas",
		feet={ name="Uk'uxkaj Boots", augments={'Haste+2','"Snapshot"+2','MND+8',}},
		neck="Imbodla Necklace",
		waist="",
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
		body="", 
		hands="Amalric gages +1",
		ring1="Shiva ring", 
		ring2="Shiva ring", 
		back="Refraction cape", 
		waist="", 
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
		body="", 
		hands="Amalric gages +1",
		ring1="Shiva ring", 
		ring2="Angha Ring", 
		back="Bookworm's cape", 
		waist="Aswang sash", 
		legs="Psycloth lappas", 
		feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +6','MP+9',}},
		}
	sets.midcast.Dark = {
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="Savant's treatise", 
		head="Nahtirah hat", 
		neck="Imbodla Necklace", 
		ear1="Psystorm earring", 
		ear2="Lifestorm earring", 
		body="Amalric doublet +1", 
		hands="Amalric gages +1",
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
		body="Amalric doublet +1", 
		hands="Amalric gages +1",
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
		hands="Amalric gages +1",
		ring1="Archon Ring", 
		ring2="Excelsis ring", 
		back="Bookworm's cape", 
		waist="Fucho-no-obi", 
		legs="Psycloth lappas", 
		feet="Orvail souliers +1",
		}

end
function filtered_action(spell) -- Events (Casting)
	
	if buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		if spell.name == 'Penury' then 
			cancel_spell()
			send_command('input /ja "Parsimony" <me>')
		end
		if spell.name == 'Celerity' then
			cancel_spell()
			send_command('input /ja "Alacrity" <me>')
		end
		if spell.name == 'Accession' then
			cancel_spell()
			send_command('input /ja "Manifestation" <me>')
		end
		if spell.name == 'Rapture' then
			cancel_spell()
			send_command('input /ja "Ebullience" <me>')
		end
		if spell.name == 'Perpetuance' then
			cancel_spell()
			send_command('input /ja "Immanence" <me>')
		end
	end
--Dispelga
	if spell.name == 'Dispelga' then
		equip(sets.weapons.dispelga)
	end
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
		if spell.name == 'Poisona' then
			cancel_spell()
			send_command('input /ma "Poison II" <t>')
		end
	end	
	
	
		
end
function pretarget(spell)
-- Light Arts and Dark Arts ChangeSpell
	if spell.name == 'Hailstorm II' and player.main_job_level == 60 then
		cancel_spell()
		send_command('input /ma "Hailstorm" <t>')
	elseif spell.name == 'Windstorm II' and  player.main_job_level == 60 then
		cancel_spell()
		send_command('input /ma "Windstorm" <t>')
	end
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
			equip(sets.precast, sets.magic.IMPACT)
			add_to_chat(158, '**Precast IMPACT Gear Equipped**')
		end
		if spell.name == 'Dispelga' then
			equip(sets.precast, sets.weapons.dispelga)
			add_to_chat(158, '**Precast Gear Equipped**')
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
			equip(sets.midcast.Elemental['Magic Accuracy'], sets.magic.IMPACT)
			add_to_chat(158, '**Impact Gear Equipped**')
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
					equip({waist="Hachirin-no-Obi"})
					add_to_chat(158, '**Earth Day/Weather Obi Equipped**')
					end
				elseif spell.element == 'Water' then
					if world.day_element == 'Water' or  world.weather_element == 'Water' then
					equip({waist="Hachirin-no-Obi"})
					add_to_chat(158, '**Water Day/Weather Obi Equipped**')
					end
				elseif spell.element == 'Wind' then
					if world.day_element == 'Wind' or  world.weather_element == 'Wind' then
					equip({waist="Hachirin-no-Obi"})
					add_to_chat(158, '**Wind Day/Weather Obi Equipped**')
					end
				elseif spell.element == 'Fire' then
					if world.day_element == 'Fire' or  world.weather_element == 'Fire' then
					equip({waist="Hachirin-no-Obi"})
					add_to_chat(158, '**Fire Day/Weather Obi Equipped**')
					end
				elseif spell.element == 'Ice' then
					if world.day_element == 'Ice' or  world.weather_element == 'Ice' then
					equip({waist="Hachirin-no-Obi"})
					add_to_chat(158, '**Ice Day/Weather Obi Equipped**')
					end
				elseif spell.element == 'Thunder' then
					if world.day_element == 'Thunder' or  world.weather_element == 'Thunder' then
					equip({waist="Hachirin-no-Obi"})
					add_to_chat(158, '**Lightning Day/Weather Obi Equipped**')
					end
				elseif spell.name == 'Impact' then
				equip (sets.magic.IMPACT)
				
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
			if spell.name == 'Dispelga' then
			equip(sets.midcast.Enfeebling, sets.weapons.dispelga)
			add_to_chat(158, '**Daybreak Gear Equipped**')
			else
			equip(sets.midcast.Enfeebling.BlackACC)
			add_to_chat(158, '**Black Enfeebling Gear Equipped**')
			end
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
			add_to_chat(158, '** Dark magic Gear Equipped**')
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
		elseif spell.name == 'Haste' 
		or 'Flurry' 
		or 'Sneak' 
		or 'Invisible' 
		or 'Refresh' 
		or 'Sandstorm' 
		or 'Sandstorm II' 
		or 'Rainstorm' 
		or 'Rainstorm II' 
		or 'Windstorm' 
		or 'Windstorm II'
		or 'Firestorm' 
		or 'Firestorm II' 
		or 'Hailstorm' 
		or 'Hailstorm II' 
		or 'Aurorastorm' 
		or 'Aurorastorm II'
		or 'Animus Augeo' 
		or 'Animus Minuo' 
		or 'Adloquium' then
			equip(sets.midcast.EnhancingDuration)
			add_to_chat(158, '**Duration Enhanced**')	
		else
			equip(sets.midcast.Enhancing)
			add_to_chat(158, '**Enhancing Gear Equipped**')
				if string.find(spell.english,'storm') then
					equip(sets.magic.STORMSURGE)
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