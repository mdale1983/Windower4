--[[
	Creator: Enuri
	Server: Asura
	Functions:
]]
----------------------------------------------
--  Initialization function required for    --
--          this to work properly           --
----------------------------------------------
	function get_sets()
		mote_include_version = 2
	  
	-- Load and initialize the include file.
		include('Mote-Include.lua')
	end 
--------------------------
--  Job Setup Section   --
--------------------------
	function job_setup()
		state.Buff.Sekkanoki = buffactive.Sekkanoki or false
		state.Buff.Sengikori = buffactive.Sengikori or false
		state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false
		state.CapacityMode = M(false, 'Capacity Point Mantle')
		moonshade_WS = S{
			"Tachi: Fudo", "Tachi: Rana", "Tachi: Kasha", "Tachi: Gekko"
		}
		gav_ws = S{"Tachi: Fudo","Tachi: Kasha","Tachi: Gekko"}
		job_update()
	end 
--------------------------
--  User Setup Section  --
--------------------------
	function user_setup()
		state.OffenseMode:options('Normal', 'Mid', 'Acc')
		state.HybridMode:options ('Normal', 'DT')
		--state.ReRaiseMode:options('Normal', 'Reraise')
		state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
	--[[ Overriding default hot keys ]]
		send_command('bind f11 gs c cycle HybridMode')      --F10
		send_command('bind f12 gs c cycle ReraiseMode')     --F11
		send_command('bind f10 gs c cycle WeaponskillMode') 	--F11
		send_command('bind != gs c toggle CapacityMode')    --alt=
	--[[ Additional User Defined Settings ]]
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
		if state.HybridMode.value == "DT" then 
			state.ReRaiseMode:set('Normal')
			idleSet = set_combine(idleSet, sets.DT)
			add_to_chat(8, '*User Mode selected: DT -- equiping DT set*')
		end 
		--[[if state.ReRaiseMode.value == "Reraise" then 
			state.HybridMode:set('Normal')
			idleSet = set_combine(idleSet, sets.Reraise)
			add_to_chat(8, '*User Mode selected: RR -- equiping Reraise set*')
		end]]
		if player.hpp < 80 then 
			idleSet = set_combine(idleSet, sets.regen)
		end 
		if state.Buff.Doom then
			idleSet = set_combine(idleSet, sets.buff.Doom)
		end
		if buffactive['Weakness'] then 
			equip({head="Twilight helm", body="Twilight mail"})
			disable('Head', 'Body')
			add_to_chat(8, 'Weakness detected - Locking Helm and Body')add_to_chat(8, 'Weakness detected - blocking Helm and Body')
			else 
			enable('Head', 'Body')
		end 
		if S{"Dynamis - Qufim"}:contains(world.area) then
			equip({body="Saotome domaru +2"})
			disable('Body')
		end
		if state.CapacityMode.value then 
			idleSet = set_combine(idleSet, sets.CapacityMantle)
		end
		if S{"Eastern Adoulin","Western Adoulin"}:contains(world.area) then
			idleSet = set_combine(idleSet,{body="Councilor's Garb"})
		end		
		return idleSet
	end 
-------------------------------
--  Custom Melee Gear set    --
-------------------------------
	function customize_melee_set(meleeSet)
		local abil_recasts = windower.ffxi.get_ability_recasts()
        if buffactive.Seigan and abil_recasts[133] == 0 then 
                send_command('@wait 1.0; input /ja "Third Eye" <me>')
            elseif buff == 'Hasso' then 
                cancel_spell()
            elseif not buffactive['Hasso'] and not buffactive['Seigan'] and not midaction() then 
                send_command('@wait 1.0; input /ja "Hasso" <me>')
        end
		if state.HybridMode.value == "DT" then 
			meleeSet = set_combine(meleeSet, sets.DT)
			add_to_chat(8, '*Danger Low HP -- equiping DT set*')
		end 
		--[[if state.ReRaiseMode.value == "Reraise" then 
			meleeSet = set_combine(meleeSet, sets.Reraise)
			add_to_chat(8, '*Danger Low HP -- equiping Reraise set*')
		end]]
		if buffactive['Weakness'] then 
			equip({head="Twilight helm", body="Twilight mail"})
			disable('Head', 'Body')
			add_to_chat(8, 'Weakness detected - blocking Helm and Body')
			else 
			enable('Head', 'Body')
		end
		if state.CapacityMode.value then 
			meleeSet = set_combine(meleeSet, sets.CapacityMantle)
		end
		--[[if S{"Dynamis - Tavnazia"}:contains(world.area) then
			equip({body="Saotome domaru +2"})
			disable('Body')
		end]]
		if buffactive['Warding Circle'] then
			meleeSet = set_combine(meleeSet, {body="Founder's Breastplate"})
		end
		return meleeSet
	end 
