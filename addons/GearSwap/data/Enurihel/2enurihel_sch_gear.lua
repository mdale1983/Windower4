--------------------------------------
    -- Start defining the sets Orison
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
		 main={ name="Grioavolr", augments={'"Fast Cast"+6','Mag. Acc.+6','"Mag.Atk.Bns."+10','Magic Damage +1',}},
		sub="Achaq Grip",
		ammo="Incantor Stone",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Inyanga Jubbah +1",
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','"Cure" potency +3%',}},
		legs="Aya. Cosciales +2",
		feet="Chelona Boots",
		neck="Orison Locket",
		waist="Channeler's Stone",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Kishar Ring",
		right_ring="Sirona's Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
		head="Umuthi Hat",
		legs="Doyen Pants",
	})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
		legs="Ebers Pant. +1",
	})

    sets.precast.FC.StatusRemoval = set_combine(sets.precast.FC['Healing Magic'], {
		main="Yagrush",
	})
	
	sets.precast.FC.Erase = set_combine(sets.precast.FC.StatusRemoval, {
	})
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Genbu's Shield",
		ammo="Incantor Stone",
		head={ name="Piety Cap", augments={'Enhances "Devotion" effect',}},
		body="Inyanga Jubbah +1",
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','"Cure" potency +3%',}},
		legs="Ebers Pant. +1",
		feet={ name="Vanya Clogs", augments={'"Cure" potency +3%','"Cure" spellcasting time -10%','"Conserve MP"+4',}},
		neck="Orison Locket",
		waist="Channeler's Stone",
		left_ear="Nourish. Earring",
		right_ear="Nourish. Earring +1",
		left_ring="Warp Ring",
		right_ring="Sirona's Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
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
		legs="Aya. Cosciales +2",
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
		legs="Aya. Cosciales +2",
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
		 main="Iridal Staff",
		sub="Achaq Grip",
		ammo="Leisure Musk +1",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ebers Bliaud +1",
		hands="Theophany Mitts",
		legs="Ebers Pant. +1",
		feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		neck="Cleric's Torque",
		waist="Korin Obi",
		left_ear="Nourish. Earring",
		right_ear="Nourish. Earring +1",
		left_ring="Tamas Ring",
		right_ring="Persis Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	}

    sets.midcast.Cure = {
		main="Iridal Staff",
		sub="Achaq Grip",
		ammo="Clarus Stone",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Theo. Briault +2",
		hands={ name="Telchine Gloves", augments={'"Cure" spellcasting time -1%','Enh. Mag. eff. dur. +10',}},
		legs="Ebers Pant. +1",
		feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		neck="Incanter's Torque",
		waist="Channeler's Stone",
		left_ear="Nourish. Earring",
		right_ear="Nourish. Earring +1",
		left_ring="Tamas Ring",
		right_ring="Persis Ring",
		back={ name="Mending Cape", augments={'Healing magic skill +8','Enha.mag. skill +10','Mag. Acc.+10','"Cure" potency +2%',}},
	}

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
	})

    sets.midcast.CureMelee = {
		--ammo="Incantor Stone"
	}

    sets.midcast.Cursna = {
		main="Yagrush",
		sub="Thuellaic Ecu +1",
		ammo="Hasty Pinion +1",
		head="Ebers Cap +1",
		body="Inyanga Jubbah +1",
		hands="Fanatic Gloves",
		legs="Th. Pant. +3",
		feet="Vanya Clogs",
		neck="Malison Medallion",
		waist="Channeler's Stone",
		left_ear="Beatific Earring",
		left_ring="Haoma's Ring",
		right_ring="Haoma's Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	}

    sets.midcast.StatusRemoval = {
		main="Yagrush",
		sub="Thuellaic Ecu +1",
		ammo="Leisure Musk +1",
		head="Ebers Cap +1",
		body="Inyanga Jubbah +1",
		hands="Theophany Mitts +2",
		legs="Ebers Pant. +1",
		feet={ name="Piety Duckbills", augments={'Enhances "Protectra V" effect',}},
		neck="Orison Locket",
		waist="Channeler's Stone",
		right_ear="Etiolation Earring",
		left_ear="Loquac. Earring",
		left_ring="Persis Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	}
	
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {
		 neck="Cleric's Torque",
		name="Gende. Gages +1",
	})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
    sets.midcast['Enhancing Magic'] = { -- Enh. Ma. Skill > Conserve MP
		main="Gada",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		legs="Piety Pantaloons",
		feet="Ebers Duckbills",
		neck="Incanter's Torque",
		waist="Austerity Belt",
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
		neck="noden's Gorget",
		waist="Siegel Sash",
		left_ear="Earthcry Earring",
		
	})
	
	sets.midcast.Haste = set_combine(sets.midcast.Duration,{-- Used to force duration onto Haste
		ammo="Hasty Pinion +1",
		neck="Orison Locket",
		waist="Channeler's Stone",
		right_ear="Loquac. Earring",
		left_ear="Etiolation Earring",
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
		head="Ebers Cap +1",
		body="Ebers Bliaud +1",
		hands="Ebers Mitts",
		legs="Piety Pantaloons",
		feet="Ebers Duckbills",
		neck="Incanter's Torque",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		waist="Cascade Belt",
		back={ name="Mending Cape", augments={'Healing magic skill +8','Enha.mag. skill +10','Mag. Acc.+10','"Cure" potency +2%',}},
	})

    sets.midcast.Regen = set_combine(sets.midcast.Duration,{
		main="Bolelabunga",
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
		left_ring="Kishar Ring",
		right_ring="Stikini Ring",
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
		left_ring="Kishar Ring",
		right_ring="Stikini Ring",
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
		waist="Austerity Belt",
		left_ear="Mendi. Earring",
		right_ear="Andoaa Earring",
		left_ring="Star Ring",
		right_ring="Star Ring",
		back="Vita Cape",
	} 
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
		 main="Bolelabunga",
		sub="Genmei Shield",
		ammo="Incantor Stone",
		head="Befouled Crown",
		body="Theo. Briault +2",
		hands="Inyan. Dastanas +2",
		legs="Assid. Pants +1",
		feet="Inyanga crackows +2",
		neck="Twilight Torque",
		waist="Fucho-no-Obi",
		left_ear="Hearty Earring",
		right_ear="Etiolation Earring",
		left_ring="Inyanga Ring",
		right_ring="Renaye Ring",
		back="Mecisto. Mantle"
	}

    sets.idle.PDT = {
	}

    sets.idle.Town = {
		 main="Bolelabunga",
		sub="Genmei Shield",
		ammo="Incantor Stone",
		head="Befouled Crown",
		body="Theo. Briault +2",
		hands="Inyan. Dastanas +2",
		legs="Assid. Pants +1",
		feet="Herald's gaiters",
		neck="Twilight Torque",
		waist="Fucho-no-Obi",
		left_ear="Hearty Earring",
		right_ear="Etiolation Earring",
		left_ring="Inyanga Ring",
		right_ring="Renaye Ring",
		back="Mecisto. Mantle"
	}
    
    sets.idle.Weak = set_combine(sets.idle,{
	})
    
    -- Defense sets

    sets.defense.PDT = {
		main="Mafic Cudgel",
		sub="Genmei Shield",
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +1",
		hands="Aya. Manopolas +1",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +1",
		neck="Twilight Torque",
	}

    sets.defense.MDT = {
		 head="Inyanga Tiara +1",
		body="Inyanga Jubbah +1",
		hands="Inyan. Dastanas +1",
		legs="Aya. Cosciales +1",
		feet="Inyan. Crackows +1",
		neck="Twilight Torque",
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