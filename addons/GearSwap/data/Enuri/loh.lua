    --------------------------------------
    -- Precast sets
    --------------------------------------
    
    -- Precast sets to enhance JAs -- Fill in with what you have.
    sets.precast.JA['Invincible'] = {legs="Caballarius Breeches +1"}
    sets.precast.JA['Holy Circle'] = {feet="Reverence Leggings +1"}
    sets.precast.JA['Fealty'] = {body="Caballarius Surcoat +1"}
    sets.precast.JA['Divine Emblem'] = {feet="Chevalier's Sabatons +1"}
    sets.precast.JA['Cover'] = {head="Reverence Coronet +1"}
	sets.precast.Enmity = {-- Enmity
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands="Valor Gauntlets +2",
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Unmoving Collar",
		waist="Goading Belt",
		right_ear="Friomisi Earring",
		left_ring="Petrov Ring",
		right_ring="Apeile Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','HP+20','Enmity+10',}},
		}
    sets.precast.JA['Sentinel'] = sets.precast.Enmity	
    sets.precast.JA['Rampart'] = sets.precast.Enmity	
    sets.precast.JA['Provoke'] = sets.precast.Enmity
    sets.precast.JA['Warcry'] = sets.precast.Enmity
	
	sets.precast.JA['Shield Bash'] = {-- Enmity
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands="Valor Gauntlets +2",
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Unmoving Collar",
		waist="Goading Belt",
		right_ear="Friomisi Earring",
		left_ring="Petrov Ring",
		right_ring="Apeile Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','HP+20','Enmity+10',}},
		}
		
    sets.precast.JA['Chivalry'] = { --MP recovered = TP×0.5 + TP×0.015×MND (Stack MND)
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Unmoving Collar",
		waist="Goading Belt",
		right_ear="Friomisi Earring",
		left_ring="Petrov Ring",
		right_ring="Apeile Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','HP+20','Enmity+10',}},
		}
    
    sets.precast.Waltz = {-- Waltz set (Waltz Potency >(chr = vit))
		ammo="",
		head="",
		body="",
		hands="",
		legs="",
		feet="",
		neck="",
		waist="",
		left_ear="",
		right_ear="",
		left_ring="",
		right_ring="",
		back="",
		}
        
    sets.precast.Waltz['Healing Waltz'] = {-- Don't need any special gear for Healing Waltz.
	} 
    
    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {-- All forms of Fastcast cap at 80%
		Ammo="Incantor Stone",
		head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
		body="Rev. Surcoat +3",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}},
		feet={ name="Odyssean Greaves", augments={'Mag. Acc.+5','"Fast Cast"+4','STR+7',}},
		waist="Tempus Fugit",
		right_ear="Loquac. Earring",
		right_ring="Prolix Ring",
		back={ name="Rudianos's Mantle", augments={'"Fast Cast"+10',}},
		}

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC), {
		neck="Diemer Gorget",
		left_ear="Nourish. Earring +1",
		right_ear="Mendi. Earring",
		} 
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist="Siegel Sash"
		})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {-- Default set for any weaponskill that isn't any more specifically defined
		ammo="Amar Cluster",
		head={ name="Valorous Mask", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+10','Accuracy+3','Attack+12',}},
		body={ name="Odyss. Chestplate", augments={'Accuracy+29','Weapon skill damage +2%','AGI+2','Attack+12',}},
		hands={ name="Odyssean Gauntlets", augments={'Accuracy+30','Weapon skill damage +2%','STR+8','Attack+3',}},
		legs={ name="Odyssean Cuisses", augments={'Weapon skill damage +5%','Pet: INT+1','Accuracy+9 Attack+9','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		feet="Sulev. Leggings +2",
		neck="Caro Necklace",
		waist="Grunfeld Rope",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		right_ear="Ishvara Earring",
		left_ring="Rufescent Ring",
		right_ring="Shukuyu Ring",
		back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		}

    sets.precast.WS.Acc = {
		ammo="Amar Cluster",
		head="Sulevia's Mask +2",
		body="Sulevia's Plate. +2",
		hands={ name="Odyssean Gauntlets", augments={'Accuracy+30','Weapon skill damage +2%','STR+8','Attack+3',}},
		legs={ name="Odyssean Cuisses", augments={'Weapon skill damage +5%','Pet: INT+1','Accuracy+9 Attack+9','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		feet="Sulev. Leggings +2",
		neck="Fotia Gorget",
		waist="Grunfeld Rope",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		right_ear="Ishvara Earring",
		left_ring="Rufescent Ring",
		right_ring="Chirich Ring",
		back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {-- Fotia > MND > Att > Multihit
		ammo="Amar Cluster",
		head="Flam. Zucchetto +2",
		body={ name="Emicho Haubert", augments={'HP+50','DEX+10','Accuracy+15',}},
		hands="Sulev. Gauntlets +2",
		legs="Sulev. Cuisses +2",
		feet="Sulev. Leggings +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		right_ear="Brutal Earring",
		left_ring="Hetairoi Ring",
		right_ring="Rufescent Ring",
		back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		})
    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {--Accuracy Set for Requiescat
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

    sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {-- Fotia > CHC(50%) > DEX > Multihit > CHD
		ammo="Jukukik Feather",
		head="Flam. Zucchetto +2",
		body={ name="Emicho Haubert", augments={'HP+50','DEX+10','Accuracy+15',}},
		hands="Flam. Manopolas +2",
		legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
		feet={ name="Valorous Greaves", augments={'Accuracy+18 Attack+18','"Dbl.Atk."+2','DEX+14','Accuracy+14','Attack+15',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		right_ear="Brutal Earring",
		left_ring="Begrudging Ring",
		right_ring="Flamma Ring",
		back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
		})
    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {-- Accuracy Set for Chant du Cygne
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

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {--Bonus TP > WSD > STR > MND
		ammo="Amar Cluster",
		head={ name="Valorous Mask", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+10','Accuracy+3','Attack+12',}},
		body={ name="Odyss. Chestplate", augments={'Accuracy+23 Attack+23','Weapon skill damage +4%','DEX+5',}},
		hands={ name="Odyssean Gauntlets", augments={'Accuracy+30','Weapon skill damage +2%','STR+8','Attack+3',}},
		legs={ name="Odyssean Cuisses", augments={'Weapon skill damage +5%','Pet: INT+1','Accuracy+9 Attack+9','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		feet="Sulev. Leggings +2",
		neck="Caro Necklace",
		waist="Grunfeld Rope",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		right_ear="Ishvara Earring",
		left_ring="Rufescent Ring",
		right_ring="Shukuyu Ring",
		back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS, {--Accuracy Set for Savage Blade
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

    sets.precast.WS['Sanguine Blade'] = {--MAB > INT > MND > STR
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body={ name="Found. Breastplate", augments={'Accuracy+15','Mag. Acc.+15','Attack+15','"Mag.Atk.Bns."+15',}},
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
		legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}},
		feet={ name="Founder's Greaves", augments={'VIT+10','Accuracy+15','"Mag.Atk.Bns."+15','Mag. Evasion+15',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Archon Ring",
		right_ring="Arvina Ringlet +1",
		back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		}
    
    sets.precast.WS['Atonement'] = {--WSD > BonusTP/Fotia > Enmity (Fotia Functions as +100 TP Bonus for this WS)
		ammo="Amar Cluster",
		head={ name="Valorous Mask", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+10','Accuracy+3','Attack+12',}},
		body={ name="Odyss. Chestplate", augments={'Accuracy+29','Weapon skill damage +2%','AGI+2','Attack+12',}},
		hands={ name="Odyssean Gauntlets", augments={'Accuracy+30','Weapon skill damage +2%','STR+8','Attack+3',}},
		legs={ name="Odyssean Cuisses", augments={'Weapon skill damage +5%','Pet: INT+1','Accuracy+9 Attack+9','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		feet="Sulev. Leggings +2",
		neck="Caro Necklace",
		waist="Grunfeld Rope",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		right_ear="Ishvara Earring",
		left_ring="Rufescent Ring",
		right_ring="Shukuyu Ring",
		back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		}
    
    ---------------------------------------------------------------------------------
    -- Midcast sets -- These Will NOT Function when in a Defense Mode and Engaged. --
    ---------------------------------------------------------------------------------

    sets.midcast.FastRecast = { -- Fall back set for any future missing pieces, You'll want to aim for capped Gear Haste and Fastcast
		Ammo="Incantor Stone",
		head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
		body="Rev. Surcoat +3",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}},
		feet={ name="Odyssean Greaves", augments={'Mag. Acc.+5','"Fast Cast"+4','STR+7',}},
		waist="Tempus Fugit",
		right_ear="Loquac. Earring",
		right_ring="Prolix Ring",
		back={ name="Rudianos's Mantle", augments={'"Fast Cast"+10',}},
		}
        
    sets.midcast.Enmity = {--Enmity set for spells	
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Unmoving Collar",
		waist="Goading Belt",
		right_ear="Friomisi Earring",
		left_ring="Petrov Ring",
		right_ring="Apeile Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','HP+20','Enmity+10',}},
		}

    sets.midcast.Flash = set_combine(sets.midcast.Enmity, {--Used to force flash to use the above Emnity set
	})
    
    sets.midcast.Stun = sets.midcast.Flash
    
    sets.midcast.Cure = {--Healy bits
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Loricate Torque +1",
		waist="Gishdubar sash",
		left_ear="Odnowa Earring +1",
		right_ear="Mendi. Earring",
		left_ring="Vocane Ring",
		right_ring="Moonbeam Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','HP+20','Enmity+10',}},
		}
    sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {--Self Help Section (Included are example pieces)
		})

    sets.midcast['Enhancing Magic'] = {-- Enh. Ma. Skill > Conserve MP
		ammo="Pamphredo Tathlum",
		head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		neck="Enhancing Torque",
		waist="Cascade Belt",
		}
	
	sets.midcast['Divine Magic'] = {
		head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
		body="Rev. Surcoat +3",
		waist="Asklepian Belt",
		}
		
    sets.midcast.Duration = set_combine(sets.midcast['Enhancing Magic'],{ -- Enh. Ma. Dur. (exclusivly for set_combine, nothing will directly call this set)
		body="Shabti Cuirass",
		})
    
	sets.midcast.Phalanx = set_combine(sets.midcast.Duration, { -- Balance potency/duration how you choose, Formula is: F = 28 + Floor( (Enhancing Magic Skill - 300.5) / 28.5)
		ammo="Staunch Tathlum",
		head={ name="Yorium Barbuta", augments={'Phalanx +3',}},
		body={ name="Yorium Cuirass", augments={'Phalanx +2',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Yorium Cuisses", augments={'Phalanx +2',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Enhancing Torque",
		waist="Nierenschutz",
		left_ear="Odnowa Earring +1",
		right_ear="Loquac. Earring",
		left_ring="Defending Ring",
		right_ring="Moonbeam Ring",
		back={ name="Weard Mantle", augments={'VIT+1','DEX+1','Enmity+4','Phalanx +5',}},
		})
		
	sets.midcast.Reprisal = set_combine(sets.midcast.Duration, { -- Forces Reprisal to use Duration
		})
	
	sets.midcast.Protect = set_combine(sets.midcast.Duration, { --Protect/Shell set
		left_ring="Sheltered Ring",
		})
	sets.midcast.Shell = sets.midcast.Protect
    
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
    
    sets.resting = {--Dunno if PLD uses this, but here it is if you do.
	}
    

    -- Idle sets
    sets.idle = { -- Refresh, Regen, and DT
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Chev. Cuisses +1",
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Loricate Torque +1",
		waist="Nierenschutz",
		left_ear="Odnowa Earring +1",
		right_ear="Thureous Earring",
		left_ring="Defending Ring",
		right_ring="Moonbeam Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','HP+20','Enmity+10',}},
		}

    sets.idle.Town = { -- Crafting gear, Teleport rings, etc.
		ammo="Staunch Tathlum",
		head="Shaded Specs.",
		body="Goldsmith's Apron",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Goldsm. Torque",
		waist="Nierenschutz",
		left_ear="Odnowa Earring +1",
		right_ear="Infused Earring",
		left_ring="Artificer's Ring",
		right_ring="Craftmaster's Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','HP+20','Enmity+10',}},
		}
    
    sets.idle.Weak = set_combine(sets.idle, { -- Idle Weak Set
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
    
    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
    
    sets.Kiting = {legs="Carmine Cuisses +1"}--Movement Set

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.MP = {--MP Return Set, adjust as needed.
		head="Chev. Armet +1",
		feet="Rev. Leggings +3",
		waist="Flume Belt",
		}
    -- Basic defense sets.
        
    sets.defense.PDT = {--Physical Defense Set
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Chev. Cuisses +1",
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Loricate Torque +1",
		waist="Nierenschutz",
		left_ear="Odnowa Earring +1",
		right_ear="Thureous Earring",
		left_ring="Defending Ring",
		right_ring="Moonbeam Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','HP+20','Enmity+10',}},
		}
    sets.defense.HP = {--MAX HP Set
		ammo="",
		head="",
		body="",
		hands="",
		legs="",
		feet="",
		neck="",
		waist="",
		left_ear="",
		right_ear="",
		left_ring="",
		right_ring="",
		back="",
		}
    sets.defense.Reraise = {--Defense Set with Twilight
		ammo="Staunch Tathlum",
		head="Twilight Helm",
		body="Twilight Mail",
		hands="Sulev. Gauntlets +2",
		legs="Arke Cosciales",
		feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
		neck="Loricate Torque +1",
		waist="Nierenschutz",
		left_ear="Odnowa Earring +1",
		right_ear="Thureous Earring",
		left_ring="Defending Ring",
		right_ring="Vocane Ring",
		back="Solemnity Cape",
		}
    sets.defense.Charm = {--Resist Charm Set
		legs="Arke Cosciales",
		neck="Unmoving Collar",
		right_ear="Hearty Earring",
		back="Solemnity Cape",
		}
    -- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.MDT = {--MDT/M.Evasion Set
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Chev. Cuisses +1",
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Loricate Torque +1",
		waist="Nierenschutz",
		left_ear="Odnowa Earring +1",
		right_ear="Thureous Earring",
		left_ring="Defending Ring",
		right_ring="Moonbeam Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','HP+20','Enmity+10',}},
		}


    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    sets.engaged = {--Engaged Set
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body={ name="Odyss. Chestplate", augments={'Accuracy+22','"Dbl.Atk."+5','DEX+5','Attack+14',}},
		hands="Flam. Manopolas +2",
		legs={ name="Valor. Hose", augments={'Accuracy+28','"Store TP"+7','DEX+15','Attack+11',}},
		feet="Flam. Gambieras +2",
		neck="Lissome Necklace",
		waist="Sailfi Belt +1",
		left_ear="Cessance Earring",
		right_ear="Brutal Earring",
		left_ring="Flamma Ring",
		right_ring="Petrov Ring",
		back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
		}

    sets.engaged.Acc = {--Engaged/Accuracy Set
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Flamma Korazin +1",
		hands="Flam. Manopolas +2",
		legs="Flamma Dirs +2",
		feet="Flam. Gambieras +2",
		neck="Combatant's Torque",
		waist="Sailfi Belt +1",
		left_ear="Cessance Earring",
		right_ear="Zwazo Earring",
		left_ring="Flamma Ring",
		right_ring="Chirich Ring",
		back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
		}

    sets.engaged.DW = {--Engaged Dual Wield Set if you ever need it.
		ammo="Ginsen",
        head="Otomi Helm",
		neck="Asperity Necklace",
		ear1="Dudgeon Earring",
		ear2="Heartseeker Earring",
        body="Gorney Haubert +1",
		hands="Cizin Mufflers",
		ring1="Rajas Ring",
		ring2="K'ayres Ring",
        back="Atheling Mantle",
		waist="Cetl Belt",
		legs="Cizin Breeches",
		feet="Whirlpool Greaves",
		}

    sets.engaged.DW.Acc = {--Engaged Dual Wield Set
		--[[ammo="",
		head="",
		body="",
		hands="",
		legs="",
		feet="",
		neck="",
		waist="",
		left_ear="",
		right_ear="",
		left_ring="",
		right_ring="",
		back="",--]]
		}

    sets.engaged.PDT = set_combine(sets.engaged, {--Engaged Tank Set
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Chev. Cuisses +1",
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Loricate Torque +1",
		waist="Nierenschutz",
		left_ear="Odnowa Earring +1",
		right_ear="Thureous Earring",
		left_ring="Defending Ring",
		right_ring="Moonbeam Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','HP+20','Enmity+10',}},
		})
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, {--Engaged Tank set + Accuracy
		ammo="Staunch Tathlum",
		head="Flam. Zucchetto +2",
		body="Sulevia's Plate. +2",
		hands="Sulev. Gauntlets +2",
		legs="Arke Cosciales",
		feet="Flam. Gambieras +2",
		neck="Loricate Torque +1",
		waist="Tempus Fugit",
		left_ear="Cessance Earring",
		right_ear="Brutal Earring",
		left_ring="Defending Ring",
		right_ring="Vocane Ring",
		back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
		})
    sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)--Adds Twilight to your Engaged Set
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)--Adds Twilight to your Engaged Accuracy Set
	
    sets.engaged.DW.PDT = set_combine(sets.engaged.DW, {--Dual Wield/PDT set.
	})
    sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc, {--Dual Wield Accuracy Set
	})
    sets.engaged.DW.Reraise = set_combine(sets.engaged.DW, sets.Reraise)--Dual Wield/Reraise set
    sets.engaged.DW.Acc.Reraise = set_combine(sets.engaged.DW.Acc, sets.Reraise)--Dual Wield Accuracy/Reraise Set


    --------------------------------------
    -- Custom buff sets
    --------------------------------------
	sets.HPDrain = {neck="Berserker's Torque"}--Anti-sleep set
    sets.buff.Doom = {-- Doom Set, Fill with what you have, Examples included.
		waist="Gishdubar Sash",
		left_ring="Purity Ring",
		right_ring="Saida Ring",
		}
    sets.buff.Cover = {head="Reverence Coronet +1", body="Caballarius Surcoat +1"}--Cover set