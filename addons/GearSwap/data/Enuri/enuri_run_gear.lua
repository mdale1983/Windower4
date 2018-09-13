include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = {
	    ammo="Staunch Tathlum",
        head="Futhark bandeau +1",
		neck="Loricate torque",
		ear1="Telos earring",
		ear2="Hearty Earring",
		body="Ayanmo corazza +1",
		hands=Herc.Hands.PDT,
		ring1="Defending Ring",
		ring2="Vocane Ring",
        back="Evasionist's cape",
		waist="Flume Belt",
		legs="Carmine Cuisses +1",
		feet="Erilaz greaves +1",
	}
	sets.idle.PDT = set_combine(sets.idle, {
		ammo="Staunch Tathlum",
		body="Erilaz surcoat +1",
		legs="Erilaz leg guards +1",
		ring1="Defending ring",
		feet="Erilaz greaves +1",
		waist="Ioskeha belt"
	})
	sets.idle.Magic = set_combine(sets.idle, {
		ammo="Staunch Tathlum",
		head="Ayanmo zucchetto +1",
		body="Erilaz surcoat +1",
		hands="Kurys gloves",
		legs="Erilaz leg guards +1",
		feet="Erilaz greaves +1",
		ring1="Defending ring",
		ear2="Hearty earring",
		back="Mubvumbamiri mantle",
		neck="Warder's charm +1",
	})
	sets.idle.BuffDuration = set_combine(sets.idle, {
		head = "Erilaz Galea",
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
		ear1="Eris' earring",
		ear2="Friomisi earring",
		ring1="Odium ring",
		ring2="Petrov ring",
		back="Earthcry mantle",
		waist="Sulla belt"
	}
	sets.SIR = {
		ammo="Impatiens", 			--10%
		body="Taeon tabard", 		--10%
		hands="Taeon gloves",		--10%
		legs="Taeon tights",		--10%
		feet="Taeon boots",			--09%
		ear1="Halasz earring",		--05%
		ring1="Evanescence ring",	--05%
	}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA['Lunge'] = set_combine(sets.Enmity, {
		head=Herc.Head.MAB,
		body="Samnuha coat",
		hands="Leyline gloves",
		ammo="Seething bomblet",
		neck="Sanctity necklace",
		ear1="Hecate's earring",
		back="Evasionist's cape",
		waist="Yamabuki-no-obi"
	})
	sets.precast.JA['Vallation'] = set_combine(sets.Enmity, {
		body="Runeist coat",
		back="Ogma's cape"
	})
	sets.precast.JA['Valiance'] = set_combine(sets.Enmity, {
		body="Runeist coat",
		back="Ogma's cape"
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
		head="Erilaz galea",
		legs="Runeist trousers",
		neck="Incanter's torque",
		
	})
	sets.precast.JA['Liement'] = set_combine(sets.Enmity, {
		body="Futhark coat",
	})
	sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity, {
		body="Futhark coat",
	})
	sets.precast.JA['Swordplay'] =set_combine(sets.Enmity, {
		hands="Futhark mitons"
	})
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
		head="Carmine mask",
		body="Taeon tabard",
		hands="Leyline gloves",
		legs="Ayanmo cosciales +1",
		feet="Carmine greaves",
		ammo="Impatiens",
		neck="Incanter's torque",
		ear1="Halasz earring",
		ear2="Loquacious earring",
		ring1="Evanescence ring",
		back="Solemnity cape",
		waist="Ioskeha belt"
	}
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		head="Carmine mask",
		hands="Runeist mitons",
		legs="Carmine cuisses +1",
		waist="Siegel sash"
	})
	sets.precast.Foil = sets.precast.FC
