--[[ 
	Created by: 	Eilwolf
	Server: 		Asura
	Gearswap Job: 	BRD
	
	
]]

----------------------------------------------
--  Initialization function required for    --
--          this to work properly           --
----------------------------------------------
	function get_sets()
		mote_include_version = 2 
	-- Load and Initialize the include files
		include('Mote-Include.lua')
	end 
--------------------------
--  Job Setup Section   --
--------------------------
	function job_setup()
		
		state.ExtraSongsMode = M{['description']='Extra Songs', 'None', 'Dummy', 'FullLength'}

    state.Buff['Pianissimo'] = buffactive['pianissimo'] or false

    -- For tracking current recast timers via the Timers plugin.
    custom_timers = {}
	end 
--------------------------
--  User Setup Section  --
--------------------------
	function user_setup()
		state.OffenseMode:options('None', 'Normal')
		state.CastingMode:options('Normal', 'Resistant')
		state.IdleMode:options('Normal', 'PDT')

		brd_daggers = S{'Izhiikoh', 'Vanir Knife', 'Atoyac', 'Aphotic Kukri', 'Sabebus'}
		pick_tp_weapon()
		
		-- Adjust this if using the Terpander (new +song instrument)
		--info.ExtraSongInstrument = 'Terpander'
		-- How many extra songs we can keep from Daurdabla/Terpander
		info.ExtraSongs = 3
		
		-- Set this to false if you don't want to use custom timers.
		state.UseCustomTimers = M(true, 'Use Custom Timers')
		
		-- Additional local binds
		send_command('bind ^` gs c cycle ExtraSongsMode')
		send_command('bind !` input /ma "Chocobo Mazurka" <me>')
		select_default_macro_book()
		set_lockstyle()
	end 
--------------------------------------------------
--  This section is called when you change jobs --
--------------------------------------------------
	function file_unload()
		send_command('unbind ^`')
		send_command('unbind !=')
		send_command('unbind ^[')
		send_command('unbind ![')
		send_command('unbind @f9')
		send_command('unbind @f10')
		send_command('unbind @f11')
		send_command('unbind @f12')
	end		
----------------------------------------------
--  This tells Gear swap what sets to fetch  --
--  Recommend creating a Car file.          --
----------------------------------------------
	function init_gear_sets()
	
	end 
---------------------------
--  Custom Idle Gear set --
---------------------------		
	function customize_idle_set(idleSet)
	
		return idleSet
	end 
-------------------------------
--  Custom Melee Gear set    --
-------------------------------
	function customize_melee_set(meleeSet)
	
		return meleeSet
	end 
------------------------------------------------------------------
-- Called when a player gains or loses a buff.                  --
-- buff == buff gained or lost                                  --
-- gain == true if the buff was gained, false if it was lost.   --
------------------------------------------------------------------	
	function job_buff_change(buff, gain)
	
	end
