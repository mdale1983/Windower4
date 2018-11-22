include('augments.lua')
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
		ammo="Sihirik",
        head="Sulevia's mask +1",
        body="Sulevia's Plate. +2",
		hands="Sulevia's gauntlets +2",
		legs="Carmine cuisses +1",
        feet="Sulevia's leggings +2",
		neck="Loricate torque +1",
        ear1="Telos earring",
		ear2="Cessance earring",
        ring1="Warp ring",
        ring2="Gelatinous ring +1",
        back="Solemnity cape",
		waist="Flume belt"
	}
----------------------------------
--		Job Ability sets		--
----------------------------------
	sets.precast.JA['Diabolic Eye'] = {
		hands="Fallen's Finger Gauntlets"
	}
    sets.precast.JA['Nether Void']  = {
		legs="Bale Flanchard +2"
	}
    sets.precast.JA['Dark Seal']    = {
		head="Fallen's burgeonet"
	}
    sets.precast.JA['Souleater']    = {
		head="Ignominy burgeonet +2"
	}
    sets.precast.JA['Blood Weapon'] = {
		body="Fallen's Cuirass +1"
	}
    sets.precast.JA['Last Resort']  = {
		back="Ankou's mantle"
	}
	sets.precast.JA['Weapon Bash'] = {
		hands="Ignominy gauntlets"
	}
