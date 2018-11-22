include('augments.lua')
------------------
-- 	Bullets 	--
------------------
	gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.ACCbullet = "Eradicating Bullet"
    gear.MAbullet = "Chrono Bullet"
	gear.U_Shot_Ammo = "Chrono Bullet"
	DefaultAmmo = {['Fomalhaut'] = "Chrono bullet", ['Fomalhaut'] = "Chrono bullet"}
	U_Shot_Ammo = {['Fomalhaut'] = "Chrono bullet", ['Fomalhaut'] = "Chrono bullet"}
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
        ammo=gear.RAbullet,
        head="Meghanada visor +1",
        neck="Scout's gorget +1",
		--neck="Loricate torque +1",
        ear1="Hearty Earring",
        ear2="Etiolation Earring",
        body="Meghanada cuirie +1",
        hands=Herc.Hands.PDT,
        ring1="Defending Ring",
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
		range="Fomalhaut"
	})
	sets.idle.Leaden = set_combine(sets.idle,{ 
		main="Fettering blade",
		sub="Hepatizon rapier +1",
		range="Fomalhaut"
	})
----------------------------------
--		Job Ability sets		--
----------------------------------
	sets.precast.JA['Eagle Eye Shot'] = {legs="Arc. Braccae +1"}
    sets.precast.JA['Bounty Shot'] = {hands="Amini Glove. +1"}
    sets.precast.JA['Beleouflage'] = {body="Orion Jerkin +3"}
    sets.precast.JA['Scavenge'] = {feet="Orion Socks +3"}
    sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +2"}
    sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +1"}
--------------------------------------
--		Pre-Cast Gear sets			--
--------------------------------------
	sets.precast.FC = {
		head="Carmine mask +1",
		body="Taeon tabard",
		hands="Leyline gloves",
		legs="Rawhide Trousers",
		feet="Carmine greaves +1",
		neck="Voltsurge torque",
		ear1="Etiolation earring",
		ear2="Loquacious earring",
		ring1="Prolix ring",
		ring2="Kishar ring",
		back=Bele.FC,
		waist="Resolute belt"
	}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        --body="Passion Jacket",
        neck="Magoraga Beads",
        --ring2="Lebeche Ring",
    })
	sets.precast.RA = {-- (10% Snapshot, 5% Rapid from Merits)
        ammo=gear.RAbullet,
		head="Taeon chapeau",
        body="Arcadian jerkin +1",
		hands="Carmine Fin. Ga. +1",
        legs="Adhemar Kecks",
        feet="Meg. jam. +1",
		neck="Scout's gorget +1",
        waist="Impulse Belt",
		back=Bele.RA
    }
