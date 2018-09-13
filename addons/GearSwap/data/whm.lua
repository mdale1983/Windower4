-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('organizer-lib')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    select_default_macro_book()
	set_lockstyle()
	set_healbot()
	get_mpValue()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end
    
    if spell.skill == 'Healing Magic' then
        gear.default.obi_back = "Mending Cape"
    else
        gear.default.obi_back = "Toro Cape"
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end


function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end 
end
function get_mpValue()
local abil_recasts = windower.ffxi.get_ability_recasts()
	if player.mp < 40 then 
		send_command('@input /ja "Sublimation" <me>')
	end 
	if player.mp > 40 then 
		send_command('@input /ja "Sublimation" <me>')
	end 
end 

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 14)
end
	
function set_lockstyle()
    send_command('wait 2; input /lockstyleset 2')
end
function set_healbot()
		send_command('wait 1; input //lua l healbot')
		send_command('wait 2; input //hb ignoretrusts off')
		send_command('wait 2; input //hb mincure 1')
		--send_command('wait 2; input //hb follow Enuri')
		send_command('wait 2; input //hb bufflist self Enurihel')

		send_command('wait 4; input //hb ignore_debuff always Accuracy Down')
		send_command('wait 4; input //hb ignore_debuff always Bind')
		send_command('wait 4; input //hb ignore_debuff always Bio')
		send_command('wait 4; input //hb ignore_debuff always shock')
		send_command('wait 4; input //hb ignore_debuff always curse')
		send_command('wait 4; input //hb ignore_debuff always Curse')
		send_command('wait 4; input //hb ignore_debuff always Defense Down')
		send_command('wait 4; input //hb ignore_debuff always Dia')
		send_command('wait 4; input //hb ignore_debuff always Disease')
		send_command('wait 4; input //hb ignore_debuff always Rasp')
		send_command('wait 4; input //hb ignore_debuff always Frost')
		send_command('wait 4; input //hb ignore_debuff always Burn')
		send_command('wait 4; input //hb ignore_debuff always Drown')
		send_command('wait 4; input //hb ignore_debuff always Evasion Down')
		send_command('wait 4; input //hb ignore_debuff always Magic Evasion Down')
		send_command('wait 4; input //hb ignore_debuff always Max HP Down')
		send_command('wait 4; input //hb ignore_debuff always Max MP Down')
		send_command('wait 4; input //hb ignore_debuff always Silence')
		send_command('wait 4; input //hb ignore_debuff always Petrification')
		send_command('wait 4; input //hb ignore_debuff always Plague')
		send_command('wait 4; input //hb ignore_debuff always Slow')
		send_command('wait 4; input //hb ignore_debuff always Weight')
end	