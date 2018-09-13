include('augments.lua')
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
		main="Nixxer",
		ammo="Staunch Tathlum",
        head="Souveran schaller +1",
        body="Rev. Surcoat +2",
		hands="Souv. Handsch. +1",
		legs="Carmine cuisses +1",
        feet="Souveran schuhs +1",
		neck="Loricate Torque",
		ear1="Thureous earring",
		ear2="Hearty earring",
        ring1="Warp ring",
        ring2="Vocane ring",
        back=Rudian.FC,
		waist="Flume belt"
	}
	sets.idle.PDT = set_combine(sets.idle, {
		legs="Chevalier's cuisses +1",
		ring1="Defending ring",
		ear1="Thureous earring",
		ear2="Hearty earring",
	})
	sets.idle.Weak = {}
----------------------
-- 	Enmity Gear set --
----------------------
	sets.Enmity = {
		head="Souveran schaller +1",
		body="Souveran cuirass",
		hands="Souveran handschuhs +1",
		legs="Souveran diechlings",
		feet="Chevalier's Sabatons",
		neck="Unmoving Collar",
		ring1="Apeile ring",
		ring2="Apeile ring +1",
		ear1="Friomisi earring",
		ear2="",
		back="Earthcry mantle",
		waist="Creed baudrier",
	}
	sets.midcast.JA = {}
	--[[sets.midcast['Blank Gaze'] = sets.midcast.Enmity
    sets.midcast['Geist Wall'] = sets.midcast.Enmity
    sets.midcast['Jettatura'] = sets.midcast.Enmity]]
    sets.midcast.Stun = sets.midcast.Flash
	sets.midcast.JA['Sentinel'] = sets.Enmity
	sets.midcast.JA['Rampart'] = sets.Enmity
	sets.midcast.JA['Palisade'] = sets.Enmity
	sets.midcast.JA['Fealty'] = sets.Enmity
	sets.midcast.JA['Holy Circle'] = sets.Enmity
