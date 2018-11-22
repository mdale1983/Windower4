include('hel_augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle={
		main="Bolelabunga",
		sub="Genmei Shield",
		ammo="Incantor Stone",
		head="Befouled Crown",
		body="Jhakri robe +1",
		hands="Gende. gages +1",
		legs="Assid. Pants +1",
		feet="Herald's gaiters",
		neck="Loricate Torque +1",
		waist="Fucho-no-Obi",
		ear1="Etiolation Earring",
		ear2="Hearty Earring",
		ring1="Gelatinous Ring",
		ring2="Renaye Ring",
		back="Solemnity cape"
	}
	sets.idle.MagicEva = set_combine(sets.idle,{ 
		head="Inyanga tiara +1",
		neck="Dampener's torque",
		ear1="Infused Earring",
		ear2="Genmei Earring",
		body="Inyanga jubbah",
		hands="Inyanga dastanas +1",
		ring1="Ayanmo Ring",
		ring2="Vocane ring",
		back="Solemnity Cape",
		waist="Flume Belt",
		legs="Inyanga Shalwar +2",
		feet="Inyanga Crackows +1"
	})
	sets.resting = {
		main="Boonwell Staff",
		sub="Enki Strap",
		ammo="Clarus Stone",
		head="Orvail Corona +1",
		body="Chelona Blazer",
		hands="Nares Cuffs",
		legs="Nisse Slacks",
		feet="Chelona Boots",
		neck="Eidolon Pendant",
		waist="Austerity Belt",
		ear1="Mendi. Earring",
		ear2="Andoaa Earring",
		ring1="Star Ring",
		ring2="Star Ring",
		back="Vita Cape",
	}
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}
	sets.precast.JA['Parsimony'] = {legs="Arbatel Pants"}
	sets.precast.JA['Penury'] = {legs="Arbatel Pants"}
	sets.precast.JA['Perpetuance'] = {hands="Arbatel Bracers +1"}
	sets.precast.JA['Rapture'] = {head="Arbatel Bonnet +1"}
	sets.precast.JA['Ebullience'] = {head="Arbatel Bonnet +1"}
	sets.precast.JA['Sublimation'] = {
		main="Siriti",
		ammo="Ghastly Tathlum +1",
		head="Acad. Mortarboard",
		body="Peda. Gown +1",
		hands=Telc.Hands.Regen,
		legs=Telc.Legs.Regen,
		feet=Telc.Feet.Regen,
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		ear1="Terminus Earring",
		ear2="Odnowa Earring",
		ring1="Provocare Ring",
		ring2="Kunaji Ring",
		back="Swith Cape",
	}
----------------------------------
-- 	Pre-cast Magic Gear-sets 	--	
----------------------------------
	sets.precast.FC = {--63% FC
		main="Grioavolr",
		sub="Enki strap",
		ammo="Incantor stone",
		head="Vanya hood",
		body="Helios jacket",
		hands="Merlinic Dastanas",
		legs="Psycloth Lappas", 
		feet="Chelona boots", 
		neck="Voltsurge Torque",
		waist="Channeler's stone",
		ear1="Etiolation Earring",
		ear2="Loquac. Earring",
		ring1="Kishar Ring",
		ring2="Lebeche Ring",
		back={ name="Lugh's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		main="Bolelabunga", 
		sub="Genmei Shield",
		ammo="Incantor Stone",
		head="Piety Cap", 
		body="Inyanga Jubbah +1",
		hands="Gende. Gages +1", 
		legs="Ebers Pant. +1",
		feet="Vanya Clogs", 
		neck="Orison Locket",
		waist="Channeler's Stone",
		ear1="Nourish. Earring",
		ear2="Nourish. Earring +1",
		ring1="Warp Ring",
		ring2="Sirona's Ring",
	})
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {
		head="Umuthi Hat",
		legs="Doyen Pants"
	})
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist="Siegel Sash"
	})
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
		neck="Stoicheion Medal"
	})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		body="Heka's Kalasiris",
		back="Pahtli Cape"
	})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {
		head=empty,
		body="Twilight Cloak"
	})
	sets.precast.FC.Regen = set_combine(sets.precast.FC, {
		back="Lugh's Cape", 
		hands="Arbatel Bracers +1",
	})
	sets.precast.Klimaform = {
		feet="Arbatel Loafers"
	}
