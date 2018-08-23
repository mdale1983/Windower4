include('augments.lua')
----------------------
--	Field/Town Idle	--
----------------------
 sets.idle = {
		ammo="Staunch Tathlum",
		head="Meghanada visor +1",
		neck="Twilight torque",
		ear1="Odnowa Earring",
		ear2="Odnowa Earring +1",
		body="Meghanada Cuirie +2",
		hands="Meg. Gloves +1",
		ring1="Warp Ring",
		ring2="Vocane ring",
		back="Solemnity Cape",
		waist="Flume Belt",
		legs="Meghanada Chausses +1",
		feet="Fajin Boots"
	}
         
    sets.idle.Regen = set_combine(sets.idle, {
		head="Ocelomeh Headpiece +1",
		neck="Wiglen Gorget",
		ring1="Sheltered Ring",
		ring2="Paguroidea Ring"
	})
------------------------------------------
--	 Special sets (required by rules)	--
------------------------------------------
    sets.TreasureHunter = {
		hands="Plunderer's Armlets", 
		feet="Skulker's Poulaines", 
		waist="Chaac Belt"
	}
    sets.ExtraRegen = {
		head="Ocelomeh Headpiece +1",
		neck="Wiglen Gorget",
		ring1="Sheltered Ring",
		ring2="Paguroidea Ring"
	}
    sets.Kiting = {
		feet="Jute Boots +1"
	}
    sets.buff['Sneak Attack'] = {
		ammo="Yetshila",
        head="Adhemar Bonnet",
		neck="Caro Necklace",
		ear1="Brutal Earring",
		ear2="Cessance Earring",
        body="Abnoba Kaftan",
		hands="Plunderer's Armlets +1",
		ring1="Ramuh Ring +1",
		ring2="Epona's Ring",
        back=thf_crit,
		waist="Chaac Belt",
		legs="Pillager's Culottes +3",
		feet="Skulker's Poulaines +1"
	}
    sets.buff['Trick Attack'] = set_combine(sets.buff['Sneak Attack'], {
		ring1="Garuda Ring"
	})
------------------------------------------
-- 	Actions we want to use to tag TH.	--
------------------------------------------
    sets.precast.Step = set_combine(sets.TreasureHunter, {})
    sets.precast.Flourish1 = set_combine(sets.TreasureHunter, {})
    sets.precast.JA.Provoke = set_combine(sets.TreasureHunter, {})
--------------------------
--	Precast Gearsets	--
--------------------------
	sets.precast.JA['Collaborator'] = {
		head="Skulker's Bonnet +1"
	}
    sets.precast.JA['Accomplice'] = {
		head="Skulker's Bonnet +1"
	}
    sets.precast.JA['Assassins Charge'] = {
		feet="Plunderer's Poulaines +1"
	}
    sets.precast.JA['Ambush'] = {}
    sets.precast.JA['Flee'] = {
		feet="Pillager's Poulaines +1"
	}
    sets.precast.JA['Hide'] = {
		body="Pillager's Vest +2"
	}
    sets.precast.JA['Conspirator'] = {
		body="Skulker's Vest"
	}
    sets.precast.JA['Steal'] = {
		hands="Pillager's Armlets +1",
		legs="Pillager's Culottes +3",
		feet="Pillager's Poulaines +1"
	}
    sets.precast.JA['Despoil'] = {
		feet="Skulker's Poulaines +1"
	}
    sets.precast.JA['Perfect Dodge'] = {
		hands="Plunderer's Armlets +1"
	}
    sets.precast.JA['Feint'] = {
		legs="Plunderer's Culottes +1"
	}
    sets.precast.JA['Sneak Attack'] = set_combine(sets.buff['Sneak Attack'])
    sets.precast.JA['Trick Attack'] = set_combine(sets.buff['Trick Attack'])
    sets.precast.JA['Mug'] = set_combine(sets.precast.WS, {
		ammo="Jukukik Feather",
		head="Adhemar Bonnet",
		ear1="Suppanomimi",
		ear2="Sherida Earring",
        waist="Grunfeld Rope",
		legs=herc_legs_DEXCRIT,
		feet=herc_feet_TA
	})
    organizer_items = {
        "Taming Sari",
        "Raider's Boomerang",
        "Aeneas",
        "Oneiros Knife"
	}
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		waist="Gishdubar Sash"
		--ring1="Kunaji Ring",
	}
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    -- Fast cast sets for spells
    sets.precast.FC = {
		ammo="Impatiens",
		neck="Orunmila's Torque",
		ear1="Enchanter Earring +1",
		ear2="Loquacious Earring",
        head=herc_head_DT,
		body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Kishar Ring",
		ring2="Veneficium Ring"
	}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		neck="Magoraga Beads"
	})
    -- Ranged snapshot gear
    sets.precast.RA = {}
