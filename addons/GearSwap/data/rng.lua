--[[ Ranger V2.1.1
	Creator: Enuri
	Server:	 Asura
	Funcitons: 
]]
----------------------------------------------
--  Initialization function required for    --
--          this to work properly           --
----------------------------------------------
  function get_sets() 
    mote_include_version = 2
  --Load and initialize the include file
    include('Mote-Include.lua')
	include('organizer-lib')
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
		send_command('bind f12 gs c cycle RangedMode')
	--[[ AltF9-AltF12 keybinds ]]
		send_command('bind !f9 gs c cycle Empty')
		send_command('bind !f10 gs c cycle Empty')
		send_command('bind !f11 gs c toggle Empty')
		send_command('bind !f12 gs c toggle Empty')
		send_command('bind != gs c toggle CapacityMode')
		send_command('bind !` input /ma "Utsusemi: Ni" <me>')
		send_command('bind !q input /ma "Utsusemi: Ichi" <me>')
	--[[ CtrlF9-CtrlF12 keybinds ]]
		send_command('bind ^f9 gs c cycle AutoRA')
		send_command('bind ^f10 gs c cycle Empty')
		send_command('bind ^f11 gs c cycle Empty')
		send_command('bind ^f12 gs c cycle Empty')
		send_command('bind ^` input /ma "Tonko: Ni" <me>')
		send_command('bind ^q input /ma "Monomi: Ichi" <me>')
	--[[ WindowsF9-WindowsF12 keybinds ]]
		send_command('bind @f9 gs c set rangedWeapon Fomalhaut')
		send_command('bind @f10 gs c set rangedWeapon Annihilator')
		send_command('bind @f11 gs c set rangedWeapon Yoichinoyumi')
		send_command('bind @f12 gs c set rangedWeapon Gandiva')
		send_command('bind @` input /ma "blank" <me>')
		send_command('bind @q input /ma "blank" <t>')
  end 
--------------------------
--  Job Setup Section   --
--------------------------
	function job_setup()
		state.mainWeapon = M{'None', 'Fomalhaut', 'Annihilator', 'Yoichinoyumi', 'Gandiva'}
		state.rangedWeapon = M{'None', 'Fomalhaut', 'Annihilator', 'Yoichinoyumi', 'Gandiva'}
		oneHandList = S{'Perun +1', ''}
		bowList = S{'Bow1', 'Bow2'}
		gunList = S{'Doomsday', 'Holliday', 'Lionsquall'}
	--[[ Other states ]]
		state.Buff.Barrage = buffactive.Barrage or false
		state.Buff.Camouflage = buffactive.Camouflage or false
		state.Buff['Unlimited Shot'] = buffactive['Unlimited Shot'] or false
		state.Buff['Velocity Shot'] = buffactive['Velocity Shot'] or false
		state.Buff['Double Shot'] = buffactive['Double Shot'] or false
	--[[ Moonshade earring and Gav. Helmet ]]
		moonshade_WS = S{
			"Trueflight", "Wildfire", "Last Stand",
			"Coronach", "Requiescat", 'Sanguine Blade'
		}
		gav_ws = S{
			"Torcleaver","Resolution","Catastrophe",
			"Scourge","Cross Reaper"
		}
	--[[ Ninja Tools Section ]]
		ninjaTools = {
			Utsusemi = S{"Shihei",},
			Hojo = S{"Kaginawa",},
			Migawari = S{"Mokujin",},
			Kakka = S{"Ryuno",},
			Tonko = S{"Shinobi-tabi",},
			Kurayami = S{"Sairui-Ran",},
			Raiton = S{"Hiraishin",},
			Hyoton = S{"Tsurara",},
			Monomi = S{"Sanjaku-Tenugui",},
		}
		state.warned = M(false)
		options.ammo_warning_limit = 10
  end 
