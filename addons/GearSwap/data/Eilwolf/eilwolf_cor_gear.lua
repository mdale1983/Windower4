include('augments.lua')
------------------
-- 	Bullets 	--
------------------
	gear.RAbullet = "Bronze Bullet"
	gear.WSbullet = "Bronze Bullet"
	gear.MAbullet = "Bronze Bullet"
	gear.QDbullet = "Bronze Bullet"
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
        ammo=gear.RAbullet,
        head="Meghanada visor +1",
        neck="Loricate torque +1",
        ear1="Cessance Earring",
        ear2="Telos Earring",
        body="Emet harness +1",
        hands=Herc.Hands.PDT,
        ring1="Warp Ring",
        ring2="Gelatinous ring +1",
    	back="Solemnity Cape",
        waist="Flume Belt",
        legs="Carmine Cuisses +1",
        feet=Herc.Feet.PDT
    }
	sets.idle.PDT = set_combine(sets.idle, {
        legs="Meg. Chausses +1",
		ring1="Defending Ring"
    })
	sets.idle.MagicEva = set_combine(sets.idle,{ 
		 ammo=gear.RAbullet,
        head="Meghanada visor +1",
        neck="Loricate torque +1",
        ear1="Cessance Earring",
        body="Emet harness +1",
        hands=Herc.Hands.PDT,
        ring2="Gelatinous ring +1",
    	back="Solemnity Cape",
        waist="Flume Belt",
        legs="Carmine Cuisses +1",
        feet=Herc.Feet.PDT,
		ring1="Vengeful ring",
		ear2="Etiolation earring",
	})
	sets.idle.Ranged = set_combine(sets.idle,{ 
		main="Fettering blade",
		sub="Nusku shield",
		range="Fomalhaut"
	})
	sets.idle.Melee = set_combine(sets.idle,{ 
		main="Hepatizon sapara +1",
		sub="Hepatizon sapara +1",
		range="Anarchy +3"
	})
	sets.idle.Leaden = set_combine(sets.idle,{ 
		main="Fettering blade",
		sub="Hepatizon rapier +1",
		range="Fomalhaut"
	})
----------------------------------
--		Job Ability sets		--
----------------------------------
	sets.precast.JA['Triple Shot'] = {
		body="Navarch's Frac +2"
	}
	--[[sets.precast.JA['Snake Eye'] = {
		legs="Commodore Culottes +1"
	}]]
	sets.precast.JA['Wild Card'] = {
		feet="Lanun Bottes"
	}
	sets.precast.JA['Random Deal'] = {
		body="Lanun Frac"
	}
	sets.precast.JA['Quick Draw'] = {
		ammo=gear.QDbullet,
        head="Carmine Mask",
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
        body="Samnuha coat",
        hands="Leyline Gloves",
        ring1="Acumen Ring",
        ring2="Garuda Ring",
        back="Gunslinger's Cape",
        waist="Eschan Stone",
        legs="Shneddick Tights +1",
        feet="Lanun Bottes"
	}
	--[[sets.precast.JA['Fold'] = {
		hands="Commodore Gants +2"
	}}]]
	sets.precast.CorsairRoll = {
        range="Compensator",
		head="Lanun Tricorne +1",
        hands="Chasseur's Gants +1",
        body="Lanun Frac +1",
		neck="Regal Necklace",
        back="Camulus's mantle",
        feet="Lanun Bottes"
    }
	sets.precast.CorsairRoll["Samurai Roll"] = set_combine(sets.precast.CorsairRoll, {
		--legs="Navarch's Culottes +1"
	})
	sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {
		feet="Navarch's Bottes +2"
	})
	--[[sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {
		--head="Navarch's Tricorne +1"
	})]]
	sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {
		body="Chasseur's Frac"
	})
	sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {
		hands="Navarch's Gants +2"
	})
	sets.precast.LuzafRing = {
		ring2="Luzaf's Ring"
	}
    --[[sets.precast.FoldDoubleBust = {
		hands="Lanun Gants"
	}]]
--------------------------------------
--		Pre-Cast Gear sets			--
--------------------------------------
	sets.precast.FC = {
		head="Carmine mask +1",
		body="Taeon tabard",
		hands="Leyline gloves",
		legs="Ayanmo cosciales +2",
		feet="Carmine greaves +1",
		neck="Voltsurge torque",
		ear1="Etiolation earring",
		ear2="Loquacious earring",
		ring1="Prolix ring",
		ring2="Kishar ring",
		back=Cam.FC,
		waist="Resolute belt"
	}
	sets.precast.CorsairShot = {}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        --body="Passion Jacket",
        neck="Magoraga Beads",
        --ring2="Lebeche Ring",
    })
	sets.precast.RA = {
        ammo=gear.RAbullet,
        body="Laksa. Frac +2",
		hands="Carmine Fin. Ga. +1",
        waist="Impulse Belt",
        legs="Adhemar Kecks",
        feet="Meg. jam. +1",
		back=Cam.RA
    }
