include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = {
	    ammo="Staunch Tathlum",
        head="Futhark bandeau +1",
		neck="Loricate torque +1",
		ear1="Etiolation earring",
		ear2="Hearty Earring",
		body="Erilaz surcoat +1",
		hands=Herc.Hands.PDT,
		ring1="Defending Ring",
		ring2="Gelatinous ring +1",
        back=Ogma.ENM,
		waist="Flume Belt",
		legs="Carmine Cuisses +1",
		feet="Erilaz greaves +1",
	}
	sets.idle.PDT = set_combine(sets.idle, {
		ammo="Eluder's sachet",
        head="Futhark bandeau +1",
		neck="Loricate torque +1",
		ear1="Etiolation earring",
		ear2="Hearty Earring",
		body="Erilaz surcoat +1",
		hands=Herc.Hands.PDT,
		ring1="Defending Ring",
		ring2="Gelatinous ring +1",
        back=Ogma.ENM,
		waist="Flume Belt",
		legs="Erilaz leg guards +1",
		feet="Erilaz greaves +1",
	})
	sets.idle.MagicEva = set_combine(sets.idle, {
		ammo="Staunch Tathlum",
        head="Erilaz Galea +1",
		neck="Warder's charm +1",
		ear1="Etiolation earring",
		ear2="Hearty Earring",
		body="Erilaz surcoat +1",
		hands="Kurys gloves",
		ring1="Defending Ring",
		ring2="Gelatinous ring +1",
		back=Ogma.ENM,
		waist="Flume Belt",
		legs="Erilaz leg guards +1",
		feet="Erilaz greaves +1",
	})
	sets.idle.BuffDuration = set_combine(sets.idle, {
		head = "Erilaz Galea +1",
		ring2 = "Defending Ring",
		legs = "Futhark trousers +1",
	})
--------------------------
-- 	Enmity Gear-set 	--
--------------------------
	sets.Enmity = {
		head="Rabid visor",
		body="Emet harness +1",
		hands="Kurys gloves",
		legs="Erilaz leg guards +1",
		feet="Rager ledelsens +1",
		ammo="Aqreaqa bomblet",
		neck="Unmoving Collar",
		ear1="Cryptic earring",
		ear2="Friomisi earring",
		ring1="Odium ring",
		ring2="Petrov ring",
		back=Ogma.ENM,
		waist="Sulla belt"
	}
	sets.SIR = {
		ammo="Impatiens", 			--10%
		hands="Taeon gloves",		--10%
		legs="Carmine cuisses +1",	--20%
		feet="Taeon boots",			--09%
		ear2="Halasz earring",		--05%
		ring1="Evanescence ring",	--05%
		waist="Resolute belt"		--08%
	}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA['Lunge'] = set_combine(sets.Enmity, {
		head=Herc.Head.MAB,
		body="Samnuha coat",
		hands=Herc.Hands.MAB,
		legs=Herc.Legs.MAB,
		feet="Adhemar gamashes",
		ammo="Seething bomblet",
		neck="Sanctity necklace",
		ring1="Acumen ring",
		ear1="Hecate's earring",
		ear2="Friomisi earring",
		back="Evasionist's cape",
		waist="Eschan stone"
	})
	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
	sets.precast.JA['Vallation'] = set_combine(sets.Enmity, {
		body="Runeist coat",
		legs="Futhark trousers +1",
		back=Ogma.TP
	})
	sets.precast.JA['Valiance'] = set_combine(sets.Enmity, {
		body="Runeist coat",
		legs="Futhark trousers +1",
		back=Ogma.TP
	})
	sets.precast.JA['Battuta'] = set_combine(sets.Enmity, {
		head="Futhark Bandeau +1",
	})
	sets.precast.JA['Gambit'] = set_combine(sets.Enmity, {
		hands="Runeist mitons"
	})
	sets.precast.JA['Rayke'] = set_combine(sets.Enmity, {
		feet="Futhark boots"
	})
	sets.precast.JA['Pflug'] = set_combine(sets.Enmity, {
		feet="Runeist bottes"
	})
	sets.precast.JA['Embolden'] = set_combine(sets.Enmity, {
		back="Evasionist's cape"
		
	})
	sets.precast.JA['Vivacious Pulse'] = set_combine(sets.Enmity, {
		head="Erilaz Galea +1",
		legs="Runeist trousers",
		neck="Incanter's torque",
		
	})
	sets.precast.JA['Liement'] = set_combine(sets.Enmity, {
		body="Futhark Coat +1",
	})
	sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity, {
		body="Futhark Coat +1",
	})
	sets.precast.JA['Swordplay'] =set_combine(sets.Enmity, {
		hands="Futhark mitons"
	})
	sets.precast.JA['One For All'] = sets.Enmity
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity, { })
	sets.precast.JA['Ignis'] = sets.Enmity
	sets.precast.JA['Gelus'] = sets.Enmity
	sets.precast.JA['Flabra'] = sets.Enmity
	sets.precast.JA['Tellus'] = sets.Enmity
	sets.precast.JA['Sulpor'] = sets.Enmity
	sets.precast.JA['Unda'] = sets.Enmity
	sets.precast.JA['Lux'] = sets.Enmity
	sets.precast.JA['Tenebrae'] = sets.Enmity
	sets.midcast.JA = {}
	sets.midcast.JA['Liement'] = sets.Enmity
	sets.midcast.JA['Swordplay'] = sets.Enmity
	sets.midcast.JA['Pflug'] = sets.Enmity
	sets.midcast.JA['Rayke'] = sets.Enmity
	sets.midcast.JA['Gambit'] = sets.Enmity
	sets.midcast.JA['Valiance'] = sets.Enmity
	sets.midcast.JA['Vallation'] = sets.Enmity
