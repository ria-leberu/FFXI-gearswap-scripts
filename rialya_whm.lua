-- Rialya's WHM Gearswap
include('organizer-lib.lua')

function get_sets()
	--Starup Settings
		include('rialya-commonitems.lua') --Essential carry inventory items (i.e. Echo Drops, Remedy)
		windower.send_command('du blinking self always off; wait 8; input /lockstyleset 1; wait 1; du blinking self always on;')
	-- Obi Sets
		sets.obi = {}
		sets.obi.Light = {waist='Korin Obi'}
		sets.obi.Dark = {waist='Anrin Obi'}
	-- Aftercast Sets
		--Defense/Kiting/Recovery Set
	sets.Standing = {
		main="Yagrush", 
		sub="Genbu's shield", 
		body="Respite cloak",  
		neck="Twilight torque",  
		ear2="Novia earring", 
		hands="Dynasty mitts", 
		ring1="Dark ring", 
		ring2="Shneddick ring", 
		waist="Fucho-no-obi",
		back="Cheviot cape", 
		legs="Assiduity pants +1", 
		feet="Helios boots",
	}
	sets.StandingTP = {
		head="Theophany cap", 
		body="Theophany briault", 
		neck="Asperity necklace", 
		ear1="Brutal earring", 
		ear2="Suppanomimi", 
		hands="Telchine gloves", 
		ring1="Mars's Ring", 
		ring2="Rajas ring", 
		waist="Cetl belt",
		back="Cheviot cape", 
		legs="Telchine braconi", 
		feet="Helios boots",
	}
	sets.WSRealmrazer = {
		head="Theophany cap", 
		body="Weatherspoon robe +1", 
		neck="Light gorget", 
		ear1="Bladeborn earring", 
		ear2="Steelflash earring", 
		hands="Telchine gloves", 
		ring1="Mars's Ring", 
		ring2="Cetl belt", 
		waist="Fucho-no-obi",
		back="Cheviot cape", 
		legs="Telchine braconi", 
		feet="Helios boots",
	}
		--Resting
	sets.Resting = {
		main="Boonwell staff", 
		ammo="Clarus stone", 
		head="Orvail Corona +1", 
		neck="Grandiose chain", 
		body="Chelona blazer", 
		hands="Nares cuffs", 
		ring2="Angha ring", 
		back="Vita cape", 
		waist="Qiqirn sash +1",
		legs="Nisse slacks", 
		feet="Chelona boots",
	}
	-- Precast Sets
	sets.Precast = {
		main="Yagrush", 
		sub="Sors shield",
		ammo="Incantor stone", 			-- 2% Fast Cast
		head="Nahtirah hat", 			-- 10% Fast Cast
		ear1="Loquacious earring", 
		hands="Gendewitha gages", 
		back="Swith cape", 
		waist="Witful belt",
		legs="Artsieq hose",
		feet="Chelona boots",
	}
	sets.PrecastCure = {
		main="Ababinili", 
		ammo="Incantor stone", 
		head="Nahtirah hat", 
		neck="Aceso's choker", 
		ear1="Loquacious earring", 
		ear2="Novia earring", 
		body="Ebers Bliaud", 
		hands="Gendewitha gages", 
		ring1="Mediator's ring", 
		ring2="Ephedra ring", 
		back="Swith cape", 
		waist="Witful belt", 
		legs="Orison pantaloons +2", 
		feet="Chelona boots",
	}
	sets.PrecastStatus = {
		main="Yagrush", 
		sub="Sors shield",
		ammo="Incantor stone", 
		head="nahtirah hat", 
		neck="Aceso's choker", 
		ear1="Loquacious earring", 
		ear2="Novia earring", 
		body="Ebers Bliaud", 
		hands="Gendewitha gages", 
		ring1="Mediator's ring", 
		ring2="Ephedra ring", 
		back="Swith cape", 
		waist="Witful belt", 
		legs="Orison pantaloons +2", 
		feet="Chelona boots",
	}
