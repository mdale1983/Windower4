--[[Paladin Gearswap 

]]
----------------------------------------------
--  Initialization function required for    --
--          this to work properly           --
----------------------------------------------
	function get_sets()
		mote_include_version = 2
		--[[Load and Initialize the include file]]
		include('Mote-IncludePLD.lua')
	end 
--------------------------
-- 	Job Setup Section 	--
--------------------------
	function job_setup()
		include('caster_buffWatcher.lua')
		buffWatcher.watchList = 
		{
			["Enlight"]="Enlight II",
			["Enmity Boost"]="Crusade",
			["Phalanx"]="Phalanx",
			["Protect"]="Protect V",
			["Shell"]="Shell IV",							   
		}
		include('common_info.status.lua')
		state.CapacityMode = M(false, 'Capacity Point Mantle')
		shieldList = S{'Aegis', 'Ochain'}
		state.mainWeapon = M{'None', 'Aegis', 'Ochain'}
		moonshade_WS = S{"Resolution", "Dimidiation", "Savage Blade", "Vorpal Blade", 
						 "Requiescat", "Sanguine Blade"}
		PhysicalSpells = S {
		'Bludgeon', 'Body Slam', 'Feather Storm', 'Mandibular Bite', 
		'Queasyshroom', 'Power Attack', 'Screwdriver', 'Sickle Slash', 
		'Smite of Rage', 'Terror Touch', 'Battle Dance', 'Claw Cyclone',
		'Foot Kick', 'Grand Slam', 'Sprout Smack', 'Helldive', 'Jet Stream',
		'Pinecone Bomb', 'Wild Oats', 'Uppercut'
		}
		
		BlueMagic_Buffs = S {
			'Refueling',
		}

		BlueMagic_Healing = S {
			'Healing Breeze', 'Pollen', 'Wild Carrot'
		}

		BlueMagic_Enmity = S { 
			'Blank Gaze', 'Jettatura', 'Geist Wall', 
			'Sheep Song', 'Soporific', 'Cocoon', 'Stinking Gas'
		}
		
		Magic_Enmity = S {
			'Flash', 'Stun', 'Sleepga'
		}
	end 
--------------------------
-- 	User Setup Section 	--
--------------------------
	function user_setup()
		state.OffenseMode:options('PDT', 'Magic', 'Normal', 'Acc')
		state.IdleMode:options('PDT', 'Normal')
		state.HybridMode:options ('Normal', 'DT', 'Reraise') 
		state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
		--[[ Overriding default hotkeys ]]
		send_command('bind f10 gs c cycle HybridMode')      --F10
		send_command('bind f9 gs c cycle IdleMode')
		send_command('bind !f9 gs c cycle OffenseMode')
		send_command('bind f11 gs c cycle WeaponskillMode') --F11
		send_command('bind != gs c toggle CapacityMode')    --alt=
		send_command('bind !f9 gs c set mainWeapon "Ochain"')
		send_command('bind ^f9 gs c set mainWeapon "Aegis"')
		select_default_macro_book()
		set_lockstyle()
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
	end
----------------------------------------------
--  This tells Gear swap what sets to fetch  --
--  Recommend creating a Car file.          --
----------------------------------------------
	function init_gear_sets()
		--[[Gear has been collected in a separate file]]
	end
--------------------------
--  Custom Idle Gear set --
--------------------------
	function customize_idle_set(idleSet)
		if state.IdleMode.value == 'PDT' then 
			idleSet = set_combine(idleSet, sets.idle.PDT)
		end
		if state.Buff.Doom then
			idleSet = set_combine(idleSet, sets.buff.Doom)
		end
		 
		if state.CapacityMode.value then 
			idleSet = set_combine(idleSet, sets.CapacityMantle)
		end
		return idleSet
	end 
------------------------------
--  Custom melee Gearset    --
------------------------------
	function customize_melee_set(meleeSet)	
		if state.Buff.Doom then
			meleeSet = set_combine(meleeSet, sets.buff.Doom)
		end
		return meleeSet
	end 
---------------------------------
--  Custom Defense Gear set    --
---------------------------------	
	--[[function customize_defense_set(defenseSet)
		if state.ExtraDefenseMode.value ~= 'None' then
			defenseSet = set_combine(defenseSet, sets[state.ExtraDefenseMode.value])
		end
		if state.EquipShield.value == true then
			defenseSet = set_combine(defenseSet, sets[state.DefenseMode.current .. 'Shield'])
		end
		if state.Buff.Doom then
			defenseSet = set_combine(defenseSet, sets.buff.Doom)
		end
		return defenseSet
	end]]
