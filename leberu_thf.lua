--[[ 
Author: Rialya (Asura, Valefor, Bismarck)

Rialya's THF Gearswap

LUA file for Blue Mage gear swap and on-th-fly mode switching.

-Allows cycling of offensive damage types for weapons, and cycling of defensice damage type mitigation
-Spell specific stat modification

]]--
include('organizer-lib.lua')
text = require('texts')
display = text.new()
weaponset = "TH"
armorset = "TH"
str = 'Weapon Set: ${weaponset|TH}  Armor Set: ${armorset|TH}'
display:text(str)
display:font("Consolas")
display:size(20)
display:pos(400,880)
display:show()

function get_sets()
	--Startup settings
	include('rialya-commonitems.lua') --adds commonly used items for Organizer addon to pull into inventory
	windower.send_command('du blinking self always off; wait 8; input /lockstyleset 2; wait 1; du blinking self always on; ') --adjust dressup settings and style lock 
	windower.send_command('bind f9 gs c toggle Weapon set')	--sets F9 to toggle Weapon set
	windower.send_command('bind f10 gs c toggle Armor set')	--sets F10 to toggle Armor set
	windower.send_command('bind f11 gs c toggle TH set')	--sets F11 to toggle Treasure Hunter set
	
	--Binds Single Key Press to replace macros
	--Single Number Key
	windower.send_command('bind %1 input /ja "Curing Waltz III" <st>')
	--windower.send_command('bind %2 input /ma "Nat. Meditation" <me>')
	--windower.send_command('bind %3 input /ma "Barrier Tusk" <me>')
	--windower.send_command('bind %4 input /ma "Reactor Cool" <me>')
	windower.send_command('bind %5 input /ja "Haste Samba" <me>')
	--windower.send_command('bind %6 input /ma "Battery Charge" <me>')
	--windower.send_command('bind %7 input /ma "Occultation" <me>')
	--windower.send_command('bind %8 input ')
	--windower.send_command('bind %9 input ')
	--windower.send_command('bind %0 input ')
	
	--CTRL + Number Key
	windower.send_command('bind %^1 input /ws "Evisceration" <t>')
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
	windower.send_command('bind %!2 input /ws "Aeolian Edge" <t>')
	--windower.send_command('bind %!3 input /ma "Thrashing Assault" <t>')
	--windower.send_command('bind %!4 input /ma "Heavy Strike" <t>')
	--windower.send_command('bind %!5 input /ma "Delta Thrust" <t>')
	--windower.send_command('bind %!6 input /ma "Entomb" <t>')
	--windower.send_command('bind %!7 input /ma "Tenebral Crush" <t>')
	--windower.send_command('bind %!8 input /ma "Magic Hammer" <t>')
	--windower.send_command('bind %!9 input /ma "Dream Flower" <t>')
	--windower.send_command('bind %!0 input ')
	
	--Misc Keys
	windower.send_command('bind %k exec key.txt')
	
	-- Weapon and Armor Type Change (Default sets to 1) 
	Weapon_Index = 1
	Armor_Index = 1
	WS_Index = 1
	Weapon_Set_Names = {"TH", "Physical", "Magical"}
	Armor_Set_Names = { "TH", "Attack", "Accuracy", "PDT", "MDT"}
	sets.weapons = {}
	sets.weapons['Physical'] = { --Physical Damage Weapon Set
		main="Kaja knife",
		sub="Sandung",
	}
	sets.weapons['Magical'] = { --Aeolian Damage Weapon Set
		main="Kaja knife",
		sub="Sandung",
	}
	sets.weapons['TH'] = { --Physical Damage Weapon Set
		main="Kaja knife",
		sub="Sandung",
	}
	sets.standing = {}
	sets.standing['Attack'] = {
		
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands="Malignance gloves",
		legs="Meg. Chausses",
		feet="Jute Boots +1",
		neck="Iqabi necklace",
		waist="Cetl Belt",
		left_ear="Allegro Earring",
		right_ear="Thunder Earring",
		left_ring="Vocane ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
		
	}
	sets.standing['Accuracy'] = {
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands="Malignance gloves",
		legs="Meg. Chausses",
		feet="Jute Boots +1",
		neck="Iqabi necklace",
		waist="Cetl Belt",
		left_ear="Allegro Earring",
		right_ear="Thunder Earring",
		left_ring="Vocane ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.standing['PDT'] = {
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands="Malignance gloves",
		legs="Meg. Chausses",
		feet="Jute Boots +1",
		neck="Iqabi necklace",
		waist="Cetl Belt",
		left_ear="Allegro Earring",
		right_ear="Thunder Earring",
		left_ring="Vocane ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.standing['MDT'] = {
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands="Malignance gloves",
		legs="Meg. Chausses",
		feet="Jute Boots +1",
		neck="Iqabi necklace",
		waist="Cetl Belt",
		left_ear="Allegro Earring",
		right_ear="Thunder Earring",
		left_ring="Vocane ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.standing['TH'] = {
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands="Malignance gloves",
		legs="Meg. Chausses",
		feet="Jute Boots +1",
		neck="Iqabi necklace",
		waist="Cetl Belt",
		left_ear="Brutal earring",
		right_ear="Suppanomimi",
		left_ring="Vocane ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.TP = {}
	sets.TP['Accuracy'] = {
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands="Malignance gloves",
		legs="Meg. Chausses",
		feet="Malignance boots",
		neck="Iqabi necklace",
		waist="Cetl Belt",
		left_ear="Brutal earring",
		right_ear="Suppanomimi",
		left_ring="Enlivened Ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.TP['Attack'] = {
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands="Malignance gloves",
		legs="Meg. Chausses",
		feet="Malignance boots",
		neck="Iqabi necklace",
		waist="Cetl Belt",
		left_ear="Brutal earring",
		right_ear="Suppanomimi",
		left_ring="Enlivened Ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.TP['PDT'] = {
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands="Malignance gloves",
		legs="Meg. Chausses",
		feet="Malignance boots",
		neck="Iqabi necklace",
		waist="Cetl Belt",
		left_ear="Brutal earring",
		right_ear="Suppanomimi",
		left_ring="Vocane ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.TP['MDT'] = {
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands="Malignance gloves",
		legs="Meg. Chausses",
		feet="Malignance boots",
		neck="Iqabi necklace",
		waist="Cetl Belt",
		left_ear="Brutal earring",
		right_ear="Suppanomimi",
		left_ring="Vocane ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.TP['TH'] = {
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}},
		legs="Meg. Chausses",
		feet="Malignance boots",
		neck="Iqabi necklace",
		waist="Cetl Belt",
		left_ear="Brutal earring",
		right_ear="Suppanomimi",
		left_ring="Enlivened Ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.precast = {
	}
	sets.midcast = {}
	sets.WS = {}
	
	sets.WS.MandalicStab = {
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands="Mummu Wrists +1",
		legs="Meg. Chausses",
		feet="Mummu Gamash. +1",
		neck="Iqabi necklace",
		waist="Cetl Belt",
		left_ear="Allegro Earring",
		right_ear="Thunder Earring",
		left_ring="Enlivened Ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.WS.RudrasStorm = {
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands="Mummu Wrists +1",
		legs="Meg. Chausses",
		feet="Mummu Gamash. +1",
		neck="Iqabi necklace",
		waist="Cetl Belt",
		left_ear="Allegro Earring",
		right_ear="Thunder Earring",
		left_ring="Enlivened Ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.WS.Evisceration = {
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands="Mummu Wrists +1",
		legs="Meg. Chausses",
		feet="Mummu Gamash. +1",
		neck="Iqabi necklace",
		waist="Cetl Belt",
		left_ear="Moonshade earring",
		right_ear="Thunder Earring",
		left_ring="Enlivened Ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.WS.AeolianEdge = {
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands="Mummu Wrists +1",
		legs="Meg. Chausses",
		feet="Mummu Gamash. +1",
		neck="Iqabi necklace",
		waist="Cetl Belt",
		left_ear="Allegro Earring",
		right_ear="Thunder Earring",
		left_ring="Enlivened Ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	}
	sets.WS.SavageBlade = {
		--ammo="Jukukik Feather",
		--head={ name="Herculean Helm", augments={'Accuracy+8 Attack+8','Weapon skill damage +5%','Accuracy+3',}},
		--body="Assim. Jubbah +2",
		--hands="Jhakri Cuffs +2",
		--legs="Aya. Cosciales +1",
		--feet="Aya. Gambieras +1",
		--neck="Tjukurrpa Medal",
		--waist="Prosilio Belt",
		--left_ear="Brutal Earring",
		--right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		--left_ring="Rajas Ring",
		--right_ring="Ifrit Ring",
		--back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.WS.SanguineBlade = {
		--ammo="Ghastly tathlum",
		--head="Jhakri Coronal",
		--body="Jhakri Robe +2",
		--hands="Jhakri Cuffs +2",
		--legs="Jhakri Slops +1",
		--feet="Jhakri Pigaches +1",
		--neck="Eddy Necklace",
		--waist="Aswang Sash",
		--left_ear="Friomisi earring",
		--right_ear="Novio Earring",
		--left_ring="Acumen Ring", --acumen ring
		--right_ring="Shiva Ring",
		--back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	sets.JA = {}
	sets.JA.Steps = {
		range="Moonring Blade",
		head="Mummu Bonnet +1",
		body="Mummu Jacket +1",
		hands="Mummu Wrists +1",
		legs="Meg. Chausses",
		feet="Mummu Gamash. +1",
		neck="Peacock charm",
		waist="Cetl Belt",
		left_ear="Allegro Earring",
		right_ear="Thunder Earring",
		left_ring="Enlivened Ring",
		right_ring="Rajas Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
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
	if spell.name == "Sanguine Blade" then
		equip(sets.WS.SanguineBlade)
		add_to_chat(158, '**Sanguine Gear Equipped**')
	end
	if spell.name == "Savage Blade" then
		equip(sets.WS.SavageBlade)
		add_to_chat(158, '**Savage Blade Gear Equipped**')
	end
	if spell.name == "Rudra's Storm" then
		equip(sets.WS.RudrasStorm)
		add_to_chat(158, '**Rudras Storm Gear Equipped**')
	end
	if spell.name == "Mandalic Stab" then
		equip(sets.WS.MandalicStab)
		add_to_chat(158, '**Mandalic Stab Gear Equipped**')
	end
	if spell.name == "Aeolian Edge" then
		equip(sets.WS.AeolianEdge)
		add_to_chat(158, '**Aeolian Edge Gear Equipped**')
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