--Midcast Sets
--Healing Magic 
	--Cure Potency
	sets.MidcastCurePotency = {
		main="Tamaxchi", 
		sub="Sors shield", 
		ammo="Clarus stone", 
		head="Gendewitha caubeen", 
		neck="Phrenic torque", 
		ear1="Lifestorm earring", 
		ear2="Novia earring", 
		body="Gendewitha Bliaut", 
		hands="Bokwus gloves", 
		ring1="Mediator's ring", 
		ring2="Ephedra ring", 
		back="Mending cape", 
		waist="Pythia sash", 
		legs="Nisse slacks", 
		feet="Orvail souliers +1",
	}
	--Status Removal
	sets.MidcastStatusNaSpells = {
		main="Yagrush", 
		sub="Sors shield",
		ammo="Clarus stone", 
		head="Ebers Cap", 
		neck="Phrenic torque", 
		ear1="Lifestorm earring", 
		ear2="Novia earring", 
		body="Weatherspoon robe +1", 
		hands="Bokwus gloves", 
		ring1="Mediator's ring", 
		ring2="Ephedra ring", 
		back="Mending cape", 
		waist="Korin Obi", 
		legs="Nisse slacks", 
		feet="Orvail souliers +1",
	}
	sets.MidcastStatusCursna = {
		main="Yagrush", 
		sub="Sors shield", 
		ammo="Clarus stone", 
		head="Gendewitha caubeen", 
		neck="Malison medallion", 
		ear1="Lifestorm earring", 
		ear2="Novia earring", 
		body="Gendewitha Bliaut", 
		hands="Bokwus gloves", 
		ring1="Mediator's ring", 
		ring2="Ephedra ring", 
		back="Mending cape", 
		waist="Cetl belt", 
		legs="Theophany pantaloons", 
		feet="Gendewitha galoshes",
	}
	sets.MidcastEraseSacrificeEsuna = {
		main="Yagrush", 
		sub="Sors shield",
		ammo="Clarus stone", 
		head="Gendewitha caubeen", 
		neck="Phrenic torque", 
		ear1="Lifestorm earring", 
		ear2="Novia earring", 
		body="Gendewitha Bliaut", 
		hands="Bokwus gloves", 
		ring1="Mediator's ring", 
		ring2="Ephedra ring", 
		back="Mending cape", 
		waist="Cetl belt", 
		legs="Nisse slacks", 
		feet="Orvail souliers +1",
	}
	sets.MidcastDivineCaress = {
		main="Yagrush",
		ammo="Clarus stone", 
		head="Gendewitha caubeen", 
		neck="Phrenic torque", 
		ear1="Lifestorm earring", 
		ear2="Novia earring", 
		body="Gendewitha Bliaut", 
		hands="Orison mitts +2", 
		ring1="Mediator's ring", 
		ring2="Ephedra ring", 
		back="Mending cape", 
		waist="Korin Obi", 
		legs="Nisse slacks", 
		feet="Orvail souliers +1",
	}
--Enhancing Magic
	sets.MidcastMaxEnhancing = {
		main="Ababinili", 
		sub="Fulcio Grip", 
		ammo="Clarus stone", 
		head="Ebers Cap", 
		neck="Colossus's torque", 
		ear1="Lifestorm earring", 
		ear2="Novia earring", 
		body="Ebers Bliaud", 
		hands="Dynasty Mitts", 
		ring1="Mediator's ring", 
		ring2="Ephedra ring", 
		back="Mending cape", 
		waist="Witful belt", 
		legs="Piety pantaloons", 
		feet="Orison duckbills +2",
	}
--Regen
	sets.MidcastEnhancingRegen = {
		main="Ababinili", 
		sub="Fulcio Grip", 
		ammo="Clarus stone", 
		head="Ebers Cap", 
		neck="Noetic torque", 
		ear1="Lifestorm earring", 
		ear2="Novia earring", 
		body="Cleric's briault +2", 
		hands="Orison mitts +2", 
		ring1="Mediator's ring", 
		ring2="Ephedra ring", 
		back="Mending cape", 
		waist="Witful belt", 
		legs="Theophany pantaloons", 
		feet="Orison duckbills +2",
	}
--Barspell
	sets.MidcastEnhancingBarspell = {
		main="Ababinili", 
		sub="Fulcio Grip", 
		ammo="Clarus stone", 
		head="Ebers Cap", 
		neck="Colossus's torque", 
		ear1="Lifestorm earring", 
		ear2="Novia earring", 
		body="Ebers Bliaud", 
		hands="Dynasty Mitts", 
		ring1="Mediator's ring", 
		ring2="Ephedra ring", 
		back="Mending cape", 
		waist="Witful belt", 
		legs="Piety pantaloons", 
		feet="Orison duckbills +2",
	}
