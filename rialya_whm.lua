--[[ 
Author: Rialya (Asura, Valefor, Bismarck) 
11.18.2020

Rialya's WHM Gearswap

LUA file for White Mage gear swap and on-th-fly mode switching.

	-Cure (precast) Prioritizes Fast Cast and Cure Cast Time reduction. 
	-Cure (midcast) prioritizes Potency, MP Efficiency, Afflatus Solace, and Enmity Reduction
	-White Mage Trait "Tranquil Heart" bases its enmity reduction on healing 
	magic skill, resulting in a -25% enmity reduction at 500 healing magic skill 
	(-0.5 Enmity/10 Healing Magic). Enmity generation will be calculated by:
	(1-EnmityEquipment/100)*(1-(HealingMagicSkill/10*0.5))

Cure Notes:
	
	When selecting gear for single target Cures, the preference is to maximize the effect of Afflatus Solace and get MP returns.
	This locks in Ebers Briault +1, Alaunus' Cape, and Ebers Pantaloons +1.

	Cure Cast Reduction (Caps at -80% cast time)
	
	Enmity Reduction (Caps at -50 from equipment)
	
	Potency
		Single Target Cures
		
		Curagas
		
		
	
	Afflatus Solace Stoneskin Potency
	
	
	Ideal Single Target Cure Set
		CurePot=10+11+11+11+10+3
		CurePotII=6+2
		Enmity=-6-6-6-6-25-5-5-10
	
		main="Iridal Staff", --Iridescence:Weather+10%, CurePot+10
		sub=
		ammo=
		head="Kaykaus Mitra +1", --VIT14, MND19, HealingMagic16, Haste6, CurePotency11, SET:CurePotII (2+pieces, 4,6,8,10), PathB: Enmity-6
		body="Ebers Bliaud +1", --Solace+14, MND33, VIT20, HealingMagic+24, 
		hands="Kaykaus Cuffs +1" --VIT25, MND35, Haste3, Enmity-6, CurePotency11,  SET:CurePotII (2+pieces, 4,6,8,10), PathB:Enmity-6 or PathD:ConMP7,FC4 or PathA: MND12
		legs="Ebers Pantaloons +1", --VIT22, MND33, Convert6%CureToMP
		feet="Kaykaus boots +1" --VIT10, MND19, Enmity-6, ConMP7, CurePot+11, SET:CurePotII (2+pieces, 4,6,8,10)
		neck="Cleric's torque +2" --CurePot+10, AUG:MND+15 Enmity-25 FC+10
		waist=
		left_ear="Glorius Earring" --Enmity-5, CurePotII+2
		right_ear=
		left_ring="Lebeche ring" --Enmity-5, CurePot+3
		right_ring=
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+5','Enmity-10','Damage taken-5%',}},

Regen Notes:
	
	Potency

		Regen I/II/III/IV = 5/12/20/30 HP per tic
		Group I Regen Merits: +5 to each regen = 10/17/25/35

		Bolelabunga (Potency +10%)
		Inyanga tiara +2 (Potency +14%)
		Piety Briault +3 (Potency +52%)

		10*1.76 = Floor(17.6) = 17
		17*1.76 = Floor(29.96) = 29
		25*1.76 = Floor(44) = 44
		35*1.76 = Floor(61.6) = 61

	Duration
		
		Duration: 75/60/60/60 sec
		
		Theophany pantaloons +3 (+24)
		Ebers Mitts +1 (+22)
		Ammurapi Shield (+10% Enhancing)
		Telchine pigaches (+10% Enhancing)
		Embla Sash (+10% Enhancing)
		
		75+46=121*1.3=157s/3 = 52 tics
		60+46=106*1.3=137s/3 = 45 tics
		
		
	Ideal Regen (Max Potency with Duration Secondary)
		
		Regen I (15 MP)= 17*52 = 884 hp (58.93 HP/MP)
		Regen II (36 MP)= 29*45 = 1305 hp (36.25 HP/MP)
		Regen III (64 MP) = 44*45 = 1980 hp (30.93 HP/MP)
		Regen IV (82 MP)= 61*45 = 2745 hp (33.47 HP/MP)
		

Barspell Notes:

	Potency
		1 Barelement = 1 Magic Evasion to Elemental, Barstatus likely works the same
		
		
]]--
include('organizer-lib.lua')

