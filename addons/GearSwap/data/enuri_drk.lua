--[[
	Lua: Dark Knight V2.1
	Created by: Enuri
	Server: Asura
	
	
]]
----------------------------------------------
--  Initialization function required for    --
--          this to work properly           --
----------------------------------------------
	function get_sets()
		mote_include_version = 2
	-- Load and initialize the include file(s)
		include('Mote-Include.lua')
	end 
------------------------------------------
-- Initialization of the various job 	--
-- Binds for the differnt modes			--
------------------------------------------
	function job_binds()
	--[[ F9-F12 keybinds ]]
		send_command('bind f9 gs c cycle IdleMode')
		send_command('bind f10 gs c cycle OffenseMode')
		send_command('bind f11 gs c cycle HybridMode')
		send_command('bind f12 gs c cycle CastingMode')
	--[[ AltF9-AltF12 keybinds ]]
		send_command('bind !f9 gs c cycle Empty')
		send_command('bind !f10 gs c cycle Empty')
		send_command('bind !f11 gs c cycle LastResortMode')
		send_command('bind !f12 gs c cycle SouleaterMode')
		send_command('bind != gs c toggle CapacityMode')
	--[[ CtrlF9-CtrlF12 keybinds ]]
		send_command('bind ^f9 gs c cycle Empty')
		send_command('bind ^f10 gs c cycle Empty')
		send_command('bind ^f11 gs c cycle Empty')
		send_command('bind ^f12 gs c cycle Empty')
	--[[ WindowsF9-WindowsF12 keybinds ]]
		send_command('bind @f9 gs c set mainWeapon Apocalypse')
		send_command('bind @f10 gs c set mainWeapon Liberator')
		send_command('bind @f11 gs c set mainWeapon Ragnarok')
		send_command('bind @f12 gs c set mainWeapon Caladbolg')
	end 
--------------------------
--  Job Setup Section   --
--------------------------
	function job_setup()
	--[[ Various weapon states ]]
		state.mainWeapon = M{'None', 'Apocalypse', 'Liberator', 'Ragnarok', 'Caladbolg'}
		gsList = S{'Macbain', 'Crobaci +1'}
		scytheList = S{'Cronus', 'Raetic Scythe'}
	--[[ Correction to errors in Mote Libs ]]
		absorbs = S{ 
			'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 
			'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 
			'Absorb-CHR', 'Absorb-ACC', 'Absorb-TP',
			'Absorb-Attri'
		}
	--[[ Moonshade earring and Gav. Helmet ]]
		moonshade_WS = S{
			"Resolution", "Torcleaver", "Catastrophe", 
			"Cross Reaper", "Quietus", "Entropy", "Insurgency", "Savage Blade", "Vorpal Blade", "Requiescat", 
			'Sanguine Blade'
		}
		gav_ws = S{
			"Torcleaver","Resolution","Catastrophe",
			"Scourge","Cross Reaper"
		}
	--[[ Nuking sets ]]
		LowTierNuke = S{
			'Stone', 'Stone II', 'Stone III', 3
			'Stonega', 'Stonega II',
			'Water', 'Water II', 'Water III', 
			'Waterga', 'Waterga II',
			'Aero', 'Aero II', 'Aero III', 
			'Aeroga', 'Aeroga II',
			'Fire', 'Fire II', 'Fire III', 
			'Firaga', 'Firaga II',
			'Blizzard', 'Blizzard II', 'Blizzard III', 
			'Blizzaga', 'Blizzaga II',
			'Thunder', 'Thunder II', 'Thunder III', 
			'Thundaga', 'Thundaga II'
		}
	--[[ Section for Rune Fencer sub job to display which rune ]]    
		state.Runes = M{['description']='Rune', 
			"Ignis", 
			"Gelus", 
			"Flabra", 
			"Tellus", 
			"Sulpor", 
			"Unda", 
			"Lux", 
			"Tenebrae"
		}
		state.Rune = M{['description']='which', 
			"Fire Dmg | Ice Resist: Paralyze, Bind, Frost", 
			"Ice Dmg | Wind Resist: Choke, Gravity, Silence", 
			"Wind dmg | Earth Resist: Slow, Petrify, Rasp", 
			"Earth dmg | Lightning Resist: Stun, Shock", 
			"Lightning Dmg | Water Resist: Poison, Drown", 
			"Water dmg | Fire Resist: Addle, Burn, Plague, Amnesia", 
			"Light Dmg | Dark Resist's: Blind, Bio, Sleep", 
			"Dark Dmg | Light Resist's: Repose, Dia, Charm"
		}
	--[[ Section for Ninja Tools ]]
		ninjaTools = {
			Utsusemi = S{"Shihei",},--"Shikanofuda" 
			Hojo = S{"Kaginawa",},--"Chonofuda"
			Migawari = S{"Mokujin",},
			Kakka = S{"Ryuno",},
			Tonko = S{"Shinobi-tabi",},
			Kurayami = S{"Sairui-Ran",},
			Raiton = S{"Hiraishin",},
			Hyoton = S{"Tsurara",},
			Monomi = S{"Sanjaku-Tenugui",},
		}
	end 
