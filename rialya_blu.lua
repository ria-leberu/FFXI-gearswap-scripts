--[[ 
Author: Rialya (Asura, Valefor, Bismarck)

Rialya's BLU Gearswap

LUA file for Blue Mage gear swap and on-th-fly mode switching.

-Allows cycling of offensive damage types for weapons, and cycling of defensice damage type mitigation
-Spell specific stat modification

]]--
include('organizer-lib.lua')
text = require('texts')
display = text.new()
weaponset = "Physical"
armorset = "Attack"
hasteset = "Haste"
str = 'Weapon Set: ${weaponset|Physical}  \nArmor Set: ${armorset|Attack} \nHaste: ${hasteset|No Haste}'
display:text(str)
display:font("Arial Black")
display:size(12)
display:pos(850,950)
display:show()

function get_sets()
	
	--mote_include_version = 2
	--Startup settings
	include('rialya-commonitems.lua') --adds commonly used items for Organizer addon to pull into inventory
	--include('Mote-Include.lua')
	windower.send_command('du blinking self always off; wait 2; input /lockstyleset 2') --adjust dressup settings and style lock 
	windower.send_command('bind f9 gs c toggle Weapon set')	--sets F9 to toggle Weapon set
	windower.send_command('bind f10 gs c toggle Armor set')	--sets F10 to toggle Armor set
	
	--Binds Single Key Press to replace macros
	--Single Number Key
	windower.send_command('bind %1 input /ma "Magic Fruit" <st>')
	windower.send_command('bind %2 input /ma "Nat. Meditation" <me>')
	windower.send_command('bind %3 input /ma "Barrier Tusk" <me>')
	windower.send_command('bind %4 input /ma "Cocoon" <me>')
	windower.send_command('bind %5 input /ma "Erratic Flutter" <me>')
	windower.send_command('bind %6 input /ma "Battery Charge" <me>')
	windower.send_command('bind %7 input /ma "Occultation" <me>')
	windower.send_command('bind %8 input /ma "Saline coat" <me>')
	windower.send_command('bind %9 input /ma "Silent Storm" <t>')
	windower.send_command('bind %0 input /ma "White Wind" <me>')
	
	--CTRL + Number Key
	windower.send_command('bind %^1 input /ws "Expiacion" <t>')
	windower.send_command('bind %^2 input /ws "Savage blade" <t>')
	windower.send_command('bind %^3 input /ja "Chain Affinity" <me>')
	windower.send_command('bind %^4 input /ja "Efflux" <me>')
	windower.send_command('bind %^5 input /ja "Burst Affinity" <me>')
	--windower.send_command('bind %^6 input /ja "Penury" <me>')
	--windower.send_command('bind %^7 input /ja "Accession" <me>')
	windower.send_command('bind %^8 input /ja "Diffusion" <me>')
	windower.send_command('bind %^9 input /ja "Unbridled Learning" <me>')
	windower.send_command('bind %^0 input /ma "Mighty Guard" <me>')
	
	--ALT + Number Key
	windower.send_command('bind %!1 input /ma "Spectral Floe" <t>')
	windower.send_command('bind %!2 input /ma "Subduction" <t>')
	windower.send_command('bind %!3 input /ma "Thrashing Assault" <t>')
	windower.send_command('bind %!4 input /ma "Heavy Strike" <t>')
	windower.send_command('bind %!5 input /ma "Delta Thrust" <t>')
	windower.send_command('bind %!6 input /ma "Entomb" <t>')
	windower.send_command('bind %!7 input /ma "Tenebral Crush" <t>')
	windower.send_command('bind %!8 input /ma "Magic Hammer" <t>')
	windower.send_command('bind %!9 input /ma "Dream Flower" <t>')
	windower.send_command('bind %!0 input /ma "Glutinous Dart" <t>')
	
	--Misc Keys
	windower.send_command('bind %q input /ma "Sudden Lunge" <t>')
	windower.send_command('bind %w input /ma "Actinic Burst" <t>')
	windower.send_command('bind %a input /ma "Fantod" <me>')
	windower.send_command('bind %z input /ma "Magic Barrier" <me>')
	
	
	-- Weapon and Armor Type Change (Default sets to 1) 
	Weapon_Index = 1
	Armor_Index = 1
	Haste_Index = 1
	--WS_Index = 1
	Weapon_Set_Names = {"Physical", "Magic"}
	Armor_Set_Names = {"Attack", "Accuracy", "PDT", "MDT"}
	Haste_Set_Names = {"No Haste", "15%", "30%", "35%", "MAX"}
	
	sets.weapons = {}
	sets.weapons['Physical'] = { --Physical Damage Weapon Set -- Assumes DW5 (35%)
		main="Tizona",
		sub="Machaera +2",
	}
	sets.weapons['Magic'] = { -- Magic Damage Weapon Set -- Assumes DW3 (25%)
		main="Gabaxorea",
		sub="Gabaxorea",
	}
	sets.aftercast = {
		ammo="Staunch Tathlum",
		head="Malignance chapeau",
		body="Malignance tabard",
		hands="Malignance gloves",
		legs="Aya. Cosciales +1",
		feet="Malignance boots",
		neck="Loricate Torque +1",
		waist="Flume belt",
		left_ear="Odnowa Earring +1",
		right_ear="Ethereal earring",
		left_ring="Shneddick ring",
		right_ring="Defending ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Crit.hit rate+10','Damage taken-5%',}},
	}
	sets.resting = {
		ammo="Staunch Tathlum",
		head="Orvail Corona +1",
		body="Chelona Blazer",
		hands="Aya. Manopolas +1",
		legs="Nisse Slacks",
		feet="Chelona Boots",
		neck="Grandiose Chain",
		waist="Qiqirn Sash +1",
		left_ear="Brutal Earring",
		right_ear="Ethereal Earring",
		left_ring="Shneddick Ring",
		right_ring="Defending ring",
		back="Vita Cape",
	}
	sets.tp = {
		ammo="Amar Cluster", --STR+2, Acc+10, Eva+10
		head="Malignance chapeau",
		body="Adhemar jacket +1",
		hands="Adhemar wristbands +1",
		legs={ name="Taeon Tights", augments={'Accuracy+11','"Triple Atk."+2',}},
		feet="Aya. Gambieras +1", --Haste+3, Crit+5, STR+16, DEX+33, Acc+36, Eva+60, MDB+5, DT-2
		neck="Asperity Necklace", --Att+8, StoreTP+3, DA+2
		waist="Sailfi belt +1", --Haste+5, DA+4
		left_ear="Brutal Earring", --DA+5
		right_ear="Suppanomimi", --DW+5
		left_ring="Ayanmo Ring", --Acc+6, DT-3
		right_ring="Rajas Ring", --STR+5, DEX+5, StoreTP+5
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Crit.hit rate+10','Damage taken-5%',}},
	}
	sets.tp['Attack'] = set_combine(sets.tp, {
		ammo="Amar Cluster", --STR+2, Acc+10, Eva+10
		head="Malignance chapeau",
		body="Adhemar jacket +1",
		hands="Adhemar wristbands +1",
		legs={ name="Taeon Tights", augments={'Accuracy+11','"Triple Atk."+2',}},
		feet="Aya. Gambieras +1", --Haste+3, Crit+5, STR+16, DEX+33, Acc+36, Eva+60, MDB+5, DT-2
		neck="Asperity Necklace", --Att+8, StoreTP+3, DA+2
		waist="Sailfi belt +1", --Haste+5, DA+4
		left_ear="Brutal Earring", --DA+5
		right_ear="Suppanomimi", --DW+5
		left_ring="Ayanmo Ring", --Acc+6, DT-3
		right_ring="Rajas Ring", --STR+5, DEX+5, StoreTP+5
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Crit.hit rate+10','Damage taken-5%',}},
	})
	
	sets.tp['Accuracy'] = {
		ammo="Honed Tathlum",
		head="Malignance chapeau",
		body="Malignance tabard",
		hands="Adhemar wristbands +1",
		legs="Aya. Cosciales +1",
		feet="Malignance boots",
		neck="Asperity Necklace",
		waist="Hurch'lan sash",
		left_ear="Brutal Earring",
		right_ear="Suppanomimi", --DW+5
		left_ring="Ayanmo Ring",
		right_ring="Mars's Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Crit.hit rate+10','Damage taken-5%',}},
	}
	sets.tp['PDT'] = {
		ammo="Honed Tathlum",
		head="Malignance chapeau",
		body="Malignance tabard",
		hands="Malignance gloves",
		legs="Aya. Cosciales +1",
		feet="Malignance boots",
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Brutal earring",
		right_ear="Suppanomimi",
		left_ring="Ayanmo Ring",
		right_ring="Defending ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Crit.hit rate+10','Damage taken-5%',}},
	}
	sets.tp['MDT'] = {
		ammo="Honed Tathlum",
		head="Malignance chapeau",
		body="Malignance tabard",
		hands="Malignance gloves",
		legs="Aya. Cosciales +1",
		feet="Malignance boots",
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Brutal earring",
		right_ear="Suppanomimi",
		left_ring="Ayanmo Ring",
		right_ring="Defending ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Crit.hit rate+10','Damage taken-5%',}},
	}
	sets.tp.haste = {}
	
	sets.tp.haste['No Haste'] = {
	}
	sets.tp.haste['15%'] = {
	}
	sets.tp.haste['30%'] = {
	}
	sets.tp.haste['35%'] = {
	}
	sets.tp.haste['MAX'] = {
	}
	sets.tp.AM = { --Prioritize Store TP over DA, TA, QA, OA
		ammo="Amar Cluster",
		head="Malignance chapeau",
		body="Malignance tabard",
		hands="Malignance gloves",
		legs="Jhakri slops +1",
		feet="Malignance boots",
		neck="Asperity Necklace",
		waist="Sailfi belt +1",
		left_ear="Brutal Earring",
		--right_ear="Suppanomimi",
		left_ring="Ayanmo Ring",
		right_ring="Rajas Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Crit.hit rate+10','Damage taken-5%',}},
	}
	sets.tp.TreasureHunter = {
		waist="Chaac Belt",
	}
	sets.tp.Misc = {
		range="Aureole",
	}
	sets.precast = { --33fc
		--ammo="", Sapience orb 2fc
		head="Haruspex hat", --8fc
		--neck="", orunmila 5fc or baetyl 4fc
		left_ear="Loquacious earring", --2fc
		--right_ear="", ebchtr. earring+1 2fc
		body="Luhlaza jubbah", --6fc
		hands="Leyline gloves", --5fc
		--left_ring="", kishar ring 4fc, rahab ring 2fc, prolix ring 2fc
		--right_ring="",
		back="Swith cape", --3fc
		waist="Witful belt",
		legs="Lengo pants", --5fc
		feet="Chelona boots", --4fc
	}
	sets.precast.BlueMagic = { --40fc
		--ammo="", Sapience orb 2fc
		head="Haruspex hat", --8fc
		--neck="", orunmila 5fc or baetyl 4fc
		left_ear="Loquacious earring", --2fc
		--right_ear="", 
		body="Hashishin mintan", --13bluemagicspellcast
		hands="Leyline gloves", --5fc
		--left_ring="", kishar ring 4fc, rahab ring 2fc, prolix ring 2fc
		--right_ring="",
		back="Swith cape", --3fc
		waist="Witful belt",
		legs="Lengo pants", --5fc pinga pants+1 13fc
		feet="Chelona boots", --4fc carmine greaves+1 8fc
	}
	
	sets.midcast = {}
	sets.midcast.PhysicalDamage = { --Acc, STR, Macc
		ammo="Amar Cluster",
		head="Jhakri Coronal +2",
		body="Assim. Jubbah +3",
		hands="Malignance Gloves",
		legs="Jhakri Slops +1",
		feet="Amalric nails +1",
		neck="Tjukurrpa Medal",
		waist="Prosilio Belt",
		left_ear="Flame Pearl",
		right_ear="Flame Pearl",
		left_ring="Rajas Ring",
		right_ring="Ifrit Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.midcast.MagicAttack = {
		ammo="Erlene's notebook",
		head="Jhakri coronal +2",
		body="Amalric doublet +1",
		hands="Amalric gages +1",
		legs="Amalric slops +1",
		feet="Amalric nails +1",
		neck="Eddy Necklace",
		waist="Orpheus's sash",
		left_ear="Friomisi earring",
		right_ear="Novio Earring",
		left_ring="Acumen Ring", --acumen ring
		right_ring="Shiva Ring",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	sets.midcast.Cure = {
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
	sets.midcast.MagicAccuracy = {
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
	sets.midcast.PhysicalDebuff = {
		ammo="Mavi Tathlum",
		head="Assim. Keffiyeh +1",
		body="Assim. Jubbah +3",
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
	sets.midcast.PhysicalAccuracy = {
		ammo="Mavi Tathlum",
		head="Assim. Keffiyeh +1",
		body="Assim. Jubbah +3",
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
	sets.midcast.EnmityIncrease = {
		ammo="Mavi Tathlum",
		head="Assim. Keffiyeh +1",
		body="Assim. Jubbah +3",
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
	sets.midcast.Recast = {
		head="Haruspex Hat",
		body={ name="Luhlaza Jubbah", augments={'Enhances "Enchainment" effect',}},
		hands="Hashi. Bazubands",
		legs="Orvail Pants +1",
		left_ear="Loquacious earring",
		feet={ name="Taeon Boots", augments={'Accuracy+12','"Triple Atk."+2',}},
		waist="Hurch'lan Sash",
		back="Swith Cape",
	}
	sets.midcast.BlueMagicSkill = {
		ammo="Mavi Tathlum",
		head="Luhlaza Keffiyeh",
		body="Assim. Jubbah +3",
		hands="Rawhide Gloves",
		legs="Hashishin Tayt",
		feet={ name="Luhlaza Charuqs", augments={'Enhances "Diffusion" effect',}},
		--neck="",
		--waist="",
		--left_ear="",
		--right_ear="",
		--left_ring="",
		--right_ring="",
		back={ name="Cornflower Cape", augments={'MP+22','DEX+1','Accuracy+1','Blue Magic skill +10',}},
	}
	sets.WS = {}
	sets.WS.Requiescat = {
		ammo="Honed Tathlum",
		head="Jhakri coronal +2",
		body="Assim. Jubbah +3",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +1",
		feet={ name="Taeon Boots", augments={'Accuracy+12','"Triple Atk."+2',}},
		neck="Soil Gorget",
		waist="Shadow Belt",
		left_ear="Lifestorm Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Solemn Ring",
		right_ring="Persis Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.WS.Expiacion = {
		ammo="Jukukik Feather",
		head={ name="Herculean Helm", augments={'Accuracy+8 Attack+8','Weapon skill damage +5%','Accuracy+3',}},
		body="Assim. Jubbah +3",
		hands="Jhakri Cuffs +2",
		legs={ name="Taeon Tights", augments={'Accuracy+9','Crit.hit rate+3','Weapon skill damage +3%',}},
		feet={ name="Herculean Boots", augments={'Attack+27','Weapon skill damage +4%','STR+7',}},
		neck="Tjukurrpa Medal",
		waist="Sailfi belt +1",
		left_ear="Brutal Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Rajas Ring",
		right_ring="Ifrit Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.WS.SavageBlade = {
		ammo="Amar Cluster",
		head={ name="Herculean Helm", augments={'Accuracy+8 Attack+8','Weapon skill damage +5%','Accuracy+3',}},
		body="Assim. Jubbah +3",
		hands="Jhakri Cuffs +2",
		legs={ name="Taeon Tights", augments={'Accuracy+9','Crit.hit rate+3','Weapon skill damage +3%',}},
		feet={ name="Herculean Boots", augments={'Attack+27','Weapon skill damage +4%','STR+7',}},
		neck="Asperity Necklace",
		waist="Sailfi belt +1",
		left_ear="Brutal Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Rajas Ring",
		right_ring="Ifrit Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.WS.SanguineBlade = {
		ammo="Ghastly tathlum",
		head="Jhakri coronal +2",
		body="Amalric doublet +1",
		hands="Jhakri Cuffs +2",
		legs="Amalric slops +1",
		feet="Amalric nails +1",
		neck="Eddy Necklace",
		waist="Aswang Sash",
		left_ear="Friomisi earring",
		right_ear="Novio Earring",
		left_ring="Acumen Ring", --acumen ring
		right_ring="Shiva Ring",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	sets.WS.ChantDuCygne = { 
		ammo="Jukukik Feather",
		head={ name="Taeon Chapeau", augments={'Attack+11','Crit.hit rate+3','Crit. hit damage +3%',}},
		body={ name="Taeon Tabard", augments={'Accuracy+11','Crit.hit rate+3','Crit. hit damage +3%',}},
		hands={ name="Taeon Gloves", augments={'Attack+14','Crit.hit rate+3','Crit. hit damage +3%',}},
		legs={ name="Taeon Tights", augments={'Accuracy+9','Crit.hit rate+3','Weapon skill damage +3%',}},
		feet={ name="Taeon Boots", augments={'Attack+21','Crit.hit rate+3','Crit. hit damage +3%',}},
		neck="Light Gorget",
		waist="Snow Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Rajas Ring",
		right_ring="Ramuh Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Crit.hit rate+10','Damage taken-5%',}},
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
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Crit.hit rate+10','Damage taken-5%',}},
	}
	sets.JA.AzureLore = {
		hands="Mirage Bazubands +2",
	}
	sets.JA.Steps = {
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
	--Trust Equip Swap
	sets.trust = sets.aftercast
	
	check_haste()
end

--WS Change Based on Mainhand
function filtered_action(spell)
	if spell.name == 'Erase' then
		cancel_spell()
		send_command('input /ma "Winds of Promy." <me>')
	end
end

function precast(spell)

	--Weaponskills
	if spell.name == "Chant du Cygne" then
		equip(sets.WS.ChantDuCygne)
		add_to_chat(158, '**Chant du Cygne Gear Equipped**')
	elseif spell.name == "Requiescat" then
		equip(sets.WS.Requiescat)
		add_to_chat(158, '**Requiescat Gear Equipped**')
	elseif spell.name == "Sanguine Blade" then
		equip(sets.WS.SanguineBlade)
		add_to_chat(158, '**Sanguine Gear Equipped**')
	elseif spell.name == "Realmrazer" then
		equip(sets.WS.Realmrazer)
		add_to_chat(158, '**Realmrazer Gear Equipped**')
	elseif spell.name == "Savage Blade" then
		equip(sets.WS.SavageBlade)
		add_to_chat(158, '**Savage Blade Gear Equipped**')
	elseif spell.name == "Expiacion" then
		equip(sets.WS.Expiacion)
		add_to_chat(158, '**Expiacion Gear Equipped**')
	end
	
	--Job Abilities
	if spell.name == 'Azure Lore' then
		equip(sets.JA.AzureLore)
		add_to_chat(158, '**Azure Lore Enhanced**')
	end
	
	--Spells
	if spell.skill == 'Blue Magic' then
		equip(sets.precast.BlueMagic)
		add_to_chat(158, '**Precast Gear Equipped**')
	elseif spell.skill == 'White Magic' then
		equip(sets.precast)
	end
	
end

function midcast(spell)
	if spell.type == "Trust" then
		equip(sets.trust)
		add_to_chat(158, '**Trust 119 Equipped**')
	end
	
	-- BLU Physical Spells --
	if spell.name == 'Quadrastrike' 
		or spell.name == 'Vertical Cleave' 
		or spell.name == 'Death Scissors' 
		or spell.name == 'Empty Thrash' 
		or spell.name == 'Dimensional Death' 
		or spell.name == 'Bloodrake' 
		or spell.name == 'Amorphic Spikes' 
		or spell.name == 'Disseverment' 
		or spell.name == 'Hysteric Barrage' 
		or spell.name == 'Frenetic Rip' 
		or spell.name == 'Seedspray' 
		or spell.name == 'Vanity Dive' 
		or spell.name == 'Goblin Rush' 
		or spell.name == 'Thrashing Assault'
		or spell.name == 'Quad. Continuum' 
		or spell.name == 'Delta Thrust' 
		or spell.name == 'Cannonball' 
		or spell.name == 'Glutinous Dart' 
		or spell.name == 'Sinker Drill'
		or spell.name == 'Benthic Typhoon'
		or spell.name == 'Final Sting'
		or spell.name == 'Spiral Spin'
	then 
		equip(sets.midcast.PhysicalDamage)
		add_to_chat(158, '**Physical Spell Gear Equipped**')
		if buffactive['Chain Affinity'] then
			equip(sets.ChainAffinity)
			add_to_chat(158, '**Chain Affinity Enhanced**')
		end
		if buffactive['Efflux'] then
			equip(sets.Efflux)
			add_to_chat(158, '**Efflux Affinity Enhanced**')
		end
	end

	-- BLU Physical Debuff Accuracy
	if spell.name == 'Sudden Lunge' 
		or spell.name == 'Whirl of Rage'
		or spell.name == 'Head Butt'
		or spell.name == 'Sweeping Gouge'  
		or spell.name == 'Paralyzing Triad'
	then
		equip (sets.midcast.PhysicalDebuff)
		add_to_chat(158, '**Physical Debuff Accuracy Set Equipped**')
	end
	
	-- BLU Physical Accuracy
	
	if spell.name == 'Heavy Strike'
	then
		equip (sets.midcast.PhysicalAccuracy)
		add_to_chat(158, '**Physical Accuracy Set Equipped**')
	end
	
	-- BLU Magical Spells/INT
	if spell.name == 'Gates of Hades' 
		or spell.name == 'Leafstorm' 
		or spell.name == 'Firespit' 
		or spell.name == 'Acrid Stream' 
		or spell.name == 'Regurgitation' 
		or spell.name == 'Corrosive Ooze' 
		or spell.name == 'Thermal Pulse' 
		or spell.name == 'Magic Hammer' 
		or spell.name == 'Evryone. Grudge' 
		or spell.name == 'Water Bomb' 
		or spell.name == 'Dark Orb' 
		or spell.name == 'Thunderbolt' 
		or spell.name == 'Tem. Upheaval' 
		or spell.name == 'Embalming Earth' 
		or spell.name == 'Foul Waters' 
		or spell.name == 'Rending Deluge' 
		or spell.name == 'Droning Whirlwind' 
		or spell.name == 'Subduction' 
		or spell.name == 'Spectral Floe' 
		or spell.name == 'Blinding Fulgor' 
		or spell.name == 'Sandspin' 
		or spell.name == 'Blinding Fulgor' 
		or spell.name == 'Entomb' 
		or spell.name == 'Tenebral Crush'
		or spell.name == 'Retinal Glare'
	then
		equip(sets.midcast.MagicAttack)
		add_to_chat(158, '**INT Gear Equipped**')
		if buffactive['Burst Affinity'] then
			equip(sets.JA.BurstAffinity)
			add_to_chat(158, '**Burst Affinity Enhanced**')
		end	
	end
	
	-- BLU Cure Spells
	if spell.name == 'Magic Fruit' 
		or spell.name == 'Plenilune Embrace' 
		or spell.name == 'Wild Carrot' 
		or spell.name == 'Pollen' 
		or spell.name == 'White Wind' 
		or spell.name == 'Cure III' 
		or spell.name == 'Cure IV' 
	then
		equip(sets.midcast.Cure)
		add_to_chat(158, '**Cure Gear Equipped**')
	end
	
	-- BLU Debuffs
	if spell.name == 'Frightful Roar' 
		or spell.name == 'Infrasonics' 
		or spell.name == 'Barbed Crescent' 
		or spell.name == 'Tourbillion' 
		or spell.name == 'Cimicine Discharge' 
		or spell.name == 'Sub-zero smash' 
		or spell.name == 'Filamented Hold' 
		or spell.name == 'Mind Blast' 
		or spell.name == 'Sandspin' 
		or spell.name == 'Hecatomb Wave' 
		or spell.name == 'Cold Wave' 
		or spell.name == 'Terror Touch' 
		or spell.name == 'Pinecone Bomb' 
		or spell.name == 'Dream Flower' 
		or spell.name == 'Silent Storm'  
		or spell.name == 'Sheep song' 
	then  
		equip(sets.midcast.MagicAccuracy)
		add_to_chat(158, '**Magic ACC Gear Equipped**')
	end
	
	if spell.name == 'Occultation' 
		or spell.name == 'Diamondhide' 
		or spell.name == 'Magic Barrier' 
	then
		if buffactive['Diffusion'] then
			equip(sets.midcast.BlueMagicSkill, sets.JA.Diffusion)
			add_to_chat(158, '**Diffusion Enhanced**')
		else
		equip(sets.midcast.BlueMagicSkill)
		add_to_chat(158, '**Blue Magic Gear Equipped**')
		end
	end
	
	-- BLU Offensive/Defensive Debuffs for Recast Reduction
	
	if spell.name == 'Metallic Body'  
		or spell.name == 'Cocoon' 
		or spell.name == 'Harden Shell' 
		or spell.name == 'Animating Wail' 
		or spell.name == 'Battery Charge' 
		or spell.name == 'Nat. Meditation' 
		or spell.name == 'Carcharian Verve' 
		or spell.name == 'O. Counterstance' 
		or spell.name == 'Barrier Tusk' 
		or spell.name == 'Saline Coat' 
		or spell.name == 'Regeneration' 
		or spell.name == 'Erratic Flutter' 
		or spell.name == 'Mighty Guard' 
		or spell.name == 'Carcharian Verve' 
		or spell.name == 'Actinic Burst'
	then
		if buffactive['Diffusion'] then
			equip(sets.midcast.Recast, sets.JA.Diffusion)
			add_to_chat(158, '**Diffusion Enhanced**')
		else
		equip(sets.midcast.Recast)
		add_to_chat(158, '**Recast Gear Equipped**')
		end
	end
	-- Sneak Jig --
	if spell.english == 'Spectral Jig' 
		or spell.english == 'Sneak' 
	and buffactive.sneak 
	then
        send_command('cancel 71')
    end
end

function aftercast(spell)
	if player.status == 'Engaged' then
		if player.equipment.main == 'Tizona' then
			if buffactive['Aftermath: Lv.3'] then
				equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
				equip(sets.tp[Armor_Set_Names[Armor_Index]], sets.tp[Haste_Set_Names[Haste_Index]], sets.tp.AM)
				add_to_chat(158, '**AM3 TP [' ..Armor_Set_Names[Armor_Index]..'] Haste['..Haste_Set_Names[Haste_Index].. '] Equipped**')
			else
				equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
				equip(sets.tp[Armor_Set_Names[Armor_Index]])
				--add_to_chat(158, '**No-AM3 TP [' ..Armor_Set_Names[Armor_Index]..'] Haste['..Haste_Set_Names[Haste_Index].. '] Equipped**')
			end
		else
			equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
			equip(sets.tp[Armor_Set_Names[Armor_Index]])
			add_to_chat(158, '**Magic Weapon TP [' ..Armor_Set_Names[Armor_Index]..'] Haste['..Haste_Set_Names[Haste_Index].. '] Equipped**')
		end
    else
		equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
        equip(sets.aftercast)
		add_to_chat(158, '**Aftercast Equipped**')
    end
end

function buff_change(name,gain,buff_details)
    check_haste()
	if player.status == 'Engaged' then
		if player.equipment.main == 'Tizona' then
			if buffactive['Aftermath: Lv.3'] then
				equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
				equip(sets.tp[Armor_Set_Names[Armor_Index]], sets.tp[Haste_Set_Names[Haste_Index]], sets.tp.AM)
				add_to_chat(158, '**AM3 TP [' ..Armor_Set_Names[Armor_Index]..'] Haste['..Haste_Set_Names[Haste_Index].. '] Equipped**')
			end
		end
    end
end

function buff_refresh(name, buffdetails)
	check_haste()
end

function check_haste() --changes gear set based on magic haste, compensating for dual wield
	if ( ( (buffactive[33] or buffactive[580] or buffactive.embrava) and (buffactive.march or buffactive[604]) ) or
			( buffactive[33] and (buffactive[580] or buffactive.embrava) ) or
			( buffactive.march == 2 and buffactive[604] ) ) then
		display.hasteset = Haste_Set_Names[5]
		Haste_Index = 5
	elseif ( (buffactive[33] or buffactive.march == 2 or buffactive[580]) and buffactive['haste samba'] ) then
		display.hasteset = Haste_Set_Names[4]
		Haste_Index = 4
	elseif ( ( buffactive[580] or buffactive[33] or buffactive.march == 2 ) or
				( buffactive.march == 1 and buffactive[604] ) ) then
		display.hasteset = Haste_Set_Names[3]
		Haste_Index = 3
	elseif ( buffactive.march == 1 or buffactive[604] ) then
		display.hasteset = Haste_Set_Names[2]
		Haste_Index = 2
	else
		display.hasteset = Haste_Set_Names[1]
		Haste_Index = 1
	end
end

function status_change(new,old)
    if new == 'Engaged' then
		if player.equipment.main == 'Tizona' then
			if buffactive['Aftermath: Lv.3'] then
				equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
				equip(sets.tp[Armor_Set_Names[Armor_Index]], sets.tp[Haste_Set_Names[Haste_Index]], sets.tp.AM)
				add_to_chat(158, '**AM3 TP [' ..Armor_Set_Names[Armor_Index]..'] Haste['..Haste_Set_Names[Haste_Index].. '] Equipped**')
			else
				equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
				equip(sets.tp[Armor_Set_Names[Armor_Index]])
				add_to_chat(158, '**No-AM3 TP [' ..Armor_Set_Names[Armor_Index]..'] Haste['..Haste_Set_Names[Haste_Index].. '] Equipped**')
			end
		else
			equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
			equip(sets.tp[Armor_Set_Names[Armor_Index]])
			add_to_chat(158, '**Magic Weapon TP [' ..Armor_Set_Names[Armor_Index]..'] Haste['..Haste_Set_Names[Haste_Index].. '] Equipped**')
		end
	elseif new == 'Resting' then
		equip(sets.resting)
		equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
		add_to_chat(158, '**Resting Set Equipped**')
    else
		equip(sets.weapons[Weapon_Set_Names[Weapon_Index]])
		equip(sets.aftercast)
		add_to_chat(158, '**Aftercast Equipped**')
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
			equip(sets.tp[Armor_Set_Names[Armor_Index]])
		else
			equip(sets.aftercast)
		end
		display.armorset = Armor_Set_Names[Armor_Index]
	end
end