--Display Text for Mode Switching
text = require('texts')
display = text.new()
mode = "Support"
str = 'Weapon Set: ${mode|Support}'
display:text(str)
display:font("Consolas")
display:size(10)
display:pos(850,950)
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
	windower.send_command('bind %9 input /ja "Light Arts" <me>')
	windower.send_command('bind %0 input /ja "Dark Arts" <me>')
	
	--CTRL + Number Key
	windower.send_command('bind %^1 input /ma "Curaga" <t>')
	windower.send_command('bind %^2 input /ma "Curaga II" <t>')
	windower.send_command('bind %^3 input /ma "Curaga III" <t>')
	windower.send_command('bind %^4 input /ma "Curaga IV" <t>')
	windower.send_command('bind %^5 input /ma "Curaga V" <t>')
	windower.send_command('bind %^6 input /ja "Penury" <me>')
	windower.send_command('bind %^7 input /ja "Accession" <me>')
	--windower.send_command('bind %^8 input ')
	windower.send_command('bind %^9 input /ja "Afflatus Solace" <me>')
	--indower.send_command('bind %^0 input')
	
	--ALT + Number Key
	--windower.send_command('bind %!1 input ')
	windower.send_command('bind %!2 input /ma "Repose" <t>')
	windower.send_command('bind %!3 input /ma "Haste" <t>')
	--windower.send_command('bind %!4 input ')
	--windower.send_command('bind %!5 input ')
	windower.send_command('bind %!6 input /ja "Celerity" <me>')
	--windower.send_command('bind %!7 input ')
	--windower.send_command('bind %!8 input ')
	windower.send_command('bind %!9 input /ma "Aspir" <t>')
	--windower.send_command('bind %!0 input ')
	
	--Misc Keys
	windower.send_command('bind %q input /ja "Divine Caress" <me>')
	windower.send_command('bind %z input /ja "Sublimation" <me>')
	windower.send_command('bind %x input /item "Echo Drops" <me>')
	windower.send_command('bind %w input /item "Elshimo pachira fruit" <me>')
	windower.send_command('alias bslp input /ma "Barsleepra" <me>')
	windower.send_command('bind %a input /ma "Cure" <t>')
	-- Weapon and Armor Type Change (Default sets to 1) 
	Mode_Index = 1
	Armor_Index = 1
	Mode_Set_Names = {"Support", "Frontline"}
	Armor_Set_Names = {"Support", "Hybrid", "PDT", "MDT"}
	-- Obi Sets
	sets.obi = {}
	sets.obi.Light = {waist='Hachirin-no-Obi'}
	sets.obi.Dark = {waist='Hachirin-no-Obi'}
	sets.weapons = {}
	sets.weapons['Support'] = {}
	sets.weapons['Frontline'] = {
		main="Yagrush",
		sub="",
	}
	sets.weapons.dispelga = {
		main="Daybreak",
	}
	sets.aftercast = { --[[aftercast Gear: DamageTakenDown, MagicDamageTakenDown, PhysicalDamageTakenDown, M.EvasionUp, EvasionUp]]--
		main="Malignance Pole", --150hp
		sub="Enki Strap", --45hp
		ammo="Staunch Tathlum",
		head="Inyanga Tiara +1",--45hp
		body="Inyanga Jubbah +2", --85hp
		hands="Inyan. Dastanas +2",--35hp
		legs="Inyanga Shalwar +1",--55hp
		feet="Inyan. Crackows +1",--25hp
		neck="Loricate Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Odnowa Earring +1", --conv110mp to 110hp
		right_ear="Eabani Earring", --45hp
		left_ring="Defending Ring",
		right_ring="Shneddick Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+5','Enmity-10','Damage taken-5%',}},
	}
	sets.aftercast.tp = { --[[Gear (Melee): Refresh, DamageTakenDown, MagicDamageTakenDown, PhysicalDamageTakenDown, M.EvasionUp, EvasionUp]]--
		head="Theophany cap", 
		body="Theophany briault", 
		neck="Asperity necklace", 
		ear1="Brutal earring", 
		ear2="Suppanomimi", 
		hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
		ring1="Mars's Ring", 
		ring2="Rajas ring", 
		waist="Cetl belt",
		back="Alaunus's cape", 
		legs="Telchine braconi", 
		feet="Helios boots",
	}
	sets.tp = {
		head="Theophany cap", 
		body="Theophany briault", 
		neck="Asperity necklace", 
		ear1="Brutal earring", 
		ear2="Suppanomimi", 
		hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
		ring1="Mars's Ring", 
		ring2="Rajas ring", 
		waist="Cetl belt",
		back="Alaunus's cape", 
		legs="Telchine braconi", 
		feet="Helios boots",
	}
	sets.WS = {
	}
	sets.WS.Realmrazer = {
		head="Theophany cap", 
		body="", 
		neck="Light gorget", 
		ear1="Bladeborn earring", 
		ear2="Steelflash earring", 
		hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
		ring1="Mars's Ring", 
		ring2="Cetl belt", 
		waist="Fucho-no-obi",
		back="Alaunus's cape", 
		legs="Telchine braconi", 
		feet="Helios boots",
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
	sets.precast = { --Precast Gear (No Quickening): FastCast, 66% Total with LightArts
		--main="",
		--sub="",
		ammo="Incantor Stone", --2fc
		head="Nahtirah Hat",--10fc
		--neck="",
		left_ear="Loquac. Earring", --2fc
		right_ear="Malignance Earring", --4fc
		body="Inyanga Jubbah +2", --14c
		hands="Gendewitha Gages", --7fc
		--ring1="", 
		--ring2="", 
		waist="Embla Sash", --5fc
		back="Swith Cape", --3fc
		legs="Artsieq Hose", --5fc BIS: Pinga pants +1
		feet="Chelona Boots", --4fc
	}
	sets.precast.cure = { --Total CureCast Reduction, Fast Cast 83% (Capped with Light Arts)
		--main="Ababinili", -- cure spellcasting time -10%
		ammo="Incantor stone", -- 2% fast cast
		head="Nahtirah hat",  -- 10% fast cast
		neck="Aceso's choker", -- cure spellcasting time -10% 
		ear1="Loquacious earring", -- 2% fast cast
		ear2="Malignance earring", --4fc
		body="Inyanga Jubbah +2", --14fc
		hands="Gendewitha gages", -- 7% fc
		--ring1="", 
		--ring2="", 
		back="Swith cape", -- 3% fc
		waist="Embla Sash",-- 5% fc 
		legs="Ebers Pantaloons +1", --healing magic casting time -12%
		feet="Chelona boots", -- 4% fast cast
	}
	sets.precast.reduction = { --Precast Gear with Quickening (For spells that lack useful modification applied midcast)
		--main="", 
		--sub="",
		ammo="Incantor Stone",
		head="Nahtirah Hat",
		body="Inyanga Jubbah +2",
		hands={ name="Gendewitha Gages", augments={'Phys. dmg. taken -1%','Song recast delay -1',}},
		legs="Artsieq Hose",
		feet="Chelona Boots",
		neck="Aceso's Choker",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		ear2="Malignance earring",
		left_ring="Persis Ring",
		right_ring="",
		back="Swith Cape",
	}
	sets.precast.status = { --[[Total Status Removal Cast Reduction = 10 "Light Arts" + 50 "White Mage Divine Benison V"+ 53 "Equipment" = 113% (80%Cap)]]--
		main="Yagrush", 
		sub="",
		ammo="Incantor stone", -- 2% fast cast
		head="Nahtirah hat", -- 10% fast cast
		neck="Aceso's choker", -- cure spellcasting time -10% 
		ear1="Loquacious earring", -- 2% fast cast
		ear2="Malignance earring", --4% fast cast
		body="", 
		hands="Gendewitha gages", -- 7% fast cast
		ring1="", 
		ring2="", 
		back="Swith cape", -- 3% fast cast
		waist="Witful belt", -- 3% fast cast
		legs="Ebers Pantaloons +1", --healing magic casting time -12%
		feet="Chelona boots",  -- 4% fast cast
	}
--Midcast Sets
--Healing Magic 
	--Cure Potency
	sets.midcast = {}
	sets.midcast.recast = { --For spells unaffected by other stats and benefit from reduced recast and conserve mp
		main="Malignance pole",
		sub="Irenic Strap",
		ammo="Clarus Stone",
		head="Theophany Cap",
		body="Count's Garb",
		hands="Shrieker's Cuffs",
		legs="Aya. Cosciales +1",
		feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +6','MP+9',}},
		neck="Loricate torque +1",
		waist="Pythia Sash",
		left_ear="Loquac. Earring",
		ear2="Malignance earring",
		left_ring="Persis Ring",
		right_ring="Rajas Ring",
		back={ name="Alaunus's Cape", augments={'Damage taken-5%',}},
	}
	sets.midcast.CurePotency = { --[[ AfflatusSolace, Cure Potency, EnmityDown, HealingMagicSkill, MND, ConserveMP, Haste, 50% potency  ]]--
		main="Iridal Staff",
		sub="Amicus Grip",
		ammo="Erlene's Notebook",
		head="Kaykaus Mitra +1",
		body="Ebers Bliaud +1",
		hands="Kaykaus Cuffs +1",
		legs="Ebers Pant. +1",
		feet="Kaykaus Boots +1",
		neck="Phrenic Torque",
		waist="Pythia Sash",
		left_ear="Mendi. Earring",
		right_ear="Novia Earring",
		left_ring="Mediator's Ring",
		right_ring="Persis Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+5','Enmity-10','Damage taken-5%',}},
	}
	sets.midcast.CuragaPotency = { --[[ Cure Potency, EnmityDown, MND, HealingMagicSkill, ConserveMP, Haste, 50% potency  ]]--
		main="Iridal Staff",
		sub="Amicus Grip",
		ammo="Erlene's Notebook",
		head="Kaykaus Mitra +1",
		body="Theo. Briault",
		hands="Kaykaus Cuffs +1",
		legs="Ebers Pantaloons +1",
		feet="Kaykaus Boots +1",
		neck="Cleric's Torque",
		waist="Pythia Sash",
		left_ear="Lifestorm Earring",
		right_ear="Novia Earring",
		left_ring="Mediator's Ring",
		right_ring="Ephedra Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+5','Enmity-10','Damage taken-5%',}},
	}
	--Status Removal
	sets.midcast.StatusNaSpells = { --[[ DivineVeil, EnmityDown, Haste, ConserveMP ]]--
		main="Yagrush",
		sub="Sors Shield",
		ammo="Clarus Stone",
		head="Haruspex Hat",
		body="Ayanmo Corazza +2",
		hands="Shrieker's Cuffs",
		legs="Weath. Pants +1",
		feet="Navon Crackows",
		neck="Cleric's Torque",
		waist="Cetl Belt",
		left_ear="Mendi. Earring",
		right_ear="Novia Earring",
		left_ring="Mediator's Ring",
		right_ring="Sangoma Ring",
		back="Mending Cape",
	}
	sets.midcast.StatusCursna = { --[[ DivineVeil, EnhanceCursna, HealingMagicSkill, EnmityDown, Haste, ConserveMP ]]--
		main="Yagrush",
		sub="Sors Shield",
		ammo="Clarus Stone",
		head="Nahtirah Hat",
		body="Ebers Bliaud +1",
		hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
		legs="Theo. Pantaloons",
		feet="Gende. Galoshes",
		neck="Malison Medallion",
		waist="Cetl Belt",
		left_ear="Lifestorm Earring",
		right_ear="Novia Earring",
		left_ring="Mediator's Ring",
		right_ring="Ephedra Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+5','Enmity-10','Damage taken-5%',}},
	}
	sets.midcast.EraseSacrificeEsuna = { --Yagrush, Recast Reduction (Haste, FastCast, Divine Benison), ConserveMP, -Enmity, -Damage Taken
		main="Yagrush",
		sub="Sors Shield",
		ammo="Clarus Stone",
		head="Haruspex Hat",
		body="Ayanmo Corazza +2",
		hands="Shrieker's Cuffs",
		legs="Weath. Pants +1",
		feet="Navon Crackows",
		neck="Cleric's Torque",
		waist="Cetl Belt",
		left_ear="Mendi. Earring",
		right_ear="Novia Earring",
		left_ring="Mediator's Ring",
		right_ring="Sangoma Ring",
		back="Mending Cape",
	}
	sets.midcast.DivineCaress = {
		--main="",
		--ammo="", 
		--head="", 
		--neck="", 
		--ear1="", 
		--ear2="", 
		--body="", 
		hands="Orison mitts +2", 
		--ring1="", 
		--ring2="E", 
		back="Mending cape", 
		--waist="", 
		--legs="", 
		--feet="",
	}
--Enhancing Magic
	sets.midcast.MaxEnhancing = {
		main="Ababinili", 
		sub="Fulcio Grip", 
		ammo="Clarus stone", 
		head="Ebers Cap", 
		neck="Colossus's torque", 
		ear1="Lifestorm earring", 
		ear2="Mimir earring", 
		body="Ebers Bliaud +1", 
		hands="Dynasty Mitts", 
		ring1="Mediator's ring", 
		ring2="Ephedra ring", 
		back="Mending cape", 
		waist="Witful belt", 
		legs="Piety pantaloons", 
		feet="Orison duckbills +2",
	}
--Regen
	sets.midcast.EnhancingRegen = {
		main="Bolelabunga",
		sub="Ammurapi Shield",
		ammo="Clarus Stone",
		head="Inyanga Tiara +1",
		body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
		hands="Orison Mitts +2",
		legs="Theo. Pantaloons",
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		neck="Noetic Torque",
		waist="Embla Sash",
		left_ear="Lifestorm Earring",
		right_ear="Novia Earring",
		left_ring="Mediator's Ring",
		right_ring="Ephedra Ring",
		back="Mending Cape",
	}
--Barspell
	sets.midcast.EnhancingBarspell = { --At leastr 500 enhancing, Resistance+, Duration+
		main="Ababinili",
		sub="Fulcio Grip",
		ammo="Clarus Stone",
		head="Ebers Cap",
		body="Ebers Bliaud +1",
		hands="Dynasty Mitts",
		legs={ name="Piety Pantaloons", augments={'Enhances "Afflatus Misery" effect',}},
		feet="Orsn. Duckbills +2",
		neck="Colossus's Torque",
		waist="Witful Belt",
		left_ear="",
		right_ear="Mimir Earring",
		left_ring="Mediator's Ring",
		right_ring="Ephedra Ring",
		back="Mending Cape",
	}
--Enhancing Duration
	sets.midcast.EnhancingDuration = { --increase duration of Enhancing Magic spells without other potency modifiers
		main="Yagrush",
		sub="Ammurapi Shield",
		head={ name="Telchine Cap", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +9',}},
		body={ name="Telchine Chas.", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		waist="Embla Sash",
	}
--Enfeebling Magic
	sets.midcast.Enfeebling = {
		main="Marin Staff",
		sub="Enki Strap",
		ammo="Elis Tome",
		head="C. Palug Crown",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs={ name="Chironic Hose", augments={'Blood Pact Dmg.+6','Pet: STR+9','Accuracy+11 Attack+11','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
		feet="Skaoi Boots",
		neck="Noetic Torque",
		waist="Rumination Sash",
		left_ear="Lifestorm Earring",
		right_ear="Psystorm Earring",
		left_ring="Mediator's Ring",
		right_ring="Ayanmo Ring",
		back="Refraction Cape",
	}
	sets.midcast.Elemental = {
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="", 
		head="", 
		neck="Eddy necklace", 
		ear1="Hecate's earring",
		ear2="Novio earring", 
		body="", 
		hands="Gendewitha gages", 
		ring1="Mediator's ring", 
		ring2="Angha Ring", 
		back="Refraction cape", 
		waist="Aswang sash", 
		legs="Telchine braconi", 
		feet="Orvail souliers +1",
	}
	sets.midcast.EnfeeblingWhiteAcc = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Elis Tome",
		head="C. Palug Crown",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Aya. Cosciales +1",
		feet="Skaoi Boots",
		neck="Noetic Torque",
		waist="Rumination Sash",
		left_ear="Malignance Earring",
		right_ear="Gwati Earring",
		left_ring="Sangoma Ring",
		right_ring="Ayanmo Ring",
		back="Refraction Cape",
	}
	sets.midcast.Divine = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Elis Tome",
		head="C. Palug Crown",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Aya. Cosciales +1",
		feet="Skaoi Boots",
		neck="Noetic Torque",
		waist="Rumination Sash",
		left_ear="Malignance Earring",
		right_ear="Gwati Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back="Refraction Cape",
	}
	--Black Magic Accuracy
	sets.midcast.EnfeeblingBlackAcc = {
		main="Marin staff", 
		sub="Mephitis grip", 
		ammo="", 
		head="Weatherspoon corona +1", 
		neck="Imbodla Necklace", 
		ear1="Lifestorm earring", 
		ear2="Psystorm earring", 
		body="Theophany briault", 
		hands="Gendewitha gages", 
		ring1="Stikini Ring", 
		ring2="Stikini Ring", 
		back="Refraction cape", 
		waist="Aswang sash", 
		legs="Telchine braconi", 
		feet="Orvail souliers +1",
	}
	sets.midcast.EnfeeblingWhitePotency = {
		main="Marin Staff",
		sub="Enki Strap",
		ammo="Elis Tome",
		head="C. Palug Crown",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs={ name="Chironic Hose", augments={'Blood Pact Dmg.+6','Pet: STR+9','Accuracy+11 Attack+11','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
		feet="Skaoi Boots",
		neck="Noetic Torque",
		waist="Rumination Sash",
		left_ear="Lifestorm Earring",
		right_ear="Stikini Ring",
		left_ring="Stikini Ring",
		right_ring="Ayanmo Ring",
		back="Refraction Cape",
	}
	sets.midcast.DarkAcc = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Elis Tome",
		head="C. Palug Crown",
		body="Ayanmo Corazza +2",
		hands="Inyan. Dastanas +2",
		legs={ name="Chironic Hose", augments={'Blood Pact Dmg.+6','Pet: STR+9','Accuracy+11 Attack+11','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
		feet="Orvail Souliers +1",
		neck="Eddy Necklace",
		waist="Fucho-no-Obi",
		left_ear="Malignance Earring",
		right_ear="Gwati Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back="Toro Cape",
	}		
	sets.midcast.DrainAspir = {
		main="Daybreak", --BIS Rubicundity
		sub="Ammurapi Shield", -- Current BIS
		ammo="Elis Tome", -- BIS 	Pemphredo Tathlum
		head="C. Palug Crown", -- Current BIS
		body="Ayanmo Corazza +2", -- BIS Shango Robe
		hands="Inyan. Dastanas +2", -- Current BIS
		legs={ name="Chironic Hose", augments={'Blood Pact Dmg.+6','Pet: STR+9','Accuracy+11 Attack+11','Mag. Acc.+15 "Mag.Atk.Bns."+15',}}, --BIS Theophany Pantaloons +3
		feet="Orvail Souliers +1", -- BIS Theophany Duckbills +3
		neck="Eddy Necklace", -- BIS Erra Pendant
		waist="Fucho-no-Obi", -- Current BIS
		left_ear="Malignance Earring", --Current BIS
		right_ear="Gwati Earring", --BIS Mani Earring
		left_ring="Stikini Ring", -- BIS Evanescence Ring
		right_ring="Stikini Ring", --BIS Stikini Ring +1
		back="Toro Cape", --BIS Aurist's Cape 
	}
end

function filtered_action(spell) -- Events (Casting)
	if spell.name == 'Aurorastorm II' then
		cancel_spell()
		send_command('input /ma "Aurorastorm" <me>')
	end
	if spell.name == 'Dispelga' then
		equip(sets.weapons.dispelga)
	end
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
		if spell.element == world.weather_element or spell.element == world.day_element then
			equip(sets.midcast.CurePotency, sets.obi.Light)
			add_to_chat(158, '**Day/Weather Obi Equipped**')
		else
			equip(sets.midcast.CurePotency)
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
		equip(sets.aftercast.tp, sets.weapons[Mode_Set_Names[Mode_Index]])
		add_to_chat(158, '**TP Gear Equipped**')
	else
	equip(sets.aftercast, sets.weapons[Mode_Set_Names[Mode_Index]])
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

function buff_change(name,gain,buff_details)
    if buffactive['Sleep'] then
		send_command('cancel stoneskin;')
	end
end

function status_change(new,old)
	if new == 'Resting' then
		equip(sets.resting, sets.weapons[Mode_Set_Names[Mode_Index]])
	elseif new == 'Engaged' then
		equip(sets.weapons[Mode_Set_Names[Mode_Index]])
		equip(sets.tp)
	else
	equip(sets.aftercast)
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