----------------------------------------------
--  General hooks for setting combat state  --
----------------------------------------------
    ------------------------------------------------------------------
    --  Called by the 'update' self-command, for common needs.      --
    --  Set eventArgs.handled to true if we don't want automatic    --
    --  equipping of gear.                                          --
    ------------------------------------------------------------------
		function job_update(cmdParams, eventArgs)
			job_status_change()
			get_combat_form()
			get_combat_weapon()
			job_state_change()
			update_melee_groups()
		end 
		function job_status_change(newStatus, oldStatus, eventArgs)
			function get_combat_form()
			classes.CustomMeleeGroups:clear()
			-- Hasso 16%
			-- Haste (white magic) 15%
			-- Haste Samba (Sub) 5%
			-- Haste (Merited DNC) 10%
			-- Victory March +3/+4/+5     14%/15.6%/17.1%
			-- Advancing March +3/+4/+5   10.9%/12.5%/14%
			-- Embrava 25%
			if (buffactive.embrava or buffactive.haste) and buffactive.march == 2 then
				add_to_chat(8, '-------------Haste 43%-------------')
				classes.CustomMeleeGroups:append('Haste_43')
			elseif buffactive.embrava and buffactive.haste then
				add_to_chat(8, '-------------Haste 40%-------------')
				classes.CustomMeleeGroups:append('Haste_40')
			elseif (buffactive.hasso and buffactive.haste) then 
				add_to_chat(8, '-------------Haste 31%-------------')
				classes.CustomMeleeGroups:append('Haste_40')
			elseif (buffactive.haste ) or (buffactive.march == 2 and buffactive['haste samba']) then
				add_to_chat(8, '-------------Haste 30%-------------')
				classes.CustomMeleeGroups:append('Haste_30')
			elseif buffactive.hasso or buffactive.march == 2 then
				add_to_chat(8, '-------------Haste 47%-------------')
				classes.CustomMeleeGroups:append('Haste_25')
			end
		end
		end 
		function get_combat_form()
			
			------------------------------------------------------
			--  Can add in more here this is just a placeholder --
			------------------------------------------------------
		end
		function get_combat_weapon()
			--currently left blank
			return get_combat_weapon
		end
		function job_state_change(stateField, newValue, oldValue)
			--nothing added in here
		end
		function update_melee_groups()
			if buffactive['Samurai Roll'] then
				classes.CustomRangedGroups:append('SamRoll')
			end
		end
-----------------------
-- Pre-cast section  --
-----------------------
	function job_precast(spell, action, spellMap, eventArgs)
	if spell.english == 'Tachi: Fudo' then
		send_command('@wait 4; input //send Enuriel /ws "Leaden Salute" <t> ')
	end
