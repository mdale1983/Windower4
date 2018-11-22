--[[ Red Mage V2.0
	Created by: Enuri of Asura
	
	Key mappings for binds to different modes
		[*]OffenseMode			|	--f9
		[*]HybridMode      		|	--F10
		[*]IdleMode				|	--F12
		[*]CastingMode			|	--f12
		[*]PhysicalDefenseMode 	|	Ctrl+f9
		[*]MagicalDefenseMode 	|	Ctrl+f10
		[*]Kiting 				|	WindowsKey+f9
		[*]mainWeapon Murgleis 	|	windowsKey+f10
		[*]mainWeapon Sequence 	|	windowsKey+f11
		[*]mainWeapon Excalibur |	windowsKey+f12
	
	This also has custom spell mappings and breaks down 
	Enfeebling magic by MND and INT 
	
]]
----------------------------------------------
--  Initialization function required for    --
--          this to work properly           --
----------------------------------------------
	function get_sets() 
		mote_include_version = 2
		include('Mote-Include.lua')
	end 
--------------------------
--  Job Setup Section   --
--------------------------
	function job_setup()
	--[[ State Buffs ]]
		state.Buff.Saboteur = buffactive.Saboteur or false
	--[[ Spell Maps ]]
		enfeebling_magic_acc = S{
			'Bind', 'Break', 'Dispel', 'Distract', 'Distract II', 'Frazzle',
			'Frazzle II',  'Gravity', 'Gravity II', 'Silence', 'Sleep', 
			'Sleep II', 'Sleepga', 'Inundation'
		}
		enfeebling_magic_skill = S{
			'Distract III', 'Frazzle III', 'Poison II'
		}
		enfeebling_magic_effect = S{
			'Dia', 'Dia II', 'Dia III', 'Diaga'
		}
	gsList = S{'Excalibur', 'Almace', 'Sequence', 'Murgleis'}
	state.mainWeapon = M{'Excalibur', 'Almace', 'Sequence', 'Murgleis'}
	moonshade_WS = S{
			"Savage Blade", "Requiescat", "Sanguine Blade"
		}
	end 
--------------------------
--  User Setup Section  --
--------------------------
	function user_setup()
	--[[ Regular user states ]]
		state.OffenseMode:options('None', 'Normal', 'Acc')
		state.HybridMode:options('Normal', 'PDT', 'Magic')
		state.CastingMode:options('Normal', 'Burst', 'Resistant')
		state.IdleMode:options('Normal', 'PDT', 'MDT')
		state.WeaponskillMode:options('Normal', 'Acc')
		state.PhysicalDefenseMode:options('None', 'PDT')
		state.MagicalDefenseMode:options('None', 'MDT')
	--[[ Overriding states ]]	
		send_command('bind f9 gs c cycle OffenseMode')		--f9
		send_command('bind f10 gs c cycle HybridMode')      --F10
		send_command('bind f11 gs c cycle IdleMode')		--F12
		send_command('bind f12 gs c cycle CastingMode')		--f12
		send_command('bind ^f9 gs c cycle PhysicalDefenseMode')
		send_command('bind ^f10 gs c cycle MagicalDefenseMode')
		send_command('bind @f9 gs c toggle Kiting')
	--[[ Main Weapon Key binds ]]
		send_command('bind @f10 gs c set mainWeapon "Murgleis"')
		send_command('bind @f11 gs c set mainWeapon "Sequence"')
		send_command('bind @f12 gs c set mainWeapon "Excalibur"')
	--[[ Job specific functions for Lockstyle and Macros ]]
		select_default_macro_book()
		get_player_name()
	--[[ Misc Stuff ]]
		gear.default.obi_waist = "Hachirin-no-Obi"
	end 	
	function get_player_name()
		if windower.ffxi.get_player() then 
			self = windower.ffxi.get_player().name
			roll = windower.ffxi.get_player().main_job_full
			windower.add_to_chat(7,'Hello '..self..' Your '..roll..' LUA is now loaded')
		end
	end 
--------------------------------------
-- Elements for skillchain names    --
--------------------------------------
    skillchain_elements = {}
    skillchain_elements.Light = S{'Light','Fire','Wind','Lightning'}
    skillchain_elements.Darkness = S{'Dark','Ice','Earth','Water'}
    skillchain_elements.Fusion = S{'Light','Fire'}
    skillchain_elements.Fragmentation = S{'Wind','Lightning'}
    skillchain_elements.Distortion = S{'Ice','Water'}
    skillchain_elements.Gravitation = S{'Dark','Earth'}
    skillchain_elements.Transfixion = S{'Light'}
    skillchain_elements.Compression = S{'Dark'}
    skillchain_elements.Liquification = S{'Fire'}
    skillchain_elements.Induration = S{'Ice'}
    skillchain_elements.Detonation = S{'Wind'}
    skillchain_elements.Scission = S{'Earth'}
    skillchain_elements.Impaction = S{'Lightning'}
    skillchain_elements.Reverberation = S{'Water'}
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
		send_command('unbind !f9')
		send_command('unbind !f10')
		send_command('unbind !f11')
		send_command('unbind !f12')
	end