--------------------------
--  User Setup Section  --
--------------------------
	function user_setup()
  	state.IdleMode:options('Normal', 'PDT', 'MagicEva')
  	state.OffenseMode:options('Melee', 'Ranged')
  	state.HybridMode:options('Normal', 'MagicEva', 'DT')
  	state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
  	state.RangedMode:options('Normal', 'Acc')
  --[[ User Created states ]]
  	options.ammo_warning_limit = 15
	state.AutoRA = M{['description']='Auto RA', 'Normal', 'Shoot', 'WS' }
	state.CapacityMode = M(false, 'Capacity Point Mantle')
  --[[ Ammo stuff ]]
	
  --[[ Loading of various functions ]]
  	getHp()
  	job_update()
  	select_default_macro_book()
  	set_lockstyle()
	get_player_name()
  	job_binds()
  end 
	function get_player_name()
  	if windower.ffxi.get_player() then 
    	self = windower.ffxi.get_player().name
    	roll = windower.ffxi.get_player().main_job_full
    	windower.add_to_chat(7, 'Hello '..self..' your '..roll..' LUA is now loaded')
    	windower.add_to_chat(7, 'The gerbils are fetching your '..roll..' Lockstyle!')
    end 
  end
--------------------------------------------------
--  This section is called when you change jobs --
--------------------------------------------------
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
		send_command('unbind !`')
		send_command('unbind !q')
	--[[ CtrlF9-CtrlF12 unbind's ]]
		send_command('unbind ^f9')
		send_command('unbind ^f10')
		send_command('unbind ^f11')
		send_command('unbind ^f12')
		send_command('unbind !`')
		send_command('unbind !q')
	--[[ WindowsF9-WindowsF12 unbind's ]]
		send_command('unbind @f9')
		send_command('unbind @f10')
		send_command('unbind @f11')
		send_command('unbind @f12')
		send_command('unbind !`')
		send_command('unbind !q')
  end 
----------------------------------------------
--  This tells Gear swap what sets to fetch  --
--  Recommend creating a Car file.          --
----------------------------------------------
	function init_gear_sets()
		--[[Gear is in a seperate File]]
	end 
-----------------------------------------
-- Checking Player HP for Hybird modes --	
-----------------------------------------
	function getHp()
		if player.hpp <= 51 then 
			state.HybridMode:set('DT')
    	elseif player.hpp > 51 then 
    		state.HybridMode:set('Normal')
    	end 
  end
---------------------------
--  Custom Idle Gear set --
---------------------------	
	function customize_idle_set(idleSet)
		if state.HybridMode.value == "DT" then 
			idleSet = set_combine(idleSet, sets.DT)
			add_to_chat(7, 'Your HP is at '..player.hpp..' equiping you DT set')
		end
		if state.rangedWeapon.value == "Fomalhaut" then 
			idleSet = set_combine(idleSet, {range="Fomalhaut"})
		elseif state.rangedWeapon.value == "Annihilator" then 
			idleSet = set_combine(idleSet, {range="Annihilator"})
		elseif state.rangedWeapon.value == "Yoichinoyumi" then 
			idleSet = set_combine(idleSet, {range="Yoichinoyumi"})
		end 
		if state.IdleMode.value == "PDT" then 
			idleSet = set_combine(idleSet, sets.idle.PDT)
		elseif state.IdleMode.value == "MagicEva" then 
			idleSet = set_combine(idleSet, sets.idle.MagicEva)
		end 
		if state.CapacityMode.value then 
			idleSet = set_combine(idleSet, sets.CapacityMantle)
		end
		if state.Buff.Doom then
			idleSet = set_combine(idleSet, sets.buff.Doom)
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
		if state.OffenseMode.value == "Acc" then 
			state.WeaponskillMode:set("Acc")
		elseif state.OffenseMode.value == "Normal" then  
			state.WeaponskillMode:reset()
		end		
		if state.HybridMode.value == "MagicEva" then 
			meleeSet = set_combine(meleeSet, sets.MagicEva)
		elseif state.HybridMode.value == "DT" then 
			meleeSet = set_combine(meleeSet, sets.DT)
		end
		if state.CapacityMode.value then 
			meleeSet = set_combine(meleeSet, sets.CapacityMantle)
		end 
		if state.Buff.Doom then
			meleeSet = set_combine(meleeSet, sets.buff.Doom)
		end
		return meleeSet
	end 
----------------------------------------------
--  General hooks for setting combat state  --
----------------------------------------------
  ------------------------------------------------ 
  --  	Called by the 'update' self-command,	-- 
  --  	for common needs.      					--
  --  	Set eventArgs.handled to true if we		-- 
  --	don't want automatic    				--
  --  	equipping of gear.                      --
  ------------------------------------------------
	function job_update(cmdParams, eventArgs)
		job_status_change()
		get_combat_form()
		get_combat_weapon()
		job_state_change()
		update_melee_group()
	end 
	function job_status_change(newStatus, oldStatus, eventArgs)
		if newStatus == "Engaged" then 
		-- handle weapon sets
			if bowList:contains(player.equipment.main) then
				state.CombatWeapon:set('bow')
			elseif gunList:contains(player.equipment.main) then
				state.CombatWeapon:set('gun')
			elseif player.equipment.range == 'Fomalhaut' then
				state.CombatWeapon:set('Fomalhaut')
			elseif player.equipment.range == 'Annihilator' then
				state.CombatWeapon:set('Annihilator')
			elseif player.equipment.range == 'Yoichinoyumi' then
				state.CombatWeapon:set('Yoichinoyumi')
			end 
		end 
	end 
	function get_combat_form()
		classes.CustomMeleeGroups:clear()
		-- Haste (white magic) 15%
		-- Haste Samba (Sub) 5%
		-- Haste (Merited DNC) 10%
		-- Victory March +3/+4/+5     14%/15.6%/17.1%
		-- Advancing March +3/+4/+5   10.9%/12.5%/14%
		-- Embrava 25%
		if (buffactive.embrava or buffactive.haste) and buffactive.march == 2 then
			classes.CustomMeleeGroups:append('Haste_43')
		elseif buffactive.embrava and buffactive.haste then
			classes.CustomMeleeGroups:append('Haste_40')
		elseif (buffactive.haste ) or (buffactive.march == 2 and buffactive['haste samba']) then
			classes.CustomMeleeGroups:append('Haste_30')
		elseif buffactive.embrava or buffactive.march == 2 then
			classes.CustomMeleeGroups:append('Haste_25')
		end
		if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
			state.CombatForm:set("DW")
		end
	end 
	function get_combat_weapon() 
		if state.rangedWeapon.value == "Fomalhaut" then 
			equip({main="Perun +1", sub="Bronze Dagger", range="Fomalhaut"})
		elseif state.rangedWeapon.value == "Annihilator" then 
			equip({main="Perun +1", sub="Nusku shield", Range="Annihilator"})
		elseif state.rangedWeapon.value == "Yoichinoyumi" then 
			equip({main="Perun +1", sub="Nusku shield", Range="Yoichinoyumi"})
		elseif state.rangedWeapon.value == "Gandiva" then 
			equip({main="Perun +1", sub="Nusku shield", Range="Gandiva"})
		end 
		return get_combat_weapon
	end 
	function job_state_change() 
		if stateField == 'Offense Mode' then
			if newValue == 'Melee' then
				enable('range')
			else
				disable('range')
			end
		end
	end 
	function update_melee_group()
	--[[ Can use this to create your own custom Template ]]
		
	end
-------------------------------------
--  Creating a custom spellMap,    --
-------------------------------------
	function job_get_spell_map(spell, default_spell_map)
		if spell.skill == 'Dark Magic' and absorbs:contains(spell.english) then
			return 'Absorb'
		end
		if spell.skill == 'Elemental Magic' and LowTierNuke:contains(spell.english) then 
			return 'MA'
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
	function job_precast(spell, action, spellMap, eventArgs)
		if spell.type=="Ninjutsu" then 
			check_tools(spell) 
		end 
		if spell.action_type == 'Ranged Attack' or
          (spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery')) then
           check_ammo(spell, action, spellMap, eventArgs)
        end
		if spellMap == 'Utsusemi' then
			if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
				cancel_spell()
				add_to_chat(123, '**!! '..spell.english..' Canceled: [3+ IMAGES] !!**')
				eventArgs.handled = true
				return
			elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
				send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
			end
		end
	end 
	function job_post_precast(spell, spellMap, eventArgs)
		if spell.action_type=="Magic" and buffactive.Silence then
			eventArgs.cancel = true
			send_command('input /item "Echo Drops" <me>')
		end
		if spell.type=='WeaponSkill' then
			if moonshade_WS:contains(spell.english) and player.tp < 2850 then
				equip({ear2="Moonshade Earring"})
			end
		end
		 -- Equip obi if weather/day matches for WS.
		if spell.type == 'WeaponSkill' then
			if spell.english == 'Trueflight' then
				if world.weather_element == 'Light' or world.day_element == 'Light' then
					equip({waist="Hachirin-no-Obi"})
				end
			elseif spell.english == 'Wildfire' and (world.weather_element == 'Fire' or world.day_element == 'Fire') then
				equip({waist="Hachirin-no-Obi"})
			end
		end
		if spell.action_type == 'Ranged Attack' then
			if spell.action_type == 'Ranged Attack' then
				if flurry == 2 then
					equip(sets.precast.RA.Flurry2)
				elseif flurry == 1 then
					equip(sets.precast.RA.Flurry1)
				end
			end
		end
	end 
-----------------------
--  Mid-cast Section --
-----------------------
	function job_midcast(spell, spellMap, eventArgs)
		if spell.type == 'CorsairShot' or spell.action_type == 'Ranged Attack' then
			if state.CapacityMode.value then
				equip(sets.CapacityMantle)
			end
		end
	end
	function job_post_midcast(spell, spellMap, eventArgs)
		if spell.action_type == 'Ranged Attack' then
			if buffactive['Double Shot'] then
				equip(sets.DoubleShot)
			end
			if state.Buff.Barrage then
				equip(sets.buff.Barrage)
			end
		end
		if spell.type == 'WeaponSkill' then 
			if gav_ws:contains(spell.english) and (spell.element==world.day_element or spell.element==world.weather_element) then
				equip({head="Gavialis Helm"})
			end
		end
	end 
-------------------------
--  after-cast Section --
-------------------------
	function job_aftercast(spell, spellMap, eventArgs)
		if spell.english == "Shadowbind" then
			send_command('@timers c "Shadowbind ['..spell.target.name..']" 42 down abilities/00122.png')
		end
	end 
	function job_post_aftercast(spell, spellMap, eventArgs)
  
	end 
--------------------------------------
-- 	Called when a player gains 		--
--	or loses a buff. buff == buff 	--
--	gained or lost. gain == true 	--
--	if the buff was gained, false 	--
--	if it was lost.   				--
--------------------------------------
	function job_buff_change(buff, gain)	
		if state.Buff[buff] ~= nil then
			state.Buff[buff] = gain
			handle_equipping_gear(player.status)
		end
		if buff:lower()=='terror' or buff:lower()=='petrification' or buff:lower()=='stun' then
			if gain then
				equip(sets.DT)
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
		if buffactive['Reive Mark'] then
			equip(sets.Reive)
			disable('neck')
			else
				enable('neck')
		end
	--[[ Job Specific Buff handling ]]
		if S{'flurry'}:contains(buff:lower()) then
			if not gain then
				flurry = nil
				add_to_chat(122, "Flurry status cleared.")
			end
			if not midaction() then
				handle_equipping_gear(player.status)
			end
		end
		if buff == "Camouflage" then
			if gain then
				equip(sets.buff.Camouflage)
				disable('body')
			else
				enable('body')
			end
		end
	end 
----------------------------------
--  Sub job section for Ninja   --
----------------------------------
	function check_tools(spell)
		for prefix,tools in pairs(ninjaTools) do
			if spell.english:startswith(prefix) then
				for tool in tools:it() do
					if not player.inventory[tool] then
						add_to_chat(100,'WARNING: You are out of '..tool..'.')
					elseif player.inventory[tool].count < 10 then
						add_to_chat(100,'WARNING: You are low on '..tool..'. '..player.inventory[tool].count..' remaining.')
					end
				end
			end
		end
	end
----------------------------
--	Bullet Check Function --
----------------------------
function check_ammo(spell, action, spellMap, eventArgs)
	-- Filter ammo checks depending on Unlimited Shot
	if state.Buff['Unlimited Shot'] then
		if player.equipment.ammo ~= U_Shot_Ammo[player.equipment.range] then
			if player.wardrobe2[U_Shot_Ammo[player.equipment.range]] or player.wardrobe[U_Shot_Ammo[player.equipment.range]] then
				add_to_chat(122,"Unlimited Shot active. Using custom ammo.")
				equip({ammo=U_Shot_Ammo[player.equipment.range]})
			elseif player.wardrobe2[DefaultAmmo[player.equipment.range]] or player.wardrobe[DefaultAmmo[player.equipment.range]] then
				add_to_chat(122,"Unlimited Shot active but no custom ammo available. Using default ammo.")
				equip({ammo=DefaultAmmo[player.equipment.range]})
			else
				add_to_chat(122,"Unlimited Shot active but unable to find any custom or default ammo.")
			end
		end
	else
		if player.equipment.ammo == U_Shot_Ammo[player.equipment.range] and player.equipment.ammo ~= DefaultAmmo[player.equipment.range] then
			if DefaultAmmo[player.equipment.range] then
				if player.wardrobe2[DefaultAmmo[player.equipment.range]] then
					add_to_chat(122,"Unlimited Shot not active. Using Default Ammo")
					equip({ammo=DefaultAmmo[player.equipment.range]})
				else
					add_to_chat(122,"Default ammo unavailable.  Removing Unlimited Shot ammo.")
					equip({ammo=empty})
				end
			else
				add_to_chat(122,"Unable to determine default ammo for current weapon.  Removing Unlimited Shot ammo.")
				equip({ammo=empty})
			end
		elseif player.equipment.ammo == 'empty' then
			if DefaultAmmo[player.equipment.range] then
				if player.wardrobe2[DefaultAmmo[player.equipment.range]] then
					add_to_chat(122,"Using Default Ammo")
					equip({ammo=DefaultAmmo[player.equipment.range]})
				else
					add_to_chat(122,"Default ammo unavailable.  Leaving empty.")
				end
			else
				add_to_chat(122,"Unable to determine default ammo for current weapon.  Leaving empty.")
			end
		elseif player.wardrobe2[player.equipment.ammo].count < 15 then
			add_to_chat(122,"Ammo '"..player.wardrobe2[player.equipment.ammo].shortname.."' running low ("..player.wardrobe2[player.equipment.ammo].count..")")
		end
	end
end
--------------------------
--	Checking for flurry	--
--------------------------
	windower.register_event('action',
    function(act)
        --check if you are a target of spell
        local actionTargets = act.targets
        playerId = windower.ffxi.get_player().id
        isTarget = false
        for _, target in ipairs(actionTargets) do
            if playerId == target.id then
                isTarget = true
            end
        end
        if isTarget == true then
            if act.category == 4 then
                local param = act.param
                if param == 845 and flurry ~= 2 then
                    --add_to_chat(122, 'Flurry Status: Flurry I')
                    flurry = 1
                elseif param == 846 then
                    --add_to_chat(122, 'Flurry Status: Flurry II')
                    flurry = 2
                end
            end
        end
    end)
----------------------------------------
--  Selecting and Setting the default --
--	Macro book and Lock style 		  --
----------------------------------------
	function select_default_macro_book()
	set_macro_page(1, 16)
	end
	function set_lockstyle()
		send_command('wait 4; input /lockstyleset 15')
	end