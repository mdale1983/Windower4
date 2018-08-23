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
    indi_timer = ''
    indi_duration = 180
	state.CapacityMode = M(false, 'Capacity Point Mantle')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'MB')
    state.IdleMode:options('Normal', 'PDT')

    gear.default.weaponskill_waist = "Windbuffet Belt"
	send_command('bind != gs c toggle CapacityMode')    --alt=
    select_default_macro_book()
	set_lockstyle()
	set_healbot()
end


-- Define sets and vars used by this job file.
function init_gear_sets()


end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
end

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
-- User code that supplements standard s decisions.
-------------------------------------------------------------------------------------------------------------------

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
	if (world.time >= (17*60) or world.time <= (7*60)) then
			idleSet = set_combine(idleSet, sets.Night)
		else
			idleSet = set_combine(idleSet ,sets.Day)
	end
	if S{"Eastern Adoulin","Western Adoulin"}:contains(world.area) then
        idleSet = set_combine(idleSet,{body="Councilor's Garb"})
    end
	if state.CapacityMode.value then 
        idleSet = set_combine(idleSet, sets.CapacityMantle)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
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
    set_macro_page(1, 13)
end
function set_lockstyle()
    send_command('wait 4; input /lockstyleset 11')
end
function set_healbot()
		send_command('wait 1; input //hb ignoretrusts off')
		send_command('wait 1; input //hb mincure 1')
		send_command('wait 1; input //hb follow Eilwolf')
		send_command('wait 1; input //hb buff Enurihel Indi-Precision')

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