--------------------------
--	Midcast Gear Sets 	--
--------------------------
	sets.midcast.FastRecast = sets.precast.FC
	sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	------------------
	-- Ranged gear 	--
	------------------
		sets.midcast.RA = {
		-- 17sTP from weapons/Shield
			ammo=gear.RAbullet,
			head="Meghanada visor +1",
			neck="Scout's gorget +1",
			--neck="Iskur gorget",
			body="Orion Jerkin +2",		--6sTP
			hands="Adhemar wristbands",
			legs="Adhemar kecks",
			feet="Adhemar gamashes",
			ear1="Enervating Earring",
			ear2="Telos Earring",
			ring1="Dingir Ring",
			ring2="Ilabrat Ring",
			waist="Eschan stone",
			back=Bele.RA,
		}-- +52 sTP
		sets.midcast.RA.Annihilator = {
		-- 7sTP from weapons/Shield
			ammo=gear.RAbullet,
			head="Orion beret +2",
			neck="Scout's gorget +1",		--
			body="Mummu jacket +2",			--6sTP
			hands="Adhemar wristbands",		--6sTP
			legs="Adhemar kecks",			--7sTP
			feet="Adhemar gamashes",
			ear1="Enervating Earring",		--sTP
			ear2="Telos Earring",			--5sTP
			ring1="Rajas Ring",				--5sTP
			ring2="Ilabrat Ring",			--5sTP
			waist="Eschan stone",			--
			back=Bele.RA,					--10sTP
		}-- +52 sTP
	----------------------------------
	--		Custom Buff sets		--
	----------------------------------
		sets.buff.Barrage = {
			ammo=gear.RAbullet,
			head="Orion beret +2",
			neck="Iskur gorget",		--
			body="Mummu jacket +2",			
			hands="Orion Bracers +2",		--6sTP
			legs="Adhemar kecks",			--7sTP
			feet="Adhemar gamashes",
			ear1="Enervating Earring",		--sTP
			ear2="Telos Earring",			--5sTP
			ring1="Rajas Ring",				--5sTP
			ring2="Ilabrat Ring",			--5sTP
			waist="Eschan stone",			--
			back=Bele.RA,					--10sTP
		}
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
        back=Bele.TP,
        waist="Grunfeld rope",
        legs=Herc.Legs.WS,
        feet=Herc.Feet.WS
    }
	sets.engaged.DW = set_combine(sets.engaged, {
	-- No Magic Haste 
		body="Adhemar jacket",		--5
		ear2="Suppanomimi",			--5
		legs="Carmine Cuisses +1",	--6
		feet=Taeon.Feet.DW,			--9
		back=gear.RNG_DW_Cape, 		--10
		ear1="Eabani Earring", 		--4
		waist="Reiki Yotai", 		--7
    })-- 49% DW Needed
    sets.engaged.DW.Haste_25 = set_combine(sets.engaged,  {
	-- 15% Magic Haste 
		body="Adhemar jacket",		--5
		ear2="Suppanomimi",			--5
		legs="Carmine Cuisses +1",	--6
		feet=Taeon.Feet.DW,			--9
		back=gear.RNG_DW_Cape, 		--10
		ear1="Eabani Earring", 		--4
		waist="Reiki Yotai", 		--7
    }) -- 42% DW Needed
    sets.engaged.DW.Haste_30 = set_combine(sets.engaged,  {
	-- 30% Magic Haste 
        body="Adhemar jacket",		--5
		ear2="Suppanomimi",			--5
		legs="Carmine Cuisses +1",	--6
		feet=Taeon.Feet.DW,			--9
		back=gear.RNG_DW_Cape, 		--10
		ear1="Eabani Earring", 		--4
		waist="Reiki Yotai", 		--7
    }) -- 31% DW Needed
    sets.engaged.DW.Haste_40 = set_combine(sets.engaged,  {
	--40% Magic Haste 
        body="Adhemar jacket",		--5
		ear2="Suppanomimi",			--5
		legs="Carmine Cuisses +1",	--6
		feet=Taeon.Feet.DW,			--9
		back=gear.RNG_DW_Cape, 		--10
		ear1="Eabani Earring", 		--4
		waist="Reiki Yotai", 		--7
    }) -- 27% DW Needed
    sets.engaged.DW.Haste_43 = set_combine(sets.engaged,  {
	-- 45% Magic Haste 
        body="Adhemar jacket",		--5
		legs="Carmine Cuisses +1",	--6
	}) -- 11% DW Needed
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
	sets.precast.WS['Detonator'] = set_combine(sets.precast.WS, {
		ammo=gear.WSbullet,
		hands="Meg. Gloves +1",
		ear1="Ishvara earring",
		ring1="Petrov ring",
		ring2="Apate ring",
		back="Gunslinger's cape",
	})
	sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, {
        ammo=gear.WSbullet,
		head="Orion beret +2",
		body=Herc.Body.RWS,
		hands="Meghanada gloves +1",
		legs=Herc.Legs.RWS,
		feet=Herc.Feet.RWS,
		neck="Fotia gorget",
		ring1="Karieyh Ring",
		ring2="Regal ring",
        ear1="Ishvara Earring",
		waist="Fotia belt",
		back=Bele.RA
    })
	sets.precast.WS['Coronach'] = set_combine(sets.precast.WS, {
        ammo=gear.WSbullet,
		head="Orion beret +2",
		body=Herc.Body.RWS,
		hands="Meghanada gloves +1",
		legs=Herc.Legs.RWS,
		feet=Herc.Feet.RWS,
		neck="Fotia gorget",
		ring1="Karieyh Ring",
		ring2="Regal ring",
        ear1="Ishvara Earring",
		waist="Fotia belt",
		back=Bele.RA
    })
	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {
        ammo=gear.WSbullet,
        ear1="Enervating Earring",
        ear2="Moonshade Earring",
        ring1="Regal Ring",
        ring2="Karieyh Ring",
    })
	sets.precast.WS['Wildfire'] = {
        ammo=gear.MAbullet,
        head="Orion beret +2",
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
		ear2="Hecate's Earring",
		body="Samnuha coat",
        hands="Carmine Fin. Ga. +1",
		legs=Herc.Legs.RWS,
        feet="Adhemar Gamashes",
        ring1="Karieyh Ring",
		ring2="Dingir Ring",
        waist="Eschan stone",
        back=Bele.RA,
    }
	sets.precast.WS['Trueflight'] = set_combine(sets.precast.WS['Wildfire'], { 
		--[[123MAB with 21% wsD]]
		head="Orion beret +2",
		legs=Herc.Legs.RWS,
		ring2="Dingir ring",
	})
	sets.precast.WS['Aeolian Edge'] = {
        ammo=gear.MAbullet,
        head=Herc.Head.MAB,
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
		ear2="Hecate's Earring",
        body="Samnuha Coat",
        hands="Leyline Gloves",
        ring1="Acumen Ring",
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
	