--------------------------------------
--		Casting Gear sets			--
--------------------------------------
	sets.precast.FC = {
--[[ Fast Cast 33%	]]
		ammo="Impatiens",			
		head="Carmine Mask +1",
		body=Odyssean.Body.FC,
		hands=Leyline.FC,
		legs="Enif cosciales",
		feet=Odyssean.Feet.FC,
		ring2="Kishar ring", 
		neck="Voltsurge torque",
		ear1="Etiolation earring",
		ear2="Loquacious earring",
		waist="Chuq'aba belt",
	}
	sets.midcast.FastRecast = {
        ammo="Impatiens",
        head="Carmine mask",
        body=Odyssean.Body.FC,
		hands=Odyssean.Hands.FC,
		ear2="Loquacious earring",
        legs="Enif Cosciales",
        feet="Carmine Greaves"
    }
	sets.midcast['Dark Magic'] = set_combine(sets.precast.FC, {
		ammo="Hydrocera",
		--[[head="Ignominy burgeonet +2",]]
		neck="Erra Pendant",
		body="Lugra cloak",
		hands="Fallen's finger gauntlets",
		legs="Eschite cuisses",
		feet=Odyssean.Feet.FC,
		ring1="Etana ring",
		ring2="Evanescence ring",
		ear1="Hermetic earring",
		ear2="Gwati earring",
		waist="Casso sash",
		back=Niht.DarkMagic
	})
	sets.midcast['Dread Spikes'] = set_combine(sets.precast.FC, {
		ammo="Aqreqaq bomblet",
		head="Ignominy burgeonet +2",
		body="Bale cuirass +2",
		hands="Odyssean gauntlets",
		legs="Valorous hose",
		feet="Dornen schuhs",
		neck="Sanctity necklace",
		ear1="Thureous earring",
		ear2="Bloodbead earring",
		ring1="Meridian ring",
		ring2="Etana ring",
		back="Repulse mantle",		
	})
	sets["DRK_SPIKES"] = {
		main="Apocalypse",
		sub="Utu Grip",
		ammo="Egoist's Tathlum",
		head="Ratri Sallet +1",
		neck="Dualism Collar +1",
		ear1="Odnowa Earring",
		ear2="Odnowa Earring +1",
		body="Heath. Cuirass +1",
		hands="Rat. Gadlings +1",
		ring1="Moonlight Ring",
		ring2="Moonlight Ring",
		back="Moonlight Cape",
		waist="Gold Mog. Belt",
		legs="Ratri Cuisses +1",
		feet="Rat. Sollerets +1"
	}
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], { 
		body="Valorous Mail",
		hands="Fallen's finger gauntlets",
		back="Ankou's mantle"
	})
	sets["DRK_ABS"] = {
		main="Apocalypse",
		sub="Utu Grip",
		ammo="Pemphredo Tathlum",
		head="Ig. Burgonet +3",
		neck="Erra Pendant",
		ear1="Dark Earring",
		ear2="Hermetic Earring",
		body="Carm. Sc. Mail +1",
		hands="Pavor Gauntlets",
		ring1="Kishar Ring",
		ring2="Evanescence Ring",
		back="Chuparrosa Mantle",
		waist="Casso Sash",
		legs="Eschite Cuisses",
		feet="Rat. Sollerets +1"
	}
	sets.midcast.Absorb.Resistant = set_combine(sets.midcast.Absorb, { 
		head="Carmine Mask"
	})
	sets.midcast['Absorb-TP'] = set_combine(sets.midcast.Absorb,{
		hands="Bale gauntlets +2",
	})
	sets.midcast['Stun'] = set_combine(sets.midcast['Dark Magic'], {
	
	})
	sets.midcast.Endark = {
        head="Ignominy Burgonet +2",
        neck="Erra Pendant",
        ear2="Dark Earring",
        ear1="Loquacious Earring",
        body="Carmine Scale Mail",
        hands="Fallen's finger gauntlets",
        ring1="Stikini Ring",
        ring2="Evanescence Ring",
        waist="Casso sash",
        legs="Eschite cuisses",
        feet=Odyssean.Feet.FC,
        back="Niht Mantle",
	}
	sets["DRK_ENDARK"] = {
		main="Caladbolg",
		sub="Utu Grip",
		ammo="Pemphredo Tathlum",
		head="Ig. Burgonet +3",
		neck="Erra Pendant",
		ear1="Dark Earring",
		ear2="Abyssal Earring",
		body="Carm. Sc. Mail +1",
		hands="Fall. Fin. Gaunt. +3",
		ring1="Stikini Ring +1",
		ring2="Evanescence Ring",
		back="Niht Mantle",
		waist="Casso Sash",
		legs="Eschite Cuisses",
		feet="Rat. Sollerets +1"
	}
	--sets.midcast['Endark II'] = set_combine(sets.midcast.Endark, {})
	sets.midcast.Drain = set_combine(sets.midcast.Absorb, {
		ammo="Pemphredo Tathlum",
		head="Ignominy Burgonet +2",
		neck="Erra pendant",
		body="Found. Breastplate",
		hands="Fallen's finger gauntlets",
		legs="Eschite cuisses",
		feet="Ratri sollerets",
		ear1="Hermetic earring",
		ear2="Hirudinea earring",
		ring1="Kishar ring",
		ring2="Evanescence ring",
		waist="Eschan stone",
		back=Niht.DarkMagic
	})
	sets["DRK_DRAIN"] = {
		main="Misanthropy",
		sub="Utu Grip",
		ammo="Pemphredo Tathlum",
		head="Fall. Burgeonet +3",
		neck="Erra Pendant",
		ear1="Hermetic Earring",
		ear2="Hirudinea Earring",
		body="Carm. Sc. Mail +1",
		hands="Fall. Fin. Gaunt. +3",
		ring1="Archon Ring",
		ring2="Evanescence Ring",
		back="Niht Mantle",
		waist="Austerity Belt +1",
		legs="Eschite Cuisses",
		feet="Rat. Sollerets +1"
	}
	sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast['Elemental Magic'] = {}
	sets.midcast['Enfeebling Magic'] = {}
------------------------------
--		Enmity Section		--
------------------------------
	sets.Enmity = {
		ammo="Paeapua",
        head="Despair Helm",
		neck="Invidia Torque",
        body="Odyssean chestplate",
		ring1="Odium Ring",
		ring2="Petrov ring",
		ear2="Friomisi earring",
		waist="Goading Belt",
		legs="Odyssean cuirass",
		feet="Dornen schuhs"
	}
	sets.midcast.Stun.Enmity = set_combine(sets.Enmity, {})
	sets.midcast.Absorb.Enmity = set_combine(sets.Enmity, {})
    sets.midcast['Absorb-TP'].Enmity = set_combine(sets.Enmity, {})
    sets.midcast['Elemental Magic'].Enmity = set_combine(sets.Enmity, {})
    sets.midcast['Enfeebling Magic'].Enmity = set_combine(sets.Enmity, {})
