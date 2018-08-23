 --------------------------------------
    -- Start defining the sets Orison
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
		ammo="Incantor Stone",
		head="Welkin Crown",
		body="Inyanga Jubbah +1",
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','"Cure" potency +3%',}},
		legs="Aya. Cosciales +1",
		feet="Chelona Boots",
		neck="Incanter's Torque",
		waist="Pythia Sash",
		left_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Sirona's Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
		head="Umuthi Hat",
		legs="Doyen Pants",
	})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
		legs="Ebers Pant.",
	})

    sets.precast.FC.StatusRemoval = set_combine(sets.precast.FC['Healing Magic'], {
		main="Yagrush",
	})
	
	sets.precast.FC.Erase = set_combine(sets.precast.FC.StatusRemoval, {
	})
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Genbu's Shield",
		head="Piety Cap",
		legs="Doyen Pants",
		feet="Hygieia Clogs",
		left_ear="Mendi. Earring",
		right_ear="Nourish. Earring +1",
	})
	
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
	}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    gear.default.weaponskill_neck = "Fotia Gorget"
    gear.default.weaponskill_waist = "Fotia Belt"
    sets.precast.WS = {
		ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +1",
		hands="Aya. Manopolas +1",
		legs="Aya. Cosciales +1",
		feet="Aya. Gambieras +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		right_ear="Telos Earring",
		left_ring="Begrudging Ring",
		right_ring="Rufescent Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	}
    
    sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS, {
	})
	
	sets.precast.WS['Mystic Boon'] = set_combine(sets.precast.WS, { -- MND > WSD > STR
		ammo="Hydrocera",
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +1",
		hands="Aya. Manopolas +1",
		legs="Aya. Cosciales +1",
		feet="Aya. Gambieras +1",
		neck="Nuna Gorget",
		waist="Luminary Sash", 
		left_ear="Regal Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		left_ring="Rufescent Ring",
		right_ring="Ayanmo Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%',}},
    })
    

    -- Midcast Sets
    
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {
	})
    
    -- Cure sets
    gear.default.obi_waist = "Goading Belt"
    gear.default.obi_back = "Mending Cape"

    sets.midcast.CureSolace = {
		 main="Chatoyant Staff",
		sub="Achaq Grip",
		head="Ebers Cap",
		body="Ebers Bliaud",
		hands="Telchine Gloves",
		legs="Ebers Pantaloons",
		feet="Piety Duckbills",
		neck="Incanter's Torque",
		waist="Korin Obi",
		left_ear="Loquac. Earring",
		right_ear="Nourish. Earring +1",
		left_ring="Tamas Ring",
		right_ring="Sirona's Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	}

    sets.midcast.Cure = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Genbu's Shield",
		ammo="Hasty Pinion +1",
		head={ name="Kaykaus Mitra", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
		body="Theo. Briault +2",
		hands="Theophany Mitts +2",
		legs="Ebers Pant.",
		feet="Piety Duckbills",
		neck="Incanter's Torque",
		waist="Goading Belt",
		left_ear="Mendi. Earring",
		right_ear="Nourish. Earring +1",
		left_ring="Haoma's Ring",
		right_ring="Lebeche Ring",
		back="Solemnity Cape",
	}

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
	})

    sets.midcast.CureMelee = {
		--ammo="Incantor Stone"
	}

    sets.midcast.Cursna = {
		main="Yagrush",
		head={ name="Kaykaus Mitra", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
		body="Ebers Bliaud",
		hands="Fanatic Gloves",
		legs="Th. Pant. +3",
		feet="Gende. Galosh. +1",
		neck="Malison Medallion",
		left_ear="Beatific Earring",
		left_ring="Haoma's Ring",
		right_ring="Haoma's Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	}

    sets.midcast.StatusRemoval = {
		main="Yagrush",
		head="Ebers Cap",
		body="Zendik Robe",
		hands="Theophany Mitts +2",
		legs="Ebers Pant.",
		feet={ name="Piety Duckbills +1", augments={'Enhances "Protectra V" effect',}},
		neck="Incanter's Torque",
		waist="Channeler's Stone",
		left_ring="Kuchekula Ring",
		right_ring="Lebeche Ring",
		 back={ name="Mending Cape", augments={'Healing magic skill +8','Enha.mag. skill +10','Mag. Acc.+10','"Cure" potency +2%',}},
	}
	
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {
	})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
    sets.midcast['Enhancing Magic'] = { -- Enh. Ma. Skill > Conserve MP
		main="Gada",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Umuthi Hat",
		body="Telchine Chas.",
		hands="Inyan. Dastanas +1",
		legs="Piety Pantaloons",
		feet="Ebers Duckbills",
		neck="Incanter's Torque",
		waist="Austerity Belt +1",
		left_ear="Mendi. Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		 back={ name="Mending Cape", augments={'Healing magic skill +8','Enha.mag. skill +10','Mag. Acc.+10','"Cure" potency +2%',}},
	}
	
    sets.midcast.Duration = set_combine(sets.midcast['Enhancing Magic'],{ -- Enh. Ma. Dur. (exclusivly for set_combine, nothing will directly call this set)
		main="Gada",
		sub="Ammurapi Shield",
		head="Telchine Cap",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Telchine Pigaches",
	})

    sets.midcast.Stoneskin = set_combine(sets.midcast.Duration,{
		waist="Siegel Sash",
		left_ear="Earthcry Earring",
	})
	
	sets.midcast.Haste = set_combine(sets.midcast.Duration,{-- Used to force duration onto Haste
		ammo="Hasty Pinion +1",
		neck="Voltsurge Torque",
		waist="Goading Belt",
		right_ear="Loquac. Earring",
		left_ring="Rahab Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	})

    sets.midcast.Auspice = set_combine(sets.midcast.Duration,{
		feet="Ebers Duckbills"
	})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast.Duration, {
	})
	
	sets.midcast.Refresh = set_combine(sets.midcast.Duration, {
	})
	
	sets.midcast.Phalanx = set_combine(sets.midcast.Duration, { -- Enhancing Skill = -36 damage @ 3 minutes. Enh. Dur. = -33 damage @ 5 minutes
	})
	
	sets.midcast.Storm = set_combine(sets.midcast.Duration, {
	})

    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'],{
		main="Beneficus",
		head="Ebers Cap",
		body="Ebers Bliaud",
		hands="Ebers Mitts",
		legs="Piety Pantaloons",
		feet="Ebers Duckbills",
		neck="Incanter's Torque",
		waist="Cascade Belt",
		back={ name="Mending Cape", augments={'Healing magic skill +8','Enha.mag. skill +10','Mag. Acc.+10','"Cure" potency +2%',}},
	})

    sets.midcast.Regen = set_combine(sets.midcast.Duration,{
		main="Gada",
		head="Inyanga Tiara +1",
		body={ name="Piety Briault", augments={'Enhances "Benediction" effect',}},
		hands="Ebers Mitts",
		--legs="Th. Pant. +3",
	})

    sets.midcast.Protectra = set_combine(sets.midcast.Duration,{
		ring1="Sheltered Ring",
		feet="Piety Duckbills"
	})
	sets.midcast.Protect = sets.midcast.Protectra

    sets.midcast.Shellra = set_combine(sets.midcast.Duration,{
		ring1="Sheltered Ring",
		legs="Piety Pantaloons"
	})
	sets.midcast.Shell = sets.midcast.Shellra


    sets.midcast['Divine Magic'] = {
		main="Yagrush",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Inyanga Tiara +1",
		body="Theo. Briault +2",
		hands="Inyan. Dastanas +1",
		legs="Th. Pant. +3",
		feet="Theo. Duckbills +2",
		neck="Incanter's Torque",
		waist="Refoccilation Stone",
		right_ear="Beatific Earring",
		left_ear="Regal Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	}

    sets.midcast['Dark Magic'] = {
		main="Rubicundity",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Inyanga Tiara +1",
		body="Zendik Robe",
		hands="Inyan. Dastanas +1",
		legs="Inyanga Shalwar +1",
		feet="Inyan. Crackows +1",
		neck="Erra Pendant",
		waist="Refoccilation Stone",
		right_ear="Digni. Earring",
		left_ear="Regal Earring",
		left_ring="Evanescence Ring",
		right_ring="Stikini Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	}

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
		main="Gada",
		sub="Ammurapi Shield",
		ammo="Hydrocera",
		head="Inyanga Tiara +1",
		body="Theo. Briault +2",
		hands="Inyan. Dastanas +1",
		legs="Th. Pant. +3",
		feet="Theo. Duckbills +2",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		right_ear="Digni. Earring",
		left_ear="Regal Earring",
		left_ring="Stikini Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	}

    sets.midcast.IntEnfeebles = {
		main="Gada",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Inyanga Tiara +1",
		body="Theo. Briault +2",
		hands="Inyan. Dastanas +1",
		legs="Th. Pant. +3",
		feet="Theo. Duckbills +2",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		right_ear="Digni. Earring",
		left_ear="Regal Earring",
		left_ring="Stikini Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
		main="Boonwell Staff",
		sub="Enki Strap",
		ammo="Clarus Stone",
		head="Orvail Corona +1",
		body="Chelona Blazer",
		hands="Nares Cuffs",
		legs="Nisse Slacks",
		feet="Chelona Boots",
		neck="Eidolon Pendant",
		waist="Austerity Belt +1",
		left_ear="Mendi. Earring",
		right_ear="Andoaa Earring",
		left_ring="Star Ring",
		right_ring="Star Ring",
		back="Felicitas Cape",
	} 
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
		main="Bolelabunga",
		sub="Genbu's Shield",
		ammo="Homiliary",
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +1",
		hands="Aya. Manopolas +1",
		legs="Aya. Cosciales +1",
		feet="Aya. Gambieras +1",
		neck="Twilight torque",
		waist="Channeler's Stone",
		left_ear="Hearty Earring",
		right_ear="Colossus's Earring",
		left_ring="Inyanga Ring",
		right_ring="Defending Ring",
		back="Mecisto. Mantle"
	}

    sets.idle.PDT = {
	}

    sets.idle.Town = {
		main="Bolelabunga",
		sub="Genbu's Shield",
		ammo="Homiliary",
		head="Inyanga Tiara +1",
		body="Theo. Briault +2",
		hands="Inyan. Dastanas +1",
		legs="Inyanga Shalwar +1",
		feet="Inyan. Crackows +1",
		neck="Twilight torque",
		waist="Channeler's Stone",
		left_ear="Hearty Earring",
		right_ear="Colossus's Earring",
		left_ring="Inyanga Ring",
		right_ring="Defending Ring",
		back="Solemnity Cape",
	}
    
    sets.idle.Weak = set_combine(sets.idle,{
	})
    
    -- Defense sets

    sets.defense.PDT = {
	}

    sets.defense.MDT = {
	}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
		ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +1",
		hands="Aya. Manopolas +1",
		legs="Aya. Cosciales +1",
		feet="Aya. Gambieras +1",
		neck="Clotharius Torque",
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Hetairoi Ring",
		back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1",back="Mending Cape"}