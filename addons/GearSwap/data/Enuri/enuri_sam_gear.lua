include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = {
	    head="Rabid visor",
		body="Wakido domaru +2",
		hands="Kurys glvoes",
		legs=Valor.Legs.TP,
		feet="Danzo Sune-Ate",
		neck="Loricate Torque",
		waist="Flume Belt",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		ring1="Defending Ring",
		RING2="Vocane Ring",
		back="Solemnity cape",
		ammo="Staunch Tathlum"
	}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA.Meditate = set_combine(sets.precast.JA, {
			back="Smertrios's Mantle",
			hands="Saotome Kote",
			head="Myochin Kabuto"
		})
	sets.precast.JA['Warding Circle'] = set_combine(sets.precast.JA, {head="Wakido Kabuto +3"})
	sets.precast.JA['Sekkanoki'] = set_combine(sets.precast.JA, {})
	sets.precast.JA['Konzen-ittai'] = set_combine(sets.precast.JA, {})
	sets.precast.JA['Blade Bash'] = set_combine(sets.precast.JA, {hands="Sakonji Kote +2"})
	sets.precast.JA['Meikyo Shisui'] = set_combine(sets.precast.JA, {})
	sets.precast.JA['Hasso'] = set_combine(sets.precast.JA, {
		hands = "Wakido kote +2",
		legs = "Kasuga haidate +1"
	})
	sets.precast.JA['Sengikori'] = set_combine(sets.precast.JA, {})
---------------
-- Buff sets --
---------------
	sets.buff.Sekkanoki = {hands="Unkai Kote +2"}
    sets.buff.Sengikori = {feet="Unkai Sune-ate +2"}
    sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate"}
--------------------------
-- 	engaged gear-sets 	--
--------------------------
	sets.engaged = {
			ammo="Ginsen",
			head="Flam. Zucchetto +2",
			body=Valor.Body.TP,
			hands="Wakido kote +2",
			legs="Ryuo Hakama",
			feet="Flamma gambieras +2",
			neck="Moonbeam nodowa",
			waist="Ioskeha Belt",
			ear1="Cessance Earring",
			ear2="Telos Earring",
			Ring1="Flamma Ring",
			ring2="Chirich ring",
			back=Smert.TP
	}
	sets.engaged.Mid = {
	    ammo="Ginsen",
			head="Flam. Zucchetto +2",
			body=Valor.Body.TP,
			hands="Wakido kote +2",
			legs="Wakido haidate +2",
			feet="Flamma gambieras +2",
			neck="Moonbeam nodowa",
			waist="Ioskeha Belt",
			ear1="Cessance Earring",
			ear2="Telos Earring",
			Ring1="Flamma Ring",
			ring2="Chirich ring",
			back=Smert.TP
	}
	sets.engaged.HighAccuracy = {
	    head="Wakido Kabuto +3",
		body="Ken. Samue +1",
		hands="Wakido Kote +3",
		legs="Wakido Haidate +3",
		feet="Flam. Gambieras +2",
		neck="Souveran handschuhs +1",
		waist="Ioskeha Belt",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Takaha Mantle", augments={'STR+4','"Zanshin"+1','"Store TP"+2','Meditate eff. dur. +6',}},
	}
	sets.engaged.Reraise = set_combine(sets.engaged,{
		body="Twilight Mail",head="Twilight Helm"
	})
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
	sets.precast.WS = {
		ammo="Knobkierrie",
		head=Valor.Head.WS,
		body="Nzingha cuirass",
		hands=Valor.Hands.WS,
		legs="Wakido Haidate +2",
		feet=Valor.Feet.TP,
		neck="Fotia gorget",
		waist="Fotia belt",
		ear1="Ishvara earring",
		ear2="Brutal earring",
		ring1="Regal ring",
		ring2="Shukuyu ring",
		back=Smert.WS
	}
	sets.precast.WS.Mid = {
		ammo="Knobkierrie",
		head=Valor.Head.WS,
		body=Valor.Body.TP,
		hands=Valor.Hands.WS,
		legs="Wakido Haidate +2",
		feet=Valor.Feet.TP,
		neck="Fotia gorget",
		waist="Fotia belt",
		ear1="Ishvara earring",
		ear2="Brutal earring",
		ring1="Regal ring",
		ring2="Shukuyu ring",
		back=Smert.WS
	}
	sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, { 
	-- Magic Accuracy
		head="Flam. Zucchetto +2",
		body="Flamma Korazin +1",
		hands="Flam. Manopolas +2",
		legs="Flamma Dirs +1",
		feet="Flam. Gambieras +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
	})
	sets.precast.WS['Tachi: Jinpu'] = set_combine (sets.precast.WS['Tachi: Ageha'], {
		ammo="Knobkierrie",
		head=Valor.Head.WS,
		body="Found. Breastplate",
		hands=Valor.Hands.TP,
		legs="Hizamaru hizayoroi",
		feet="Loyalist sabatons",
		neck="Fotia gorget",
		waist="Fotia belt",
		ear1="Ishvara earring",
		ear2="Brutal earring",
		ring1="Regal ring",
		ring2="Shukuyu ring",
		back=Smert.WS		
	})
	sets.precast.WS['Tachi: Fudo'] = sets.precast.WS
	sets.precast.WS.Mid['Tachi: Fudo'] = sets.precast.WS.Mid
	sets.precast.WS['Tachi: Shoha'] = sets.precast.WS
	sets.precast.WS.Mid['Tachi: Shoha'] = sets.precast.WS.Mid
	
----------------------
-- 	Misc Gear-sets 	--
----------------------
	sets.DT = set_combine(sets.idle, {
		--head="Sulevia's mask +1",
		--body="Sulevia's Plate. +2",
		ammo="Sihirik",
		hands="Sulevia's gauntlets +2",
		legs="Sulevia's cuisses +1",
        feet="Sulevia's leggings +2",
		neck="Twilight torque",
		ear1="Static Earring",
        ear2="Hearty earring",
        ring1="Defending ring",
        ring2="Vocane ring",
        back="Mubvum. mantle",
		waist="Asklepian belt"
	})
	sets.PhysicalDefense = {}
	sets.PhysicalDefense.DT = sets.DT
	sets.Asleep = set_combine(sets.DT, {
		head="Frenzy sallet"
	})
	sets.Reraise = set_combine(sets.DT, {
		head="Twilight helm",
		body="Twilight mail"
	})
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
	sets.Reive = {
		neck="Ygna's resolve +1"
	}