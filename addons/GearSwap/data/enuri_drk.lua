--[[    DARK KNIGHT V3.0
    Created by: Enurihel of Asura
    Based off AlanWarren's GearSwap file
     
    This lua will automatically do the following based off triggers
        while asleep and engaged equips Berserker's Torque
        While weakened Equips Twilight Helm and Mail
        Will auto cancel Souleater based off defined rules
        Auto-cancel Hasso when Last Resort is active
     
    This lua will also auto detect whether you have Great Sword or Scythe 
    equipped and equip the defined gear set based off that
        Current Auto-detect weapons:
            [*]Ragnarok:    Uses engaged.Ragnarok
            [*]Caladbolg:   Uses engaged.Caladbolg
            [*]Apocalypse: Uses engaged.Apocalypse 
            [*]gsList:  Uses the defined Great sword list of weapons
    Additional files needed
        Mote-Include
        CharName_drk_gear (this will house your gear sets)
            Additionally you can choose to house your augments 
            at the top of your gear file or create another file 
            to house your augments for all your jobs.
    User Defined Modes
        Melee Offense Mode
            [*]Normal
            [*]Mid
            [*]Accuracy
        Weaponskill Mode
            [*]Normal
            [*]Mid
            [*]Acc
        Hybrid Modes    
            [*]Damage Taken (DT)
            [*]Re-raise
        Casting modes
            [*]Normal
            [*]resistant
            [*]enmity
    Job ability Defined Modes
        [*]Souleater mode (will toggle Souleater off after 1 WS)
        [*]Last Resort (will toggle Hasso off when active)
    Other aspects of this file 
        [*]Capacity Mode - equip your CP mantle when engaged and Idle
        [*]Equips Ygna's Resolve +1 while reive status is active 
        [*]If you are weakened will keep Reraise set on
    Rune Fencer as a Sub Job and Rune rules
        When you are /run you will have the option to create 
        and in game macro to cycle through the runes and display 
        specific rune information
            [*]/console gs c rune 
            [*]/console gs c cycle runes
            [*]/console gs c cycle rayke
            [*]/console gs c cycle rune
        if you want to create another macro to move backwards use 
        the same as above just edit cycle to cycleback
    Custom Aftermath gear and gear sets
        Currently this is only setup for Liberator and Apocalypse 
        and in the car file this will only work with Apocalypse
        but in the end that you so choose to create a new gear set
        follow this structure for constructing it
            sets.engaged.Weapon.AM      --For Liberator it will be AM3
            sets.engaged.Weapon.Mid.AM  --For Liberator it will be AM3
            sets.engaged.Weapon.Mid.AM  --For Liberator it will be AM3
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
	function binds_on_load()
	--[[ F9-F12 ]]
		send_command('bind f9 gs c cycle IdleMode')
		send_command('bind f10 gs c cycle OffenseMode')
		send_command('bind f11 gs c cycle HybridMode')
		send_command('bind f12 gs c cycle CastingMode')
	--[[ ALT F9-12 ]]
		send_command('bind !f9 gs c update user')
		send_command('bind !f10 gs c cycle RangedMode')
		send_command('bind !f11 gs c cycle WeaponskillMode')
		send_command('bind !f12 gs c cycle Kiting')
	--[[ Windows Key F9-F12]]
		--[[ User defined weapon swapping on the fly binds ]]
		send_command('bind @f10 gs c set mainWeapon "Apocalypse"')
		send_command('bind @f11 gs c set mainWeapon "Ragnarok"')
		send_command('bind @f12 gs c set mainWeapon "Caladbolg"')
	--[[ Misc. Section for CP and other junk ]]
		send_command('bind != gs c toggle CapacityMode')    --alt=.
		send_command('bind ^f9 gs c cycle SouleaterMode')
		send_command('bind ^f10 gs c cycle LastResortMode')
	end 
	function job_setup()
		state.Buff.Souleater = buffactive.souleater or false
		state.Buff['Last Resort'] = buffactive['Last Resort'] or false
	--[[ Set the default to false if you'd rather SE always stay active ]]
		state.SouleaterMode = M(false, 'Soul Eater Mode')
		state.LastResortMode = M(false, 'Last Resort Mode')
		state.CapacityMode = M(false, 'Capacity Point Mantle')
	--[[ Creating the state for mainWeapon and constructing Weapon list]]
		state.mainWeapon = M{'None', 'Apocalypse', 'Ragnarok', 'Caladbolg'}
		gsList = S{'Macbain', 'Crobaci +1'}
		scytheList = S{'Cronus', 'Raetic Scythe'}
	--[[ Correction to the errors in the Mote libs]]
		absorbs = S{ 
			'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 'Absorb-AGI', 
			'Absorb-INT',  'Absorb-MND', 'Absorb-CHR', 'Absorb-Attri', 
			'Absorb-ACC', 'Absorb-TP'
		}
	--[[ Define the Weapon Skills that benefit from Moonshade Earring ]]
		moonshade_WS = S{
			"Resolution", "Torcleaver", "Catastrophe", "Cross Reaper", "Quietus", 
			"Entropy", "Insurgency", "Savage Blade", "Vorpal Blade", 
			"Requiescat", 'Sanguine Blade'
		}
	--[[ Define Low tier Nukes Tier III and below spells ]]
		LowTierNuke = S{
			'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
			'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
			'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III', 'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga', 'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'
		}
		gav_ws = S{"Torcleaver","Resolution","Catastrophe","Scourge","Cross Reaper"}
	end 
--------------------------
--  User Setup Section  --
--------------------------
	function user_setup()
		state.OffenseMode:options('Normal', 'Mid', 'Acc')
		state.HybridMode:options ('Normal', 'DT', 'Reraise')
		state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
		state.CastingMode:options('Normal', 'Resistant', 'Enmity')
		state.IdleMode:options('Normal', 'PDT', 'MagicEva')
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
		state.Rune2 = M{['description']='which', 
			"Fire", 
			"Ice", 
			"Wind", 
			"Earth", 
			"Lightning", 
			"Water", 
			"Light", 
			"Dark"
		}
	--[[ Loading of other Functions within the Lua ]]
		--[[ Additional User Defined Settings ]]
		select_default_macro_book()
		set_lockstyle()
		get_player_name()
		get_combat_form()
		get_player_hp()
		job_update()
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
		if binds_on_unload then
			binds_on_unload()
		end
	end
----------------------------------------------
--  This tells Gear swap what sets to fetch  --
--  Recommend creating a Car file.          --
----------------------------------------------
	function init_gear_sets()
	
	end 
-----------------------------------------
-- Checking Player HP for Hybird modes --	
-----------------------------------------
	function get_player_hp()  
		if player.hpp <= 50 then 
			send_command('gs c set HybridMode "Reraise"')
			add_to_chat(7,'Death is iminent your hp is at '..player.hpp..'% setting Reraise set!')
		elseif player.hpp > 50 then 
			send_command('gs c set HybridMode "Normal"')
		end
	end 
---------------------------
--  Custom Idle Gear set --
---------------------------
	function customize_idle_set(idleSet)
		if state.HybridMode.value == "DT" then 
			idleSet = set_combine(idleSet, sets.DT)
			add_to_chat(8, '*Danger Low HP -- equiping DT set*')
		end 
		if state.HybridMode.value == "Reraise" then 
			idleSet = set_combine(idleSet, sets.Reraise)
			add_to_chat(7,'DT value is at 46% with Re-raise set on')
		end 
		if player.mpp < 50 then 
			idleSet = set_combine(idleSet, sets.latentRefresh)
		end 
		if player.mpp < 80 then 
			idleSet = set_combine(idleSet, sets.Refresh)
		end 
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
		if player.hpp < 50 then 
			state.HybridMode:set('DT')
			add_to_chat(7'Your HP percent is '..player.hpp..' Equiping DT set')
		end 
		if state.HybridMode.value == "DT" then 
			meleeSet = set_combine(meleeSet, sets.DT)
			add_to_chat(8, '*Danger Low HP is at'..player.hpp..'equiping DT set*')
		end 
		if buffactive['Weakness'] then 
			equip({head="Twilight helm", body="Twilight mail"})
			disable('Head', 'Body')
			add_to_chat(8, 'Weakness detected - blocking Helm and Body')
			else 
			enable('Head', 'Body')
		end
		if state.Buff['Souleater'] then
			meleeSet = set_combine(meleeSet, sets.buff.Souleater)
		end	
		if state.CapacityMode.value then 
			meleeSet = set_combine(meleeSet, sets.CapacityMantle)
		end
		if buffactive['Arcane Circle'] then
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
				equip({main="Apocalypse", sub="Utu grip"})
				set_macro_page(2, 6)
			elseif state.mainWeapon.value == "Ragnarok" then 
				equip({main="Ragnarok", sub="Utu grip"})
				set_macro_page(3, 6)
			elseif state.mainWeapon.value == "Caladbolg" then 
				equip({main="Caladbolg", sub="Utu strap"})
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
-------------------------
-- Pre-target section  --
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

	end
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
		if buffactive['Dark Seal'] and S{"Drain III"}:contains(spell.english)then
			equip({head="Fallen's Burgeonet"})
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
		if spell.english == 'Catastrophe' then
			send_command('@wait 4; input //send Enuriel /ws "Leaden Salute" <t> ')
		end
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	