end
	function job_post_precast(spell, action, spellMap, eventArgs)
		if state.OffenseMode.value == "Normal" then 
			if spell.type == 'WeaponSkill' then
				if world.time >= 17*60 or world.time < 7*60 then -- Dusk to Dawn time.
					equip({ear1="Lugra Earring +1", ear2="Lugra Earring"})
				end
			end
		end 
		if spell.type=='WeaponSkill' then
			if moonshade_WS:contains(spell.english) and player.tp < 2850 then
				equip({ear2="Moonshade Earring"})
			end
		end
	-- Lock Weaponskill if you are to far from the mob as to not lose TP 
		if spell.type == 'WeaponSkill' then 
			if spell.target.distance > 5 then 
				cancel_spell()
				add_to_chat(8, 'Target to far away. Move closer')
				--send_command('input /tell Gardon MOVE CLOSER')
				return
			end 
		end
		if spell.type:lower() == 'weaponskill' then
			if state.Buff.Sekkanoki then
				equip(sets.buff.Sekkanoki)
			end
			if state.Buff.Sengikori then
				equip(sets.buff.Sengikori)
			end
			if state.Buff['Meikyo Shisui'] then
				equip(sets.buff['Meikyo Shisui'])
			end
		end		
	end
-----------------------
--  Mid-cast Section --
-----------------------
	function job_post_midcast(spell, action, spellMap, eventArgs)
		if spell.type == 'WeaponSkill' then 
			if gav_ws:contains(spell.english) and (spell.element==world.day_element or spell.element==world.weather_element) then
				equip({head="Gavialis Helm"})
			end
		end
		if state.HybridMode.value == 'Reraise' or
			(state.HybridMode.value == 'Physical' and state.ReraiseMode.value == 'Reraise') then
			equip(sets.Reraise)
		end		
	end	
------------------------------------------------------------------
-- Called when a player gains or loses a buff.                  --
-- buff == buff gained or lost                                  --
-- gain == true if the buff was gained, false if it was lost.   --
------------------------------------------------------------------	
	function job_buff_change(buff, gain)	
		if state.Buff[buff] ~= nil then
			state.Buff[buff] = gain
			handle_equipping_gear(player.status)
		end
		--[[if (gain_or_loss) then  
			add_to_chat(4,'------- Gained Buff: '..status..'-------')
		else
			add_to_chat(3,'------- Lost Buff: '..status..'-------')
		end ]]
		if buff:lower()=='terror' or buff:lower()=='petrification' or buff:lower()=='stun' then
			if gain then
				equip(sets.defense.DT)
				add_to_chat(8, 'DT set is equiped')
			elseif not gain then 
				handle_equipping_gear(player.status)
			end
		end
		if buff:lower()=='sleep' then
			if gain and player.hp > 120 and player.status == "Engaged" then 
			-- Equip Berserker's Torque / Frenzy Sallet While You Are Asleep
				equip(sets.Asleep)
			elseif not gain then 
			-- Remove Berserker's Torque / Frenzy Sallet
				handle_equipping_gear(player.status)
			end
		end
		if buffactive['Reive Mark'] then
			equip(sets.Reive)
			disable('neck')
			else
				enable('neck')
		end
		if buff == "doom" then
			if gain then           
				equip(sets.buff.Doom)
				--send_command('@input /p Doomed please cursna.')
				send_command('@input /item "Holy Water" <me>')
				disable('ring1','ring2','waist')
			else
				enable('ring1','ring2','waist')
				handle_equipping_gear(player.status)
			end
		end
		if buff == "Seigan" and player.status == 'Engaged' then
            if gain then
                send_command('@wait 1.0;input /ja "Third Eye" <me>')
            elseif not midaction() then
                send_command('@wait 1.0;input /ja "Hasso" <me>')
            end
        end
	end 
------------------------------------------------------------------
--  Selecting and Setting the default Macro book and Lock style --
------------------------------------------------------------------
	function select_default_macro_book()
		-- Default macro set/book
		if player.sub_job == 'WAR' then
			set_macro_page(1, 5)
		elseif player.sub_job == 'DRK' then 
			set_macro_page(3, 5)
		elseif player.sub_job == 'SAM' then
			set_macro_page(1, 5)
		elseif player.sub_job == 'SAM' then
			set_macro_page(2, 5)
		else
			set_macro_page(1, 5)
		end
	end
	function set_lockstyle()
		send_command('wait 4; input /lockstyleset 13')
	end	