--[[ 
Author: Rialya (Asura, Valefor, Bismarck)

Rialya's MNK Gearswap

LUA file for Blue Mage gear swap and on-th-fly mode switching.

-Allows cycling of offensive damage types for weapons, and cycling of defensice damage type mitigation
-Spell specific stat modification

]]--
include('organizer-lib.lua')
text = require('texts')
display = text.new()
weaponset = "Attack"
armorset = "Attack"
str = 'Weapon Set: ${weaponset|Attack}  Armor Set: ${armorset|Attack}'
display:text(str)
display:font("Consolas")
display:size(20)
display:pos(400,880)
display:show()

function get_sets()
	--Startup settings
	include('rialya-commonitems.lua') --adds commonly used items for Organizer addon to pull into inventory
	windower.send_command('du blinking self always off; wait 2; input /lockstyleset 2;') --adjust dressup settings and style lock 
	windower.send_command('bind f9 gs c toggle Weapon set')	--sets F9 to toggle Weapon set
	windower.send_command('bind f10 gs c toggle Armor set')	--sets F10 to toggle Armor set
	windower.send_command('bind f11 gs c toggle TH set')	--sets F11 to toggle Treasure Hunter set
	
	--Binds Single Key Press to replace macros
	--Single Number Key
	--windower.send_command('bind %1 input /ja "Curing Waltz III" <st>')
	--windower.send_command('bind %2 input /ma "Nat. Meditation" <me>')
	--windower.send_command('bind %3 input /ma "Barrier Tusk" <me>')
	--windower.send_command('bind %4 input /ma "Reactor Cool" <me>')
	--windower.send_command('bind %5 input /ja "Haste Samba" <me>')
	--windower.send_command('bind %6 input /ma "Battery Charge" <me>')
	--windower.send_command('bind %7 input /ma "Occultation" <me>')
	--windower.send_command('bind %8 input ')
	--windower.send_command('bind %9 input ')
	--windower.send_command('bind %0 input ')
	
	--CTRL + Number Key
	--windower.send_command('bind %^1 input /ws "Rudra\'s Storm" <t>')
	--windower.send_command('bind %^2 input /ja "Chain Affinity" <me>')
	--windower.send_command('bind %^3 input /ja "Efflux" <me>')
	--windower.send_command('bind %^4 input /ja "Burst Affinity" <me>')
	--windower.send_command('bind %^5 input /ma "Curaga V" <t>')
	--windower.send_command('bind %^6 input /ja "Penury" <me>')
	--windower.send_command('bind %^7 input /ja "Accession" <me>')
	--windower.send_command('bind %^8 input /ja "Diffusion" <me>')
	--windower.send_command('bind %^9 input /ja "Unbridled Learning" <me>')
	--windower.send_command('bind %^0 input /ma "Mighty Guard" <me>')
	
	--ALT + Number Key
	--windower.send_command('bind %!1 input /ma "Spectral Floe" <t>')
	--windower.send_command('bind %!2 input /ws "Aeolian Edge" <t>')
	--windower.send_command('bind %!3 input /ma "Thrashing Assault" <t>')
	--windower.send_command('bind %!4 input /ma "Heavy Strike" <t>')
	--windower.send_command('bind %!5 input /ma "Delta Thrust" <t>')
	--windower.send_command('bind %!6 input /ma "Entomb" <t>')
	--windower.send_command('bind %!7 input /ma "Tenebral Crush" <t>')
	--windower.send_command('bind %!8 input /ma "Magic Hammer" <t>')
	--windower.send_command('bind %!9 input /ma "Dream Flower" <t>')
	--windower.send_command('bind %!0 input ')
	
	--Misc Keys
	--windower.send_command('bind %w input /ma "Flash" <t>')
	windower.send_command('bind %k exec key.txt')
	
	-- Weapon and Armor Type Change (Default sets to 1) 
	Weapon_Index = 1
	Armor_Index = 1
	WS_Index = 1
	Weapon_Set_Names = {"Attack", "Tanking"}
	Armor_Set_Names = {"Attack", "Accuracy", "Tank-PDT", "Tank-MDT"}
	sets.weapons = {}
	sets.weapons['Attack'] = { --Physical Damage Weapon Set
		main="Arasy sainti",
		--sub="Eminent dagger",
	}
	sets.weapons['Tanking'] = { --Aeolian Damage Weapon Set
		main="Arasy sainti",
		--sub="Eminent dagger",
	}
	
	sets.standing = {}
	sets.standing['Attack'] = {
		
		ammo="Honed Tathlum",
		head="Ken. Jinpachi",
		body="Ken. Samue",
		hands="Malignance gloves",
		legs="Ken. Hakama",
		feet="Malignance boots",
		neck="Iqabi Necklace",
		waist="Cetl Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Enlivened Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10',}},
		
	}
	sets.standing['Accuracy'] = {
		
		ammo="Honed Tathlum",
		head="Ken. Jinpachi",
		body="Ken. Samue",
		hands="Malignance gloves",
		legs="Ken. Hakama",
		feet="Malignance boots",
		neck="Iqabi Necklace",
		waist="Cetl Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Enlivened Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10',}},
	}
	sets.standing['PDT'] = {
		
		ammo="Honed Tathlum",
		head="Ken. Jinpachi",
		body="Ken. Samue",
		hands="Malignance gloves",
		legs="Ken. Hakama",
		feet="Malignance boots",
		neck="Iqabi Necklace",
		waist="Cetl Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Enlivened Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10',}},
	}
	sets.standing['MDT'] = {
		
		ammo="Honed Tathlum",
		head="Ken. Jinpachi",
		body="Ken. Samue",
		hands="Malignance gloves",
		legs="Ken. Hakama",
		feet="Malignance boots",
		neck="Iqabi Necklace",
		waist="Cetl Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Enlivened Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10',}},
	}
	
	sets.TP = {}
	sets.TP['Accuracy'] = {
		ammo="Honed Tathlum",
		head="Ken. Jinpachi",
		body="Ken. Samue",
		hands="Malignance gloves",
		legs="Ken. Hakama",
		feet="Malignance boots",
		neck="Iqabi Necklace",
		waist="Cetl Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Enlivened Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10',}},
	}
	sets.TP['Attack'] = {
		ammo="Honed Tathlum",
		head="Ken. Jinpachi",
		body="Ken. Samue",
		hands="Ken. Tekko",
		legs="Ken. Hakama",
		feet="Ken. Sune-Ate",
		neck="Iqabi Necklace",
		waist="Cetl Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Enlivened Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10',}},
	}
	sets.TP['PDT'] = {
		ammo="Honed Tathlum",
		head="Ken. Jinpachi",
		body="Ken. Samue",
		hands="Malignance gloves",
		legs="Ken. Hakama",
		feet="Malignance boots",
		neck="Iqabi Necklace",
		waist="Cetl Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Vocane ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10',}},
	}
	sets.TP['MDT'] = {
		ammo="Honed Tathlum",
		head="Ken. Jinpachi",
		body="Ken. Samue",
		hands="Malignance gloves",
		legs="Ken. Hakama",
		feet="Malignance boots",
		neck="Iqabi Necklace",
		waist="Cetl Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Vocane ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10',}},
	}
	
	sets.precast = {
	}
	sets.midcast = {}
	sets.WS = {}
	
	sets.WS.ShijinSpiral = {
		ammo="Honed Tathlum",
		head="Ken. Jinpachi",
		body="Ken. Samue",
		hands="Ken. Tekko",
		legs="Ken. Hakama",
		feet="Ken. Sune-Ate",
		neck="Iqabi Necklace",
		waist="Cetl Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Enlivened Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10',}},
	}
	sets.WS.VictorySmite = {
		ammo="Honed Tathlum",
		head="Ken. Jinpachi",
		body="Ken. Samue",
		hands="Ken. Tekko",
		legs="Ken. Hakama",
		feet="Ken. Sune-Ate",
		neck="Iqabi Necklace",
		waist="Cetl Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Enlivened Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10',}},
	}
	sets.WS.AsceticsFury = {
		ammo="Honed Tathlum",
		head="Ken. Jinpachi",
		body="Ken. Samue",
		hands="Ken. Tekko",
		legs="Ken. Hakama",
		feet="Ken. Sune-Ate",
		neck="Iqabi Necklace",
		waist="Cetl Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Enlivened Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10',}},
	}
	sets.WS.RagingFists = {
		ammo="Honed Tathlum",
		head="Ken. Jinpachi",
		body="Ken. Samue",
		hands="Ken. Tekko",
		legs="Ken. Hakama",
		feet="Ken. Sune-Ate",
		neck="Iqabi Necklace",
		waist="Cetl Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Enlivened Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10',}},
	}
	sets.WS.HowlingFist = {
		ammo="Honed Tathlum",
		head="Ken. Jinpachi",
		body="Ken. Samue",
		hands="Ken. Tekko",
		legs="Ken. Hakama",
		feet="Ken. Sune-Ate",
		neck="Iqabi Necklace",
		waist="Cetl Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Enlivened Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10',}},
	}
	--Trust Equip Swap
		sets.trust = sets.TP['Accuracy']
	-- Variables
	weapon_type = 'physical'
	count_aptitude = 0