----------------------------------
-- 	Pre-cast Magic Gear-sets 	--	
----------------------------------
	sets.precast.FC = {
		head="Carmine mask +1",
		body="Taeon tabard",
		hands="Leyline gloves",
		legs="Ayanmo cosciales +2",
		feet="Carmine greaves +1",
		ammo="Impatiens",
		neck="Voltsurge torque",
		ear1="Etiolation earring",
		ear2="Loquacious earring",
		ring1="Prolix ring",
		ring2="Kishar ring",
		back=Ogma.FC,
		waist="Resolute belt"
	}
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		hands="Runeist mitons",
		legs="Futhark trousers +1",
		waist="Siegel sash"
	})
	sets.precast.Foil = sets.precast.FC
----------------------------------
-- 	Mid-cast Magic Gear-Sets 	--
----------------------------------
	sets.midcast.FastRecast = sets.precast.FC
	sets.midcast.EnhancingDuration = set_combine(sets.idle, {
		head="Erilaz Galea +1",
		body="Futhark Coat +1",
		hands="Runeist's Mitons",
		legs="Futhark trousers +1",
		feet="Erilaz greaves +1",
		waist="Flume Belt",
		neck="Incanter's Torque",
		ear2="Loquacious Earring",
		ring1="Defending Ring",
		back="Solemnity cape",
	})
	sets.midcast['Enhancing Magic'] = {
		ammo="Impatiens", 			--10%
		head="Carmine mask +1",
		body="Futhark coat +1",
		hands="Runeist mitons",
		legs="Futhark trousers +1",
		feet="Taeon boots",
		waist="Siegel sash",
		neck="Incanter's torque",
		ear1="Etiolation earring",
		ear2="Halasz earring",		--05%
		ring1="Defending ring",
		ring2="Evanescence ring",
		back="Evasionist's cape"
	}
	sets.midcast['Temper'] = set_combine(sets.midcast['Enhancing Magic'], {
        head="Carmine Mask +1",
        body="Manasa Chasuble",
        hands="Runeist's Mitons +3",
        legs="Carmine Cuisses +1",
    })
	sets.midcast['Cocoon'] = set_combine(sets.SIR, {
		head="Futhark bandeau +1",
		body="Futhark coat +1",
		ring2="Defending ring",
		back="Solemnity cape",
		neck="Loricate torque +1",
	})
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
		head="Futhark Bandeau +1",
		body="Taeon tabard",
		hands="Taeon gloves",
		legs="Taeon tights",
		feet="Taeon boots"
	})
	sets.midcast.Regen = set_combine(sets.SIR, {
		head="Runeist bandeau +1",
	})
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		head="Erilaz Galea +1",
		waist="Gishdubar sash"
	})
	sets.midcast.Flash = sets.Enmity
	sets.midcast.Foil = sets.Enmity
	sets.midcast.Stun = sets.Enmity
	sets.midcast['Blank Gaze'] = sets.Enmity
    sets.midcast['Geist Wall'] = sets.Enmity
    sets.midcast['Jettatura'] = sets.Enmity
	sets.midcast['Wild Carrot'] = set_combine(sets.SIR, { 
		head="Futhark bandeau +1",
		body="Futhark coat +1", 
		ring1="Gelatinous ring +1",
		ring2="Kunaji ring",
		back="Solemnity cape"
	})
	sets.midcast['Pollen'] = sets.midcast['Wild Carrot']