-----------------------
-- Pre-cast section  --
-----------------------
	function job_post_precast(spell, action, spellMap, eventArgs)
		if spell.type == 'BardSong' then
        -- Auto-Pianissimo
        if ((spell.target.type == 'PLAYER' and not spell.target.charmed) or (spell.target.type == 'NPC' and spell.target.in_party)) and
            not state.Buff['Pianissimo'] then
            
            local spell_recasts = windower.ffxi.get_spell_recasts()
            if spell_recasts[spell.recast_id] < 2 then
                send_command('@input /ja "Pianissimo" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
                eventArgs.cancel = true
                return
            end
        end
    end
	end 
-----------------------
--  Mid-cast Section --
-----------------------
	function job_midcast(spell, action, spellMap, eventArgs)
		if spell.action_type == 'Magic' then
        if spell.type == 'BardSong' then
            -- layer general gear on first, then let default handler add song-specific gear.
            local generalClass = get_song_class(spell)
            if generalClass and sets.midcast[generalClass] then
                equip(sets.midcast[generalClass])
            end
        end
    end
	end
---------------------------
-- Post Mid-cast Section --
---------------------------
	function job_post_midcast(spell, action, spellMap, eventArgs)
		if spell.type == 'BardSong' then
			if state.ExtraSongsMode.value == 'FullLength' then
				equip(sets.midcast.SongEffect)
				state.ExtraSongsMode:reset()
			end 
		end
	end
-------------------------
--  After-cast Section --
-------------------------	
	function job_aftercast(spell, action, spellMap, eventArgs)
		aftercast_start = os.clock()
		
		local generalClass = get_song_class(spell)
		if spell.type == 'BardSong' and not spell.interrupted then
			-- if spell.target and spell.target.type == 'SELF' then
			-- if spell.target.type ~= 'SELF' and spell.name ~= "Magic Finale" then   -- (Only using Custom Timers for debuffs; no huge reason for buffs)
			if spell.name ~= "Magic Finale" and (generalClass == "SongDebuff" or generalClass == "ResistantSongDebuff") then   -- (Only using Custom Timers for debuffs; no huge reason for buffs)
				--adjust_timers(spell, spellMap)
				local dur = calculate_duration(spell, spellMap)
				send_command('timers create "'..spell.target.name..':'..spell.name..'" '..dur..' down')
			end
			--state.ExtraSongsMode:reset()
		end
		--[[if state.SpellDebug.value == "On" then 
		  spelldebug(spell)
		end]]
		if spell.interrupted then
		  add_to_chat(8,'--------- Casting Interupted: '..spell.name..'---------')
		end 
		--equip(sets.Idle.Current)    
		--check_run_status()
		if precast_start and state.SpellDebug.value == "On" then 
			add_to_chat(8,"Spell: "..spell.name..string.format(" Casting Time: %.2f", aftercast_start - precast_start))
		end
		precast_start = nil
	end
------------------------------------------------
-- Job-specific hooks for non-casting events. --
------------------------------------------------
	--------------------------------------------------------
	-- Handle notifications of general user state change. --
	--------------------------------------------------------
		function job_state_change(stateField, newValue, oldValue)
			if stateField == 'Offense Mode' then
				if newValue == 'Normal' then
					disable('main','sub','ammo')
				else
					enable('main','sub','ammo')
				end
			end
		end
------------------------------------------------------------
-- User code that supplements standard library decisions. --
------------------------------------------------------------
	------------------------------------------
	-- Called by the 'update' self-command. --
	------------------------------------------
		function job_update(cmdParams, eventArgs)
			pick_tp_weapon()
		end
	-----------------------------------------------------------
	-- Modify the default idle set after it was constructed. --
	-----------------------------------------------------------
		function customize_idle_set(idleSet)
			if player.mpp < 51 then
				idleSet = set_combine(idleSet, sets.latent_refresh)
			end
			
			return idleSet
		end
	-------------------------------------------------------------------------------
	-- Function to display the current relevant user state when doing an update. --
	-------------------------------------------------------------------------------
		function display_current_job_state(eventArgs)
			display_current_caster_state()
			eventArgs.handled = true
		end	
---------------------------------------------
-- Utility functions specific to this job. --
---------------------------------------------
	-----------------------------------------------------------
	-- Determine the custom class to use for the given song. --
	-----------------------------------------------------------
		function get_song_class(spell)
	--[[
		Can't use spell.targets:contains() 
		because this is being pulled from resources 
	]]
			if set.contains(spell.targets, 'Enemy') then
				if state.CastingMode.value == 'Resistant' then
					return 'ResistantSongDebuff'
				else
					return 'SongDebuff'
				end
			elseif state.ExtraSongsMode.value == 'Dummy' then
				return 'TerpanderDummy'
			else
				return 'SongEffect'
			end
		end
	-----------------------------------------------------
	-- Function to create custom buff-remaining 	   --
	-- timers with the Timers plugin,				   --
	-- keeping only the actual valid songs rather than --
	-- spamming the default							   --
	-- buff remaining timers.						   --
	-----------------------------------------------------
		function adjust_timers(spell, spellMap)
			if state.UseCustomTimers.value == false then
				return
			end
			
			local current_time = os.time()
		--[[
			custom_timers contains a table of song names, with the
			os time when they will expire. Eliminate songs that 
			have already expired from our local list.
		]]
			local temp_timer_list = {}
			for song_name,expires in pairs(custom_timers) do
				if expires < current_time then
					temp_timer_list[song_name] = true
				end
			end
			for song_name,expires in pairs(temp_timer_list) do
				custom_timers[song_name] = nil
			end
			
			local dur = calculate_duration(spell.name, spellMap)
			if custom_timers[spell.name] then
			--[[
				Songs always overwrite themselves now, unless the new song has
				less duration than the old one (ie: old one was NT version, new
				one has less duration than what's remaining).
				If new song will outlast the one in our list, replace it.
			]]
				if custom_timers[spell.name] < (current_time + dur) then
					send_command('timers delete "'..spell.name..'"')
					custom_timers[spell.name] = current_time + dur
					send_command('timers create "'..spell.name..'" '..dur..' down')
				end
			else
				-- Figure out how many songs we can maintain.
				local maxsongs = 1
				if player.equipment.range == info.ExtraSongInstrument then
					maxsongs = maxsongs + info.ExtraSongs
				end
				if buffactive['Clarion Call'] then
					maxsongs = maxsongs + 1
				end
				-- If we have more songs active than is currently apparent, we can still overwrite
				-- them while they're active, even if not using appropriate gear bonuses (ie: Daur).
				if maxsongs < table.length(custom_timers) then
					maxsongs = table.length(custom_timers)
				end
				
				-- Create or update new song timers.
				if table.length(custom_timers) < maxsongs then
					custom_timers[spell.name] = current_time + dur
					send_command('timers create "'..spell.name..'" '..dur..' down')
				else
					local rep,repsong
					for song_name,expires in pairs(custom_timers) do
						if current_time + dur > expires then
							if not rep or rep > expires then
								rep = expires
								repsong = song_name
							end
						end
					end
					if repsong then
						custom_timers[repsong] = nil
						send_command('timers delete "'..repsong..'"')
						custom_timers[spell.name] = current_time + dur
						send_command('timers create "'..spell.name..'" '..dur..' down')
					end
				end
			end
		end
	---------------------------------------------------------------
	-- Function to calculate the duration of a song based on the --
	-- equipment used to -- cast it.Called from adjust_timers(), --
	-- which is only called on aftercast().						 --
	---------------------------------------------------------------
		function calculate_duration(spellName, spellMap)
			local mult = 1
		--[[ change to 0.25 with 90 Daur ]]
			if player.equipment.range == 'Daurdabla' then mult = mult + 0.3 end 
		--[[ change to 0.3 with 95 Gjall ]]
			if player.equipment.range == "Gjallarhorn" then mult = mult + 0.4 end 
		--[[ 0.1 for 75, 0.4 for 95, 0.5 for 99/119 ]]
			if player.equipment.main == "Carnwenhan" then mult = mult + 0.1 end 
			if player.equipment.main == "Legato Dagger" then mult = mult + 0.05 end
			if player.equipment.sub == "Legato Dagger" then mult = mult + 0.05 end
			if player.equipment.neck == "Aoidos' Matinee" then mult = mult + 0.1 end
			if player.equipment.body == "Aoidos' Hngrln. +2" then mult = mult + 0.1 end
			if player.equipment.legs == "Mdk. Shalwar +1" then mult = mult + 0.1 end
			if player.equipment.feet == "Brioso Slippers" then mult = mult + 0.1 end
			if player.equipment.feet == "Brioso Slippers +1" then mult = mult + 0.11 end
			
			if 
				spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet" then mult = mult + 0.1 
			end
			if 
				spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet +1" then mult = mult + 0.1 
			end
			if 
				spellMap == 'Madrigal' and player.equipment.head == "Aoidos' Calot +2" then mult = mult + 0.1 
			end
			if 
				spellMap == 'Minuet' and player.equipment.body == "Aoidos' Hngrln. +2" then 
				mult = mult + 0.1 
			end
			if 
				spellMap == 'March' and player.equipment.hands == 'Ad. Mnchtte. +2' then 
				mult = mult + 0.1 
			end
			if 
				spellMap == 'Ballad' and player.equipment.legs == "Aoidos' Rhing. +2" then mult = mult + 0.1 
			end
			if spellName == "Sentinel's Scherzo" and player.equipment.feet == "Aoidos' Cothrn. +2" then mult = mult + 0.1 end
			
			if buffactive.Troubadour then
				mult = mult*2
			end
			if spellName == "Sentinel's Scherzo" then
				if buffactive['Soul Voice'] then
					mult = mult*2
				elseif buffactive['Marcato'] then
					mult = mult*1.5
				end
			end
			
			local totalDuration = math.floor(mult*120)

			return totalDuration
		end


-- Examine equipment to determine what our current TP weapon is.
function pick_tp_weapon()
    if brd_daggers:contains(player.equipment.main) then
        state.CombatWeapon:set('Dagger')
        
        if S{'NIN','DNC'}:contains(player.sub_job) and brd_daggers:contains(player.equipment.sub) then
            state.CombatForm:set('DW')
        else
            state.CombatForm:reset()
        end
    else
        state.CombatWeapon:reset()
        state.CombatForm:reset()
    end
end

-- Function to reset timers.
function reset_timers()
    for i,v in pairs(custom_timers) do
        send_command('timers delete "'..i..'"')
    end
    custom_timers = {}
end
------------------------------------------------------------------
--  Selecting and Setting the default Macro book and Lock style --
------------------------------------------------------------------
	function select_default_macro_book()
		-- Default macro set/book
		if player.sub_job == 'DNC' then
			set_macro_page(1, 10)
		elseif player.sub_job == 'SAM' and player.equipment.main == 'Ragnarok' then
			set_macro_page(1, 10)
		elseif player.sub_job == 'SAM' and player.equipment.main == 'Caladbolg' then
			set_macro_page(1, 10)
		elseif player.sub_job == 'SAM' and player.equipment.main == 'Apocalypse' then
			set_macro_page(1, 10)
		else
			set_macro_page(1, 10)
		end
	end
	function set_lockstyle()
		send_command('wait 4; input /lockstyleset 14')
	end
--
-- Miscelanous Stuff --
--
	windower.raw_register_event('zone change',reset_timers)
	windower.raw_register_event('logout',reset_timers)