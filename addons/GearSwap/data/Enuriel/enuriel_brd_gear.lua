include('augments.lua')
info.ExtraSongInstrument = 'Terpander'
info.ExtraSongs = 3
----------------------
--  Field/Town Idle --
----------------------
	sets.idle={
		main="Sangoma",
		sub="Genmei Shield",
		head="Aya. Zucchetto",
		body="Ayanmo corazza +1",
		hands="Aya. Manopolas +1",
		neck="Dampener's Torque",
		ear1="Hearty Earring",
		ear2="Halasz Earring",
		ring1="Vocane Ring",
		ring2="Gelatinous ring",
		back="Solemnity Cape",
		waist="Flume Belt",
		legs="Aya. cosciales +1",
		feet="Fili Cothurnes +1"
	}
	sets.idle.PDT = {
		main="Mafic Cudgel",
		sub="Genmei Shield",
		head="Aya. zucchetto",
		neck="Dampener's torque",
		ear1="Infused Earring",
		ear2="Genmei Earring",
		body="Ayanmo corazza",
		hands="Gende. Gages +1",
		ring1="Ayanmo Ring",
		ring2="Vocane ring",
		back="Solemnity Cape",
		waist="Flume Belt +1",
		legs="Ayanmo cosciales",
		feet="Ayanmo gambieras +1"
	}
	sets.idle.MagicEva = { 
		head="Inyanga tiara +1",
		neck="Dampener's torque",
		ear1="Infused Earring",
		ear2="Genmei Earring",
		body="Inyanga jubbah",
		hands="Inyanga dastanas +1",
		ring1="Ayanmo Ring",
		ring2="Vocane ring",
		back="Solemnity Cape",
		waist="Flume Belt",
		legs="Inyanga Shalwar +2",
		feet="Inyanga Crackows +1"
	}
	sets.idle.PDT = {
		head="Ayanmo Zucchetto",
		body="Ayanmo Corazza",
		hands="Ayanmo Manopolas +1",
		legs="Ayanmo Cosciales",
		feet="Ayanmo Gambieras +1",
		ring1="Ayanmo ring",
		ring2="Vocane ring",
		ear1="Flashward earring",
		ear2="Etiolation earring",
		neck="Loricate Torque +1",
		back="Solemnity cape"
	}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
    sets.precast.JA.Troubadour = {body="Bihu Justaucorps"}
    sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions"}
----------------------------------
-- 	Pre-cast Magic Gear-sets 	--	
----------------------------------
	sets.precast.FC={	
		head="Vanya Hood",
		neck="Voltsurge Torque",
		ear1="Loquacious earring",
		ear2="Enchntr. Earring +1",
		body="Shango Robe",
		hands="Gende. Gages +1",
		ring1="Kishar Ring",
		ring2="Weather. Ring",
		back="Intarabus's Cape",
		waist="Witful Belt",
	}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		back="Pahtli Cape",
		legs="Doyen Pants"
	})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {
		head="Umuthi Hat",
		legs="Doyen Pants"
	})

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist="Witful Belt"
	})

    sets.precast.FC.BardSong = {
    	main="Kali",
		sub="Ammurapi Shield",
		--range="Gjallarhorn",
		range="Linos",
		body="Inyanga jubbah",
        head="Fili Calot +1",
		neck="Aoidos' Matinee",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Gendewitha Gages +1",
		ring1="Kishar Ring",
		ring2="Prolix Ring",
        back="Intarabus's Cape",
		waist="Dynamic Belt",
		legs="Doyen Pants",
		feet="Telchine pigaches",
	}
    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {
		range=info.ExtraSongInstrument
	})