--------------------------------------
--		Scythe Engaged sets			--
--------------------------------------	
--[[ Non-REMA Scythe Set]]
	sets.engaged = {
        ammo="Ginsen",
		head=Valor.Head.TP,
        body=Valor.Body.TP,
		hands="Flamma Manopolas +2",
		legs=Odyssean.Legs.TP,
        feet=Valor.Feet.TP,
		neck="Lissome necklace",
        ear1="Telos earring",
		ear2="Cessance earring",
        ring1="Flamma ring",
        ring2="Chirich Ring",
        back=Ankou.TP,
        waist="Ioskeha belt",
    }
	sets.engaged.Mid = set_combine(sets.engaged, {
        legs=Odyssean.Legs.TP,
		ear1="Zennaroi Earring",
        ear2="Mache Earring",
	})
	sets.engaged.Acc = set_combine(sets.engaged.Mid, {
		hands="Emicho gauntlets",
		neck="Iqabi necklace",
		feet="Emicho gambieras",
		waist="Kentarch belt +1"
	})
	----------------------------------
	--	Apocalypse Engaged Gear 	--
	----------------------------------
		----------------------
		--	 1114 Accuracy 	--
		----------------------
	sets.engaged.Apocalypse = set_combine(sets.engaged, { 
		head="Flamma zucchetto +2",
		hands="Sulevia's gauntlets +2",
		body=Valor.Body.TP,
		feet="Flamma gambieras +2"
	})
	sets.engaged.Apocalypse.Mid = set_combine(sets.engaged.Apocalypse, {
		----------------------
		--	 1152 Accuracy 	--
		----------------------
		legs=Odyssean.Legs.TP,
	})
	sets.engaged.Apocalypse.Acc = set_combine(sets.engaged.Apocalypse.Mid, {
		----------------------
		--	 1184 Accuracy 	--
		----------------------
		hands=Valor.Hands.TP,
	})
--------------------------
-- AfterMath Gearsets	--
--------------------------
	--------------------------
	--		AM Gear			--
	-- Removes some haste	--
	--------------------------
	sets.engaged.Apocalypse.AM = set_combine(sets.engaged.Apocalypse, {
		hands="Sulevia's gauntlets +2",
		legs="Ignominy flanchard +2",
		ammo="Ginsen",
	})
	sets.engaged.Apocalypse.Mid.AM = set_combine(sets.engaged.Apocalypse.Mid, {
		legs="Ignominy flanchard +2",
	})
	sets.engaged.Apocalypse.Acc.AM = set_combine(sets.engaged.Apocalypse.Acc, {
		head="Argosy celata +1",
		legs=Odyssean.Legs.TP,
	})
------------------------------------------
--		Greatsword Engaged sets			--
------------------------------------------	
	sets.engaged.GreatSword = set_combine(sets.engaged, {
--[[ This set has +34 sTP for 5 Hit	]]
		head="Argosy celata",
		hands=Valor.Hands.TP,
		legs=Valor.Legs.TP,
		feet=Valor.Feet.TP,
		ear1="Telos Earring",
		ear2="Cessance earring",
		neck="Clotharius torque",
        ring1="Rajas ring",
        ring2="Petrov Ring",
        back=Ankou.TP,
        waist="Ioskeha belt",
    })
	sets.engaged.GreatSword.Mid = set_combine(sets.engaged.GreatSword, {
        legs=Odyssean.Legs.TP,
		ear1="Zennaroi Earring",
        ear2="Mache Earring",
    })
	sets.engaged.GreatSword.Acc = set_combine(sets.engaged.GreatSword.Mid, {
		hands="Emicho gauntlets",
		neck="Iqabi necklace",
		ring2="Begrudging ring",
		feet="Emicho gambieras",
		waist="Kentarch belt +1"
    })
	sets.engaged.Caladbolg = set_combine(sets.engaged.GreatSword, {
		head="Flamma zucchetto +2",
		hands="Flamma manopolas +2",
		legs=Odyssean.Legs.TP,
		feet="Flamma gambieras +2",
		neck="Lissome necklace",
		ear1="Telos Earring",
		ear2="Cessance earring",
		ring1="Flamma ring",
		ring2="Chirich ring"
	})
	sets.engaged.Ragnarok = set_combine(sets.engaged.GreatSword, {
		head="Flamma zucchetto +2",
		hands="Flamma manopolas +2",
		legs=Odyssean.Legs.TP,
		feet="Flamma gambieras +2",
		neck="Lissome necklace",
		ear1="Telos Earring",
		ear2="Cessance earring",
		ring1="Flamma ring",
		ring2="Chirich ring"
	})
	sets.engaged.Ragnarok.Mid = set_combine(sets.engaged.Ragnarok, {
		--ring1="Chirich ring",
		ring2="Chirich ring",
		ear2="Steelflash earring"
	})
	sets.engaged.Ragnarok.Acc = set_combine(sets.engaged.Ragnarok.Mid, {
		
	})