--------------------------
-- 	engaged gear=sets 	--
--------------------------
	sets.engaged = {
		ammo="Ginsen",
		head="Ayanmo zucchetto +1",
		body="Ayanmo corazza +2",
		hands="Adhemar wristbands",
		legs="Samnuha tights",
		feet=Herc.Feet.WS,
		neck="Lissome necklace",
		ear1="Telos earring",
		ear2="Cessance Earring",
		ring1="Rajas ring",
		ring2="Chirich Ring",
		back=Ogma.TP,
		waist="Ioskeha belt",
	}
	sets.engaged.PDT = set_combine(sets.idle, {
	--[[ PDT caps at 50% and MDT 24% (with shell V]]
		ammo="Staunch Tathlum",
		body="Erilaz surcoat +1",
		legs="Meghanada chausses +1",
		feet="Erilaz greaves +1",
		ring1="Defending ring",
		waist="Ioskeha belt",
	})
	sets.engaged.Tanking = set_combine(sets.idle.PDT,{
		--24% MDT | 50% PDT | 12% Enemy Critical down 
		body="Futhark coat +1",
		ring2="Fortified ring"
	})
	sets.engaged.MagicEva = set_combine(sets.idle, {
		ammo="Staunch Tathlum",
		head="Ayanmo zucchetto +1",
		body="Erilaz surcoat +1",
		hands="Erilaz gauntlets +1",
		legs="Runeist trousers +1",
		feet="Erilaz greaves +1",
		ring1="Defending ring",
		back=Ogma.ENM,
		neck="Warder's charm +1",
	})
	--Capped DT with DD Gear
	sets.engaged.TankHyb = set_combine(sets.engaged.PDT, {
		ammo="Staunch Tathlum",
		head="Runeist Bandeau +2",
		neck="Loricate Torque +1",
		ear1="Telos Earring",
		ear2="Cessance Earring",
		body="Ayanmo Corazza +2",
		hands="Herculean Gloves",
		ring1="Defending Ring",
		ring2="Chirich Ring",
		back=Ogma.ENM,
		waist="Ioskeha Belt",
		legs="Meg. Chausses +1",
		feet="Herculean Boots"
	})
	--Low DT with DD Gear
	sets.engaged.DDHyb = {
		ammo="Ginsen",
		head="Ayanmo zucchetto +1",
		body="Ayanmo corazza +2",
		hands="Adhemar wristbands",
		legs="Samnuha tights",
		feet=Herc.Feet.WS,
		neck="Lissome necklace",
		ear1="Telos earring",
		ear2="Cessance Earring",
		ring1="Rajas ring",
		ring2="Chirich Ring",
		back=Ogma.TP,
		waist="Ioskeha belt",
	}
	--Mid DT with Acc
	sets.engaged.DDHybAcc = {
		ammo = "Yamarang",
		head = "Meghanada visor +1",
		neck = "Lissome necklace",
		ear1 = "Cessance Earring",
		ear2 = "Telos earring",
		body = "Adhemar jacket",
		hands = Herc.Hands.WS,
		ring1 = "Defending ring",
		ring2 = "Chirich Ring",
		back = "Evasionist's cape",
		waist = "Ioskeha Belt",
		legs = "Carmine cuisses +1",
		feet = Herc.Feet.WS
	}
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
	sets.precast.WS['Dimidiation'] = {
		head="Adhemar bonnet",
		body="Adhemar jacket",
		hands="Meg. gloves +1",
		legs="Adhemar kecks",
		feet=Herc.Feet.TP,
		ammo="Knobkierrie",
		neck="Fotia gorget",
		ring1="Regal ring",
		ring2="Karieyh ring",
		ear1="Mache earring",
		ear2="Brutal earring",
		back=Ogma.TP,
		waist="Fotia belt"
	}
	sets.precast.WS['Resolution'] = {
		head="Adhemar bonnet",
		body="Adhemar Jacket",
		hands=Herc.Hands.StrWS,
		legs=Herc.Legs.StrWS,
		feet=Herc.Feet.WS,
		ammo="Knobkierrie",
		neck="Fotia gorget",
		ring1="Regal ring",
		ring2="Karieyh ring",
		ear1="Sherida earring",
		ear2="Cessance earring",
		back=Ogma.TP,
		waist="Fotia belt"
	}
----------------------
-- 	Misc Gear-sets 	--
----------------------
	sets.Reive = {
		neck="Ygna's resolve +1"
	}
	sets.buff.Doom = {
		ring1="Purity Ring",
		ring2="Saida Ring",
		waist="Gishdubar sash",
	}
	sets.Asleep = set_combine(sets.engaged.PDT, {
		head="Frenzy Sallet"
	})
	sets.DT = sets.idle.PDT
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}
	sets.Reive = {
		neck="Ygna's resolve +1"
	}
	sets.Protect = { 
	
	}
	sets.latent_refresh = {
		
	}
	sets.refresh = { 
	
	}
	sets.regen = { 
	
	}