--------------------------
--	Midcast Gear Sets 	--
--------------------------
	sets.midcast.FastRecast = {
		head="Carmine mask +1",
		body="Taeon tabard",
		hands="Leyline gloves",
		legs="Ayanmo cosciales +2",
		feet="Carmine greaves +1",
		neck="Voltsurge torque",
		ear1="Etiolation earring",
		ear2="Loquacious earring",
		ring1="Prolix ring",
		ring2="Kishar ring",
		back=Cam.FC,
		waist="Resolute belt",
    }
	sets.midcast.Utsusemi = sets.midcast.FastRecast
	sets.midcast.CorsairShot = {
        ammo=gear.QDbullet,
        head="Carmine Mask",
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
        body="Samnuha coat",
        hands="Leyline Gloves",
        ring1="Acumen Ring",
        ring2="Garuda Ring",
        back="Gunslinger's Cape",
        waist="Eschan Stone",
        legs="Shneddick Tights +1",
        feet="Lanun Bottes"
    }
	sets.midcast.CorsairShot.Acc = set_combine(sets.midcast.CorsairShot, {
        head="Carmine Mask",
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
        body="Samnuha coat",
        ear1="Lifestorm Earring",
        ear2="Psystorm Earring",
        ring1="Perception Ring",
        ring2="Sangoma Ring",
        feet="Navarch's Bottes +2"
    })
    sets.midcast.CorsairShot['Light Shot'] = sets.midcast.CorsairShot.Acc
	sets.midcast.CorsairShot['Dark Shot'] = sets.midcast.CorsairShot['Light Shot']
	------------------
	-- Ranged gear 	--
	------------------
		sets.midcast.RA.Fomalhaut = { 
			ammo=gear.RAbullet,
			head="Meghanada visor +1",
			neck="Iskur gorget",
			ear1="Enervating Earring",
			ear2="Telos Earring",
			body="Mummu jacket +2",
			hands="Adhemar wristbands",
			ring1="Dingir Ring",
			ring2="Ilabrat Ring",
			back=Cam.RA,
			waist="Eschan stone",
			legs="Adhemar kecks",
			feet="Adhemar gamashes"
		}
		sets.midcast.RA.Gun = set_combine(sets.midcast.RA, {
			
		})
----------------------------------
--		Engaged sets			--
----------------------------------	
	sets.engaged = {
        ammo=gear.RAbullet,
        head="Adhemar bonnet",
        neck="Lissome Necklace",
        ear1="Cessance Earring",
        ear2="Telos Earring",
        body="Adhemar jacket",
        hands=Herc.Hands.WS,
        ring1="Chirich Ring",
        ring2="Ilabrat Ring",
        back=Cam.TP,
        waist="Grunfeld rope",
        legs=Herc.Legs.WS,
        feet=Herc.Feet.WS
    }
	sets.engaged.Melee = {
        ammo=gear.RAbullet,
        head="Meghanada visor +1",
        neck="Lissome Necklace",
        ear1="Cessance Earring",
        ear2="Telos Earring",
        body="Adhemar jacket",
        hands="Adhemar wristbands",
        ring1="Chirich Ring",
        ring2="Epona's Ring",
        back="Camulu's Mantle",
        waist="Grunfeld rope",
        legs="Samnuha Tights",
        feet="Taeon Boots"
    }
	sets.engaged.DW = set_combine(sets.engaged, {
	-- No Magic Haste 
		head="Carmine Mask +1",
		body="Adhemar jacket",		--5
		ear2="Suppanomimi",			--5
		legs="Carmine Cuisses +1",	--6
		feet=Taeon.Feet.DW,			--9
		back=gear.RNG_DW_Cape, 		--10
		ear1="Eabani Earring", 		--4
		waist="Grunfeld rope", 		--7
    })-- 49% DW Needed
    sets.engaged.DW.Haste_25 = set_combine(sets.engaged,  {
	-- 15% Magic Haste 
		body="Adhemar jacket",		--5
		ear2="Suppanomimi",			--5
		legs="Carmine Cuisses +1",	--6
		feet=Taeon.Feet.DW,			--9
		back=gear.RNG_DW_Cape, 		--10
		ear1="Eabani Earring", 		--4
		waist="Grunfeld rope", 		--7
    }) -- 42% DW Needed
    sets.engaged.DW.Haste_30 = set_combine(sets.engaged,  {
	-- 30% Magic Haste 
        body="Adhemar jacket",		--5
		ear2="Suppanomimi",			--5
		legs="Carmine Cuisses +1",	--6
		feet=Taeon.Feet.DW,			--9
		back=gear.RNG_DW_Cape, 		--10
		ear1="Eabani Earring", 		--4
		waist="Grunfeld rope", 		--7
    }) -- 31% DW Needed
    sets.engaged.DW.Haste_40 = set_combine(sets.engaged,  {
	--40% Magic Haste 
        body="Adhemar jacket",		--5
		ear2="Suppanomimi",			--5
		legs="Carmine Cuisses +1",	--6
		feet=Taeon.Feet.DW,			--9
		back=gear.RNG_DW_Cape, 		--10
		ear1="Eabani Earring", 		--4
		waist="Grunfeld rope", 		--7
    }) -- 27% DW Needed
    sets.engaged.DW.Haste_43 = set_combine(sets.engaged,  {
	-- 45% Magic Haste 
        body="Adhemar jacket",		--5
		legs="Carmine Cuisses +1",	--6
	}) -- 11% DW Needed
	sets.engaged.MagicEva = { 
		ammo=gear.RAbullet,
        head="Meghanada visor +1",
        neck="Loricate torque +1",
        ear1="Cessance Earring",
		ear2="Etiolation earring",
        body="Emet harness +1",
        hands=Herc.Hands.PDT,
        ring1="Vengeful Ring",
        ring2="Gelatinous ring +1",
    	back="Solemnity Cape",
        waist="Flume Belt",
        legs="Carmine Cuisses +1",
        feet=Herc.Feet.PDT
	}