----------------------------------------------
--  This tells Gearswap what sets to fetch  --
--  Recommend creating a Car file.          --
----------------------------------------------
	function init_gear_sets()
	
	end	
--------------------------
--  Custom Idle Gearset --
--------------------------
	function customize_idle_set(idleSet)
		if player.mpp < 51 then
			idleSet = set_combine(idleSet, sets.latent_refresh)
		end
		if state.PhysicalDefenseMode.value == "PDT" then 
			idleSet = set_combine(idleSet, sets.defense.PDT)
		end 
		if state.MagicalDefenseMode.value == "MDT" then 
			idleSet = set_combine(idleSet, sets.defense.MDT)
		end 
		return idleSet
	end 
------------------------------
--  Custom melee Gearset    --
------------------------------
	function customize_melee_set(meleeSet)
		if state.OffenseMode == 'Normal' then 
			send_command('gs c set WeaponskillMode Normal')
		elseif state.OffenseMode == 'Acc' then 
			send_command('gs c set WeaponskillMode Acc')
		end 
		if state.PhysicalDefenseMode.value == "PDT" then 
			idleSet = set_combine(idleSet, sets.defense.PDT)
		end 
		if state.MagicalDefenseMode.value == "MDT" then 
			idleSet = set_combine(idleSet, sets.defense.MDT)
		end 
		if state.mainWeapon.value == "Murgleis" then 
			equip({main="Murgleis", sub="Almace"})
		elseif state.mainWeapon.value == "Sequence" then 
			equip({main="Sequence", sub="Almace"})
		elseif state.mainWeapon.value == "Excalibur" then 
			equip({main="Excalibur", sub="Almace"})
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
	function job_status_change(newStatus, oldStatus, eventArgs)
		
	end
	function job_update(cmdParams, eventArgs)
		get_combat_form()
		get_combat_weapon()
		--update_melee_groups()
		determine_haste_group()
	end
	function get_combat_form()
		if (buffactive.haste and buffactive.hasso and buffactive.march == 2) then 
			add_to_chat(8, '---Weapon Delay is not Capped---')
		end 
		------------------------------------------------------
		--  Can add in more here this is just a placeholder --
		------------------------------------------------------
	end
	function get_combat_weapon()
		if state.mainWeapon.value == "Murgleis" then 
			equip({main="Murgleis", sub="Almace"})
		end 
		if state.mainWeapon.value == "Sequence" then 
			equip({main="Sequence", sub="Almace"})
		end 
		if state.mainWeapon.value == "Excalibur" then 
			equip({main="Excalibur", sub="Almace"})
		end
	end
	function job_state_change(stateField, newValue, oldValue)
		if stateField == 'Offense Mode' then
			if newValue == 'None' then
				enable('main','sub','range')
			else
				disable('main','sub','range')
			end
		end
	end
	
	function determine_haste_group()

		classes.CustomMeleeGroups:clear()
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
		elseif (buffactive.haste ) or (buffactive.march == 2 and buffactive['haste samba']) then
			add_to_chat(8, '-------------Haste 30%-------------')
			classes.CustomMeleeGroups:append('Haste_30')
		elseif buffactive.embrava or buffactive.march == 2 then
			add_to_chat(8, '-------------Haste 25%-------------')
			classes.CustomMeleeGroups:append('Haste_25')
		end
	end
--------------------------------------------------
--  Creating a custom spellMap,                 --
--  since Mote capitalized absorbs incorrectly  --
--------------------------------------------------
	function job_get_spell_map(spell, default_spell_map)
		if spell.action_type == 'Magic' then
			if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
				if (world.weather_element == 'Light' or world.day_element == 'Light') then
					return 'CureWeather'
				end
			end
			if spell.skill == 'Enfeebling Magic' then
				if spell.type == "WhiteMagic" then
					if  enfeebling_magic_effect:contains(spell.english) then
						return "EffectEnfeebles"
					elseif not enfeebling_magic_skill:contains(spell.english) then
						if enfeebling_magic_acc:contains(spell.english) and not buffactive.Stymie then
							return "MndEnfeeblesAcc"
						else
							return "MndEnfeebles"
						end
					end
				elseif spell.type == "BlackMagic" then
					if  enfeebling_magic_effect:contains(spell.english) then
						return "EffectEnfeebles"
					elseif not enfeebling_magic_skill:contains(spell.english) then
						if enfeebling_magic_acc:contains(spell.english) and not buffactive.Stymie then
							return "IntEnfeeblesAcc"
						else
							return "IntEnfeebles"
						end
					end
				else
					return "MndEnfeebles"
				end
			end
		end
	end
