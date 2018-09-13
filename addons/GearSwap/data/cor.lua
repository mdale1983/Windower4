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
]]
----------------------------------------------
--  Initialization function required for    --
--          this to work properly           --
----------------------------------------------
	function get_sets() 
		mote_include_version = 2
		include('Mote-Include.lua')
		include('organizer-lib')
	end 
--------------------------
--  Job Setup Section   --
--------------------------
	function job_setup()
		state.LuzafRing = M(false, "Luzaf's Ring")
		state.warned = M(false)
		state.CapacityMode = M(false, 'Capacity Point Mantle')
		
		define_roll_values()
		moonshade_WS = S{
			"Leaden Salute", "Wildfire", "Last Stand",
			"Savage Blade", "Requiescat", 'Sanguine Blade'
		}
	end 
--------------------------
--  User Setup Section  --
--------------------------
	function user_setup()
		state.OffenseMode:options('Melee', 'Ranged')
		state.HybridMode:options('Normal', 'Acc', 'High' )
		state.RangedMode:options('Normal', 'Acc')
		state.WeaponskillMode:options('Normal', 'Acc')
		state.CastingMode:options('Normal', 'Resistant')
		state.IdleMode:options('Normal')
		state.RestingMode:options('Normal')
		state.PhysicalDefenseMode:options('PDT')
		state.MagicalDefenseMode:options('MDT')
		
		options.ammo_warning_limit = 15
		state.AutoRA = M{['description']='Auto RA', 'Normal', 'Shoot', 'WS' }
	--[[ Overriding states ]]
		send_command('bind ^` input /ja "Double-up" <me>')
		send_command('bind !` input /ja "Bolter\'s Roll" <me>')
		send_command('bind != gs c toggle CapacityMode')
		send_command('bind ^- gs c cycle AutoRA')
	--[[ Job specific functions for Lockstyle and Macros ]]
		select_default_macro_book()
		set_lockstyle()
		get_player_name()
		get_combat_form()
	end 	
	function get_player_name()
		if windower.ffxi.get_player() then 
			self = windower.ffxi.get_player().name
			roll = windower.ffxi.get_player().main_job_full
			windower.add_to_chat(7,'Hello '..self..' Your '..roll..' LUA is now loaded')
			windower.add_to_chat(7,'The gerbils are fetching your '..roll..'  Lockstyle')
		end
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
		if state.Buff.Doom then
			idleSet = set_combine(idleSet, sets.buff.Doom)
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
		if state.OffenseMode.value == "Ranged" then 
			meleeSet = set_combine(meleeSet, sets.engaged.RA)
		end 
		update_melee_groups()
		if state.CapacityMode.value then 
			meleeSet = set_combine(meleeSet, sets.CapacityMantle)
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
	end 
	function job_status_change(newStatus, oldStatus, eventArgs)
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
	function get_combat_form()
		if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
			state.CombatForm:set("DW")
		else
			state.CombatForm:reset()
		end
	end 
	function get_combat_weapon()
		if state.OffenseMode.value == "DW" then 
			equip({range="Anarchy +3"})
		elseif state.OffenseMode.value == "Ranged" then 
			equip({range="Compensator"})
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
	function update_melee_groups()
		if player.status == "Engaged" then 
			if state.OffenseMode.value == "Ranged" then 
				equip(sets.engaged.RA)
			end
		end 
	end 
	function job_toggle_state(field)
		if field:lower() == 'luzaf' then
			state.LuzafRing:toggle()
			return "Use of Luzaf Ring", state.LuzafRing.value
		end
	end
-------------------------
--	Pretarget Function --
-------------------------
	function job_pretarget(spell, action, spellMap, eventArgs)
		-- If autora enabled, use WS automatically at 100+ TP
		if spell.action_type == 'Ranged Attack' then
			if player.tp >= 1000 and state.AutoRA.value == 'WS' and not buffactive.amnesia then
				cancel_spell()
				use_weaponskill()
			end
		end
	end 
----------------------
-- Precast section  --
----------------------
	function job_precast(spell, action, spellMap, eventArgs)
		-- Check that proper ammo is available if we're using ranged attacks or similar.
		if spell.action_type == 'Ranged Attack' or spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
			do_bullet_checks(spell, spellMap, eventArgs)
		end

		-- gear sets
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
	function job_post_precast(spell, action, spellMap, eventArgs)
		if spell.type == 'WeaponSkill' then
			--[[if state.CapacityMode.value then
				equip(sets.CapacityMantle)
			end]]
		end
		if spell.type=='WeaponSkill' then
			if moonshade_WS:contains(spell.english) and player.tp < 2000 then
				equip({ear2="Moonshade Earring"})
			end
		end
		if spell.type == 'WeaponSkill' then 
			if spell.target.distance > 5 then 
				cancel_spell()
				add_to_chat(8, 'Target to far away. Move closer')
				return
			end 
		end 
	end
----------------------
--  Midcast Section --
----------------------
	function job_midcast(spell, action, spellMap, eventArgs)
		if spell.type == 'CorsairShot' or spell.action_type == 'Ranged Attack' then
			if state.CapacityMode.value then
				equip(sets.CapacityMantle)
			end
		end
	end
------------------------
--  Aftercast Section --
------------------------	
	function job_aftercast(spell, action, spellMap, eventArgs)
		if spell.type == 'CorsairRoll' and not spell.interrupted then
			display_roll_info(spell)
		end
		if state.AutoRA.value ~= 'Normal' then
			use_ra(spell)
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
			add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
			add_to_chat(104, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
		end
	end
----------------------------------
--  Sub job section for Ninja   --
----------------------------------
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
	function job_precast(spell, action, spellMap, eventArgs)
		if spell.type=="Ninjutsu" then check_tools(spell) end
	end
	  
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
		
		local available_bullets = player.inventory[bullet_name] or player.wardrobe[bullet_name]
		
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
------------------------------------------------------------------
--  Selecting and Setting the default Macro book and Lock style --
------------------------------------------------------------------
function select_default_macro_book()
	set_macro_page(2, 14)
end
function set_lockstyle()
    send_command('wait 4; input /lockstyleset 12')
end	