--[[ 
Author: Rialya (Asura, Valefor, Bismarck)

Rialya's SMN Gearswap



]]--
include('organizer-lib.lua')

--Display Text for Mode Switching
text = require('texts')
display = text.new()
mode = "Support"
str = 'Current Mode: ${mode|Support}'
display:text(str)
display:font("Consolas")
display:size(10)
display:pos(400,880)
display:show()

function get_sets()
	--Starup Settings
	include('rialya-commonitems.lua') --Essential carry inventory items (i.e. Echo Drops, Remedy)
	windower.send_command('du blinking self always off; wait 8; input /lockstyleset 1; wait 1; du blinking self always on;')
	windower.send_command('bind f9 gs c toggle Mode set')	--sets F9 to toggle Frontline Mode
	windower.send_command('bind f10 gs c toggle Weapon set')	--sets F9 to toggle Armor Mode
	
	--Binds Single Key Press to replace macros
	--Single Number Key
	windower.send_command('bind %1 input /ma "Cure III" <t>')
	windower.send_command('bind %2 input /ma "Cure IV" <t>')
	windower.send_command('bind %3 input /ma "Cure V" <t>')
	--windower.send_command('bind %4 input ')
	windower.send_command('bind %5 input /ma "Haste" <t>')
	--windower.send_command('bind %6 input ')
	--windower.send_command('bind %7 input ')
	--windower.send_command('bind %8 input ')
	--windower.send_command('bind %9 input ')
	--windower.send_command('bind %0 input ')
	
	--CTRL + Number Key
	--windower.send_command('bind %^1 input /ma "Curaga" <t>')
	--windower.send_command('bind %^2 input /ma "Curaga II" <t>')
	--windower.send_command('bind %^3 input /ma "Curaga III" <t>')
	--windower.send_command('bind %^4 input /ma "Curaga IV" <t>')
	--windower.send_command('bind %^5 input /ma "Curaga V" <t>')
	--windower.send_command('bind %^6 input /ja "Penury" <me>')
	--windower.send_command('bind %^7 input /ja "Accession" <me>')
	--windower.send_command('bind %^8 input ')
	--windower.send_command('bind %^9 input ')
	--windower.send_command('bind %^0 input ')
	
	--ALT + Number Key
	--windower.send_command('bind %!1 input ')
	--windower.send_command('bind %!2 input /ma "Repose" <t>')
	--windower.send_command('bind %!3 input /ma "Haste" <t>')
	--windower.send_command('bind %!4 input ')
	--windower.send_command('bind %!5 input ')
	--windower.send_command('bind %!6 input /ja "Celerity" <me>')
	--windower.send_command('bind %!7 input ')
	--windower.send_command('bind %!8 input ')
	--windower.send_command('bind %!9 input ')
	--windower.send_command('bind %!0 input ')
	
	--Misc Keys
	windower.send_command('bind %q input /ja "Divine Caress" <me>')
	
	-- Weapon and Armor Type Change (Default sets to 1) 
	Mode_Index = 1
	Armor_Index = 1
	Mode_Set_Names = {"Support", "Frontline"}
	Armor_Set_Names = {"Support", "Hybrid", "PDT", "MDT"}
	-- Obi Sets
	sets.obi = {}
	sets.obi.Light = {waist='Korin Obi'}
	sets.obi.Dark = {waist='Anrin Obi'}
	sets.weapons = {}
	sets.weapons['Support'] = {}
	sets.weapons['Frontline'] = {
		main="",
		sub="",
	}
	sets.weapons.dispelga = {
		main="Daybreak",
	}
	sets.idle = { --[[Idle Gear: Refresh, DamageTakenDown, MagicDamageTakenDown, PhysicalDamageTakenDown, M.EvasionUp, EvasionUp]]--
		main="Malignance Pole",
		--sub="",
		--range="",
		--ammo="",
		head="C. Palug Crown",
		body="Inyanga Jubbah +1",
		hands="Asteria Mitts +1",
		legs="Assid. Pants +1",
		feet="Inyanga Crackows",
		neck="Loricate Torque +1",
		waist="",
		left_ear="Andoaa Earring",
		right_ear="Novia Earring",
		left_ring="Sangoma Ring",
		right_ring="Shneddick Ring",
		back="Scintillating Cape",
	}
	sets.WS = {
	}
	
	sets.resting = { --[[Resting Gear: MPRecoveredWhileHealing Refresh DamageTaken MP]]--
		main="Boonwell staff", --MPRecoveredWhileHealing+18
		ammo="Clarus stone", --MPRecoveredWhileHealing+2
		head="Orvail Corona +1", --MPRecoveredWhileHealing+4
		neck="Grandiose chain", --MPRecoveredWhileHealing+2
		body="Chelona blazer", --MPRecoveredWhileHealing+8
		hands="Nares cuffs", --MPRecoveredWhileHealing+4
		ring2="Angha ring", --MPRecoveredWhileHealing+2
		back="Vita cape", --MPRecoveredWhileHealing+3
		waist="Qiqirn sash +1", --MPRecoveredWhileHealing+3
		legs="Nisse slacks", --MPRecoveredWhileHealing+4
		feet="Chelona boots", --MPRecoveredWhileHealing+5
	}
	-- precast Sets
	sets.precast = { --[[Precast Gear (No Quickening): FastCast; Total SpellCast Reduction = 10 "Light Arts" +  49 "Equipment" = 59%]]--
		main="Yagrush", 
		--sub="",
		ammo="Incantor stone", 	-- 2% Fast Cast
		head="Nahtirah hat", -- 10% Fast Cast
		body="Inyanga jubbah +1", --13% fast cast
		ear1="Loquacious earring", --2% fast cast
		ear2="Malignance earring",
		hands="Gendewitha gages", -- 7% fast cast
		back="Swith cape", -- 3% fast cast
		waist="", -- 2% fast cast
		legs="Artsieq hose", -- 5% fast cast
		feet="Chelona boots", -- 4% fast cast
	}
	sets.precast.cure = { --[[Total CureCast Reduction = 10 "Light Arts" + 20 "Merits: Cure Cast Reduction" + 63 "Equipment" = 93%]]--
		main="Ababinili", -- cure spellcasting time -10%
		ammo="Incantor stone", -- 2% fast cast
		head="Nahtirah hat",  -- 10% fast cast
		neck="Aceso's choker", -- cure spellcasting time -10% 
		ear1="Loquacious earring", -- 2% fast cast
		ear2="Malignance earring",
		--body="", 
		hands="Gendewitha gages", -- 7% fast cast
		--ring1="", 
		--ring2="", 
		back="Swith cape", -- 3% fast cast
		waist="", -- 2% fast cast
		legs="Orison pantaloons +2", --healing magic casting time -12%
		feet="Chelona boots", -- 4% fast cast
	}