----------------------------------------------
--  General hooks for setting combat state  --
----------------------------------------------
    ------------------------------------------------------------------
    --  Called by the 'update' self-command, for common needs.      --
    --  Set eventArgs.handled to true if we don't want automatic    --
    --  equipping of gear.                                          --
    ------------------------------------------------------------------	
		function job_status_change(newStatus, oldStatus, eventArgs)
			if newStatus == "Idle" then
				
			end 
		end
	function get_combat_weapon()
		if state.mainWeapon.value == "Ochain" then 
				equip({sub="Ochain"})
				--set_macro_page(2, 6)
		elseif state.mainWeapon.value == "Aegis" then 
				equip({sub="Aegis"})
				--set_macro_page(3, 6)
		end
	end 
	function job_update(cmdParams, eventArgs)
		get_combat_weapon()
		job_status_change()
	end
	function job_state_change(stateField, newValue, oldValue)
		--nothing added in here
	end
	function update_melee_groups()
		classes.CustomMeleeGroups:clear()
	end
----------------------
-- Precast section  --
----------------------
	function job_post_precast(spell, action, spellMap, eventArgs)
		if spell.english == 'Rayke' then 
			send_command('@input /p Rayke used lowering enemies '..state.Rune2.value..' resistance'  )
		end
		if spell.english == 'Gambit' then 
			send_command('@input /p Gambit used lowering enemies '..state.Rune2.value..' defense'  )
		end 
		if spell.english == 'Lunge' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[spell.recast_id] > 0 then
				send_command('input /jobability "Swipe" <t>')
				add_to_chat(122, '*Lunge Aborted: Timer on Cooldown -- Downgrading to Swipe.*')
				eventArgs.cancel = true
			return
			end
		end
		if spell.english == 'Valiance' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[spell.recast_id] > 0 then
				send_command('input /jobability "Vallation" <me>')
				add_to_chat(122, '*Valiance Aborted: Timer on Cooldown -- Downgrading to Vallation.*')
				eventArgs.cancel = true
			return
			end
		end
		if spell.english == 'Pflug' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[spell.recast_id] > 0 then
				send_command('input /jobability "Liement" <me>')
				add_to_chat(122, '*Pflug Aborted: Timer on Cooldown -- Downgrading to Liement.*')
				eventArgs.cancel = true
			return
			end
		end
		if spell.english == 'Gambit' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[spell.recast_id] > 0 then
				send_command('input /jobability "Rayke" <t>')
				add_to_chat(122, '*Gambit Aborted: Timer on Cooldown -- Downgrading to Rayke.*')
				eventArgs.cancel = true
			return
			end
		end	
		if spell.action_type=="Magic" and buffactive.Silence then
			eventArgs.cancel = true
			send_command('input /item "Echo Drops" <me>')
		end
	end
----------------------
--  Midcast Section --
----------------------
	function job_post_midcast(spell, action, spellMap, eventArgs)
		if spell.skill == 'Elemental Magic' then
			if spell.element == world.day_element or spell.element == world.weather_element then
				equip(sets.midcast['Elemental Magic'], {waist="Hachirin-no-Obi"})
			end
		end
		if S{"Dimidiation","Resolution"}:contains(spell.english) and (spell.element==world.day_element or spell.element==world.weather_element) then
			equip({head="Gavialis Helm"})
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
		if buff:lower()=='terror' or buff:lower()=='petrification' or buff:lower()=='sleep' or buff:lower()=='stun' then
			if gain then
				equip(sets.defense.DT)
				add_to_chat(8, 'DT set is equiped')
			elseif not gain then 
				handle_equipping_gear(player.status)
			end
		end
		if buffactive['Bio'] and world.area == "Maquette Abdhaljs-Legion" then 
			send_command('@input /item "Panacea" <me>')
			add_to_chat(7,'Bio is on remove it now!')
		end 
		if buff:lower()=='sleep' then
			if gain and player.hp > 120 and player.status == "Engaged" then -- Equip Berserker's Torque / frenzy When You Are Asleep
				equip(sets.Asleep)
			elseif not gain then -- Take Berserker's off
				handle_equipping_gear(player.status)
			end
		end
		if buff:lower()== 'sleep' then 
			equip(sets.Asleep)
			add_to_chat(8, 'Your asleep setting DT')
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
------------------------------------------------------------------
--  Selecting and Setting the default Macro book and Lock style --
------------------------------------------------------------------
function select_default_macro_book()
    -- Default macro set/book
        set_macro_page(1, 8)
    
end
function set_lockstyle()
    send_command('wait 4; input /lockstyleset 2')
end	