--[[ Generic file
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
-- Initialization of the various job 		--
-- Binds for the differnt modes					--
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
		send_command('bind !f12 gs c toggle LuzafRing')
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
		send_command('bind @f9 gs c set mainWeapon Fettering')
		send_command('bind @f10 gs c set mainWeapon Hepatizon')
		send_command('bind @f11 gs c set mainWeapon Fomalhaut')
		send_command('bind @f12 gs c set mainWeapon Empty')
		send_command('bind @` input /ma "blank" <me>')
		send_command('bind @q input /ma "blank" <t>')
  end 
--------------------------
--  Job Setup Section   --
--------------------------
	function job_setup()
  	state.mainWeapon = M{'None', 'Fettering', 'Hepatizon', 'Fomalhaut'}
	state.rangedWeapon = M{'None', 'Fomalhaut'}
  	oneHandList = S{'Hepatizon sapara +1', 'Fettering Blade'}
  	gunList = S{'Doomsday', 'Holliday', 'Lionsquall'}
  --[[ Moonshade earring and Gav. Helmet ]]
		moonshade_WS = S{
			"Leaden Salute", "Wildfire", "Last Stand",
			"Savage Blade", "Requiescat", 'Sanguine Blade'
		}
		gav_ws = S{
			"Torcleaver","Resolution","Catastrophe",
			"Scourge","Cross Reaper"
		}
	--[[ Ninja Tools Section ]]
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
		state.warned = M(false)
		options.ammo_warning_limit = 10
  end 
--------------------------
--  User Setup Section  --
--------------------------
	function user_setup()
  	state.IdleMode:options('Normal', 'PDT', 'MagicEva')
  	state.OffenseMode:options('None', 'Melee', 'Leaden', 'Ranged')
  	state.HybridMode:options('Normal', 'MagicEva', 'DT')
  	state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
  	state.RangedMode:options('Normal', 'Acc')
  --[[ User Created states ]]
  	options.ammo_warning_limit = 15
	state.AutoRA = M{['description']='Auto RA', 'Normal', 'Shoot', 'WS' }
	state.LuzafRing = M(false, "Luzaf's Ring")
	state.CapacityMode = M(false, 'Capacity Point Mantle')
  --[[ Loading of various functions ]]
  	getHp()
  	job_update()
  	select_default_macro_book()
  	set_lockstyle()
	get_player_name()
  	job_binds()
	define_roll_values()
	set_healbot()
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
		if player.hpp < 50 then 
			state.HybridMode:set('DT')
    	elseif player.hpp < 51 then 
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
		if state.IdleMode.value == "PDT" then 
			idleSet = set_combine(idleSet, sets.idle.PDT)
		elseif state.IdleMode.value == "MagicEva" then 
			idleSet = set_combine(idleSet, sets.idle.MagicEva)
		end
		if state.rangedWeapon.value == "Fomalhaut" then 
			idleSet = set_combine(idleSet, {range="Fomalhaut"})
		elseif state.mainWeapon.value == "Hepatizon" then 
			idleSet = set_combine(idleSet, {range="Anarchy +3"})
		elseif state.mainWeapon.value == "Fettering" then 
			idleSet = set_combine(idleSet, {range="Fomalhaut"})
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
		if state.rangedWeapon.value == "Fomalhaut" then 
			meleeSet = set_combine(meleeSet, {range="Fomalhaut"})
		elseif state.mainWeapon.value == "Hepatizon" then 
			meleeSet = set_combine(meleeSet, {range="Anarchy +3"})
		elseif state.mainWeapon.value == "Fettering" then 
			meleeSet = set_combine(meleeSet, {range="Fomalhaut"})
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
			if gunList:contains(player.equipment.main) then
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
		if state.mainWeapon.value == "Fomalhaut" then 
			equip({main="Fettering blade", sub="Hepatizon sapara +1",})
			state.rangedWeapon:set('Fomalhaut')
		elseif state.mainWeapon.value == "Fettering" then 
			equip({main="Fettering blade", sub="Hepatizon rapier +1", Range="Fomalhaut"})
		elseif state.mainWeapon.value == "Hepatizon" then
			state.rangedWeapon:set('None')
			equip({main="Hepatizon sapara +1", sub="Hepatizon sapara +1", range="Anarchy +3"})
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
		if state.OffenseMode.value == "DW" then 
			equip({range="Anarchy +3"})
		end 
	end
-------------------------------------
--  Creating a custom spellMap,    --
-------------------------------------
	function job_get_spell_map(spell, default_spell_map)
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
		if spell.action_type == 'Ranged Attack' or spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
			do_bullet_checks(spell, spellMap, eventArgs)
		end
		if (spell.type == 'CorsairRoll' or spell.english == "Double-Up") and state.LuzafRing.value then
			equip(sets.precast.LuzafRing)
		elseif spell.type == 'CorsairShot' and state.CastingMode.value == 'Resistant' then
			classes.CustomClass = 'Acc'
		elseif spell.english == 'Fold' and buffactive['Bust'] == 2 then
			if sets.precast.FoldDoubleBust then
				equip(sets.precast.FoldDoubleBust)
				eventArgs.handled = true
			end
		end
	end 
	function job_post_precast(spell, spellMap, eventArgs)
		if spell.action_type=="Magic" and buffactive.Silence then
			eventArgs.cancel = true
			send_command('input /item "Echo Drops" <me>')
		end
		if spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
        if spell.english == 'Leaden Salute' then
            if world.weather_element == 'Dark' or world.day_element == 'Dark' then
                equip({waist="Hachirin-no-Obi"})
            end
            if player.tp > 2900 then
                equip({waist="Hachirin-no-Obi"})
            end 
        elseif spell.english == 'Wildfire' and (world.weather_element == 'Fire' or world.day_element == 'Fire') then
            equip({waist="Hachirin-no-Obi"})
        elseif spell.type == 'CorsairShot' and (spell.element == world.weather_element or spell.element == world.day_element) then
            if spell.english ~= "Light Shot" and spell.english ~= "Dark Shot" then
                equip({waist="Hachirin-no-Obi"})
            end
        end
    end
		if spell.type=='WeaponSkill' then
			if moonshade_WS:contains(spell.english) and player.tp < 2850 then
				equip({ear2="Moonshade Earring"})
			end
		end
		--[[ Lock Weaponskill if you are to far from the mob  ]]
		if spell.skill == "Savage Blade" then 
			if spell.target.distance > 5 then 
				cancel_spell()
				add_to_chat(8, 'Target to far away. Move closer')
				return
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
		if spell.type == 'CorsairRoll' and not spell.interrupted then
			display_roll_info(spell)
		end
		if state.AutoRA.value ~= 'Normal' then
			use_ra(spell)
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
--------------------------
-- Define Roll Values	--
--------------------------
	function define_roll_values()
		rolls = {
			["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
			["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion"},
			["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy"},
			["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack"},
			["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
			["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
			["Puppet Roll"]      = {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
			["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
			["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow"},
			["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack"},
			["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
			["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh"},
			["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
			["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
			["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
			["Drachen Roll"]     = {lucky=3, unlucky=7, bonus="Pet Accuracy"},
			["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
			["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack"},
			["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen"},
			["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
			["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed"},
			["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast"},
			["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
			["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
			["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
			["Allies's Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
			["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
			["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
			["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
		}
	end
	function display_roll_info(spell)
		rollinfo = rolls[spell.english]
		local rollsize = 'Small'
		if state.LuzafRing then
			rollsize = 'Large'
		end
		if rollinfo then
			add_to_chat(36, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
			add_to_chat(217, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
		end
	end
----------------------------
--	Bullet Check Function --
----------------------------
	function do_bullet_checks(spell, spellMap, eventArgs)
		local bullet_name
		local bullet_min_count = 1
		
		if spell.type == 'WeaponSkill' then
			if spell.skill == "Marksmanship" then
				if spell.element == 'None' then
					-- physical weaponskills
					bullet_name = gear.WSbullet
				else
					-- magical weaponskills
					bullet_name = gear.MAbullet
				end
			else
				-- Ignore non-ranged weaponskills
				return
			end
		elseif spell.type == 'CorsairShot' then
			bullet_name = gear.QDbullet
		elseif spell.action_type == 'Ranged Attack' then
			bullet_name = gear.RAbullet
			if buffactive['Triple Shot'] then
				bullet_min_count = 3
			end
		end
		
		local available_bullets = player.inventory[bullet_name] or player.wardrobe2[bullet_name]
		
		-- If no ammo is available, give appropriate warning and end.
		if not available_bullets then
			if spell.type == 'CorsairShot' and player.equipment.ammo ~= 'empty' then
				add_to_chat(104, 'No Quick Draw ammo left.  Using what\'s currently equipped ('..player.equipment.ammo..').')
				return
			elseif spell.type == 'WeaponSkill' and player.equipment.ammo == gear.RAbullet then
				add_to_chat(104, 'No weaponskill ammo left.  Using what\'s currently equipped (standard ranged bullets: '..player.equipment.ammo..').')
				return
			else
				add_to_chat(104, 'No ammo ('..tostring(bullet_name)..') available for that action.')
				eventArgs.cancel = true
				return
			end
		end
		
		-- Don't allow shooting or weaponskilling with ammo reserved for quick draw.
		if spell.type ~= 'CorsairShot' and bullet_name == gear.QDbullet and available_bullets.count <= bullet_min_count then
			add_to_chat(104, 'No ammo will be left for Quick Draw.  Cancelling.')
			eventArgs.cancel = true
			return
		end
		
		-- Low ammo warning.
		if spell.type ~= 'CorsairShot' and not state.warned
			and available_bullets.count > 1 and available_bullets.count <= options.ammo_warning_limit then
			local msg = '**** LOW AMMO WARNING: '..bullet_name..' ****'
			local border = ""
			for i = 1, #msg do
				border = border .. "*"
			end

			add_to_chat(104, border)
			add_to_chat(104, msg)
			add_to_chat(104, border)
			state.warned = true
		elseif available_bullets.count > options.ammo_warning_limit and state.warned then
			state.warned = false
		end
	end
----------------------
-- Auto Ranged Mode --
----------------------
	function use_weaponskill()
		send_command('input /ws "'..auto_gun_ws..'" <t>')
	end

	function job_state_change(stateField, newValue, oldValue)
		if stateField == 'Auto RA' then
			if newValue ~= 'Normal' then
				send_command('@wait 2.5; input /ra <t>')
			end
		end
	end

	function use_ra(spell)
		
		local delay = '2.2'
		-- GUN 
		if spell.type:lower() == 'weaponskill' then
			delay = '2.25' 
		else
			if buffactive["Courser's Roll"] then
				delay = '0.7' -- MAKE ADJUSTMENT HERE
			elseif buffactive['Flurry II'] then
				delay = '0.5'
			else
				delay = '1.05' -- MAKE ADJUSTMENT HERE
			end
		end
		send_command('@wait '..delay..'; input /ra <t>')
	end
----------------------------------------
--  Selecting and Setting the default --
--	Macro book and Lock style 		  --
----------------------------------------
	function select_default_macro_book()
		set_macro_page(1, 14)
	end
	function set_lockstyle()
		send_command('wait 4; input /lockstyleset 12')
	end
	function set_healbot()
		send_command('wait 6; input //lua l healbot')
	end	