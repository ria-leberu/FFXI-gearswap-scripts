include('organizer-lib')

function get_sets()
	
	--Windower Start Up Settings
	windower.send_command('wait 2; input /lockstyleset 2;')
	
    sets.JA = {}	
    sets.TP = {}
    sets.WS = {}
	
    sets.Idle = {
	main="Tupsimati",
	range="",
    head="Scholar's M.board",
    body="Scholar's Gown",
    hands="Scholar's Bracers",
    legs="Scholar's Pants",
    feet="Scholar's Loafers",
    neck={ name="Enlightened Chain", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    waist={ name="Penitent's Rope", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    left_ear={ name="Phantom Earring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    right_ear={ name="Phantom Earring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    left_ring={ name="Diamond Ring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    right_ring={ name="Diamond Ring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
	back="Cheviot Cape",
	}
	
	sets.Precast = {
	main="Tupsimati",
	range="",
    head="Scholar's M.board",
    body="Scholar's Gown",
    hands="Scholar's Bracers",
    legs="Scholar's Pants",
    feet="Scholar's Loafers",
    neck={ name="Enlightened Chain", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    waist={ name="Penitent's Rope", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    left_ear={ name="Phantom Earring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    right_ear={ name="Phantom Earring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    left_ring={ name="Diamond Ring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    right_ring={ name="Diamond Ring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
	back="Cheviot Cape",
	}
	
	sets.midcast = {}
	
	sets.midcast.Elemental = {
	main="Tupsimati",
	range="",
    head="Scholar's M.board",
	body={ name="Teal Saio", augments={'Haste+2','INT+4','System: 1 ID: 131 Val: 5',}},
    hands={ name="Teal Cuffs", augments={'Haste+2','INT+4','System: 1 ID: 131 Val: 5',}},
    legs="Scholar's Pants",
    feet="Scholar's Loafers",
    neck={ name="Enlightened Chain", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    waist={ name="Penitent's Rope", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    left_ear={ name="Phantom Earring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    right_ear={ name="Phantom Earring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    left_ring={ name="Diamond Ring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    right_ring={ name="Diamond Ring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
	back="Cheviot Cape",
	}
	
	sets.midcast.Enfeebling = {
	main="Tupsimati",
	range="",
    head="Scholar's M.board",
    body="Scholar's Gown",
    hands="Scholar's Bracers",
    legs="Scholar's Pants",
    feet="Scholar's Loafers",
    neck={ name="Enlightened Chain", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    waist={ name="Penitent's Rope", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    left_ear={ name="Phantom Earring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    right_ear={ name="Phantom Earring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    left_ring={ name="Diamond Ring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
    right_ring={ name="Diamond Ring", augments={'Haste+2','System: 1 ID: 131 Val: 1','INT+4',}},
	back="Cheviot Cape",
	}
    
    
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
end

function precast(spell)
    equip(sets.precast)
end

function midcast(spell)
	if spell.skill == 'Elemental Magic' then
		equip(sets.midcast.Elemental)
		add_to_chat(158, '**Elemental Gear Equipped**')
	elseif spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast.Enfeebling)
		add_to_chat(158, '**Enfeebling Gear Equipped**')
	end
end

function aftercast(spell)   
        add_to_chat(158, '**Defense Gear Equipped**')
	-- Enfeebling Notification --
	if spell.english == 'Sleep' or spell.english == 'Sleepga' then
		send_command('@wait 30;input /echo ** '..spell.english..' 30 seconds **')
        send_command('@wait 50;input /echo ** '..spell.english..' 10 seconds **')
		send_command('@wait 57;input /echo ** '..spell.english..' 3 seconds **')
    elseif spell.english == 'Sleep II' then
		send_command('@wait 60;input /echo ** '..spell.english..' 30 seconds **')
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

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        equip(sets.Idle)
    elseif new == 'Engaged' then
        equip(sets.Idle)
    end
end