end
-- Gear Lock --
--WS Change Based on Mainhand
function filtered_action(spell)

end
function precast(spell)
	
	if spell.name == "Shijin Spiral" then
		equip(sets.WS.ShijinSpiral)
		add_to_chat(158, '**Shijin Spiral Gear Equipped**')
	elseif spell.name == "Victory Smite" then
		equip(sets.WS.VictorySmite)
		add_to_chat(158, '**Victory Smite Gear Equipped**')
	elseif spell.name == "Ascetic's Fury" then
		equip(sets.WS.AsceticsFury)
		add_to_chat(158, '**Ascetic\'s Fury Gear Equipped**')
	elseif spell.name == "Raging Fists" then
		equip(sets.WS.RagingFists)
		add_to_chat(158, '**Raging Fist Gear Equipped**')
	elseif spell.name == "Howling Fist" then
		equip(sets.WS.HowlingFist)
		add_to_chat(158, '**Howling Fist Gear Equipped**')
	end
	
end
function midcast(spell)
	if spell.type == "Trust" then
		equip(sets.trust)
		add_to_chat(158, '**Trust 119 Equipped**')
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
		display.weaponset = Weapon_Set_Names[Weapon_Index]
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
		display.armorset = Armor_Set_Names[Armor_Index]
	end
end