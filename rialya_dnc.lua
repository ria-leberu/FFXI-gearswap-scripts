-- Rialya's DNC Gearswap

function get_sets()

	sets.standing = {
		head="Iuitl headgear",
		neck="Asperity necklace",
		ear1="Dudgeon earring",
		ear2="Heartseeker earring",
		body="Iuitl vest",
		hands="Iuitl wristbands",
		ring1="Rajas ring",
		ring2="Ulthalam's Ring",
		back="Atheling mantle",
		waist="Twilight belt",
		legs="Manibozho brais",
		feet="Tandava Crackows",
	}

	sets.TP = {
		head="Iuitl headgear",
		neck="Asperity necklace",
		ear1="Dudgeon earring",
		ear2="Heartseeker earring",
		body="Iuitl vest",
		hands="Iuitl wristbands",
		ring1="Rajas ring",
		ring2="Ulthalam's Ring",
		back="Atheling mantle",
		waist="Twilight belt",
		legs="Manibozho brais",
		feet="Manibozho boots",
	}

	sets.WS_PyrrhicKleos = {
		head="Iuitl headgear",
		neck="Asperity necklace",
		ear1="Steelflash earring",
		ear2="Bladeborn earring",
		body="Iuitl vest",
		hands="Iuitl wristbands",
		ring1="Rajas ring",
		ring2="Spiral Ring",
		back="Atheling mantle",
		waist="Warwolf belt",
		legs="Manibozho brais",
		feet="Iuitl gaiters",
	}
	
	sets.Waltz = {
		head="Etoile tiara +1",
		neck="Asperity necklace",
		ear1="Dudgeon earring",
		ear2="Heartseeker earring",
		body="Dancer's casaque",
		hands="Iuitl wristbands",
		ring1="Rajas ring",
		ring2="Ulthalam's Ring",
		back="Atheling mantle",
		waist="Twilight belt",
		legs="Manibozho brais",
		feet="Tandava Crackows",
	}
	
end

function precast(spell)

	if spell.type == "WeaponSkill" then
		equip(sets.WS_PyrrhicKleos)
		add_to_chat(158, '**WS Gear Equipped**')
	end
	if spell.type == "Waltz" then
		equip(sets.Waltz)
		add_to_chat(158, '**Waltz Gear Equipped**')
	end
	if spell.name == "Reverse Flourish" then
		equip({hands="Charis bangles +2"})
		add_to_chat(158, '**Reverse Flourish Enhanced**')
	end
	if spell.name == "Spectral Jig" then
		equip({feet="Dancer's toe shoes"})
		send_command('cancel sneak')
		add_to_chat(158, '**Jig Enhanced**')
	elseif spell.name == "Chocobo Jig II" then
		equip({feet="Dancer's toe shoes"})
		add_to_chat(158, '**Jig Enhanced**')
	end
	if spell.name == "Seigan" then
		equip({main="Earth staff"})
	end
end

function midcast(spell)

	

end

function aftercast(spell)
	
	if spell.name == "Seigan" then
		equip({main="Eminent dagger", sub="Aphotic kukri"})
	end
	if player.status=='Engaged' then
        equip(sets.TP)
    else
        equip(sets.standing)
    end

end

function status_change(new,old)
    if new == 'Engaged' then
        equip(sets.TP)
    else
       equip(sets.standing)
	end
end