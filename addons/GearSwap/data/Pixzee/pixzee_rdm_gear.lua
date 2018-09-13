include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = { 
	-- Refresh, Regen, and DT
		ammo="Staunch Tathlum",
		head="Viti. Chapeau +3",
		body="Jhakri Robe +2",
		hands=Leyline.FC,
		legs=Lengo.Legs,
		feet=Chir.Feet.MAB,
		neck="Bathy Choker",
		waist="Fucho-no-Obi",
		left_ear="Genmei Earring",
		right_ear="Eabani Earring",
		left_ring="Fortified Ring",
		right_ring="Defending Ring",
		back=Suc.MDT,
	}
	sets.idle.Town = set_combine(sets.idle, {
	-- Crafting gear, Teleport rings, etc.
		head="Chef's Hat",
		body="Culinarian's Apron",
		hands="Angler's Gloves",
		legs="Fisherman's Hose",
		feet="Fisherman's Boots",
		neck="Culin. Torque",
		ring1="Dim. Ring (Dem)",
		ring2="Warp Ring",
	})
	sets.idle.PDT = {
		ammo="Ginsen",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Loricate Torque +1",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Eabani Earring",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		back=Suc.MDT,
	}
	sets.defense.PDT = { -- PDT Focused Defense Set
		ammo="Ginsen",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Loricate Torque +1",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Eabani Earring",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		back=Suc.MDT,
	}
	sets.idle.Magic = {
		ammo="Ginsen",
		head=Chir.Head.Acc,
		body="Ayanmo Corazza +2",
		hands="Atrophy Gloves +3",
		legs="Aya. Cosciales +2",
		feet="Carmine Greaves +1", 
		neck="Combatant's Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Eabani Earring",
		left_ring="Fortified Ring",
		right_ring="Defending Ring",
		back=Suc.MDT,
	}
	sets.defense.MDT = { -- MDT Focused Defense Set
		ammo="Ginsen",
		head=Chir.Head.Acc,
		body="Ayanmo Corazza +2",
		hands="Atrophy Gloves +3",
		legs="Aya. Cosciales +2",
		feet=Carmine.Legs.MND,
		neck="Combatant's Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Eabani Earring",
		left_ring="Fortified Ring",
		right_ring="Defending Ring",
		back=Suc.MDT,
	}
	sets.Kiting = {
		legs="Carmine Cuisses +1"
	}
	sets.latent_refresh = {
		waist="Fucho-no-obi"
	}
	sets.resting = { 
	--[[Resting set, Would you rather have it and 
		not need it or need it and not have it?]]
		main="Dark Staff",
		ammo="Clarus Stone",
		head="Orvail Corona +1",
		body="Chelona blazer",
		hands="Serpentes Cuffs",
		legs="Nares Trews",
		neck="Eidolon Pendant",
		waist="Austerity Belt",
		left_ear="Infused Earring",
		left_ring="Paguroidea Ring",
		right_ring="Star Ring",
		back="Felicitas Cape",
		}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +3"}
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}
----------------------------------
-- 	Pre-cast Magic Gear-sets 	--	
----------------------------------
	sets.precast.FC = { -- /SCH +10
		head="Atrophy Chapeau +3",
		body="Viti. Tabard +3", 
		hands=Leyline.FC,
		feet="Carmine Greaves +1",
		left_ring="Kishar Ring",
	}
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {
		head=empty,
		body="Twilight Cloak"
	})
----------------------
-- 	Buff Gear-sets 	--	
----------------------	
	sets.buff.ComposureOther = {-- Composure set when casting on others
		head="Lethargy Chappel +1",
		body="Lethargy Sayon +1",
		hands="Atrophy Gloves +3",
		legs="Lethargy Fuseau +1",
		feet="Lethargy Houseaux +1",
	}
	-- Used to force duration onto Haste
	sets.buff.Saboteur = {hands="Lethargy Gantherots +1"}