--------------------------------------
--		Pre-cast Gear sets			--
--------------------------------------
	--------------------------------------
	--		Fastcast Gear sets			--
	--------------------------------------	
		sets.precast.FC = {
			--main="Vampirism",
			ammo="Incantor stone",
			head="Carmine Mask",
			body=Odyssean.Body.FC,
			hands=Leyline.FC,
			legs="Enif cosciales",
			feet=Odyssean.Feet.FC,
			ring2="Kishar ring", 
			ear1="Halasz earring",
			ear2="Loquacious earring",
			waist="Chuq'aba belt",
			
		}	
	sets.precast.FC.Phalanx = set_combine(sets.precast.FC , {
		waist="Siegel Sash",
	})
	sets.precast.FC.Enlight = sets.precast.FC.Phalanx
	sets.precast.FC['Enlight II'] = sets.precast.FC.Phalanx
	sets.precast.FC.Protect = sets.precast.FC.Phalanx
	sets.precast.FC.Shell = sets.precast.FC.Phalanx
	sets.precast.FC.Crusade = sets.precast.FC.Phalanx   
    sets.precast.FC.Cure = {
		ammo="Impatiens",
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		body={ name="Jumalik Mail", augments={'HP+50','Attack+15','Enmity+9','"Refresh"+2',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Odyssean Cuisses", augments={'AGI+1','Pet: DEX+1','"Fast Cast"+7','Mag. Acc.+9 "Mag.Atk.Bns."+9'}},
		feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+6',}},
		neck="Orunmila's Torque",
		waist="Acerbic Sash +1",
		left_ear="Nourish. Earring +1",
		right_ear="Mendi. Earring",
		left_ring="Lebeche Ring",
		right_ring="Kishar Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10',}},
	} 
	----------------------------------
	--		Job Ability sets		--
	----------------------------------
		sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {
			hands="Cab. Gauntlets",
			ring1="Fenian ring"
		})
		sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity, {
			feet="Chevalier's Sabatons"
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
------------------------
-- Mid cast Gear Sets --
------------------------
	sets.midcast.SIR = {
		ammo="Impatiens",
		feet=Odyssean.Feet.FC,
		ear1="Halasz earring",
	}
	sets.midcast['Cure'] = set_combine(sets.midcast.SIR, {
		head="Souveran schaller +1",
		body="Rev. Surcoat +1",
		hands="Souveran handschuhs +1",
		neck="Diemer gorget",
		ear2="Oneiros earring",
		ring2="Vocane ring",
		back="Solemnity cape",
		waist="Gishdubar sash",
		legs="Souveran diechlings",
		feet="Souveran schuhs +1"
	})
	sets.midcast['Flash'] = set_combine(sets.midcast.SIR, {
		head="Souveran schaller +1",
		body="Souveran cuirass",
		hands="Souveran handschuhs +1",
		legs="Souveran diechlings",
		feet="Chevalier's Sabatons",
		neck="Unmoving Collar",
		ring1="Apeile ring",
		ring2="Apeile ring +1",
		ear2="Friomisi earring",
		back="Earthcry mantle",
		waist="Creed baudrier",
	})
	sets.midcast.EnhancingDuration = {
		head="Carmine mask",
		body="Shabti cuirass",
		hands="Regal gauntlets",
		legs="Carmine cuisses +1",
		neck="Incanter's torque"		
	}
	sets.midcast['Phalanx'] = set_combine(sets.midcast.EnhancingDuration, {
		ammo="Impatiens",
		hands="Souveran handschuhs +1",
		feet="Souveran schuhs +1",
		back="Weard mantle",
		ear1="Halasz earring",
	})
	sets.midcast['Cocoon'] = set_combine(sets.midcast.SIR, {
		
	})
	sets.midcast['Protect V'] = set_combine(sets.midcast.SIR, {
		
	})
	sets.midcast['Shell IV'] = set_combine(sets.midcast.SIR, {
		
	})
	sets.midcast['Blue Magic'] = set_combine(sets.midcast.SIR, {
		head="Souveran schaller +1",
		body="Souveran cuirass",
		hands="Souveran handschuhs +1",
		legs="Souveran diechlings",
		feet="Chevalier's Sabatons",
		neck="Unmoving Collar",
		ring1="Apeile ring",
		ring2="Apeile ring +1",
		ear2="Friomisi earring",
		back="Earthcry mantle",
		waist="Creed baudrier",
	})
	--[[sets.midcast['Jettatura'] = set_combine(sets.midcast.SIR, {
		head="Souveran schaller +1",
		body="Souveran cuirass",
		hands="Souveran handschuhs +1",
		legs="Souveran diechlings",
		feet="Chevalier's Sabatons",
		neck="Unmoving Collar",
		ring1="Apeile ring",
		ring2="Apeile ring +1",
		ear1="Friomisi earring",
		ear2="",
		back="Earthcry mantle",
		waist="Creed baudrier",
	})
	sets.midcast['Geist Wall'] = set_combine(sets.midcast.SIR, {
		head="Souveran schaller +1",
		body="Souveran cuirass",
		hands="Souveran handschuhs +1",
		legs="Souveran diechlings",
		feet="Chevalier's Sabatons",
		neck="Unmoving Collar",
		ring1="Apeile ring",
		ring2="Apeile ring +1",
		ear1="Friomisi earring",
		ear2="",
		back="Earthcry mantle",
		waist="Creed baudrier",
	})
	sets.midcast['Blank Gaze'] = set_combine(sets.midcast.SIR, {
		head="Souveran schaller +1",
		body="Souveran cuirass",
		hands="Souveran handschuhs +1",
		legs="Souveran diechlings",
		feet="Chevalier's Sabatons",
		neck="Unmoving Collar",
		ring1="Apeile ring",
		ring2="Apeile ring +1",
		ear1="Friomisi earring",
		ear2="",
		back="Earthcry mantle",
		waist="Creed baudrier",
	})]]
	sets.midcast['Reprisal'] = set_combine(sets.midcast.EnhancingDuration, {
		ammo="Staunch tathlum",
		feet=Odyssean.Feet.FC,
		ear1="Halasz earring",
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
		
	})
	sets.idle.Weak.Reraise = set_combine(sets.idle.PDT, sets.Reraise)
	sets.defense.Reraise = set_combine(sets.idle.PDT, sets.Reraise)
-----------------------
-- Engaged Gear Sets --
-----------------------	
	sets.engaged = {
		head="Souveran schaller +1",
		body="Rev. Surcoat +2",
		hands="Souveran handsch. +1",
		legs="Souveran diechlings",
		feet="Souveran schuhs +1"
	}
	sets.engaged.Ochain = set_combine(sets.idle.PDT, {
		head="Souveran schaller +1",
		body="Sulevia's breastplate +2",
		hands="Souv. Handsch. +1"
		
	})
	sets.engaged.Caladbolg = set_combine(sets.engaged.Ochain, { 
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Souveran cuirass",
		hands="Flam. manopolas +2",
		legs=Odyssean.Legs.TP,
		feet="Flam. gambieras +2",
		neck="Lissome necklace",
		ear1="Telos earring",
		ear2="Cessance earring",
		ring1="Flamma ring",
        ring2="Chirich Ring",
	})
	sets.engaged.Dynamis = set_combine(sets.idle.PDT, {
		hands="Souv. Handsch. +1"
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
	sets.precast.WS['Aeolian Edge']={
		ammo="Pemphredo Tathlum",
		head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
		body={ name="Found. Breastplate", augments={'Accuracy+11','Mag. Acc.+10','Attack+10','"Mag.Atk.Bns."+9',}},
		hands={ name="Founder's Gauntlets", augments={'STR+10','Attack+15','"Mag.Atk.Bns."+15','Phys. dmg. taken -5%',}},
		legs={ name="Odyssean Cuisses", augments={'"Mag.Atk.Bns."+29','Accuracy+24','Accuracy+17 Attack+17','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
		feet={ name="Founder's Greaves", augments={'VIT+10','Accuracy+15','"Mag.Atk.Bns."+15','Mag. Evasion+15',}},
		neck="Eddy Necklace",
		waist="Eschan Stone",
		left_ear="Crematio Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Rudianos's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},
	}
	sets.precast.WS['Requiescat']={
		ammo="Quartz Tathlum +1",
		head={ name="Valorous Mask", augments={'Accuracy+27','"Dbl.Atk."+3','DEX+10',}},
		body={ name="Valorous Mail", augments={'Accuracy+22 Attack+22','Weapon Skill Acc.+10','DEX+3','Accuracy+6',}},
		hands="Sulev. Gauntlets +2",
		legs="Sulev. Cuisses +2",
		feet="Sulev. Leggings +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Brutal Earring",
		right_ear="Telos Earring",
		left_ring="Rufescent Ring",
		right_ring="Levia. Ring +1",
		back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}	
	sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head=Odyssean.Helm.VitWS,
		body="Nzingha cuirass",
		hands=Odyssean.Hands.VitWS,
		legs=Odyssean.Legs.VitWS,
		feet="Sulev. Leggings +2", 
		ear1="Ishvara earring",
		ring1="Regal ring",
		ring2="Titan ring",
		neck="Fotia gorget",
		waist="Fotia belt",
		back=Ankou.VitWS
	})