--------------------------
--  User Setup Section  --
--------------------------
	function user_setup()
	--[[ Default states ]]
		state.IdleMode:options('Normal', 'PDT', 'MagicEva')
		state.OffenseMode:options('Normal', 'Mid', 'Acc')
		state.HybridMode:options ('Normal', 'DT')
		state.ReRaiseMode:options('Normal', 'Reraise')
		state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
		state.CastingMode:options('Normal', 'Resistant', 'Enmity')
	--[[ User created states ]]
		state.SouleaterMode = M(false, 'Soul Eater Mode')
		state.LastResortMode = M(false, 'Last Resort Mode')
		state.DarkSealMode:options('None', 'DarkSeal')		
	--[[ Section for loading user function's ]]
		get_player_hp()
		job_update()
		select_default_macro_book()
		set_lockstyle()
	end 
	function get_player_name()
		if windower.ffxi.get_player() then 
			self = windower.ffxi.get_player().name
			roll = windower.ffxi.get_player().main_job_full
			windower.add_to_chat(7,'Hello '..self..' Your '..roll..' LUA is now loaded')
			windower.add_to_chat(7,'The gerbils are constructing your '..roll..' Lockstyle set!')
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
------------------------------
--  This section is called 	--
--  when you change jobs 	--
------------------------------
	function file_unload()
	--[[ F9-F12 unbind's ]]
		send_command('unbind f9')
		send_command('unbind f10')
		send_command('unbind f11')
		send_command('unbind f12')
	--[[ AltF9-AltF12 unbind's ]]
		send_command('unbind !f9')
		send_command('unbind !f10')
		send_command('unbind !f11')
		send_command('unbind !f12')
		send_command('unbind !=')
	--[[ CtrlF9-CtrlF12 unbind's ]]
		send_command('unbind ^f9')
		send_command('unbind ^f10')
		send_command('unbind ^f11')
		send_command('unbind ^f12')
	--[[ WindowsF9-WindowsF12 unbind's ]]
		send_command('unbind @f9')
		send_command('unbind @f10')
		send_command('unbind @f11')
		send_command('unbind @f12')
	end	
----------------------------------------------
--  This tells Gear swap what sets to fetch	--
--  Recommend creating a Car file.          --
----------------------------------------------
	function init_gear_sets()
		--[[ Gear is contained in a playerName_job.lua file ]]
	end 
-----------------------------------------
-- Checking Player HP for Hybird modes --	
-----------------------------------------
	function get_player_hp()  
		if player.hpp < 60 then 
			send_command('gs c set HybridMode "DT"')
		end 
		if player.hpp < 50 then 
			send_command('gs c set HybridMode "Reraise"')
		elseif player.hpp > 51 then 
			send_command('gs c set HybridMode "Normal"')
		end
	end
---------------------------
--  Custom Idle Gear set --
---------------------------
	function customize_idle_set(idleSet)
		if state.HybridMode.value == 'DT' then 
			idleSet = set_combine(idleSet, sets.DT)
			add_to_chat(7,'Your HP is at '..player.hpp..' equiping DT set')
		end 
		if state.HybridMode.value == 'Reraise' then 
			idleSet = set_combine(idleSet, sets.Reraise)
			add_to_chat(7,'Death is iminent hp is at '..player.hpp..' equiping re-raise set')
		end 
		if player.mpp < 51 then
			idleSet = set_combine(idleSet, sets.latent_refresh)
		end
		if state.IdleMode.value == "PDT" then 
			idleSet = set_combine(idleSet, sets.idle.DT)
		end 
		if state.MagicalDefenseMode.value == "MagicEva" then 
			idleSet = set_combine(idleSet, sets.idle.MagEva)
		end
		if buffactive['Weakness'] then 
			equip({head="Twilight helm", body="Twilight mail"})
			disable('Head', 'Body')
			add_to_chat(8, 'Weakness detected - Locking Helm and Body')add_to_chat(8, 'Weakness detected - blocking Helm and Body')
			else 
			enable('Head', 'Body')
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
	function customize_melee_set
		if state.HybridMode.value == 'DT' then 
			meleeSet = set_combine(meleeSet, sets.DT)
			add_to_chat(7,'Your HP is at '..player.hpp..' equiping DT set')
		end 
		if state.HybridMode.value == 'Reraise' then 
			meleeSet = set_combine(meleeSet, sets.Reraise)
			add_to_chat(7,'Death is iminent hp is at '..player.hpp..' equiping re-raise set')
		end
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
		if buffactive['Arcane Circle'] then
			equip({body="Founder's Breastplate"})
		end
		if buffactive['Souleater'] then
			equip({head="Ignominy Burgonet +2"})
			disable('Head')
			add_to_chat(100,'Souleater is active')
			add_to_chat(100,'HP is being depleted')
		else
			enable('Head')
		end
		if buffactive['Blood Weapon'] and buffactive['Souleater'] and player.hp > 8000 then
			equip({main="Dacnomania", head="Ignominy Burgonet +1"})
			disable('Head')
			--add_to_chat(100,'WARNING: SOUL EATER HEAD ON AND &&&& Dacnomania.')
			else
				enable('Head')
		end
		if buffactive['Reive Mark'] then
			equip(sets.Reive)
			disable('neck')
			else
				enable('neck')
		end
		return meleeSet
	end 
----------------------------------------------
--  General hooks for setting combat state  --
----------------------------------------------
    --------------------------------------------------
    --  Called by the 'update' self-command, 		--
	--  for common needs. Set eventArgs.handled 	--
	--  to true if we don't want automatic   		--
    --  equipping of gear.                          --
    --------------------------------------------------
	function job_update(cmdParams, eventArgs)
		job_status_change()
		get_combat_form()
		get_combat_weapon()
		job_state_change()
		update_melee_groups()
	end
	function job_status_change(newStatus, oldStatus, eventArgs)
		if newStatus == "Engaged" then
			-- handle weapon sets
			if gsList:contains(player.equipment.main) then
				state.CombatWeapon:set('GreatSword')
			elseif scytheList:contains(player.equipment.main) then
				state.CombatWeapon:set('Engaged')
			elseif player.equipment.main == 'Ragnarok' then
				state.CombatWeapon:set('Ragnarok')
			elseif player.equipment.main == 'Apocalypse' then
				state.CombatWeapon:set('Apocalypse')
			elseif player.equipment.main == 'Caladbolg' then
				state.CombatWeapon:set('Caladbolg')
			end
		end 
	end
	function get_combat_form()
		if buffactive['Last Resort'] and buffactive.haste then 
			add_to_chat(8, '---Weapon Delay Capped---')
		elseif (buffactive.haste and buffactive.hasso and buffactive.march == 2) then 
			add_to_chat(8, '---Weapon Delay is not Capped---')
		end 
	------------------------------------------------------
	--  Can add in more here this is just a placeholder --
	------------------------------------------------------
	end
	function get_combat_weapon()
		if state.mainWeapon.value == "Apocalypse" then 
			equip({main="Apocalypse", sub="Tzacab grip"})
			set_macro_page(2, 6)
		elseif state.mainWeapon.value == "Ragnarok" then 
			equip({main="Ragnarok", sub="Bloodrain strap"})
			set_macro_page(3, 6)
		elseif state.mainWeapon.value == "Caladbolg" then 
			equip({main="Caladbolg", sub="Bloodrain strap"})
			set_macro_page(1, 6) 
		end
		if gsList:contains(player.equipment.main) then
			state.CombatWeapon:set("GreatSword")
		elseif scytheList:contains(player.equipment.main) then
			state.CombatWeapon:set("Engaged")
		elseif player.equipment.main == 'Apocalypse' then
			state.CombatWeapon:set('Apocalypse')
		elseif player.equipment.main == 'Ragnarok' then
			state.CombatWeapon:set('Ragnarok')
		elseif player.equipment.main == 'Caladbolg' then
			state.CombatWeapon:set('Caladbolg')
		else -- use regular set, which caters to Liberator
			--state.CombatWeapon:reset()
		end	
		return get_combat_weapon
	end
	function job_state_change(stateField, newValue, oldValue)
		--nothing added in here
	end
	function update_melee_groups()
		classes.CustomMeleeGroups:clear()
		-- mythic AM	
		if player.equipment.main == 'Liberator' then
			if buffactive['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM3')
			end
		elseif buffactive['Aftermath'] then
			classes.CustomMeleeGroups:append('AM')
		end
		if player.equipment.main == 'Apocalypse' then 
			if buffactive['Aftermath'] then 
				classes.CustomMeleeGroups:append('AM')
			end 
		end 
		if buffactive['Samurai Roll'] then
			classes.CustomRangedGroups:append('SamRoll')
		end
	end	
--------------------------------------------------
--  Creating a custom spellMap,                 --
--  since Mote capitalized absorbs incorrectly  --
--------------------------------------------------
	function job_get_spell_map(spell, default_spell_map)
		if spell.skill == 'Dark Magic' and absorbs:contains(spell.english) then
			return 'Absorb'
		end
	end	
	if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
		if LowTierNuke:contains(spell.english) then
			return 'LowTierNuke'
		end
	end
-------------------------
-- Pre-Target section  --
-------------------------
	function job_pretarget(spell, action, spellMap, eventArgs)
		if spell.type:endswith('Magic') and buffactive.silence then
			eventArgs.cancel = true
			send_command('input /item "Echo Drops" <me>')
		end
	end
-----------------------
-- Pre-cast section  --
-----------------------
	function job_post_precast(spell, action, spellMap, eventArgs)
		if state.OffenseMode.value == "Normal" then 
			if spell.type == 'WeaponSkill' then
				if world.time >= 17*60 or world.time < 7*60 then -- Dusk to Dawn time.
					equip({ear1="Lugra Earring +1", ear2="Lugra Earring"})
				end
			end
		end 
		if spell.action_type=="Magic" and buffactive.Silence then
			eventArgs.cancel = true
			send_command('input /item "Echo Drops" <me>')
		end
		if spell.type=='WeaponSkill' then
			if moonshade_WS:contains(spell.english) and player.tp < 2850 then
				equip({ear2="Moonshade Earring"})
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
	end
-----------------------
--  Mid-cast Section --
-----------------------
	function job_midcast(spell, action, spellMap, eventArgs)
 
	end
	function job_post_midcast(spell, action, spellMap, eventArgs)
		if spell.skill == 'Elemental Magic' then
			if spell.element == world.day_element or spell.element == world.weather_element then
				equip(sets.midcast['Elemental Magic'], {waist="Hachirin-no-Obi"})
			end
		end
		if spell.type == 'WeaponSkill' then 
			if gav_ws:contains(spell.english) and (spell.element==world.day_element or spell.element==world.weather_element) then
				equip({head="Gavialis Helm"})
			end
		end 
	end	
-------------------------
--  After-cast Section --
-------------------------
	function job_aftercast(spell, action, spellMap, eventArgs)
	 
	end
	function job_post_aftercast(spell, action, spellMap, eventArgs)

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
			-- Equip Berserker's Torque / Frenzy Sallet 
				equip(sets.Asleep)
			elseif not gain then 
			-- Remove Berserker's Torque / Frenzy Sallet
				handle_equipping_gear(player.status)
			end
		end
	end
	function custom_am() 
		if buff:startswith('Aftermath') then
			if player.equipment.main == 'Liberator' then
				classes.CustomMeleeGroups:clear()
				if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
					classes.CustomMeleeGroups:append('AM3')
					add_to_chat(8, '***Liberator AM3 UP***')
				end
				if not midaction() then
					handle_equipping_gear(player.status)
				end
			else
				classes.CustomMeleeGroups:clear()
			if player.equipment.main == "Apocalypse" then
				if buff == "Aftermath" and gain or buffactive.Aftermath then
					classes.CustomMeleeGroups:append('AM')
					add_to_chat(8, '***Apocalypse haste is active. Switching to AM set***')
				end 
			end
			if player.equipment.main == 'Ragnarok' then 
				if buff == 'Aftermath' and gain then 
					add_to_chat(8, '***Ragnarok AM active providing extra Crit***')
				end 
			end
			if player.equipment.main == 'Caladbolg' then 
				if buff == 'Aftermath' and gain then 
					add_to_chat(8, '***Caladbolg AM active providing extra dmg***')
				end 
			end
				if not midaction() then
					handle_equipping_gear(player.status)
				end
			end
		end
	end 
----------------------------------
--  Sub job section for Ninja   --
----------------------------------

--------------------------------------------------------------
--  Rune Fencer Sub Job section for displaying rune info    --
--------------------------------------------------------------
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
			add_to_chat(122, '*'..spell.english..' is '..runeinfo.damage..'-based dmg. and '..runeinfo.resistance..' resistance*')
		end
	end
	function job_self_command(cmdParams, eventArgs)
		if cmdParams[1]:lower() == 'rune' then
			send_command('@input /ja '..state.Runes.value..' <me>')
		end
	end
------------------------------------------------------------------
--  Selecting and Setting the default Macro book and Lock style --
------------------------------------------------------------------
	function select_default_macro_book()
		-- Default macro set/book
		if player.sub_job == 'DNC' then
			set_macro_page(4, 6)
		elseif player.sub_job == 'SAM' and player.equipment.main == 'Ragnarok' then
			set_macro_page(3, 6)
		elseif player.sub_job == 'SAM' and player.equipment.main == 'Caladbolg' then
			set_macro_page(1, 6)
		elseif player.sub_job == 'SAM' and player.equipment.main == 'Apocalypse' then
			set_macro_page(2, 6)
		else
			set_macro_page(2, 6)
		end
	end
	function set_lockstyle()
		send_command('wait 4; input /lockstyleset 1')
	end
	function job_handle_equipping_gear(status, eventArgs)

	end