----------------------------------
-- 	Mid-cast Magic Gear-Sets 	--
----------------------------------
	sets.midcast.Utsusemi = { -- Capped gear haste and fill with fastcast.
		ammo="Staunch Tathlum",
		head="Atrophy Chapeau +3",
		body="Viti. Tabard +3", 
		hands=Leyline.FC,
		legs="Aya. Cosciales +2",
		feet=Merl.Feet.Burst,
		neck="Magoraga Beads",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Weather. Ring",
		back="Solemnity Cape",
	}
    sets.midcast.Cure = { -- Cure potency is capped at 50%, Recieved at 30%
		ammo="Regal Gem",
		head=Vanya.Head.Heals,
		body=Vanya.Body.CST,
		hands=Kyakus.Hands.MAC,
		legs="Gyve Trousers",
		feet=Vanya.Feet.CST,
		neck="Nodens Gorget",
		waist="Bishop's Sash",
		left_ear="Mendi. Earring",
		right_ear="Beatific Earring",
		left_ring="Sirona's Ring",
		right_ring="Haoma's Ring",
		back="Tempered Cape +1",
	}
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = { -- Included are example pieces
		ammo="Regal Gem",
		head=Vanya.Head.Heals,
		body=Kyakus.Body.CST,
		hands=Kyakus.Hands.MAC,
		legs="Gyve Trousers",
		feet=Vanya.Feet.CST,
		neck="Nodens Gorget",
		waist="Gishdubar Sash",
		left_ear="Mendi. Earring",
		right_ear="Beatific Earring",
		left_ring="Kunaji Ring",
		right_ring="Asklepian Ring",
		back="Tempered Cape +1",
	}
    sets.midcast.Cursna = { -- Cursna+ > Healing Magic
		ammo="Regal Gem",
		head=Vanya.Head.Heals,
		body="Viti. Tabard +3",
		hands=Kyakus.Hands.MAC,
		legs="Atrophy Tights +3",
		feet=Gende.Feet.PDT,
		neck="Malison Medallion",
		waist="Gishdubar Sash",
		left_ear="Beatific Earring",
		right_ear="Etiolation Earring",
		left_ring="Haoma's Ring",
		right_ring="Ephedra Ring",
		back="Oretan. Cape +1",
	}	
    sets.midcast['Enhancing Magic'] = { -- Enh. Ma. Skill > Conserve MP
		main="Secespita",
		sub="Ammurapi Shield",
		head="Befouled Crown",
		body="Viti. Tabard +3",
		hands="Viti. Gloves +3", 
		legs="Atrophy Tights +3",
		feet="Leth. Houseaux +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Andoaa Earring",
		right_ear="Augment. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back=Ghost.EncDur,
	}
    sets.midcast.Duration = set_combine(sets.midcast['Enhancing Magic'],{ -- Enh. Ma. Dur. (exclusivly for set_combine, nothing will directly call this set)
		head=Telc.Head.EncDur,
		body=Telc.Body.EncDur,
		hands="Atrophy Gloves +3",
		legs=Telc.Legs.EncDur,
	})
    sets.midcast.Stoneskin = set_combine(sets.midcast.Duration,{--Stoneskin HP set, examples included
		legs="Haven Hose",
		neck="Nodens Gorget",
		waist="Siegel Sash",
		right_ear="Earthcry Earring",
	})
    sets.midcast['Enhancing Magic'].EnSpells = {-- Enspell Specific set
		ammo="Regal Gem",
		head="Befouled Crown",
		body="Viti. Tabard +3",
		hands="Viti. Gloves +3", 
		legs="Atrophy Tights +3",
		feet="Leth. Houseaux +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Etiolation Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back=Ghost.EncDur,
	}
    sets.midcast['Enhancing Magic'].GainSpells = {-- Gainspell Specific set
		ammo="Regal Gem",
		head="Befouled Crown",
		body="Viti. Tabard +3",
		hands="Viti. Gloves +3",
		legs="Atrophy Tights +3",
		feet="Leth. Houseaux +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back=Ghost.EncDur,
	}
	sets.midcast.Haste = set_combine(sets.midcast.Duration,{
		-- Fill slots not used in Duration set with Haste > Fastcast
	})
	sets.midcast.Aquaveil = set_combine(sets.midcast.Duration, { -- Aquaveil Set
		head="Amalric Coif",
		hands="Regal Cuffs",
	})
	sets.midcast.Refresh = set_combine(sets.midcast.Duration, { -- Refresh Set
		head="Amalric Coif",
		body="Atrophy Tabard +3",
		hands="Atrophy Gloves +3",
	})
	sets.midcast.Phalanx = { -- Balance potency/duration how you choose, Formula is: F = 28 + Floor( (Enhancing Magic Skill - 300.5) / 28.5)
		main=ege.FC,
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum",
		head="Leth. Chappel +1",
		body="Lethargy Sayon +1",
		hands="Atrophy Gloves +3",
		legs="Leth. Fuseau +1",
		feet="Leth. Houseaux +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Andoaa Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back=Ghost.EncDur,
	}
	sets.midcast.Storm = set_combine(sets.midcast.Duration, { 
		-- Storm Set
	})
    sets.midcast.Regen = set_combine(sets.midcast.Duration,{ 
		-- Fill with Regen Potency
	})
	sets.midcast.Protect = set_combine(sets.midcast.Duration, { 
	--Protect/Shell set
		right_ear="Brachyura earring",
		})
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = sets.midcast.Protect
	sets.midcast.Shellra = sets.midcast.Protect
	----------------------
	-- Enfeebling Magic	--
	----------------------
    sets.midcast['Enfeebling Magic'] = { 
	-- Potency > Enfeebling Magic > Magic Accuracy > INT = MND
		main="Murgleis",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head="Viti. Chapeau +3",
		body="Lethargy Sayon +1",
		hands="Regal Cuffs",
		legs=Chir.Legs.MAC,
		feet="Vitiation boots +3",
		neck="Incanter's Torque",
		waist="Rumination Sash",
		left_ear="Enfeebling Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back=Suc.MndMAC
	}
    sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], { -- Enfeebling Magic > Magic Accuracy > INT = MND
		main="Murgleis",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head="Atrophy Chapeau +3",
		body="Atrophy Tabard +3",
		hands=Kyakus.Hands.MAC,
		legs=Chir.Legs.MAC,
		feet="Vitiation boots +3",
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Digni. Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back=Suc.MndMAC,
	})
    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {
		head="Viti. Chapeau +3"
	})
    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {
		head="Viti. Chapeau +3"
	})
	--Making a single nuke set for bursts as I don't see RDM nuking a whole lot
    sets.midcast['Elemental Magic'] = {--Magic Burst Damage(40%) > MAB > INT > M.Acc
		main="Murgleis",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Ea Hat",
		body="Ea Houppelande",
		hands="Ea Cuffs",
		legs="Ea Slops",
		feet="Jhakri Pigaches +2",
		neck="Mizu. Kubikazari",
		waist="Refoccilation Stone",
		left_ear="Friomisi Earring",
		right_ear="Regal Earring",
		left_ring="Mujin Band",
		right_ring="Shiva Ring +1",
		back=Suc.MAB,
	}
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
		head=empty,
		body="Twilight Cloak"
	}) -- No touchy
	sets.midcast['Dark Magic'] = { -- Dark Magic > INT > Magic Accuracy
		main="Murgleis",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head="Pixie hairpin +1",
		body="Atrophy Tabard +3",
		hands="Regal Cuffs",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		neck="Erra Pendant",
		waist="Fucho-no-Obi",
		left_ear="Digni. Earring",
		right_ear="Gwati Earring",
		left_ring="Archon Ring",
		right_ring="Evanescence Ring",
		back=Suc.MAB,
	}
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], { 
	-- Drain/Aspir Potency set
		head="Pixie Hairpin +1",
		body="Jhakri Robe +2",
		waist="Fucho-no-obi",
		left_ring="Archon Ring",
		right_ring="Evanescence Ring",
	})
	sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {	
	-- Stun set, Use this to swap out Drain/Aspir Potency from your Dark
		head="Atrophy Chapeau +3",
		hands="Jhakri Cuffs +2",
		waist="Luminary Sash",
		left_ear="Digni. Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring",
		right_ring="Evanescence Ring",
	})
 	sets.midcast.Trust = sets.precast.FC -- Calls Trusts in Fastcast sets