----------------------
-- Precast section  --
----------------------	
	function precast(spell,action)
		if spell.english:startswith('Cur') and spell.english ~= "Cursna" then
			equip(sets.Precast.Cure)
		elseif spell.english == "Stun" then
			if buffactive.Composure then -- Cancel Composure When You Cast Stun --
				cast_delay(0.2)
				send_command('cancel Composure')
			end
		end
		--[[ Lock Weaponskill if you are to far from the mob as to not lose TP ]]
		if spell.type == 'WeaponSkill' then 
			if spell.target.distance > 5 then 
				cancel_spell()
				add_to_chat(8, 'Target to far away. Move closer')
				--send_command('input /tell Gardon MOVE CLOSER')
				return
			end 
		end
		if spell.type=='WeaponSkill' then
			if moonshade_WS:contains(spell.english) and player.tp < 2850 then
				equip({ear2="Moonshade Earring"})
			end
		end
	end
	function job_post_precast(spell, action, spellMap, eventArgs)
	
	end 
	------------------------------------------------------
	-- Run after the default midcast() is done.			--
	-- eventArgs is the same one used in job_midcast, 	--
	-- in case information needs to be persisted.		--
	------------------------------------------------------
	function job_post_midcast(spell, action, spellMap, eventArgs)
		if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
			equip(sets.buff.Saboteur)
		elseif spell.skill == 'Enhancing Magic' then
			if buffactive.composure and spell.target.type == 'PLAYER' then
				equip(sets.buff.ComposureOther)
			elseif spell.english:startswith('En') then
				equip(sets.midcast['Enhancing Magic'].EnSpells)
			elseif spell.english:startswith('Gain') then
				equip(sets.midcast['Enhancing Magic'].GainSpells)
			elseif spell.english == "Haste II" then 
				equip(sets.midcast.Duration)	
			end
		elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
			equip(sets.midcast.CureSelf)
		end
		if spell.skill == "Impact" then 
			equip({body="Twilight cloak"})
		end 
		if spell.skill == 'Enfeebling Magic' then
			if enfeebling_magic_skill:contains(spell.english) or enfeebling_magic_effect:contains(spell.english) then
				if spell.type == "WhiteMagic" then
					equip(sets.midcast.MndEnfeeblesAcc)
				else
					equip(sets.midcast.IntEnfeeblesAcc)
				end
			end
		end
		if spell.skill == 'Elemental Magic' then
			if (spell.element == world.day_element or spell.element == world.weather_element) and not string.find(spell.english, 'helix') then
				equip(sets.Obi)
			end
		end
		if spell.skill == 'Elemental Magic' then 
			send_command('gs c set CastingMode Normal')
		end 
	end
------------------------------------------------------------------
-- Called when a player gains or loses a buff.                  --
-- buff == buff gained or lost                                  --
-- gain == true if the buff was gained, false if it was lost.   --
------------------------------------------------------------------
	function job_buff_change(buff, gain)
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if state.Buff[buff] ~= nil then
			state.Buff[buff] = gain
			handle_equipping_gear(player.status)
		end
		if buff:lower()=='haste' or buff:lower()=='march' or buff:lower()=='embrava' or buff:lower()=='haste samba' then
			determine_haste_group()
			handle_equipping_gear(player.status)
		end 
		if buff:lower()=='terror' or buff:lower()=='petrification' or buff:lower()=='sleep' or buff:lower()=='stun' then
			if gain then
				equip(sets.DT)
				add_to_chat(8, 'DT set is equiped')
			elseif not gain then 
				handle_equipping_gear(player.status)
			end
		end
		if buff:lower()=='sleep' then
			if gain and player.hp > 120 and player.status == "Engaged" then 
			--Equip Berserker's Torque / frenzy When You Are Asleep
				equip({head="Frenzy sallet"})
			elseif not gain then -- Take Berserker's off
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
	end 
----------------------------------
--  Sub job section for Ninja   --
----------------------------------

------------------------------------------------------------------
--  Selecting and Setting the default Macro book and Lock style --
------------------------------------------------------------------	
	function select_default_macro_book()
		-- Default macro set/book
		if player.sub_job == 'DNC' then
			set_macro_page(1, 5)
		elseif player.sub_job == 'NIN' then
			set_macro_page(1, 5)
		else
			set_macro_page(1, 2)
		end
	end