----------------------------------------------
--			Weaponskill Gearsets			--
----------------------------------------------
	sets.precast.WS = {
		ammo="Seething bomblet",
		head=Valor.Head.WS,
		body="Ignominy cuirass +3",
		hands=Odyssean.Hands.WS,
		legs=Odyssean.Legs.VitWS,
		feet="Sulev. leggings +2",
		neck="Fotia gorget",
		ear1="Telos Earring",
		ear2="Bale earring",
		ring1="Ifrit ring",
		ring2="Karieyh ring",
		waist="Fotia belt",
		back=Ankou.StrWS
	}
	sets.WSDayBonus = {head="Gavialis Helm"}
	----------------------------------
	--		Scythe Weaponskill		--
	----------------------------------		
--[[	Entropy Weaponskill		]]
	sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {
		head="Flamma zucchetto +2",
		body="Ignominy cuirass +3",
		hands="Flamma manopolas +2",
		waist="Prosilio belt",
		ring1="Flamma ring",
		ring2="Karieyh ring",
		legs=Odyssean.Legs.StrWS,
		back=Ankou.StrWS
	})
	sets.precast.WS['Entropy'].Mid = set_combine(sets.precast.WS['Entropy'], {
		ear1="Zennaroi earring",
	})
	sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS['Entropy'].Mid, {
		ear2="Mache earring",
		ring1="Begrudging ring"
	})
--[[	Catastrophe Weaponskill		]]
	sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Ratri sallet",
		body="Ignominy cuirass +3",
		hands="Ratri gadlings",
		legs="Ratri cuisses",
		feet="Sulev. leggings +2",
		neck="Fotia gorget",
		waist="Fotia belt",
		ear1="Ishvara Earring",
		ear2="Brutal earring",
		ring1="Regal ring",
		ring2="Karieyh ring",
	})
	sets.precast.WS['Catastrophe'].Mid = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Ratri sallet",
		body="Ignominy cuirass +3",
		hands="Ratri gadlings",
		legs="Ignominy Flanchard +2",
		feet="Sulev. leggings +2",
		neck="Fotia gorget",
		waist="Fotia belt",
		ear1="Ishvara Earring",
		ear2="Brutal earring",
		ring1="Regal ring",
		ring2="Karieyh ring",
	})
--[[	Quietus Weaponskill		]]
	sets.precast.WS['Quietus'] = set_combine(sets.precast.WS, {
	
	})
--[[	Insurgency Weaponskill		]]	
	sets.precast.WS['Insurgency'] = set_combine(sets.precast.WS, {
		ammo="Seething bomblet",
		head="Argosy celata +1",
		body="Ignominy cuirass +3",
		hands="Argosy mufflers +1",
		legs="Ignominy flanchard +2",
		feet="Argosy sollerets +1",
		neck="Fotia gorget",
		waist="Fotia belt",
		ear1="Ishvara Earring",
		ear2="Cessance earring",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
	})
	sets.precast.WS['Insurgency'].Mid = set_combine(sets.precast.WS['Insurgency'], {
		ear1="Zennaroi earring",
	})
	sets.precast.WS['Insurgency'].Acc = set_combine(sets.precast.WS['Insurgency'].Mid, {
		ear2="Mache earring",
		ring1="Begrudging ring"
	})