--Enfeebling Magic
	sets.MidcastEnfeebling = {
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="", 
		head="Weatherspoon corona +1", 
		neck="Imbodla Necklace", 
		ear1="Lifestorm earring", 
		ear2="Psystorm earring", 
		body="Theophany briault", 
		hands="Gendewitha gages", 
		ring1="Mediator's ring", 
		ring2="Angha Ring", 
		back="Refraction cape", 
		waist="Aswang sash", 
		legs="Telchine braconi", 
		feet="Orvail souliers +1",
	}
	sets.MidcastElemental = {
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="", 
		head="", 
		neck="Eddy necklace", 
		ear1="Hecate's earring",
		ear2="Novio earring", 
		body="Respite cloak", 
		hands="Gendewitha gages", 
		ring1="Mediator's ring", 
		ring2="Angha Ring", 
		back="Refraction cape", 
		waist="Aswang sash", 
		legs="Telchine braconi", 
		feet="Orvail souliers +1",
	}
	sets.MidcastEnfeeblingWhiteAcc = {
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="", 
		head="Weatherspoon corona +1", 
		neck="Imbodla Necklace", 
		ear1="Lifestorm earring", 
		ear2="Psystorm earring", 
		body="Theophany briault", 
		hands="Gendewitha gages", 
		ring1="Mediator's ring", 
		ring2="Angha Ring", 
		back="Refraction cape", 
		waist="Aswang sash", 
		legs="Telchine braconi", 
		feet="Orvail souliers +1",
	}
	sets.MidcastDivine = {
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="", 
		head="Weatherspoon corona +1", 
		neck="Imbodla Necklace", 
		ear1="Lifestorm earring", 
		ear2="Psystorm earring", 
		body="Theophany briault", 
		hands="Helios gloves", 
		ring1="Mediator's ring", 
		ring2="Angha Ring", 
		back="Refraction cape", 
		waist="Aswang sash", 
		legs="Theophany pantaloons", 
		feet="Orvail souliers +1",
	}
	--Black Magic Accuracy
	sets.MidcastEnfeeblingBlackAcc = {
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="", 
		head="Weatherspoon corona +1", 
		neck="Imbodla Necklace", 
		ear1="Lifestorm earring", 
		ear2="Psystorm earring", 
		body="Theophany briault", 
		hands="Gendewitha gages", 
		ring1="Mediator's ring", 
		ring2="Angha Ring", 
		back="Refraction cape", 
		waist="Aswang sash", 
		legs="Telchine braconi", 
		feet="Orvail souliers +1",
	}
	sets.MidcastEnfeeblingWhitePotency = {
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="", 
		head="Weatherspoon corona +1", 
		neck="Imbodla Necklace", 
		ear1="Lifestorm earring", 
		ear2="Psystorm earring", 
		body="Theophany briault", 
		hands="Gendewitha gages", 
		ring1="Mediator's ring", 
		ring2="Angha Ring", 
		back="Refraction cape", 
		waist="Aswang sash", 
		legs="Telchine braconi", 
		feet="Orvail souliers +1",
	}
	sets.MidcastDarkAcc = {
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="", 
		head="Weatherspoon corona +1", 
		neck="Imbodla Necklace", 
		ear1="Lifestorm earring", 
		ear2="Psystorm earring", 
		body="Theophany briault", 
		hands="Gendewitha gages", 
		ring1="Mediator's ring", 
		ring2="Angha Ring", 
		back="Refraction cape", 
		waist="Aswang sash", 
		legs="Telchine braconi", 
		feet="Orvail souliers +1",
	}		
	sets.MidcastDrainAspir = {
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="", 
		head="Weatherspoon corona +1", 
		neck="Imbodla Necklace", 
		ear1="Lifestorm earring", 
		ear2="Psystorm earring", 
		body="Theophany briault", 
		hands="Gendewitha gages", 
		ring1="Mediator's ring", 
		ring2="Angha Ring", 
		back="Refraction cape", 
		waist="Aswang sash", 
		legs="Telchine braconi", 
		feet="Orvail souliers +1",
	}
end

-- Events (Casting)

function precast(spell)
	-- Magic Precast Sets
	if spell.action_type == 'Magic' then
		if spell.name == 'Erase' or spell.name == 'Poisona' or spell.name == 'Paralyna' or spell.name == 'Silena' or spell.name == 'Blindna' or spell.name == 'Stona' or spell.name == 'Viruna' or spell.name == 'Cursna' then
		equip(sets.PrecastStatus)
		add_to_chat(140, '**Status Precast Gear Equipped**')
		elseif spell.english:startswith('Cure') or spell.english:startswith('Cura') then
		equip(sets.PrecastCure)
		add_to_chat(140, '**Cure Speed Gear Equipped**')
		else
		equip(sets.Precast)
		add_to_chat(140, '**Precast Gear Equipped**')
		end
	end
	-- Light Arts and Dark Arts ChangeSpell
	if spell.name == 'Light Arts' and buffactive['Light Arts'] then
		cancel_spell()
		send_command('input /ja "Addendum: White" <me>')
	elseif spell.name == 'Dark Arts' and buffactive['Dark Arts'] then
		cancel_spell()
		send_command('input /ja "Addendum: Black" <me>')
	end
	if spell.name == 'Afflatus Solace' and buffactive['Afflatus Solace'] then
		cancel_spell()
		send_command('input /ja "Afflatus Misery" <me>')
	end
	--Spellchange Status Removal to Enfeeble
	if spell.target.type == 'MONSTER' then
		add_to_chat(140, '**MONSTER check**')
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
	end
	
