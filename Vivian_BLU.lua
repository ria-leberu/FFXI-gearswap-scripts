include('organizer-lib')

function get_sets()
	
    sets.JA = {}
	
	sets.FC = {
        
    }	
	
    sets.TP = {
		range="Platoon Disc",
		head="Aurore Beret",
		body="Scorpion Harness",
		hands="Aurore Gloves",
		legs="Aurore Brais",
		feet="Aurore Gaiters",
		neck="Peacock Charm",
		waist="Potent Belt",
		left_ear="Coral Earring",
		right_ear="Coral Earring",
		left_ring="Bastokan Ring",
		right_ring="Woodsman Ring",
		back="Amemet Mantle",
    }
    
     
    sets.WS = {
		range="Platoon Disc",
		head="Aurore Beret",
		body="Scorpion Harness",
		hands="Aurore Gloves",
		legs="Aurore Brais",
		feet="Aurore Gaiters",
		neck="Peacock Charm",
		waist="Potent Belt",
		left_ear="Coral Earring",
		right_ear="Coral Earring",
		left_ring="Bastokan Ring",
		right_ring="Woodsman Ring",
		back="Amemet Mantle",	
	}
	
          
    sets.Idle = {
		range="Platoon Disc",
		head="Aurore Beret",
		body="Scorpion Harness",
		hands="Aurore Gloves",
		legs="Aurore Brais",
		feet="Aurore Gaiters",
		neck="Peacock Charm",
		waist="Potent Belt",
		left_ear="Coral Earring",
		right_ear="Coral Earring",
		left_ring="Bastokan Ring",
		right_ring="Woodsman Ring",
		back="Amemet Mantle",
    }
    
    
end

function precast(spell)
    if spell.cast_time then
        equip(sets.FC)
    end
end

function midcast(spell)
    if sets.JA[spell.english] then
        equip(sets.JA[spell.english])
    elseif sets.WS[spell.english] then
        equip(sets.WS[spell.english])
        if sets.WS[spell.english].Gavialis and sets.WS[spell.english].Gavialis[world.day] then
            equip(sets.WS.Gavialis)
        end
    end
end

function aftercast(spell)
    if player.status == 'Engaged' then
        equip(sets.TP)
    else
        equip(sets.Idle)
    end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        equip(sets.Idle)
    elseif new == 'Engaged' then
        equip(sets.TP)
    end
end
