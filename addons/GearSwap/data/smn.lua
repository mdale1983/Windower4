-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Also, you'll need the Shortcuts addon to handle the auto-targetting of the custom pact commands.

--[[
    Custom commands:

    gs c siphon
        Automatically run the process to: dismiss the current avatar; summon the appropriate spirit; Elemental Siphon; release the spirit; re-summon the avatar.
        
        Will not re-summon the avatar if one was not out in the first place.
        Will not release the spirit if it was out before the command was issued.
        
    gs c pact [PactType]
        Attempts to use the indicated pact type for the current avatar.
        PactType can be one of:
			physical
			magical
			buffoffense
			buffdefense
			debuff
			cure
		
	gs c summon [AvatarName]
		Attempts to summon an avatar. Will release the current avatar/spirit if necessary.
--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff["Avatar's Favor"] = buffactive["Avatar's Favor"] or false
    state.Buff["Astral Conduit"] = buffactive["Astral Conduit"] or false

    spirits = S{"LightSpirit", "DarkSpirit", "FireSpirit", "EarthSpirit", "WaterSpirit", "AirSpirit", "IceSpirit", "ThunderSpirit"}
    avatars = S{"Carbuncle", "Fenrir", "Diabolos", "Ifrit", "Titan", "Leviathan", "Garuda", "Shiva", "Ramuh", "Odin", "Alexander", "Cait Sith"}

    magicalRagePacts = S{'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen','Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II','Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV','Chaotic strike','Thunderspark','Burning Strike','Meteorite','Nether Blast','Meteor Strike','Conflag Strike','Heavenly Strike','Wind Blade','Geocrush','Crag Throw','Grand Fall','Thunderstorm','Holy Mist','Lunar Bay','Night Terror','Level ? Holy','Impact','Zantetsuken'
	}

	magicalEnticersRagePacts = S{'Impact','Conflag Strike', 'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II','Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV','Heavenly Strike','Wind Blade', 'Geocrush', 'Thunderstorm', 'Meteor Strike','Grand Fall'
	}

	physicalEnticersRagePacts = S{--'Rush','Predator Claws','Mountain Buster','Chaotic Strike','Spinning Dive','Eclipse Bite','Blindside','Regal Scratch','Regal Gash','Poison Nails','Crescent Fang','Claw','Rock Buster','Punch','Burning Strike','Double Punch','Rock Throw','Megalith Throw','Barracuda Dive','Tail Whip','Axe Kick','Double Slap','Shock Strike','Camisado','Moonlit Charge','Crescent Fang','Volt Strike'
	}
    hybridPacts = S{
	    'Flaming Crush'
    }

    pacts = {}
	
	pacts.physical = {['Ramuh']='Volt Strike', ['Ifrit']='Flaming Crush', ['Shiva']='Rush', ['Titan']='Crag Throw', ['Leviathan']='Spinning Dive', ['Fenrir']='Eclipse Bite', ['Cait Sith']='Regal Gash', ['Diabolos']='Blindside', ['Garuda']='Predator Claws'}
	
	pacts.magical = {['Ifrit']='Meteor Strike', ['Shiva']='Heavenly Strike', ['Garuda']='Wind Blade', ['Titan']='Stone IV', ['Ramuh']='Thunderspark', ['Leviathan']='Water IV', ['Cait Sith']='Level ? Holy', ['Fenrir']='Lunar Bay', ['Diabolos']='Night Terror'}
	
	pacts.buffoffense = {['Ifrit']='Crimson Howl', ['Shiva']='Crystal Blessing', ['Garuda']='Hastega II', ['Ramuh']='Rolling Thunder', ['Fenrir']='Ecliptic Growl', ['Diabolos']='Dream Shroud'}
	
	pacts.buffdefense = {['Shiva']='Frost Armor', ['Garuda']='Aerial Armor', ['Titan']='Earthen Armor', ['Ramuh']='Lightning Armor'}
	
	pacts.debuff = {['Ifrit']='Conflag Strike', ['Shiva']='Sleepga', ['Titan']='Crag Throw', ['Ramuh']='Shock Squall', ['Leviathan']='Tidal Roar', ['Cait Sith']='Mewing Lullaby', ['Fenrir']='Impact', ['Diabolos']='Nightmare'}
	
	pacts.cure = {['Carbuncle']='Healing Ruby II', ['Garuda']='Whispering Wind', ['Leviathan']='Spring Water', ['Cait Sith']='Raise II'}

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
	state.WeaponMode = M{['description']='Weapon Mode', 'Free', 'NirvanaLock'}
	
	send_command('bind @` gs c cycle WeaponMode')
	
	autoresummon = true
	set_macro_page(1, 10)
end

function user_unload()
    send_command('unbind @`')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.

--Prevents jumping around between pre/after/mid-cast during astral conduit spam.
--Sets to pet_midcast and then never changes again because of bloodpacts.
function job_precast(spell, action, spellMap, eventArgs)
    if state.Buff['Astral Conduit'] and spell.type=="BloodPactRage" then
        eventArgs.handled = true
    end
end

function job_midcast(spell, action, spellMap, eventArgs)
    if state.Buff['Astral Conduit'] and spell.type=="BloodPactRage" then
        eventArgs.handled = true
    end
end

function job_pet_aftercast(spell, action, spellMap, eventArgs)
    if state.Buff['Astral Conduit'] and spell.type=="BloodPactRage" then
        eventArgs.handled = true
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
	--Prevent going into job_aftercast before pet_midcast unless interrupted.
	if (spell.type=="BloodPactRage" or spell.type=="BloodPactWard") and not spell.interrupted and not state.Buff['Astral Conduit'] then
		eventArgs.handled = true
	elseif state.Buff['Astral Conduit'] and spell.type=="BloodPactRage" then
        eventArgs.handled = true
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
        handle_equipping_gear(player.status)
    elseif storms:contains(buff) then
        handle_equipping_gear(player.status)
    end
end


-- Called when the player's pet's status changes.
-- This is also called after pet_change after a pet is released.  Check for pet validity.
function job_pet_status_change(newStatus, oldStatus, eventArgs)
    if pet.isvalid and not midaction() and not pet_midaction() and (newStatus == 'Engaged' or oldStatus == 'Engaged') then
        handle_equipping_gear(player.status, newStatus)
    end
end


-- Called when a player gains or loses a pet.
-- pet == pet structure
-- gain == true if the pet was gained, false if it was lost.
function job_pet_change(petparam, gain)
    classes.CustomIdleGroups:clear()
    if gain then
        if avatars:contains(pet.name) then
            classes.CustomIdleGroups:append('Avatar')
        elseif spirits:contains(pet.name) then
            classes.CustomIdleGroups:append('Spirit')
        end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell)
    if spell.type == 'BloodPactRage' then
        if magicalRagePacts:contains(spell.english) then
            return 'MagicalBloodPactRage'
		elseif magicalEnticersRagePacts:contains(spell.english) then
			return 'MagicalEnticersBloodPactRage'
		elseif physicalEnticersRagePacts:contains(spell.english) then
			return 'PhysicalEnticersBloodPactRage'
		elseif hybridPacts:contains(spell.english) then
			return 'HybridBloodPactRage'
		else
            return 'PhysicalBloodPactRage'
        end
    elseif spell.type == 'BloodPactWard' and spell.target.type == 'MONSTER' then
        return 'DebuffBloodPactWard'
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if pet.isvalid then
        if state.Buff["Avatar's Favor"] and avatars:contains(pet.name) then
            idleSet = set_combine(idleSet, sets.idle.Avatar.Favor)
        end
        if pet.status == 'Engaged' then
            idleSet = set_combine(idleSet, sets.idle.Avatar.Melee)
        end
    end
    
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if pet.isvalid then
        if avatars:contains(pet.name) then
            classes.CustomIdleGroups:append('Avatar')
        elseif spirits:contains(pet.name) then
            classes.CustomIdleGroups:append('Spirit')
        end
    end
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end


-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'siphon' then
        handle_siphoning()
        eventArgs.handled = true
    elseif cmdParams[1]:lower() == 'pact' then
        handle_pacts(cmdParams)
        eventArgs.handled = true
	elseif cmdParams[1]:lower() == 'summon' then
		handle_summons(cmdParams)
		eventArgs.handled = true
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

--Summons if you have no pet, releases and resummons if you have a pet.
function handle_summons(cmdParams)
	if cmdParams[3] ~= nil then
		summon = cmdParams[2]:lower().." "..cmdParams[3]:lower()
	else
		summon = cmdParams[2]:lower()
	end

	if not pet.isvalid and not areas.Cities:contains(world.area) then
		send_command('input /ma "'..summon..'" <me>')
	elseif pet.isvalid and not areas.Cities:contains(world.area) then
		send_command('input /pet "Release" <me>; wait 1.1; input /ma "'..summon..'" <me>')
	end
end
		
-- Custom uber-handling of Elemental Siphon
function handle_siphoning()
    if areas.Cities:contains(world.area) then
        add_to_chat(122, 'Cannot use Elemental Siphon in a city area.')
        return
    end
	
    local siphonElement
    local releasedAvatar
    local dontRelease
    
    -- If we already have a spirit out, just use that.
    if pet.isvalid and spirits:contains(pet.name) then
        siphonElement = pet.element
        dontRelease = true
    end
    
    if world.weather_element ~= 'None' and (get_weather_intensity() == 2 or world.weather_element ~= elements.weak_to[world.day_element]) then
        siphonElement = world.weather_element
    else
        siphonElement = world.day_element
    end
    
    local command = ''
    local releaseWait = 0
    
    if pet.isvalid and avatars:contains(pet.name) then
        command = command..'input /pet "Release" <me>;wait 1.1;'
        releasedAvatar = pet.name
    end
    
    if not (pet.isvalid and spirits:contains(pet.name)) then
        command = command..'input /ma "'..elements.spirit_of[siphonElement]..'" <me>;wait 4;'
    end
    
    command = command..'input /ja "Elemental Siphon" <me>;'
    
    if not dontRelease then
        command = command..'wait 1.1;input /pet "Release" <me>;'
    end
    
    if releasedAvatar then
        command = command..'wait 1.1;input /ma "'..releasedAvatar..'" <me>'
    end
    
    send_command(command)
end


-- Handles executing blood pacts in a generic, avatar-agnostic way.
-- cmdParams is the split of the self-command.
-- gs c [pact] [pacttype]
function handle_pacts(cmdParams)
    if areas.Cities:contains(world.area) then
        add_to_chat(122, 'You cannot use pacts in town.')
        return
    end

    if not pet.isvalid then
        add_to_chat(122,'No avatar currently available.')
        return
    end

    if spirits:contains(pet.name) then
        add_to_chat(122,'Cannot use pacts with spirits.')
        return
    end

    if not cmdParams[2] then
        add_to_chat(123,'No pact type given.')
        return
    end
    
    local pact = cmdParams[2]:lower()
    
    if not pacts[pact] then
        add_to_chat(123,'Unknown pact type: '..tostring(pact))
        return
    end
    
    if pacts[pact][pet.name] then
        if pact == 'astralflow' and not buffactive['astral flow'] then
            add_to_chat(122,'Cannot use Astral Flow pacts at this time.')
            return
        end
        
        -- Leave out target; let Shortcuts auto-determine it.
        send_command('@input /pet "'..pacts[pact][pet.name]..'"')
    else
        add_to_chat(122,pet.name..' does not have a pact of type ['..pact..'].')
    end
end

function job_handle_equipping_gear(playerStatus, eventArgs)    	
	if state.WeaponMode.value == "NirvanaLock" then
	  equip(sets.NirvanaLock)
	  disable("main")
	  disable("sub")
	else
	  enable("main")
	  enable("sub")
	end
end