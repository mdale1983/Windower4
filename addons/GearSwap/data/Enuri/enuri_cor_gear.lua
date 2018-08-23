include('augments.lua')
------------------
-- 	Bullets 	--
------------------
	gear.RAbullet = "Bronze Bullet"
	gear.WSbullet = "Bronze Bullet"
	gear.RAbullet = "Decimating Bullet"
	gear.WSbullet = "Decimating Bullet"
	gear.MAbullet = "Orichalc. Bullet"
	gear.QDbullet = "Animikii Bullet"
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
        ammo=gear.RAbullet,
        head="Meghanada visor +1",
        neck="Loricate torque",
        ear1="Cessance Earring",
        ear2="Telos Earring",
        body="Emet harness +1",
        hands=Herc.Hands.PDT,
        ring1="Warp Ring",
        ring2="Vocane Ring",
    	back="Solemnity Cape",
        waist="Flume Belt",
        legs="Carmine Cuisses +1",
        feet=Herc.Feet.PDT
    }
	sets.defense.PDT = set_combine(sets.idle, {
        legs="Meg. Chausses +1",
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
		body="Lanun Frac +1"
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
        hands="Chasseur's Gants",
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
	sets.precast.CorsairShot = {}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		neck="Magoraga Beads"
	})
	sets.precast.RA = {
        ammo=gear.RAbullet,
		back="Navarch's Mantle",
        body="Pursuer's Doublet",
        waist="Impulse Belt",
        legs="Adhemar Kecks",
        feet="Wurrukatte Boots"
    }
--------------------------
--	Midcast Gear Sets 	--
--------------------------
	sets.midcast.FastRecast = {
		head="Uk'uxkaj Cap",
        neck="Sanctity Necklace",
        hands="Iuitl Wristbands +1",
        ear1="Psystorm Earring",
        ear2="Lifestorm Earring",
        body="Pursuer's Doublet",
        back="Gunslinger's Cape",
        ring1="Globidonta Ring",
        ring2="Sangoma Ring",
		legs="Adhemar Kecks",
        waist="Aquiline Belt",
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
		sets.midcast.RA = {
			ammo=gear.RAbullet,
			head="Meghanada visor +1",
			neck="Iqabi Necklace",
			ear1="Enervating Earring",
			ear2="Telos Earring",
			body="Adhemar jacket",
			hands="Meghanada gloves +1",
			ring1="Meghanada Ring",
			ring2="Regal Ring",
			back="Gunslinger's Cape",
			waist="Eschan stone",
			legs="Meghanada chausses +1",
			feet="Meghanada jambeaux +1"
		}
		sets.midcast.RA.Acc = set_combine(sets.midcast.RA, {
			body="Pursuer's Doublet",
			ring1="Paqichikaji Ring",
			hands="Floral Gauntlets",
			waist="Eschan Stone"
		})
--------------------------------------
--		Casting Gear sets			--
--------------------------------------
	sets.precast.FC = {
        --ammo="Impatiens",
        head="Ejekamal Mask",
        ear1="Loquacious Earring",
        ring1="Prolix Ring",
        body="Dread Jupon",
        hands="Leyline Gloves",
        legs="Quiahuiz Trousers",
    }
----------------------------------
--		Engaged sets			--
----------------------------------	
	sets.engaged = {
        ammo=gear.RAbullet,
        head="Skormoth Mask",
        neck="Iqabi Necklace",
        ear1="Enervating Earring",
        ear2="Volley Earring",
        body="Pursuer's Doublet",
        hands="Alruna's Gloves +1",
        ring1="Raja's Ring",
        ring2="Longshot Ring",
        back="Gunslinger's Cape",
        waist="Elanid Belt",
        legs="Adhemar Kecks",
        feet="Lanun Bottes"
    }
	sets.engaged.Melee = {
        ammo=gear.RAbullet,
        head="Skormoth Mask",
        neck="Lissome Necklace",
        ear1="Cessance Earring",
        ear2="Brutal Earring",
        body="Rawhide Vest",
        hands="Floral Gauntlets",
        ring1="Chirich Ring",
        ring2="Epona's Ring",
        back="Bleating Mantle",
        waist="Windbuffet Belt +1",
        legs="Samnuha Tights",
        feet="Taeon Boots"
    }
	sets.engaged.DW = set_combine(sets.engaged.Melee, {
		range="Anarchy +3",
		head="Meghanada visor +1",
        ear1="Cessance earring",
        ear2="Suppanomimi",
        hands="Adhemar wristbands",
        body="Adhemar jacket",
        legs="Samnuha tights",
        waist="Kentarch belt +1",
		back="Camulus's mantle",
        feet="Herculean boots",
    })
	sets.engaged.Acc = set_combine(sets.engaged.Melee, {
        body="Herculean jacket",
		legs="Carmine Cuisses +1",
    })
	sets.engaged.DW.Acc = set_combine(sets.engaged.DW, {
		legs="Carmine Cuisses +1",
		ear2="Telos earring",
		ring2="Regal Ring"
    })
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
        ring1="Meghanada Ring",
        ring2="Regal Ring",
		back="Buquwik Cape",
        waist="Fotia belt",
        legs="Meghanada chausses +1",
        feet="Meghanada jambeaux +1"
    }
	sets.precast.WS['Savage Blade'] = {
		head="Adhemar bonnet",
		body="Adhemar jacket",
		hands=Herc.Hands.WS,
		legs=Herc.Legs.WS,
		feet=Herc.Feet.WS,
		neck="Fotia Gorget",
		ear1="Ishvara earring",
		ear2="Brutal earring",
		ring1="Shukuyu ring",
		ring2="Regal ring",
		waist="Fotia belt",
		back="Gunslinger's cape"
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
        ear1="Flame Pearl",
		ring1="Dingir ring",
        ear2="Moonshade Earring",
    })
	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {
        ammo=gear.WSbullet,
        ear1="Enervating Earring",
        ear2="Moonshade Earring",
        back="Buquwik Cape",
        ring1="Ifrit Ring",
        ring2="Garuda Ring"
    })
	sets.precast.WS['Wildfire'] = {
        ammo=gear.MAbullet,
        head=Herc.Head.MAB,
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
		ear2="Hecate's Earring",
		body=Herc.Body.MAB,
        hands=Herc.Hands.MAB,
        ring1="Dingir Ring",
		ring2="Fenrir Ring",
        back="Gunslinger's cape",
        waist="Eschan stone",
        legs=Herc.Legs.MAB,
        feet="Adhemar Gamashes"
    }
	sets.precast.WS['Leaden Salute'] = set_combine(sets.precast.WS['Wildfire'], { 
		--[[123MAB with 21% wsD]]
		body="Herculean vest",
		ring2="Fenrir Ring",
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