----------------------------------------------
--			Weaponskill Gearsets			--
----------------------------------------------
	sets.precast.WS = {
        head="Meghanada visor +1",
        neck="Fotia Gorget",
        ear1="Flame Pearl",
        ear2="Flame Pearl",
        body="Adhemar jacket",
		hands="Meghanada gloves +1",
        ring1="Karieyh Ring",
        ring2="Regal Ring",
		back="Buquwik Cape",
        waist="Fotia belt",
        legs="Meghanada chausses +1",
        feet="Meghanada jambeaux +1"
    }
	sets.precast.WS['Savage Blade'] = {
		head=Herc.Head.STRWS,
		body="Laksa. frac +2",
		hands="Meghanada gloves +1",
		legs=Herc.Legs.StrWS,
		feet=Herc.Feet.WS,
		neck="Fotia Gorget",
		ear1="Ishvara earring",
		ear2="Brutal earring",
		ring1="Karieyh ring",
		ring2="Regal ring",
		waist="Fotia belt",
		back=Cam.TP
	}
	sets.precast.WS['Detonator'] = set_combine(sets.precast.WS, {
		ammo=gear.WSbullet,
		hands="Meg. Gloves +1",
		ear1="Ishvara earring",
		ring1="Petrov ring",
		ring2="Karieyh ring",
		back="Gunslinger's cape",
	})
	sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, {
        ammo=gear.WSbullet,
		head=Herc.Head.RWS,
		body="Laksa. frac +2",
		hands="Meghanada gloves +1",
		legs=Herc.Legs.RWS,
		feet=Herc.Feet.RWS,
		neck="Fotia gorget",
		ring1="Karieyh ring",
		ring2="Regal ring",
        ear1="Ishvara Earring",
		waist="Fotia belt",
		back=Cam.RA
    })
	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {
        ammo=gear.WSbullet,
        ear1="Enervating Earring",
        ear2="Moonshade Earring",
        ring1="Regal Ring",
        ring2="Karieyh Ring"
    })
	sets.precast.WS['Wildfire'] = {
        ammo=gear.MAbullet,
        head=Herc.Head.MAB,
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
		ear2="Hecate's Earring",
		body="Samnuha coat",
        hands="Carmine Fin. Ga. +1",
		legs="Laksa. Trews +2",
        feet="Adhemar Gamashes",
        ring1="Karieyh Ring",
		ring2="Dingir Ring",
        waist="Eschan stone",
        back=Cam.RA,
    }
	sets.precast.WS['Leaden Salute'] = set_combine(sets.precast.WS['Wildfire'], { 
		--[[123MAB with 21% wsD]]
		head="Pixie Hairpin +1",
	})
	sets.precast.WS['Aeolian Edge'] = {
        ammo=gear.MAbullet,
        head=Herc.Head.MAB,
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
		ear2="Hecate's Earring",
        body="Samnuha Coat",
        hands="Leyline Gloves",
        ring1="Karieyh Ring",
        ring2="Garuda Ring",
        back="Gunslinger's cape",
        waist="Eschan stone",
        legs="Shneddick Tights +1",
        feet="Lanun Bottes"	
	}
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}
	sets.DT= { 
		 ammo=gear.RAbullet,
        head="Meghanada visor +1",
        neck="Loricate torque +1",
        ear1="Cessance Earring",
        ear2="Telos Earring",
        body="Emet harness +1",
        hands=Herc.Hands.PDT,
        ring1="Warp Ring",
        ring2="Gelatinous ring +1",
    	back="Solemnity Cape",
        waist="Flume Belt",
        legs="Carmine Cuisses +1",
        feet=Herc.Feet.PDT
	}