--------------------------
--	Midcast Gearsets	--
--------------------------
	sets.midcast.FastRecast = {}
    ---------------------
	-- Specific spells --
	---------------------
    sets.midcast.Utsusemi = {
		ammo="Staunch Tathlum",
        head=herc_head_DT,
		neck="Magoraga Beads",
		ear1="Enchanter Earring +1",
		ear2="Loquacious Earring",
        body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Kishar Ring",
		ring2="Prolix Ring",
        back="Moonbeam Cape",
		waist="Flume Belt",
		legs="Meghanada Chausses +2",
		feet=herc_feet_PDT
	}
    -- Ranged gear
    sets.midcast.RA = {}
    sets.midcast.RA.Acc = {}
--------------------------
--	Engaged Gearsets	--
--------------------------
	-- Normal melee group
    -- THF Native DW Trait: 25% DWIII + 5% 550JP Gift
    -- No Haste (Need 44 DW)
    -- (Aeneas/Sari) Accuracy 1080, Attack 1140
    sets.engaged = {
		ammo="Yamarang",
        head="Adhemar Bonnet",
		neck="Lissome necklace",
		ear1="Telos Earring",
		ear2="Suppanomimi",
        body="Adhemar Jacket",
		hands=Herc.Hands.WS,
		ring1="Chirich Ring",
		ring2="Epona's Ring",
        back="Kayapa cape",
		waist="Kentarch belt +1",
		legs="Samnuha Tights",
		feet=Herc.Feet.WS
	}
    -- (Aeneas/Sari) Accuracy 1097, Attack 1154
    sets.engaged.MidAcc = set_combine (sets.engaged, {
		neck="Combatant's Torque",
		hands="Adhemar Wristbands"
	})    
    -- (Aeneas/Sari) Accuracy 1189, Attack 1163
    sets.engaged.HighAcc = set_combine(sets.engaged.MidAcc, {
        head="Pillager's Bonnet +3",
		ear2="Dignitary's Earring",
		ring1="Regal Ring",
		waist="Grunfeld Rope"
	})
    -- (Aeneas/Sari) Accuracy 1286, Attack 1141
    sets.engaged.MaxAcc = set_combine(sets.engaged.HighAcc, {
        neck={name="Combatant's Torque", priority=2},
        body="Pillager's Vest +2",
		ring2={name="Ramuh Ring +1", priority=7},
        legs={name="Meghanada Chausses +2", priority=5},
		feet=herc_feet_ACC
	})     
    -- Normal melee group, 15% Haste (Need 37 DW) 
    sets.engaged.MidHaste = set_combine(sets.engaged, {})
    sets.engaged.MidAcc.MidHaste = set_combine(sets.engaged.MidAcc, {})
    sets.engaged.HighAcc.MidHaste = set_combine(sets.engaged.HighAcc, {})
    sets.engaged.MaxAcc.MidHaste = set_combine(sets.engaged.MaxAcc, {})
    -- Normal melee group, 30% Haste (26 DW)
    sets.engaged.HighHaste = set_combine(sets.engaged.MidHaste, {})
    sets.engaged.MidAcc.HighHaste = set_combine(sets.engaged.MidAcc, {})
    sets.engaged.HighAcc.HighHaste = set_combine(sets.engaged.HighAcc, {})
    sets.engaged.MaxAcc.HighHaste = set_combine(sets.engaged.MaxAcc, {})
     
    -- Normal melee group, Capped Haste (Need 6 DW)
    sets.engaged.MaxHaste = set_combine(sets.engaged.HighHaste, {
        ear2="Sherida Earring",
		hands="Adhemar Wristbands",
		waist="Windbuffet Belt +1",
		legs="Pillager's Culottes +3"
	}) 
    sets.engaged.MidAcc.MaxHaste = set_combine(sets.engaged.MaxHaste, {
		head="Skulker's Bonnet +1",
		neck="Combatant's Torque",
		body="Pillager's Vest +2"
	})
    sets.engaged.HighAcc.MaxHaste = set_combine(sets.engaged.HighAcc, {})
    sets.engaged.MaxAcc.MaxHaste = set_combine(sets.engaged.MaxAcc, {})
     
    -- Accuracy: 1216
    sets.engaged.PDT = {
		ammo="Yamarang",
        head="Meghanada Visor +1",
		neck="Loricate Torque +1",
		ear1="Telos Earring",
		ear2="Sherida Earring",
        body="Meghanada Cuirie +2",
		hands="Meghanada Gloves +2",
		ring1="Defending Ring",
		ring2="Moonbeam Ring",
        back=thf_STP,
		waist="Reiki Yotai",
		legs="Meghanada Chausses +2",
		feet=herc_feet_ACC
	}
    sets.engaged.MaxAcc.PDT = set_combine(sets.engaged.PDT, {}) 
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}
------------------------------
--	Weaponskill Gearsets	--
------------------------------
	sets.precast.WS = {
		ammo="Jukukik Feather",
        head="Adhemar Bonnet",
		neck="Caro Necklace",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
        body="Meghanada Cuirie +2",
		hands="Adhemar Wristbands",
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
        back=thf_crit,
		waist="Wanion Belt",
		legs="Samnuha Tights",
		feet="Lustratio Leggings +1"
	}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ammo="Falcon Eye",
		head="Pillager's Bonnet +3",
		waist="Grunfeld Rope"
	})
    sets.precast.WS.SA = set_combine(sets.precast.WS,{})
    sets.precast.WS.SA.Acc = set_combine(sets.precast.WS.SA,{})
    sets.precast.WS.TA = set_combine(sets.precast.WS.SA,{})
    sets.precast.WS.TA.Acc = set_combine(sets.precast.WS.TA,{})
    sets.precast.WS.SATA = set_combine(sets.precast.WS.SA,{})     
    ----------------------
    -- 	Rudra's Storm	--
    ----------------------
    sets.precast.WS['Rudra\'s Storm'] = set_combine(sets.precast.WS, {
		ammo="Seething bomblet",
		head="Adhemar Bonnet",
		body="Adhemar Jacket",
		hands="Meghanada Gloves +1",
		legs="Samnuha tights",
		feet="Adhemar gamashes",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Mache earring",
		waist="Fotia belt",
		back="Kayapa cape"
	})         
    sets.precast.WS['Rudra\'s Storm'].Acc = set_combine(sets.precast.WS['Rudra\'s Storm'], {})  
    sets.precast.WS['Rudra\'s Storm'].SA = set_combine(sets.precast.WS['Rudra\'s Storm'], {
		ammo="Yetshila",
        body="Meghanada Cuirie +2",
		waist="Artful Belt +1",
		back=thf_WSD
	})         
    sets.precast.WS['Rudra\'s Storm'].SA.Acc = set_combine(sets.precast.WS['Rudra\'s Storm'].SA, {})     
    sets.precast.WS['Rudra\'s Storm'].TA = set_combine(sets.precast.WS['Rudra\'s Storm'].SA, {})
    sets.precast.WS['Rudra\'s Storm'].TA.Acc = set_combine(sets.precast.WS['Rudra\'s Storm'].TA, {})
    sets.precast.WS['Rudra\'s Storm'].SATA = set_combine(sets.precast.WS['Rudra\'s Storm'].SA, {})
     
    ----------------------
    -- 	Mandalic Stab	--
    ----------------------
    sets.precast.WS['Mandalic Stab'] = set_combine(sets.precast.WS["Rudra's Storm"], {})         
    sets.precast.WS['Mandalic Stab'].Acc = set_combine(sets.precast.WS["Rudra's Storm"].Acc, {})    
    sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS["Rudra's Storm"].SA, {})       
    sets.precast.WS['Mandalic Stab'].SA.Acc = set_combine(sets.precast.WS["Rudra's Storm"].SA, {})   
    sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS["Rudra's Storm"].SA, {})
    sets.precast.WS['Mandalic Stab'].TA.Acc = set_combine(sets.precast.WS["Rudra's Storm"].TA, {})
    sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS["Rudra's Storm"].SA, {})
     
    ------------------------
    -- 	Evisceration sets --
    ------------------------
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
		ammo="Yetshila",
		head="Pillager's Bonnet +3",
		neck="Fotia Gorget",
		ear2="Sherida Earring",
        ring1="Begrudging Ring",
		waist="Fotia Belt",
		legs="Lustratio Subligar +1"
	})    
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {
		ammo="Falcon Eye",
		waist="Grunfeld Rope"
	})        
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'], {})    
    sets.precast.WS['Evisceration'].SA.Acc = set_combine(sets.precast.WS['Evisceration'].SA, {})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].SA, {})
    sets.precast.WS['Evisceration'].TA.Acc = set_combine(sets.precast.WS['Evisceration'].TA, {})
    sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].SA, {})
     
    -----------------------
    -- 	Exenterator sets --
    -----------------------
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
		ammo="Seething Bomblet +1",
        neck="Fotia Gorget",
		ear1="Telos Earring",
		ear2="Sherida Earring",
        hands="Meghanada Gloves +2",
		ring1="Garuda Ring",
		ring2="Ilabrat Ring",
        back=thf_WSD,
		waist="Fotia Belt",
		legs="Meghanada Chausses +2",
		feet=herc_feet_STRWSD
	})
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'].Mod, {
		ammo="Yetshila"
	})
    sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'].SA, {})
    sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'].SA, {})
