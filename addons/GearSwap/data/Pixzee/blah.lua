--------------------------------------
    -- Start defining the sets
    --------------------------------------
 
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Viti. Tabard +3"}
 
    sets.precast.Waltz = { -- Waltz set (Waltz Potency >(chr = vit))
	}
 
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
 
    -- Fast cast sets for spells
 
    -- 80% Fast Cast (including trait) for all spells
    -- No other FC sets necessary for Red Mage
    sets.precast.FC = { -- /SCH +10
		head="Atrophy Chapeau +3",
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
		feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
		left_ring="Kishar Ring",
		}
 
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"}) -- Equips and locks the Twilight Cloak when the Impact command is sent
 
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
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
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Magic dmg. taken-10%',}},
		}
		
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMid version isn't found.
	-------------------------------------------------------------------------
	-- With set_combine sets do NOT leave blank fields or gear you don't have.
	-- GearSwap will leave whatever you just happen to be wearing on and we
	-- want it to fall back to your sets.precast.WS set
	-- Remove the "--" from pieces you use
	-------------------------------------------------------------------------
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, { --MAB > INT > MND > STR
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
		head={ name="Chironic Hat", augments={'Accuracy+19 Attack+19','"Dbl.Atk."+2','CHR+6','Accuracy+13','Attack+13',}},
		body="Ayanmo Corazza +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
		neck="Fotia Gorget",
		waist="Windbuffet Belt +1",
		left_ear="Brutal Earring",
		right_ear="Sherida Earring",
		left_ring="Hetairoi Ring",
		right_ring="Rufescent Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
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
		head={ name="Viti. Chapeau +3", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
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
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Magic dmg. taken-10%',}},
		})
		
    sets.precast.WS['Knights of Round'] = set_combine(sets.precast.WS['Savage Blade'], { -- Shares mods with Savage Blade, leave alone
		})		
 
    sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, { -- Fotia > CHC(50%) > DEX > Multihit > CHD
		ammo="Yetshila +1",
		head={ name="Taeon Chapeau", augments={'Accuracy+20 Attack+20','Crit.hit rate+3','Crit. hit damage +3%',}},
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs={ name="Taeon Tights", augments={'Accuracy+20 Attack+20','Crit.hit rate+3','Crit. hit damage +3%',}},
		feet="Aya. Gambieras +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Mache Earring +1",
		right_ear="Sherida Earring",
		left_ring="Begrudging Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Magic dmg. taken-10%',}},
		})
 
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS['Chant du Cygne'], { -- Shares mods with CDC, leave alone
	})
         
    sets.precast.WS['Death Blossom'] = set_combine(sets.precast.WS, {-- Fotia > STR > MND > Multihit
		ammo="Amar Cluster",
		head={ name="Viti. Chapeau +3", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
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
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Magic dmg. taken-10%',}},
		})
 
    -- Midcast Sets
 
    sets.midcast.Utsusemi = { -- Capped gear haste and fill with fastcast.
		ammo="Staunch Tathlum",
		head="Atrophy Chapeau +3",
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
		legs="Aya. Cosciales +2",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst dmg.+6%','INT+4',}},
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
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		body={ name="Kaykaus Bliaut", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
		hands={ name="Kaykaus Cuffs", augments={'MP+60','MND+10','Mag. Acc.+15',}},
		legs="Gyve Trousers",
		feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
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
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		body={ name="Kaykaus Bliaut", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
		hands={ name="Kaykaus Cuffs", augments={'MP+60','MND+10','Mag. Acc.+15',}},
		legs="Gyve Trousers",
		feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
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
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Kaykaus Cuffs", augments={'MP+60','MND+10','Mag. Acc.+15',}},
		legs="Atrophy Tights +3",
		feet={ name="Gende. Galosh. +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -1%','Song recast delay -1',}},
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
		hands={ name="Viti. Gloves +3", augments={'Enhances "Phalanx II" effect',}},
		legs="Atrophy Tights +3",
		feet="Leth. Houseaux +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Andoaa Earring",
		right_ear="Augment. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +6','Enha.mag. skill +6','Mag. Acc.+1','Enh. Mag. eff. dur. +19',}},
	}
	
    sets.midcast.Duration = set_combine(sets.midcast['Enhancing Magic'],{ -- Enh. Ma. Dur. (exclusivly for set_combine, nothing will directly call this set)
		head={ name="Telchine Cap", augments={'Accuracy+15','Enmity-3','Enh. Mag. eff. dur. +8',}},
		body={ name="Telchine Chas.", augments={'Mag. Evasion+25','Enh. Mag. eff. dur. +9',}},
		hands="Atrophy Gloves +3",
		legs={ name="Telchine Braconi", augments={'Accuracy+15 Attack+15','Enh. Mag. eff. dur. +10',}},
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
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Viti. Gloves +3", augments={'Enhances "Phalanx II" effect',}},
		legs="Atrophy Tights +3",
		feet="Leth. Houseaux +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Etiolation Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +6','Enha.mag. skill +6','Mag. Acc.+1','Enh. Mag. eff. dur. +19',}},
		}
 
    sets.midcast['Enhancing Magic'].GainSpells = {-- Gainspell Specific set
		ammo="Regal Gem",
		head="Befouled Crown",
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Viti. Gloves +3", augments={'Enhances "Phalanx II" effect',}},
		legs="Atrophy Tights +3",
		feet="Leth. Houseaux +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +6','Enha.mag. skill +6','Mag. Acc.+1','Enh. Mag. eff. dur. +19',}},
		}
		
    sets.buff.ComposureOther = {-- Composure set when casting on others
		head="Lethargy Chappel +1",
		body="Lethargy Sayon +1",
		hands="Atrophy Gloves +3",
		legs="Lethargy Fuseau +1",
		feet="Lethargy Houseaux +1",
		}
															-- Used to force duration onto Haste
	sets.midcast.Haste = set_combine(sets.midcast.Duration,{-- Fill slots not used in Duration set with Haste > Fastcast
		
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
		main={ name="Egeking", augments={'Accuracy+50','Mag. Acc.+30','"Fast Cast"+8',}},
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
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +6','Enha.mag. skill +6','Mag. Acc.+1','Enh. Mag. eff. dur. +19',}},
	}
	
	sets.midcast.Storm = set_combine(sets.midcast.Duration, { -- Storm Set
	})

    sets.midcast.Regen = set_combine(sets.midcast.Duration,{ -- Fill with Regen Potency
	})

	sets.midcast.Protect = set_combine(sets.midcast.Duration, { --Protect/Shell set
		right_ear="Brachyura earring",
		})
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = sets.midcast.Protect
	sets.midcast.Shellra = sets.midcast.Protect
		
    sets.midcast['Enfeebling Magic'] = { -- Potency > Enfeebling Magic > Magic Accuracy > INT = MND
		main="Murgleis",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head={ name="Viti. Chapeau +3", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
		body="Lethargy Sayon +1",
		hands="Regal Cuffs",
		legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Spell interruption rate down -2%','MND+15','Mag. Acc.+6','"Mag.Atk.Bns."+4',}},
		feet="Vitiation boots +3",
		neck="Incanter's Torque",
		waist="Rumination Sash",
		left_ear="Enfeebling Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10','Mag. Evasion+15',}},
		}
 
    sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], { -- Enfeebling Magic > Magic Accuracy > INT = MND
		main="Murgleis",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head="Atrophy Chapeau +3",
		body="Atrophy Tabard +3",
		hands={ name="Kaykaus Cuffs", augments={'MP+60','MND+10','Mag. Acc.+15',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Spell interruption rate down -2%','MND+15','Mag. Acc.+6','"Mag.Atk.Bns."+4',}},
		feet="Vitiation boots +3",
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Digni. Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10','Mag. Evasion+15',}},
		})
 
    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +3"})
 
    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +3"})
	
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
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10',}},
		}
 
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"}) -- No touchy
 
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
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10',}},
		}

	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], { -- Drain/Aspir Potency set
		head="Pixie Hairpin +1",
		body="Jhakri Robe +2",
		waist="Fucho-no-obi",
		left_ring="Archon Ring",
		right_ring="Evanescence Ring",
		})

	sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {	-- Stun set, Use this to swap out Drain/Aspir Potency from your Dark
		head="Atrophy Chapeau +3",
		hands="Jhakri Cuffs +2",
		waist="Luminary Sash",
		left_ear="Digni. Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring",
		right_ring="Evanescence Ring",
		})														  -- set if any 
 
 	sets.midcast.Trust = sets.precast.FC -- Calls Trusts in Fastcast sets
	
    -- Sets to return to when not performing an action.
 
    -- Resting sets
    sets.resting = { --Resting set, Would you rather have it and not need it or need it and not have it?
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
		
    -- Idle sets
    sets.idle = { -- Refresh, Regen, and DT
		ammo="Staunch Tathlum",
		head={ name="Viti. Chapeau +3", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
		body="Jhakri Robe +2",
		hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
		legs={ name="Lengo Pants", augments={'INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+3','"Refresh"+1',}},
		feet={ name="Chironic Slippers", augments={'Rng.Atk.+8','"Blood Boon"+3','"Treasure Hunter"+2','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
		neck="Bathy Choker",
		waist="Fucho-no-Obi",
		left_ear="Genmei Earring",
		right_ear="Eabani Earring",
		left_ring="Fortified Ring",
		right_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Magic dmg. taken-10%',}},
		}
		
    sets.idle.Town = { -- Crafting gear, Teleport rings, etc.
		main="Murgleis",
		sub="Almace",
		ammo="Ginsen",
		head="Chef's Hat",
		body="Culinarian's Apron",
		hands="Angler's Gloves",
		legs="Fisherman's Hose",
		feet="Fisherman's Boots",
		neck="Culin. Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Cessance Earring",
		left_ring="Dim. Ring (Dem)",
		right_ring="Warp Ring",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		}
 
    sets.idle.Weak = set_combine(sets.idle, {
		})
 
    -- Defense sets
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
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
 
    sets.defense.MDT = { -- MDT Focused Defense Set
		ammo="Ginsen",
		head={ name="Chironic Hat", augments={'Accuracy+19 Attack+19','"Dbl.Atk."+2','CHR+6','Accuracy+13','Attack+13',}},
		body="Ayanmo Corazza +2",
		hands="Atrophy Gloves +3",
		legs="Aya. Cosciales +2",
		feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
		neck="Combatant's Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Eabani Earring",
		left_ring="Fortified Ring",
		right_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
 
    sets.Kiting = {legs="Carmine Cuisses +1"}
 
    sets.latent_refresh = {waist="Fucho-no-obi"}
	
	----------------------------------------
    -- Engaged sets
	----------------------------------------
	
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
 
	-- Normal melee group
	-- /DNC DW is 15%(DW2) and /NIN DW is 25%(DW3) All Further calculations will assume DW3 is active,
	-- Capped Gear Haste (26%), and Haste II
	------------------------------------------------
	----------DO NOT OVERGEAR Dual Wield------------
	------------------------------------------------
	sets.engaged = { -- Self hasted Melee TP Set - 31% DW to cap
		main="Murgleis",
		sub="Almace",
		ammo="Ginsen",
		head={ name="Taeon Chapeau", augments={'Accuracy+25','"Triple Atk."+2','DEX+9',}},
		body="Ayanmo Corazza +2",
		hands={ name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2','DEX+10',}},
		legs={ name="Taeon Tights", augments={'Accuracy+22','"Triple Atk."+2','DEX+10',}},
		feet={ name="Taeon Boots", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','DEX+7',}},
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Cessance Earring",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	
	sets.engaged.Acc = set_combine(sets.engaged, { -- High Accuracy TP Set
		ammo="Ginsen",
		head={ name="Taeon Chapeau", augments={'Accuracy+25','"Triple Atk."+2','DEX+9',}},
		body="Ayanmo Corazza +2",
		hands={ name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2','DEX+10',}},
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet={ name="Taeon Boots", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','DEX+7',}},
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Suppanomimi",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	})

	-- Haste 43%
	sets.engaged.Haste_43 = set_combine(sets.engaged, { -- Capped Haste TP Set - 11% DW to cap
		main="Murgleis",
		sub="Almace",
		ammo="Ginsen",
		head={ name="Taeon Chapeau", augments={'Accuracy+25','"Triple Atk."+2','DEX+9',}},
		body="Ayanmo Corazza +2",
		hands={ name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2','DEX+10',}},
		legs={ name="Taeon Tights", augments={'Accuracy+22','"Triple Atk."+2','DEX+10',}},
		feet={ name="Taeon Boots", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','DEX+7',}},
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Cessance Earring",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	})
	
	sets.engaged.Acc.Haste_43 = set_combine(sets.engaged.Haste_43, {
		ammo="Ginsen",
		head={ name="Taeon Chapeau", augments={'Accuracy+25','"Triple Atk."+2','DEX+9',}},
		body="Ayanmo Corazza +2",
		hands={ name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2','DEX+10',}},
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet={ name="Taeon Boots", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','DEX+7',}},
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Suppanomimi",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	})

	-- 40
	sets.engaged.Haste_40 = set_combine(sets.engaged.Haste_43, { -- 40 Haste TP Set - 16% DW to cap
		main="Murgleis",
		sub="Almace",
		ammo="Ginsen",
		head={ name="Taeon Chapeau", augments={'Accuracy+25','"Triple Atk."+2','DEX+9',}},
		body="Ayanmo Corazza +2",
		hands={ name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2','DEX+10',}},
		legs={ name="Taeon Tights", augments={'Accuracy+22','"Triple Atk."+2','DEX+10',}},
		feet={ name="Taeon Boots", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','DEX+7',}},
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Cessance Earring",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	})

	sets.engaged.Acc.Haste_40 = set_combine(sets.engaged.Acc.Haste_43, {
		ammo="Ginsen",
		head={ name="Taeon Chapeau", augments={'Accuracy+25','"Triple Atk."+2','DEX+9',}},
		body="Ayanmo Corazza +2",
		hands={ name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2','DEX+10',}},
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet={ name="Taeon Boots", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','DEX+7',}},
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Suppanomimi",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	})

	-- 30	
	sets.engaged.Haste_30 = set_combine(sets.engaged, { -- This is the same as your standard TP set
		main="Murgleis",
		sub="Almace",
		ammo="Ginsen",
		head={ name="Taeon Chapeau", augments={'Accuracy+25','"Triple Atk."+2','DEX+9',}},
		body="Ayanmo Corazza +2",
		hands={ name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2','DEX+10',}},
		legs={ name="Taeon Tights", augments={'Accuracy+22','"Triple Atk."+2','DEX+10',}},
		feet={ name="Taeon Boots", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','DEX+7',}},
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Cessance Earring",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	})

	sets.engaged.Acc.Haste_30 = set_combine(sets.engaged.Acc, {
		ammo="Ginsen",
		head={ name="Taeon Chapeau", augments={'Accuracy+25','"Triple Atk."+2','DEX+9',}},
		body="Ayanmo Corazza +2",
		hands={ name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2','DEX+10',}},
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet={ name="Taeon Boots", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','DEX+7',}},
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Suppanomimi",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	})

    -- 25
    sets.engaged.Haste_25 = set_combine(sets.engaged.Haste_30, { -- If you see a 25% prompt, then you don't have Haste 2
    })
	
    sets.engaged.Acc.Haste_25 = set_combine(sets.engaged.Acc.Haste_30, {
    })
	
    -- Sets for special buff conditions on spells.
 
    sets.buff.Saboteur = {hands="Lethargy Gantherots +1"}
	
	sets.Obi = {waist="Hachirin-no-Obi"} --Elemental Obi will be equiped if weather is present