--------------------------
-- 	engaged gear=sets 	--
--------------------------
--[[ 
	[*] Variations for TP weapon and (optional) offense/defense modes.  Code will 
		fall back on previous
    [*] sets if more refined versions aren't defined.
    [*] If you create a set with both offense and defense modes, the offense mode 
		should be first.
    [*]	EG: sets.engaged.Dagger.Accuracy.Evasion
 	[*] Normal melee group
	[*] /DNC DW is 15%(DW2) and /NIN DW is 25%(DW3) All Further calculations will 
		assume DW3 is active,
	[*] Capped Gear Haste (26%), and Haste II
 ]]
	------------------------------------------------
	----------DO NOT OVERGEAR Dual Wield------------
	------------------------------------------------
	sets.engaged = { -- Self hasted Melee TP Set - 31% DW to cap
		main="Murgleis",
		sub="Almace",
		ammo="Ginsen",
		head=Taeon.Head.TP,
		body="Ayanmo Corazza +2",
		hands=Taeon.Hands.TP,
		legs=Taeon.Legs.TP,
		feet=Taeon.Feet.TP,
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Cessance Earring",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back=Suc.PDT,
	}
	sets.engaged.Acc = set_combine(sets.engaged, { -- High Accuracy TP Set
		ammo="Ginsen",
		head=Taeon.Head.TP,
		body="Ayanmo Corazza +2",
		hands=Taeon.Hands.TP,
		legs=Carmine.Legs.DW,
		feet=Taeon.Feet.TP,
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Suppanomimi",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back=Suc.PDT,
	})
	-- Haste 43%
	sets.engaged.Haste_43 = set_combine(sets.engaged, {
	-- Capped Haste TP Set - 11% DW to cap
		main="Murgleis",
		sub="Almace",
		ammo="Ginsen",
		head=Taeon.Head.TP,
		body="Ayanmo Corazza +2",
		hands=Taeon.Hands.TP,
		legs=Taeon.Legs.TP,
		feet=Taeon.Feet.TP,
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Cessance Earring",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back=Suc.PDT,
	})
	sets.engaged.Acc.Haste_43 = set_combine(sets.engaged.Haste_43, {
		ammo="Ginsen",
		head=Taeon.Head.TP,
		body="Ayanmo Corazza +2",
		hands=Taeon.Hands.TP,
		legs=Carmine.Legs.DW,
		feet=Taeon.Feet.TP,
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Suppanomimi",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back=Suc.PDT,
	})
	-- 40
	sets.engaged.Haste_40 = set_combine(sets.engaged.Haste_43, { -- 40 Haste TP Set - 16% DW to cap
		main="Murgleis",
		sub="Almace",
		ammo="Ginsen",
		head=Taeon.Head.TP,
		body="Ayanmo Corazza +2",
		hands=Taeon.Hands.TP,
		legs=Taeon.Legs.TP,
		feet=Taeon.Feet.TP,
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Cessance Earring",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back=Suc.PDT,
	})
	sets.engaged.Acc.Haste_40 = set_combine(sets.engaged.Acc.Haste_43, {
		ammo="Ginsen",
		head=Taeon.Head.TP,
		body="Ayanmo Corazza +2",
		hands=Taeon.Hands.TP,
		legs=Carmine.Legs.DW,
		feet=Taeon.Feet.TP,
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Suppanomimi",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back=Suc.PDT,
	})
	-- 30	
	sets.engaged.Haste_30 = set_combine(sets.engaged, { -- This is the same as your standard TP set
		main="Murgleis",
		sub="Almace",
		ammo="Ginsen",
		head=Taeon.Head.TP,
		body="Ayanmo Corazza +2",
		hands=Taeon.Hands.TP,
		legs=Taeon.Legs.TP,
		feet=Taeon.Feet.TP,
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Cessance Earring",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back=Suc.PDT,
	})
	sets.engaged.Acc.Haste_30 = set_combine(sets.engaged.Acc, {
		ammo="Ginsen",
		head=Taeon.Head.TP,
		body="Ayanmo Corazza +2",
		hands=Taeon.Hands.TP,
		legs=Carmine.Legs.DW,
		feet=Taeon.Feet.TP,
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Suppanomimi",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back=Suc.PDT,
	})
    -- 25
    sets.engaged.Haste_25 = set_combine(sets.engaged.Haste_30, { -- If you see a 25% prompt, then you don't have Haste 2
    })
    sets.engaged.Acc.Haste_25 = set_combine(sets.engaged.Acc.Haste_30, {
    })
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
	sets.precast.WS = { --main, sub, and range will be excluded
		ammo="Amar Cluster",
		head="Jhakri Coronal +2",
		body="Ayanmo Corazza +2",
		hands="Atrophy Gloves +3",
		legs="Atrophy Tights +3",
		feet="Jhakri Pigaches +2",
		neck="Sanctity Necklace",
		waist="Kentarch Belt +1",
		left_ear="Mache Earring +1",
		right_ear="Assuage Earring",
		left_ring="Chirich Ring",
		right_ring="Ilabrat Ring",
		back=Suc.WSD,
	}
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, { 
	--MAB > INT > MND > STR
		--ammo="",
		--head="",
		--body="",
		--hands="",
		--legs="",
		--feet="",
		--neck="",
		--waist="",
		--left_ear="",
		--right_ear="",
		--left_ring="",
		--right_ring="",
		--back="",
	})
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, { -- Fotia > MND > Att > Multihit
		ammo="Amar Cluster",
		head=Chir.Head.Acc,
		body="Ayanmo Corazza +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet=Carmine.Legs.MND,
		neck="Fotia Gorget",
		waist="Windbuffet Belt +1",
		left_ear="Brutal Earring",
		right_ear="Sherida Earring",
		left_ring="Hetairoi Ring",
		right_ring="Rufescent Ring",
		back=Suc.PDT,
	})     
    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, { -- MAB > M. Acc > INT = DEX
		--ammo="",
		--head="",
		--body="",
		--hands="",
		--legs="",
		--feet="",
		--neck="",
		--waist="",
		--left_ear="",
		--right_ear="",
		--left_ring="",
		--right_ring="",
		--back="",
	})
    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {-- Bonus TP > WSD > STR > MND
		ammo="Amar Cluster",
		head="Viti. Chapeau +3",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		neck="Caro Necklace",
		waist="Prosilio Belt +1",
		left_ear="Ishvara Earring",
		right_ear="Moonshade Earring",
		left_ring="Rufescent Ring",
		right_ring="Ifrit Ring +1",
		back=Suc.WSD,
	})
    sets.precast.WS['Knights of Round'] = set_combine(sets.precast.WS['Savage Blade'], {
	-- Shares mods with Savage Blade, leave alone
	})		 
    sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, { 
	-- Fotia > CHC(50%) > DEX > Multihit > CHD
		ammo="Yetshila +1",
		head=Taeon.Head.Crit,
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs=Taeon.Legs.Crit,
		feet="Aya. Gambieras +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Mache Earring +1",
		right_ear="Sherida Earring",
		left_ring="Begrudging Ring",
		right_ring="Ilabrat Ring",
		back=Suc.MDT,
	})
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS['Chant du Cygne'], { 
	-- Shares mods with CDC, leave alone
	})     
    sets.precast.WS['Death Blossom'] = set_combine(sets.precast.WS, {-- Fotia > STR > MND > Multihit
		ammo="Amar Cluster",
		head="Viti. Chapeau +3",
		body="Ayanmo Corazza +2",
		hands="Atrophy Gloves +3",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Sherida Earring",
		left_ring="Rufescent Ring",
		right_ring="Ayanmo Ring",
		back=Suc.WSD,
		})
----------------------
-- 	Misc Gear-sets 	--
----------------------
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
	sets.Obi = {waist="Hachirin-no-Obi"}