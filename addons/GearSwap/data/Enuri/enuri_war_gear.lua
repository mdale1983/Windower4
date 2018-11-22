include('augments.lua')
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
		ammo="Sihirik",
        head="Sulevia's mask +1",
        body="Sulevia's Plate. +2",
		hands="Sulevia's gauntlets +2",
		legs="Sulevia's cuisses +1",
        feet="Hermes' sandals",
		neck="Loricate torque +1",
        ear1="Telos earring",
		ear2="Cessance earring",
        ring1="Defending ring",
        ring2="Gelatinous ring +1",
        back=Cich.TP,
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
------------------------------------------
--		Greataxe Engaged sets			--
------------------------------------------	
--[[ Non-REMA Greataxe Set]]
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
        back="Mauler's mantle",
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
	--------------------------
	--	Minos Engaged Gear 	--
	--------------------------
		----------------------
		--	 1170 Accuracy 	--
		----------------------
	sets.engaged.Minos = set_combine(sets.engaged, { 
		head="Flamma zucchetto +2",
		hands="Sulevia's gauntlets +2",
		body=Valor.Body.TP,
		feet="Flamma gambieras +2"
	})
--------------------------
-- AfterMath Gearsets	--
--------------------------
	--------------------------
	--		AM Gear			--
	-- Removes some haste	--
	--------------------------

------------------------------------------
--		Greatsword Engaged sets			--
------------------------------------------	
	sets.engaged.GreatSword = set_combine(sets.engaged, {
--[[ This set has +34 sTP for 5 Hit	]]
		head="Argosy celata +1",
		hands=Valor.Hands.TP,
		legs=Valor.Legs.TP,
		feet=Valor.Feet.TP,
		ear1="Telos Earring",
		ear2="Cessance earring",
		neck="Clotharius torque",
        ring1="Rajas ring",
        ring2="Petrov Ring",
        back=Cich.TP,
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
		back=Cich.WS
	}
	sets.WSDayBonus = {head="Gavialis Helm"}
	--------------------------------------
	--		Greataxe Weaponskill		--
	--------------------------------------		
	sets.precast.WS['Upheavel'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head=Odyssean.Helm.VitWS,
		body=Odyssean.Body.WS,
		hands=Odyssean.Hands.VitWS,
		legs=Odyssean.Legs.VitWS,
		feet="Sulev. Leggings +2", 
		ear1="Ishvara earring",
		ring1="Regal ring",
		ring2="Karieyh ring",
		back=Cich.VitWS
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
		back=Cich.VitWS
	})
	sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, { 
		ammo="Knobkierrie",
		head="Argosy celata +1",	
		body="Argosy hauberk +1",
		hands="Argosy mufflers +1",	
		legs="Argosy breeches +1",		
		feet="Argosy sollerets +1",
		ring1="Regal ring",
		ring2="Niqmaddu ring",
		ear1="Brutal earring",
		ear2="Ishvara earring",
		back=Cich.WS
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