--Midcast Sets
--Healing Magic 
	--Cure Potency
	sets.midcast = {}
	
	sets.midcast.CurePotency = { --[[ AfflatusSolace, Cure Potency, EnmityDown, HealingMagicSkill, MND, ConserveMP, Haste, 50% potency  ]]--
		main="Iridal Staff",
		sub="Amicus Grip",
		ammo="Erlene's Notebook",
		head={ name="Gende. Caubeen", augments={'Phys. dmg. taken -2%','"Cure" potency +2%',}},
		body="Ebers Bliaud +1",
		hands={ name="Telchine Gloves", augments={'"Cure" potency +7%',}},
		legs="Ebers Pantaloons",
		feet="Skaoi Boots",
		neck="Phrenic Torque",
		waist="Pythia Sash",
		left_ear="Mendi. Earring",
		right_ear="Novia Earring",
		left_ring="Mediator's Ring",
		right_ring="Persis Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+5','Enmity-10','Damage taken-5%',}},
	}
end
function filtered_action(spell) -- Events (Casting)
	
end
function precast(spell) -- Magic precast Sets
	if spell.action_type == 'Magic' then
		if buffactive['Silence'] then
			cancel_spell()
			send_command('input /item "Echo Drops" <me>')
		elseif spell.name == 'Erase' or spell.name == 'Poisona' or spell.name == 'Paralyna' or spell.name == 'Silena' or spell.name == 'Blindna' or spell.name == 'Stona' or spell.name == 'Viruna' or spell.name == 'Cursna' then
			--set_combine(sets.precastStatus, sets.weapons[Mode_Set_Names[Mode_Index]])
			equip(sets.precast.status)
			add_to_chat(158, '**Status Precast Gear Equipped**')
		elseif spell.english:startswith('Cure') or spell.english:startswith('Cura') then
			--equip(sets.precastCure)
			equip(sets.precast.cure, sets.weapons[Mode_Set_Names[Mode_Index]])
			add_to_chat(158, '**Cure Speed Gear Equipped**')
		elseif spell.name == 'Dispelga' then
			equip(sets.precast, sets.weapons.dispelga)
			add_to_chat(158, '**Precast Dispelga Gear Equipped**')
		elseif spell.english:startswith('Raise') or spell.english:startswith('Reraise') or spell.name == 'Arise' then
			equip((sets.precast.raise), sets.weapons[Mode_Set_Names[Mode_Index]])
			add_to_chat(158, '**Raise Precast**')
		else
			equip(sets.precast, sets.weapons[Mode_Set_Names[Mode_Index]])
			add_to_chat(158, '**Precast Gear Equipped**')
		end
		
	end
	
	if spell.name == 'Light Arts' and buffactive['Light Arts'] then -- Light Arts and Dark Arts ChangeSpell
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
	if spell.target.type == 'MONSTER' then --Spellchange Status Removal to Enfeeble
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
		if spell.name == 'Dispelga' then
			equip(sets.midcast.Enfeebling, sets.weapons.dispelga)
			add_to_chat(158, '**Daybreak Gear Equipped**')
		else
			equip(sets.midcast.Enfeebling, sets.weapons[Mode_Set_Names[Mode_Index]])
			add_to_chat(158, '**Enfeebling Gear Equipped**')
		end
	end
	if spell.skill == 'Elemental Magic' then
	equip(sets.midcast.Elemental, sets.weapons[Mode_Set_Names[Mode_Index]])
	add_to_chat(158, '**Elemental Gear Equipped**')
	end
	--Dark Magic
	if spell.skill == 'Dark Magic' then
		if spell.name == 'Drain' or spell.name == 'Aspir' then
			equip(sets.midcast.DrainAspir, sets.weapons[Mode_Set_Names[Mode_Index]])
			add_to_chat(158, '** Drain/Aspir Gear Equipped**')
		else
			equip(sets.midcast.DarkAcc, sets.weapons[Mode_Set_Names[Mode_Index]])
			add_to_chat(158, '** Dark Magic Gear Equipped**')
		end
	end
	--Cure Potency
	if spell.english:startswith('Cure') or spell.english:startswith('Cura') or spell.name == 'Full Cure' then
		-- Elemental Obi
		equip(sets.midcast.CurePotency)
		if spell.element == world.weather_element or spell.element == world.day_element then
			equip(sets.obi[spell_element])
			add_to_chat(158, '**Day/Weather Obi Equipped**')
		end
		add_to_chat(158, '**Cure Potency Gear Equipped**')
	end
	-- Status Removal
	if spell.name == 'Poisona' or spell.name == 'Paralyna' or spell.name == 'Silena' or spell.name == 'Blindna' or spell.name == 'Stona' or spell.name == 'Viruna' or spell.name == 'Cursna' then
		equip(sets.midcast.StatusNaSpells, sets.weapons[Mode_Set_Names[Mode_Index]])
		add_to_chat(158, '**Status Gear Equipped**')
	-- Divine Caress
		if buffactive['Divine Caress'] and not spell.name == 'Cursna' then
			equip(sets.midcast.DivineCaress, sets.weapons[Mode_Set_Names[Mode_Index]])
			add_to_chat(158, '**Divine Caress Enhanced**')
		end
		if spell.name == 'Cursna' then
				equip(sets.midcast.StatusCursna, sets.weapons[Mode_Set_Names[Mode_Index]])
				add_to_chat(158, '**Cursna Enhanced**')
		end
	end
	--Raise Timer Reduction
	if spell.english:startswith('Raise') or spell.english:startswith('Reraise') or spell.name == 'Arise' then
		equip((sets.midcast.recast), sets.weapons[Mode_Set_Names[Mode_Index]])
		add_to_chat(158, '**Recast/MP Reduction**')
	end
	--EnhancingMagic
	if spell.skill == 'Enhancing Magic' then
		if spell.name == 'Erase' then
		equip(sets.midcast.EraseSacrificeEsuna, sets.weapons[Mode_Set_Names[Mode_Index]])
		add_to_chat(158, '**Status Gear Equipped**')
		else
		equip(sets.midcast.EnhancingDuration, sets.weapons[Mode_Set_Names[Mode_Index]])
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
				equip(sets.midcast.EnhancingBarspell, sets.weapons[Mode_Set_Names[Mode_Index]])
				add_to_chat(158, '**Barspell Gear Equipped**')
			end
			if spell.english:startswith('Regen') then	
				equip(sets.midcast.EnhancingRegen, sets.weapons[Mode_Set_Names[Mode_Index]])
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
		equip(sets.idle.tp, sets.weapons[Mode_Set_Names[Mode_Index]])
		add_to_chat(158, '**TP Gear Equipped**')
	else
	equip(sets.idle, sets.weapons[Mode_Set_Names[Mode_Index]])
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
		equip(sets.resting, sets.weapons[Mode_Set_Names[Mode_Index]])
	elseif new == 'Engaged' then
		equip(sets.weapons[Mode_Set_Names[Mode_Index]])
		equip(sets.tp)
	else
	equip(sets.idle)
	equip(sets.weapons[Mode_Set_Names[Mode_Index]])
	end
end
function self_command(command)
	if command == 'toggle Mode set' then
		Mode_Index = Mode_Index +1
		if Mode_Index > #Mode_Set_Names then Mode_Index = 1 end
		send_command('@input /echo ----- Mode: ' ..Mode_Set_Names[Mode_Index]..' ------')
		equip(sets.weapons[Mode_Set_Names[Mode_Index]])
		display.mode = Mode_Set_Names[Mode_Index]
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