----------------------------------
-- 	Mid-cast Magic Gear-Sets 	--
----------------------------------
	------------------------
	-- Light Arts Section --
	------------------------
		sets.midcast.FastRecast = {    
			ammo="Incantor Stone",
			head="Merlinic Hood",
			ear2="Loquacious Earring",
			neck="Voltsurge Torque",
			body="Anhur Robe",
			hands="Gendewitha Gages",
			ring1="Weatherspoon Ring",
			ring2="Lebeche Ring",
			back="Swith Cape +1",
			waist="Goading Belt",
			legs="Artsieq Hose",
			feet="Regal Pumps +1"
		}
		sets.midcast.Cure = {
			main="Gada",
			sub="Genmei shield",
			ammo="Hydrocera",
			head=Telc.Head.Regen,
			body="Chironic doublet",
			hands=Telc.Hands.Regen,
			legs=Telc.Legs.Regen,
			feet="Chironic slippers",
			neck="Incanter's Torque",
			waist="Korin Obi",
			ear1="Lifestorm Earring",
			ear2="Loquac. Earring",
			ring1="Haoma's Ring",
			ring2="Haoma's Ring",
			back="Solemnity Cape",
		}      
		sets.midcast.Curaga = sets.midcast.Cure
		sets.midcast.Regen = {
			main="Bolelabunga",
			sub="Genmei Shield",
			ammo="Ghastly Tathlum +1",
			head="Arbatel bonnet +1",
			body=Telc.Body.Regen,
			hands=Telc.Hands.Regen,
			legs=Telc.Legs.Regen,
			feet=Telc.Feet.Regen,
			neck="Incanter's Torque",
			waist="Korin Obi",
			ear1="Hecate's Earring",
			ear2="Loquac. Earring",
			ring1="Warp Ring",
			ring2="Acumen Ring",
			back="Bookworm's Cape", 
		}
		sets.midcast.Cursna = {
			neck="Malison Medallion",
			ring1="Haoma's Ring",
			ring2="Haoma's Ring",
			feet="Gendewitha Galoshes +1"
		}
		sets.midcast['Enhancing Magic'] = {
			main="Gada",
			sub="Genmei Shield",
			ammo="Ghastly Tathlum +1",
			head="Befouled Crown",
			body=Telc.Body.Dur,
			hands="Arbatel Bracers +1",
			legs="Assid. Pants +1",
			feet=Telc.Legs.Dur,
			neck="Incanter's Torque",
			waist="Siegel Sash",
			ear1="Hecate's Earring",
			ear2="Loquac. Earring",
			ring1="Stikini Ring",
			ring2="Stikini Ring",
			back="Perimede Cape"
		}
		sets.midcast.Duration = set_combine(sets.midcast['Enhancing Magic'],{ -- Enh. Ma. Dur. (exclusivly for set_combine, nothing will directly call this set)
			main="Gada",
			sub="Ammurapi Shield",
			head=Telc.Head.Dur,
			body=Telc.Body.Dur,
			hands=Telc.Hands.Dur,
			legs=Telc.Legs.Dur,
			feet=Telc.Feet.Dur,
		})
		sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
			waist="Siegel Sash"
		})
		sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {
			feet="Pedagogy Loafers"
		})
		sets.midcast.Haste = set_combine(sets.midcast.Duration, {
			ammo="Hasty Pinion +1",
			neck="Incanter's torque",
			waist="Austerity belt",
			ear1="Loquac. Earring",
			ear2="Etiolation Earring",
			ring1="Stikini Ring",
			right2="Stikini Ring",
		})
		sets.midcast.Protect = {ring1="Sheltered Ring"}
		sets.midcast.Protectra = sets.midcast.Protect
		sets.midcast.Shell = {ring1="Sheltered Ring"}
		sets.midcast.Shellra = sets.midcast.Shell
	------------------------------
	-- Dark Arts Midcast Stuff	--
	------------------------------
		sets.midcast['Enfeebling Magic'] = {
			main="Akademos", 
			sub="Enki Strap",
			ammo="Hydrocera",
			head="Jhakri coronal",
			body="Jhakri Robe +1",
			hands="Jhakri cuffs",
			legs="Psycloth lappas",
			feet="Mallquis clogs +1",
			neck="Sanctity Necklace",
			waist="Luminary Sash",
			ear1="Lifestorm Earring",
			ear2="Psystorm Earring",
			ring1="Stikini Ring",
			ring2="Stikini Ring",
			back=Lugh.FC
		}
		sets.midcast['Dark Magic'] = {
			main="Akademos", 
			sub="Enki Strap",
			ammo="Incantor Stone",
			head="Nahtirah Hat",
			neck="Aesir Torque",
			ear1="Psystorm Earring",
			ear2="Lifestorm Earring",
			body="Vanir Cotehardie",
			hands="Yaoyotl Gloves",
			ring1="Strendu Ring",
			ring2="Sangoma Ring",
			back="Refraction Cape",
			waist="Goading Belt",
			legs="Bokwus Slops",
			feet="Bokwus Boots"
		}
		sets.midcast.Kaustra = {
			main="Akademos",
			sub="Enki Strap",
			ammo="Ghastly Tathlum +1",
			head={ name="Merlinic Hood", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Magic burst mdg.+8%','"Mag.Atk.Bns."+8',}},
			body="Wretched Coat",
			hands="Amalric Gages",
			legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+17','Magic burst mdg.+10%','MND+8','Mag. Acc.+15',}},
			feet="Jhakri Pigaches +1",
			neck="Mizu. Kubikazari",
			waist="Aswang Sash",
			ear1="Moldavite Earring",
			ear2="Friomisi Earring",
			ring1="Mujin Band",
			ring2="Locus Ring",
			back="Seshaw Cape",
		}
		sets.midcast.Drain = {
			main="Akademos",
			sub="Enki Strap",
			ammo="Ghastly Tathlum +1",
			head="Pixie Hairpin +1",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','"Drain" and "Aspir" potency +10','INT+3','"Mag.Atk.Bns."+5',}},
			feet={ name="Chironic Slippers", augments={'Mag. Acc.+5 "Mag.Atk.Bns."+5','"Drain" and "Aspir" potency +10','MND+2','Mag. Acc.+8',}},
			neck="Incanter's Torque",
			waist="Fucho-no-Obi",
			ear1="Lempo Earring",
			ear2="Friomisi Earring",
			ring1="Evanescence Ring",
			ring2="Archon Ring",
			back="Ogapepo Cape",
		}
		sets.midcast.Aspir = sets.midcast.Drain
		sets.midcast.Stun = {
			main="Grioavolr", 
			sub="Enki Strap",
			ammo="Ghastly Tathlum +1",
			head="Befouled Crown",
			body="Shango Robe",
			hands="Jhakri Cuffs +1",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+30','CHR+8',}},
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Magic burst mdg.+5%','"Mag.Atk.Bns."+15',}},
			neck="Sanctity Necklace",
			waist="Aswang Sash",
			ear1="Lifestorm Earring",
			ear2="Psystorm Earring",
			ring1="Mediator's Ring",
			ring2="Perception Ring",
			back="Altruistic Cape",
		}
		sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {	
			main="Lehbrailg +2"
		})
    ----------------------------------------------
	--	Elemental Magic sets are default for	--
	--	handling low-tier nukes.				--
	----------------------------------------------
		sets.midcast['Elemental Magic'] = {
			main="Akademos", 
			sub="Enki Strap",
			ammo="Ghastly Tathlum +1",
			head="Jhakri Coronal +1",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1",
			neck="Sanctity Necklace",
			waist="Hachirin-no-Obi",
			ear1="Friomisi Earring",
			ear2="Loquac. Earring",
			ring1="Fenrir Ring",
			ring2="Acumen Ring",
			back="Seshaw Cape",
		}
		sets.midcast['Elemental Magic'].Resistant = {
			main="Akademos", 
			sub="Enki Strap",
			ammo="Ghastly Tathlum +1",
			head="Jhakri Coronal",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1",
			neck="Sanctity Necklace",
			waist="Hachirin-no-Obi",
			ear1="Friomisi Earring",
			ear2="Loquac. Earring",
			ring1="Fenrir Ring",
			ring2="Acumen Ring",
			back="Seshaw Cape",
		}
		-- Custom refinements for certain nuke tiers
		sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
			sub="Wizzan Grip"
		})
		sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
			sub="Wizzan Grip"
		})
		sets.midcast.Impact = {
			main="Akademos",
			sub="Mephitis Grip",
			ammo="Dosis Tathlum",
			head=empty,
			neck="Eddy Necklace",
			ear1="Psystorm Earring",
			ear2="Lifestorm Earring",
			body="Twilight Cloak",
			hands=gear.macc_hagondes,
			ring1="Icesoul Ring",
			ring2="Sangoma Ring",
			back="Toro Cape",
			waist="Demonry Sash",
			legs="Hagondes Pants",
			feet="Bokwus Boots"
		}
		sets.midcast['Elemental Magic'].Burst = {
			main="Akademos", 
			sub="Enki Strap",
			ammo="Ghastly Tathlum +1",
			head={ name="Merlinic Hood", augments={'Mag. Acc.+26','Magic burst mdg.+5%','"Mag.Atk.Bns."+1',}},
			body="Jhakri Robe +1",
			hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst mdg.+10%','MND+7','Mag. Acc.+9','"Mag.Atk.Bns."+11',}},
			feet="Arbatel Loafers",
			neck="Mizu. Kubikazari",
			waist="Hachirin-no-Obi",
			ear1="Moldavite Earring",
			ear2="Friomisi Earring",
			ring1="Mujin Band",
			ring2="Locus Ring",
			back="Seshaw Cape",
		}
		sets.midcast['Elemental Magic'].Helix = {
			main="Akademos",
			sub="Enki Strap",
			ammo="Ghastly Tathlum +1",
			head={ name="Merlinic Hood", augments={'Mag. Acc.+26','Magic burst mdg.+5%','"Mag.Atk.Bns."+1',}},
			body="Jhakri Robe +1",
			hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst mdg.+10%','MND+7','Mag. Acc.+9','"Mag.Atk.Bns."+11',}},
			feet="Arbatel Loafers",
			neck="Mizu. Kubikazari",
			waist="Refoccilation Stone",
			ear1="Moldavite Earring",
			ear2="Friomisi Earring",
			ring1="Mujin Band",
			ring2="Locus Ring",
			back="Seshaw Cape",
		}
----------------------
-- 	Buff gear sets 	--
----------------------
	sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants"}
    sets.buff['Celerity'] = {feet="Pedagogy Loafers"}
    sets.buff['Alacrity'] = {feet="Pedagogy Loafers"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers"}
    sets.buff.FullSublimation = {
		head="Academic's Mortarboard",
		ear1="Savant's Earring",
		body="Pedagogy Gown +1",
		main="Siriti",
	}
    sets.buff.PDTSublimation= {
		head="Academic's Mortarboard",
		ear1="Savant's Earring"
	}
----------------------
-- 	Misc Gear-sets 	--
----------------------
	sets.Reive = {
		neck="Ygna's resolve +1"
	}
	sets.buff.Doom = {
		
	}
	sets.CapacityMantle = {
		back="Mecisto. Mantle"
	}