----------------------------------
-- 	Mid-cast Magic Gear-Sets 	--
----------------------------------
	sets.midcast.FastRecast = {
		head="Runeist Bandeau +1",
		body="Erilaz Surcoat",
		hands="Runeist Mitons",
		legs="Erilaz leg guards +1",
		feet="Erilaz greaves +1",
		neck="Incanter's Torque",
		waist="Flume Belt",
		ear2="Loquac. Earring",
		ring1="Defending Ring",
		ring2="Vocane Ring",
		back="Solemnity Cape"
	}
	sets.midcast.EnhancingDuration = set_combine(sets.idle, {
		head="Erilaz Galea",
		body="Futhark Coat",
		hands="Runeist's Mitons",
		legs="Futhark trousers +1",
		feet="Erilaz greaves +1",
		waist="Flume Belt",
		neck="Incanter's Torque",
		ear2="Loquacious Earring",
		ring1="Defending Ring",
		back="Solemnity cape",
	})
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.EnhancingDuration, {
		ammo="Impatiens", 			--10%
		head="Erilaz galea",
		hands="Runeist mitons",
		legs="Futhark trousers +1",
		waist="Siegel sash",
		neck="Incanter's torque",
		ear1="Halasz earring",		--05%
		ring1="Evanescence ring"
		
	})
	sets.midcast.Flash = sets.Enmity
	sets.midcast.BlueMagic = {
		head="Rabid visor",
		body="Emet harness +1",
		hands="Kurys gloves",
		legs="Erilaz leg guards +1",
		feet="Rager ledelsens +1",
		ammo="Aqreaqa bomblet",
		neck="Unmoving Collar",
		ear1="Eris' earring",
		ear2="Friomisi earring",
		ring1="Odium ring",
		ring2="Petrov ring",
		back="Earthcry mantle",
		waist="Sulla belt"
	}
	sets.midcast['Blank Gaze'] = sets.midcast.Enmity
    sets.midcast['Geist Wall'] = sets.midcast.Enmity
    sets.midcast['Jettatura'] = sets.midcast.Enmity
    sets.midcast.Stun = sets.midcast.Flash
	sets.midcast.BlueMagic.Cocoon = set_combine(sets.midcast['Enhancing Magic'], {
		ammo="Staunch tathlum",
		body="Emet harness +1",
		hands="Futhark Mitons", 
		feet="Erilaz greaves +1",
		neck="Unmoving collar",
		waist="Ninurta's sash",
		ear2="Ethereal Earring",
		ear1="Loquac. Earring",
		ring1="Kishar Ring",
		ring2="Prolix Ring",
		back="Mubvum. Mantle"
	})
	sets.midcast.Foil = sets.Enmity
	--[[sets.precast.Phalanx = sets.midcast.EnhancingDuration]]
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
		head="Futhark Bandeau +1",
		body="Taeon tabard",
		hands="Taeon gloves",
		legs="Taeon tights",
		feet="Taeon boots"
	})
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
		head="Runeist bandeau +1",
	})
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		head="Erilaz galea",
		waist="Gishdubar sash"
	})
	sets.midcast.Temper = set_combine(sets.midcast.EnhancingDuration, {
		
	})
--------------------------
-- 	engaged gear=sets 	--
--------------------------
	sets.engaged = {
		ammo="Staunch Tathlum",
		head = "Meghanada Visor +2",
		neck = "Loricate Torque +1",
		ear1 = "Telos Earring",
		ear2 = "Sherida Earring",
		body = "Ashera Harness",
		hands = "Ayanmo Manopolas +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = "Ogma's cape",
		waist = "Ioskeha Belt +1",
		legs = "Meghanada Chausses +2",
		feet = Herc.Feet.PDT
	}
	sets.engaged.acc = set_combine(sets.engaged.mid, {})
	sets.engaged.PDT = set_combine(sets.idle, {
	--[[ PDT caps at 50% and MDT 24% (with shell V]]
		ammo="Staunch Tathlum",
		body="Erilaz surcoat +1",
		legs="Meghanada chausses +1",
		feet="Erilaz greaves +1",
		ring1="Defending ring",
		waist="Ioskeha belt",
	})
	sets.engaged.Magic = set_combine(sets.idle, {
		ammo="Staunch Tathlum",
		head="Ayanmo zucchetto +1",
		body = "Erilaz surcoat +1",
		hands="Kurys gloves",
		legs="Erilaz leg guards +1",
		feet="Erilaz greaves +1",
		ring1="Defending ring",
		ear1="Eabani Earring",
		ear2="Flashward Earring",
		back="Mubvumbamiri mantle",
		neck="Warder's charm +1",
	})
	--Capped DT with DD Gear
	sets.engaged.TankHyb = set_combine(sets.engaged.PDT, {
		ammo="Staunch Tathlum",
		head="Meghanada Visor +1",
		neck="Loricate Torque",
		ear1="Telos Earring",
		ear2="Sherida Earring",
		body="Ayanmo corazza +2",
		hands=Herc.Hands.PDT,
		ring1="Defending ring",
		ring2="Vocane ring",
		back="Ogma's cape",
		waist="Ioskeha Belt +1",
		legs="Meghanada Chausses +1",
		feet=Herc.Feet.PDT
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
		back="Ogma's cape",
		waist="Kentarch Belt +1",
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
		ear1="Mache earring",
		ear2="Brutal earring",
		back="Ogma's cape",
		waist="Fotia belt"
	}
	sets.precast.WS['Resolution'] = {
		head="Adhemar bonnet",
		body="Adhemar Jacket",
		hands=Herc.Hands.WS,
		legs="Samnuha tights",
		feet=Herc.Feet.WS,
		ammo="Knobkierrie",
		neck="Fotia gorget",
		ring1="Regal ring",
		ring2="Shukuyu ring",
		ear1="Telos earring",
		ear2="Cessance earring",
		back="Ogma's cape",
		waist="Fotia belt"
	}
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
	sets.Reive = {
		neck="Ygna's resolve +1"
	}