-------------------------
-- Dummy Songs Section --
-------------------------
----------------------------------
-- 	Mid-cast Magic Gear-Sets 	--
----------------------------------
	 sets.midcast.FastRecast = {    
		head="Vanya Hood",
		neck="Voltsurge Torque",
		ear1="Loquacious earring",
		ear2="Enchntr. Earring +1",
		body="Shango Robe",
		hands="Gende. Gages +1",
		ring1="Kishar Ring",
		ring2="Weather. Ring",
		back="Intarabus's Cape",
		waist="Witful Belt",
	}
    -- Gear to enhance certain classes of songs. 
    sets.midcast.Ballad = {
		legs="Fili Rhingrave +1"
	}
    sets.midcast.Lullaby = {
		hands="Brioso Cuffs +3"
	}
    sets.midcast.Madrigal = {
		head="Fili Calot +1",
		back="Intarabus's Cape",
	}
	sets.midcast.Prelude = {
		back="Intarabus's Cape",
	}
    sets.midcast.March = {
		hands="Fili Manchettes +1"
	}
	sets.midcast.HonorMarch = {
		hands="Fili Manchettes +1",
		range="Marsyas"
	}
    sets.midcast.Minuet = {
		body="Fili Hongreline +1"
	}
    sets.midcast.Minne = {range="Terpander"}
    sets.midcast.Paeon = {
		head="Brioso Roundlet +3"
	}
    sets.midcast.Carol = {
		hands="Mousai Gages"
	}
    sets.midcast["Sentinel's Scherzo"] = {
		feet="Fili Cothurnes"
	}
    sets.midcast['Magic Finale'] = {
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		legs="Fili Rhingrave +1"
	}
    sets.midcast.Mazurka = {}
    -- For song buffs (duration and AF3 set bonus)
    sets.midcast.SongEffect = {
		main="Kali", 
		Sub="Ammurapi Shield",
		--range="Gjallarhorn",
		range="Linos",
        head="Fili Calot +1",
		body="Fili Hongreline +1",
		neck="Moonbow Whistle",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Fili Manchettes +1",
		ring1="Weather. Ring",
		ring2="Stikini Ring",
        back="Intarabus's Cape",
		waist="Dynamic Belt",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
	}
	sets.midcast.March = { 
	   main="Kali", 
		Sub="Ammurapi Shield",
		--range="Gjallarhorn",
		range="Linos",
        head="Fili Calot +1",
		body="Fili Hongreline +1",
		neck="Moonbow Whistle",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Fili Manchettes +1",
		ring1="Weather. Ring",
		ring2="Stikini Ring",
        back="Intarabus's Cape",
		waist="Dynamic Belt",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
	}
	sets.midcast.Minuet = {
		main="Kali", 
		Sub="Ammurapi Shield",
		--range="Gjallarhorn",
		range="Linos",
        head="Fili Calot +1",
		body="Fili Hongreline +1",
		neck="Moonbow Whistle",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Fili Manchettes +1",
		ring1="Weather. Ring",
		ring2="Stikini Ring",
        back="Intarabus's Cape",
		waist="Dynamic Belt",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
	}
	sets.midcast.Madrigal = { 
		main="Kali", 
		Sub="Ammurapi Shield",
		--range="Gjallarhorn",
		range="Linos",
        head="Fili Calot +1",
		body="Fili Hongreline +1",
		neck="Moonbow Whistle",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Fili Manchettes +1",
		ring1="Weather. Ring",
		ring2="Stikini Ring",
        back="Intarabus's Cape",
		waist="Dynamic Belt",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
	}
    -- For song defbuffs (duration primary, accuracy secondary)
    sets.midcast.SongDebuff = {
	    main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		Sub="Ammurapi Shield",
		--range="Gjallarhorn",
		range="Linos",
        head="Inyanga tiara +1",
		neck="Moonbow Whistle",
		ear1="Regal Earring",
		ear2="Enchntr. Earring +1",
        body="Inyanga jubbah",
		hands="Inyanga dastanas +1",
		ring1="Stikini Ring",
		ring2="Weather. Ring",
        back="Intarabus's Cape",
		waist="Luminary Sash",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +2"
	}

    -- For song defbuffs (accuracy primary, duration secondary)
    sets.midcast.ResistantSongDebuff = {
	    main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		sub="Ammurapi Shield",
		range="Linos",
        head="Inyanga tiara +1",
		neck="Moonbow Whistle",
		ear1="Regal Earring",
		ear2="Enchntr. Earring +1",
        body="Inyanga jubbah",
		hands="Inyanga dastanas +1",
		ring1="Stikini Ring",
		ring2="Weather. Ring",
        back="Intarabus's Cape",
		waist="Luminary Sash",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +2"
	}
	
		
	sets.midcast.LullabyFull = set_combine(sets.midcast.SongDebuff, sets.midcast.Lullaby)
	sets.midcast.LullabyFull.ResistantSongDebuff = set_combine(sets.midcast.ResistantSongDebuff, sets.midcast.Lullaby)

    -- Song-specific recast reduction
    sets.midcast.SongRecast = {
		ear2="Loquacious Earring",
		ring1="Kishar Ring",
		legs="Fili Rhingrave +1"
	} 

    sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

    -- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Terpander = {range=info.ExtraSongInstrument}

    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = {
        sub="Kali",
		range=info.ExtraSongInstrument,
        head="Fili Calot +1",
		neck="Aoidos' Matinee",
		ear1="Aoidos' Earring",
		ear2="Loquac. Earring",
        hands="Gendewitha Gages +1",
		ring1="Kishar Ring",
		ring2="Weather. Ring",
        back="Intarabus's Cape",
		waist="Witful Belt",
		legs="Doyen Pants",
		feet="Bihu Slippers",
	}

    -- Other general spells and classes.
    sets.midcast.Cure = {
        head="Vanya Hood",
		neck="Loricate Torque +1",
		ear1="Loquacious earring",
		ear2="Enchntr. Earring +1",
		body="Chironic Doublet",
		hands="Telchine Gloves",
		ring1="Dark Ring",
		ring2="Defending ring",
		back="Intarabus's Cape",
		waist="Fucho-no-obi",
		legs="Gyve Trousers",
		feet="Vanya Clogs"
	}        
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.Cursna = sets.midcast.Cure
	sets.midcast['Enhancing Magic'] = {
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum",
		head={ name="Telchine Cap", augments={'Mag. Evasion+21','Enemy crit. hit rate -3','Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Mag. Evasion+24','Enemy crit. hit rate -4','Enh. Mag. eff. dur. +8',}},
		hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Subtle Blow"+6','Enh. Mag. eff. dur. +9',}},
		legs={ name="Telchine Braconi", augments={'Mag. Evasion+24','Enemy crit. hit rate -4','Enh. Mag. eff. dur. +9',}},
		feet={ name="Telchine Pigaches", augments={'Mag. Evasion+25','"Subtle Blow"+6','Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		waist="Rumination Sash",
		ear1="Loquacious Earring",
		ear2="Enchntr. Earring +1",
		ring1="Stikini Ring",
		ring2="Evanescence Ring",
		back="Perimede Cape",
	}
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
    
	sets.midcast.RefreshRecieved = set_combine(sets.midcast['Enhancing Magic'], {back="Grapevine Cape",waist="Gishdubar Sash"})
--------------------------
-- 	engaged gear=sets 	--
--------------------------
	sets.engaged = {
		head="Aya. Zucchetto",
		body="Ayanmo corazza +1",
		hands="Chironic gloves",
		legs="Chironic Hose",
		feet="Ayanmo gambieras +1",
		neck="Clotharius torque",
		waist="Dynamic Belt",
		ear1="Mache Earring",
		ear2="Brutal Earring",
		ring1="Ayanmo Ring",
		ring2="Enlivened Ring",
		back="Solemnity cape",
	}	
	sets.engaged.DW = {
		head="Aya. Zucchetto",
		body="Ayanmo corazza +1",
		hands="Chironic gloves",
		legs="Chironic Hose",
		feet="Ayanmo gambieras +1",
		neck="Clotharius torque",
		waist="Dynamic Belt",
		ear1="Mache Earring",
		ear2="Brutal Earring",
		ring1="Ayanmo Ring",
		ring2="Enlivened Ring",
		back="Kayapa cape",
	}
	sets.meva = {
		main="Terra's Staff",
		sub="Irenic Strap +1",
		ammo="Staunch Tathlum",
		head={ name="Telchine Cap", augments={'Mag. Evasion+21','Enemy crit. hit rate -3','Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Mag. Evasion+24','Enemy crit. hit rate -4','Enh. Mag. eff. dur. +8',}},
		hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Subtle Blow"+6','Enh. Mag. eff. dur. +9',}},
		legs={ name="Telchine Braconi", augments={'Mag. Evasion+24','Enemy crit. hit rate -4','Enh. Mag. eff. dur. +9',}},
		feet={ name="Telchine Pigaches", augments={'Mag. Evasion+25','"Subtle Blow"+6','Enh. Mag. eff. dur. +10',}},
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		ear1="Eabani Earring",
		ear2="Flashward Earring",
		ring1="Purity Ring",
		ring2="Vengeful Ring",
		back="Solemnity Cape"
	}
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
	sets.precast.WS = {
		head="Aya. Zucchetto",
		body="Ayanmo corazza +1",
		hands="Chironic gloves",
		legs="Chironic hose",
		feet=Telc.Feet.WS ,
		neck="Caro Necklace",
		waist="Grunfeld Rope",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring", 
		ring1="Ilabrat Ring",
		ring2="Shukuyu Ring",
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	}

		
    
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {neck="Fotia Gorget", waist="Fotia Belt"})
    sets.precast.WS['Rudras Storm'] = set_combine(sets.precast.WS)
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {neck="Fotia Gorget", waist="Fotia Belt"})
    sets.precast.WS['Mordant Rime'] = set_combine(sets.precast.WS)
----------------------
-- 	Misc Gear-sets 	--
----------------------
	sets.Reive = {
		neck="Ygna's resolve +1"
	}
	sets.buff.Doom = {
		
	}
	sets.Asleep = set_combine(sets.engaged.PDT, {
		head="Frenzy Sallet"
	})
	sets.defense.DT = sets.engaged.PDT
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}