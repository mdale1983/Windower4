-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
    
	define_rune_info()
	
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false

	BlueMagic = {}
    blue_magic_maps = {}
    
    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods.
    
    -- Physical Spells --
    
    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
        'Bilgestorm'
    }

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }

    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
        'Battle Dance','Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave',
        'Uppercut','Vertical Cleave'
    }
        
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone',
		'Disseverment','Foot Kick','Frenetic Rip','Goblin Rush',
		'Hysteric Barrage','Paralyzing Triad','Seedspray',
		'Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault',
        'Vanity Dive'
    }
        
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Cannonball','Delta Thrust','Glutinous Dart',
		'Grand Slam','Power Attack','Quad. Continuum',
		'Sprout Smack','Sub-zero Smash'
    }
        
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
        'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot',
		'Jet Stream','Pinecone Bomb','Spiral Spin','Wild Oats'
    }

    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite','Queasyshroom'
    }

    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }

    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }

    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }

    -- Magical Spells --

    -- Magical spells with the typical Int mod
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere',
		'Dark Orb','Death Ray','Diffusion Ray','Droning Whirlwind',
		'Embalming Earth','Firespit','Foul Waters','Ice Break',
		'Leafstorm','Maelstrom','Rail Cannon','Regurgitation',
		'Rending Deluge','Retinal Glare','Tem. Upheaval',
		'Water Bomb','Spectral Floe','Tenebral Crush','Entomb','Subduction',
		'Anvil Lightning', 'Blinding Fulgor', 'Searing Tempest', 'Scouring Spate'
    }

    -- Magical spells with a primary Mnd mod
    blue_magic_maps.MagicalMnd = S{
        'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast'
    }

    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
        'Eyes On Me','Mysterious Light'
    }

    -- Magical spells with a Vit stat mod (on top of Int)
    blue_magic_maps.MagicalVit = S{
        'Thermal Pulse'
    }

    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
        'Charged Whisker','Gates of Hades'
    }
            
    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape',
		'Awful Eye','Blank Gaze','Blistering Roar','Blood Drain',
		'Blood Saber','Chaotic Eye','Cimicine Discharge','Cold Wave',
		'Corrosive Ooze','Demoralizing Roar','Digest','Dream Flower',
		'Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
		'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura',
		'Light of Penance','Lowing','Mind Blast','Mortal Ray',
		'MP Drainkiss','Osmosis','Reaving Wind','Sandspin',
		'Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn'
    }
        
    -- Breath-based spells
    blue_magic_maps.Breath = S{
        'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath',
		'Self-Destruct','Thunder Breath','Vapor Spray','Wind Breath'
    }

    -- Stun spells
    blue_magic_maps.Stun = S{
        'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap',
		'Temporal Shift','Thunderbolt','Whirl of Rage'
    }
        
    -- Healing spells
    blue_magic_maps.Healing = S{
        'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen',
		'Restoral','White Wind','Wild Carrot'
    }
    
    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBasedBuff = S{
        'Barrier Tusk','Diamondhide','Magic Barrier','Metallic Body',
		'Plasma Charge','Pyric Bulwark','Reactor Cool',
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Battery Charge',
		'Carcharian Verve','Cocoon','Erratic Flutter','Exuviation',
		'Fantod','Feather Barrier','Harden Shell','Memento Mori',
		'Nat. Meditation','Occultation','Orcish Counterstance','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up',
		'Winds of Promyvion','Zephyr Mantle'
    }
    
    
    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake',
		'Carcharian Verve','Crashing Thunder','Droning Whirlwind',
		'Gates of Hades','Harden Shell','Polar Roar',
        'Pyric Bulwark','Thunderbolt','Tourbillion','Uproot'
    }
	moonshade_WS = S{"Resolution", "Torcleaver", "Cross Reaper", "Quietus", 
                     "Entropy", "Insurgency", "Savage Blade", "Vorpal Blade", 
                     "Requiescat", 'Sanguine Blade', "Chant du Cygne"}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'DW', 'Learning')
	state.HybridMode:options('Normal', 'Refresh', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'pdt', 'Learning')

    gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}
	
	state.Runes = M{['description']='Runes', "Tellus","Unda","Flabra","Ignis","Gelus","Sulpor","Lux","Tenebrae"}
	
    -- Additional local binds
    send_command('bind ^` input /ja "Chain Affinity" <me>')
    send_command('bind !` input /ja "Efflux" <me>')
    send_command('bind @` input /ja "Burst Affinity" <me>')
	
    update_combat_form()
    select_default_macro_book()
	set_lockstyle()
	state.CapacityMode = M(false, 'Capacity Point Mantle')
	send_command('bind != gs c toggle CapacityMode')
	send_command('bind f10 gs c cycle HybridMode')
	send_command('bind f11 gs c cycle WeaponskillMode')
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind @`')
end


-- Set up gear sets.
function init_gear_sets()

	--[[
		Define your Gearsets in a car file aptly named name_job_gear.lua
	]]
	
	sets.Night = set_combine(sets.idle, {
		hands="Serpentes cuffs"
	})
	
	sets.Day = set_combine(sets.idle, {
		feet="Serpentes sabots"
	})
	
	sets.CapacityMantle = {
		back={ 
			name="Mecisto. Mantle", 
			augments={'Cap. Point+49%','MP+20','DEF+3',}}
	}
	
	sets.refresh = { 
		head="Rawhide mask",
		body="Mirage Jubbah +2",
		--waist="Fucho-no-obi"
	}
	
	sets.latent_refresh = {
		waist="Fucho-no-obi"
	}
	
	sets.DA = {
		ear1="Brutal earring", 
		ear2="Cessance earring"
	} 
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.

function job_precast(spell, action, spellMap, eventArgs)
    if unbridled_spells:contains(spell.english) and not state.Buff['Unbridled Learning'] then
        eventArgs.cancel = true
        windower.send_command('@input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
    end
	if spell.english == 'Chant du Cygne' and world.area == "Bhaflau Remnants" and player.hpp < 60 then
		cancel_spell()
		send_command('@ input /ws "Sanguine Blade" <t>')
	end
	if spell.english == 'Chant du Cygne' and world.area == "Bhaflau Remnants" then
		if (player.tp >= 3000) then
			cancel_spell()
			send_command('@ input /ws "Savage Blade" <t>')
		end 
	end 
end
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.action_type=="Magic" and buffactive.Silence then
        eventArgs.cancel = true
        send_command('input /item "Echo Drops" <me>')
    end
    if spell.type=='WeaponSkill' then
        if moonshade_WS:contains(spell.english) and player.tp < 2900 then
            equip({ear2="Moonshade Earring"})
        end
    end
--[[ Lock weaponskill if you are to far from the mob as to not lose TP ]]
    if spell.type == 'WeaponSkill' then 
        if spell.target.distance > 5 then 
            cancel_spell()
            add_to_chat(8, 'Target to far away. Move closer')
            return
        end 
    end 
end
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Add enhancement gear for Chain Affinity, etc.
    if spell.skill == 'Blue Magic' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
        if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
            equip(sets.self_healing)
        end
    end

    -- If in learning mode, keep on gear intended to help with that, regardless of action.
    if state.OffenseMode.value == 'Learning' then
        equip(sets.Learning)
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        state.Buff[buff] = gain
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
-- Return custom spellMap value that can override the default spell mapping.
-- Don't return anything to allow default spell mapping to be used.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
            end
        end
    end
end

function job_buff_change(buff, gain)
	if player.status == "Engaged" then 
		if (buffactive.embrava or buffactive.haste) and buffactive.march == 2  then
			equip({ear1="Brutal earring", ear2="Cessance earring"})
		elseif buffactive['Mighty Guard'] and buffactive['Haste'] then 
			equip({ear1="Brutal earring", ear2="Cessance earring"})
		end 
	end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	if player.sub_job == "RDM" then 
		idleSet = set_combine(idleSet, sets.DT)
	end 
	if player.mpp < 50 and player.sub_job == "WAR" then 
		if (world.time >= (17*60) or world.time <= (7*60)) then
				idleSet = set_combine(idleSet, sets.Night)
			else
				idleSet = set_combine(idleSet ,sets.Day)
		end
	end 
	if player.mpp < 80 and player.sub_job == "WAR" then 
		idleSet = set_combine(idleSet, sets.refresh)
    end
	if state.CapacityMode.value then
		idleSet = set_combine(idleSet, sets.CapacityMantle)
	end
	if player.mpp < 50 and player.sub_job == "WAR" then
        idleSet = set_combine(idleSet, sets.latent_refresh)
	end
    return idleSet
end	

function customize_melee_set(meleeSet)
    if state.CapacityMode.value then
        meleeSet = set_combine(meleeSet, sets.CapacityMantle)
    end
	--[[if player.mpp < 50 then 
		meleeSet = set_combine(meleeSet, sets.latent_refresh)
	end]]
	if buffactive.Silence then
		send_command('input /item "Echo Drops" <me>')
	end 
--Dual Weild rule for more Double Attack. A Minimum of +11 DW is needed
	if (buffactive['Haste'] and buffactive['Mighty Guard']) or (buffactive['Haste'] and buffactive.march == 2) then 
		meleeSet = set_combine(meleeSet, sets.DA)
		--add_to_chat(8, '--Magic Haste 30%--')
	end 
	return meleeSet
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    -- Check for H2H or single-wielding
    if player.equipment.sub == "Genbu's Shield" or player.equipment.sub == 'empty' then
        state.CombatForm:reset()
    else
        state.CombatForm:set('DW')
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'RDM' then
        set_macro_page(10, 7)
    else
        set_macro_page(1, 7)
    end
end

function define_rune_info()
    rune_info = {
        ["Ignis"]   = {damage="Fire", resistance="Ice"},
        ["Gelus"]   = {damage="Ice", resistance="Wind"},
        ["Flabra"]  = {damage="Wind", resistance="Earth"},
        ["Tellus"]  = {damage="Earth", resistance="Lightning"},
        ["Sulpor"]  = {damage="Lightning", resistance="Water"},
        ["Unda"]    = {damage="Water", resistance="Fire"},
        ["Lux"]     = {damage="Light", resistance="Darkness"},
        ["Tenebrae"]= {damage="Darkness", resistance="Light"},
    }
end

function display_rune_info(spell)
    runeinfo = rune_info[spell.english]
    if runeinfo then
        add_to_chat(122, '*'..spell.english..' is '..runeinfo.damage..'-base dmg and '..runeinfo.resistance..' resist.*')
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'Rune' and not spell.interrupted then
        display_rune_info(spell)
    end
end

function job_self_command(cmdParams, eventArgs)
	if cmdParams[1]:lower() == 'rune' then
		send_command('@input /ja '..state.Runes.value..' <me>')
	end
end

function job_post_midcast(spell, action, spellMap, eventArgs)

	if state.DefenseMode.value ~= 'None' and spell.type ~= 'JobAbility' then
		handle_equipping_gear(player.status)
		eventArgs.handled = true
	end
	if buffactive['Reive Mark'] and spell.type == 'WeaponSkill' then
		equip(sets.Reive)
	end
end

function set_lockstyle()
	send_command('wait 2; input /lockstyleset 4')
end