end

function midcast(spell)
	
	
	
	-- Enfeebling 
	if spell.skill == 'Enfeebling Magic' then
	equip(sets.MidcastEnfeebling)
	add_to_chat(158, '**Enfeebling Gear Equipped**')
	end
	
	if spell.skill == 'Elemental Magic' then
	equip(sets.MidcastElemental)
	add_to_chat(158, '**Elemental Gear Equipped**')
	end
	
	--Dark Magic
	if spell.skill == 'Dark Magic' then
		if spell.name == 'Drain' or spell.name == 'Aspir' then
			equip(sets.MidcastDrainAspir)
			add_to_chat(158, '** Drain/Aspir Gear Equipped**')
		else
			equip(sets.MidcastDarkAcc)
			add_to_chat(158, '** Dark Magic Gear Equipped**')
		end
	end
	--Cure Potency
	if spell.english:startswith('Cure') or spell.english:startswith('Cura') then
		-- Elemental Obi
		if spell.element == world.weather_element then
			equip(sets.obi[spell_element])
			add_to_chat(158, '**Weather Obi Equipped**')
		end
		if spell.element == world.day_element then
			equip(sets.obi[spell_element])
			add_to_chat(158, '**Day Obi Equipped**')
		end
	equip(sets.MidcastCurePotency)
	add_to_chat(158, '**Cure Potency Gear Equipped**')
	end
	-- Status Removal
	
	if spell.name == 'Poisona' or spell.name == 'Paralyna' or spell.name == 'Silena' or spell.name == 'Blindna' or spell.name == 'Stona' or spell.name == 'Viruna' or spell.name == 'Cursna' then
		equip(sets.MidcastStatusNaSpells)
		add_to_chat(158, '**Status Gear Equipped**')
	-- Divine Caress
		if buffactive['Divine Caress'] and not spell.name == 'Cursna' then
			equip(sets.MidcastDivineCaress)
			add_to_chat(158, '**Divine Caress Enhanced**')
		end
		if spell.name == 'Cursna' then
				equip(sets.MidcastStatusCursna)
				add_to_chat(158, '**Cursna Enhanced**')
		end
	end
	if spell.skill == 'Enhancing Magic' then
		if spell.name == 'Erase' then
		equip(sets.MidcastStatusNaSpells)
		add_to_chat(158, '**Status Gear Equipped**')
		else
		equip(sets.MidcastMaxEnhancing)
		add_to_chat(158, '**Enhancing Gear Equipped**')
			if spell.name == 'Protectra V' then
				equip({feet="Cleric's duckbills +2"})
				add_to_chat(158, '**Protectra V Enhanced**')
			end
			if spell.name == 'Shellra V' then
				equip({legs="Piety pantaloons"})
				add_to_chat(158, '**Shellra V Enhanced**')
			end
			if spell.english:startswith('Bar') then
				equip(sets.MidcastEnhancingBarspell)
				add_to_chat(158, '**Barspell Gear Equipped**')
			end
			if spell.english:startswith('Regen') then	
				add_to_chat(158, '**Regen Enhanced**')
			end
		end
	end
	-- Sneak Spells
	if spell.english == 'Sneak' and buffactive.sneak then
        send_command('@wait 1;cancel 71;')
    end
	-- Stoneskin
	if spell.english == 'Stoneskin' and buffactive.stoneskin then
        send_command('@wait 1;cancel stoneskin;')
    end
end

function aftercast(spell)
	if player.status == 'Engaged' then
        equip(sets.StandingTP)
		add_to_chat(158, '**TP Gear Equipped**')
	else
	equip(sets.Standing)
	add_to_chat(158, '**Defense Gear Equipped**')
	end
	
	-- Enfeebling Notification --
	if spell.english == 'Sleep' or spell.english == 'Sleepga' then
        send_command('@wait 50;input /echo ------- '..spell.english..'  10 seconds -------')
    elseif spell.english == 'Repose' then
        send_command('@wait 80;input /echo ------- '..spell.english..'  10 seconds -------')
	elseif spell.english == 'Paralyze'  then
		send_command('@wait 110;input /echo ------- '..spell.english..'  10 seconds -------')
    end
	
end

function status_change(new,old)
	if new == 'Resting' then
		equip(sets.Resting)
	elseif new == 'Engaged' then
		disable('main','sub')
		equip(sets.StandingTP)
	else
	equip(sets.Standing)
	end
end
