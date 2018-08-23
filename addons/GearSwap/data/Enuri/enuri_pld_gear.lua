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
		neck="Loricate torque",
        ear1="Telos earring",
		ear2="Infused earring",
        ring1="Warp ring",
        ring2="Vocane ring",
        back="Solemnity cape",
		waist="Flume belt"
	}
	sets.idle.PDT = set_combine(sets.idle, {
		ammo="Staunch Tathlum",
		head="Souveran schaller",
		hands="Souv. Handschuhs",
		legs="Chevalier's cuisses +1",
		feet="Souveran schuhs",
		neck="Creed Collar",
		ring1="Defending ring",
		ear1="Hearty earring",
		ear2="Thureous earring",
	})
	sets.idle.Weak = {}
----------------------
-- 	Enmity Gear set --
----------------------
	sets.Enmity = {
		head="Hero's galea",
		neck="Warder's charm +1",
		ear1="Firomisi earring",
		body="Souveran cuirass",
		hands="Valor gauntlets +2",
		legs="Souveran diechlings",
		feet="Creed sabatons +2",
		neck="Unmoving Collar",
		ring1="Apeile ring",
		ring2="Apeile ring +1",
		back="Mubvumbamiri mantle",
		waist="Creed baudrier",
	}
----------------------------------
--		Job Ability sets		--
----------------------------------
	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {
		hands="Valor Gauntlets +2",
		ring1="Fenian ring"
	})
	sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity, {
		feet="Creed sabatons +2"
	})
	sets.precast.JA['Sentinel'] = set_combine(sets.Enmity, {
		feet="Vlr. Leggings +2"
	})
	sets.precast.JA['Fealty'] = set_combine(sets.Enmity, {
		body="Cab. Surcoat"
	})
	sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity, {
		feet="Glt. Leggings +1"
	})
	sets.precast.JA['Rampart'] = set_combine(sets.Enmity, {
		head="Valor coronet"
	})
	sets.precast.JA['Cover'] = set_combine(sets.Enmity, {
		body="Cab. Surcoat"
	})
	sets.precast.JA['Provoke'] = sets.Enmity
--------------------------------------
--		Casting Gear sets			--
--------------------------------------	
	sets.precast.FC = {
		ammo="Incantor stone",
		head="Carmine Mask",
		body=Odyssean.Body.FC,
		hands="Leyline gloves",
		legs="Eschite cuisses",
		feet="Carmine greaves",
		ear2="Loquacious earring",
		waist="Goading belt",
		ear1="Halasz earring",
		
	}
------------------------
-- Mid cast Gear Sets --
------------------------
	sets.midcast['Cure'] = {
		body="Souveran cuirass",
		neck="Diemer gorget",
		ear2="Oneiros earring",
		ring2="Vocane ring",
		back="Solemnity cape",
		waist="Gishdubar sash",
		legs="Souveran diechlings",
		feet=Odyssean.Feet.FC
	}
	sets.midcast['Flash'] = set_combine(sets.Enmity, {})
	sets.midcast.EnhancingDuration = {
		head="Carmine mask",
		body="Shabti cuirass",
		hands="Regal gauntlets",
		legs="Carmine cuisses +1",
		neck="Incanter's torque"		
	}
	sets.midcast['Phalanx'] = set_combine(sets.midcast.EnhancingDuration, {
		hands="Souveran Handschuhs",
		feet="Souveran schuhs",
		back="Weard mantle",
	})
	sets.midcast['Reprisal'] = set_combine(sets.midcast.EnhancingDuration, {
	})
-------------------
-- Misc Gearsets --
-------------------
	sets.CurePot = {
		body="Souveran cuirass",
		neck="Diemer gorget",
		ear2="Oneiros earring",
		ring2="Vocane ring",
		back="Solemnity cape",
		waist="Gishdubar sash",
		legs="Flamma dirs +1",
		feet=Odyssean.Feet.FC
	}
	sets.buff.Doom = {
		legs="Shabti cuisses",
		ring1="Saida ring",
		waist="Gishdubar sash",
	}
	sets.Reraise = set_combine(sets.idle.PDT, {
		helm="Twilight Helm",
		body="Twilight Mail",
		--[[hands="Souv. Handschuhs",
		legs="Chevalier's cuisses +1",
		feet="Souveran schuhs",
		neck="Creed Collar",
		ring1="Defending ring",
		ear1="Hearty earring",
		ear2="Thureous earring",
		back="Solemnity cape",
		waist="Flume belt"]]
	})
	sets.idle.Weak.Reraise = set_combine(sets.idle.PDT, sets.Reraise)
	sets.defense.Reraise = set_combine(sets.idle.PDT, sets.Reraise)
-----------------------
-- Engaged Gear Sets --
-----------------------	
	sets.engaged = {}
	sets.engaged.Ochain = set_combine(sets.idle.PDT, {
		head="Souveran schaller",
		body="Sulevia's breastplate +2",
		hands="Souv. Handschuhs"
		
	})
	sets.engaged.Dynamis = set_combine(sets.idle.PDT, {
		hands="Souv. Handschuhs"
	})
------------------------------
-- 	Weapon skill Gear-Sets 	--
------------------------------
	sets.precast.WS['Chant du Cygne'] = {
		head=Valor.Head.WS,
		body=Odyssean.Body.WS,
		hands=Odyssean.Hands.WS,
		legs=Odyssean.Legs.StrWS,
		feet="Sulevia's Leggings +2",
		ammo="Ginsen",
		neck="Fotia Gorget",
		ear1="Mache earring",
		ear2="Telos earring",
		ring1="Petrov ring",
		ring2="Rajas ring",
		back="Weard mantle",
		waist="Fotia belt"
	}
	sets.precast.WS['Sanguine Blade'] = {
		head="Jumalik helm",
		body="Founder's breastplate",
		hands="Leyline gloves",
		legs="Eschite cuisses",
		feet=Odyssean.Feet.FC,
		neck="Sanctity necklace",
		ear1="Hecate's earring",
		ear2="Friomisi earring",
		ring1="Acumen ring",
		ring2="Fenrir ring",
		back="Argocham. mantle",
		waist="Eschan stone"
	}