--[[	Cross Reaper Weaponskill		]]
	sets.precast.WS['Cross Reaper'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Ratri sallet",
		body="Ignominy cuirass +3",
		hands="Ratri gadlings",
		legs="Ignominy flanchard +2",
		ear1="Ishvara earring",
		ring1="Regal ring",
		ring2="Karieyh ring",
	})
	sets.precast.WS['Cross Reaper'].Mid = set_combine(sets.precast.WS['Cross Reaper'], 
	{
		ear1="Zennaroi earring",
	})
	sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS['Cross Reaper'].Mid, {
		ear2="Mache earring",
		ring1="Begrudging ring"
	})	
--------------------------------------
--		Greatsword Weaponskill		--
--------------------------------------
	sets.precast.WS['Scourge'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head=Odyssean.Helm.VitWS,
		body="Ignominy cuirass +3",
		hands=Odyssean.Hands.VitWS,
		legs=Odyssean.Legs.VitWS,
		feet="Sulev. Leggings +2", 
		ear1="Ishvara earring",
		ring1="Regal ring",
		ring2="Karieyh ring",
		back=Ankou.VitWS
	})
	sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head=Odyssean.Helm.VitWS,
		body="Ignominy cuirass +3",
		hands=Odyssean.Hands.VitWS,
		legs=Odyssean.Legs.VitWS,
		feet="Sulev. Leggings +2", 
		ear1="Ishvara earring",
		ring1="Regal ring",
		ring2="Karieyh ring",
		back=Ankou.VitWS
	})
	sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, { 
		ammo="Seething bomblet",
		head="Argosy celata +1",	
		body="Argosy hauberk +1",
		hands="Argosy mufflers +1",	
		legs="Argosy breeches +1",		
		feet="Argosy sollerets +1",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
		ear1="Brutal earring",
		back=Ankou.StrWS
	})   					
	sets.precast.WS['Resolution'].Mid = set_combine(sets.precast.WS['Resolution'], {
		ear1="Zennaroi earring",
	})
	sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'].Mid, {
		ear2="Mache earring",
		ring1="Begrudging ring"
	})
--------------------------------------
--			Misc. Gearsets			--
--------------------------------------
	sets.DT = set_combine(sets.idle, {
		head="Sulevia's mask +1",
		body="Sulevia's Plate. +2",
		ammo="Staunch tathlum",
		hands="Sulevia's gauntlets +2",
		legs="Sulevia's cuisses +1",
        feet="Sulevia's leggings +2",
		neck="Loricate torque +1",
		ear1="Static Earring",
        ear2="Hearty earring",
        ring1="Defending ring",
        ring2="Gelatinous ring +1",
        back="Mubvum. mantle",
		waist="Asklepian belt"
	})
	sets.engaged.meva = { 
		head="Flamma zucchetto +2",
		body="Ignominy cuirass +3",
		ammo="Staunch tathlum",
		hands="Leyline gloves",
		legs=Odyssean.Legs.TP,
        feet="Flamma gambieras +2",
		neck="Loricate torque +1",
		ear1="Static Earring",
        ear2="Hearty earring",
        ring1="Defending ring",
        ring2="Gelatinous ring +1",
        back="Mubvum. mantle",
		waist="Asklepian belt"
	}
	sets.PhysicalDefense = {}
	sets.PhysicalDefense.DT = sets.DT
	sets.Asleep = set_combine(sets.DT, {
		head="Frenzy sallet"
	})
	sets.buff.Doom = {
		ring1="Purity Ring",
		ring2="Saida Ring",
		waist="Gishdubar sash",
	}
	sets.Reraise = set_combine(sets.DT, {
		head="Twilight helm",
		body="Twilight mail",
        back="Solemnity cape",
		waist="Nierenschutz"
	})
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}
	sets.Reive = {
		neck="Ygna's Resolve +1"
	}