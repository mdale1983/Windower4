--[[	    Rune Fencer V2.0
    Created by: Enurihel of Asura
     
    This lua will automatically do the following based off triggers
      [*]  while asleep and engaged equips Berserker's Torque
      [*]  While weakened Equips Twilight Helm and Mail
      [*]  Will auto cancel Souleater based off defined rules
      [*]  Auto-cancel Hasso when Last Resort is active
     
    This lua will also auto detect whether you have Great Sword or Scythe 
    equipped and equip the defined gear set based off that
        Current Auto-detect weapons:
            [*]Lionheart:    Uses engaged.Ragnarok
            [*]Aettir:   Uses engaged.Caladbolg
    Additional files needed
        Mote-Include
        CharName_run_gear (this will house your gear sets)
            Additionally you can choose to house your augments 
            at the top of your gear file or create another file 
            to house your augments for all your jobs.
    User Defined Modes
		Idle Sets for Super Tanking
			[*] PDT
            [*] MagicEva
            [*] Normal
        Melee Hybrid Offense Mode
            [*] TankHyb
            [*] DDHyb
            [*] DDHybAcc
        Weaponskill Mode
            [*]Normal
            [*]Mid
            [*]Acc
        Casting modes
            [*]Normal
            [*]resistant
            [*]enmity
    Job ability Defined Modes
        [*]Souleater mode (will auto toggle off Souleater)
        [*]Last Resort (will auto toggle off when active)
    Other aspects of this file 
        [*]Capacity Mode - equip your CP mantle when engaged and Idle
        [*]Equips Ygna's Resolve +1 while reive status is active 
    Rune Fencer as a Job and Rune rules
        While on RUN you will have the option to create 
        and in game macro to cycle through the runes and display 
        specific rune information
            [*]/console gs c rune 
            [*]/console gs c cycle runes
            [*]/console gs c cycle rayke
            [*]/console gs c cycle rune
        if you want to create another macro to move backwards use 
        the same as above just edit cycle to cycleback
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
		state.CapacityMode = M(false, 'Capacity Point Mantle')
		state.Buff.Souleater = buffactive.souleater or false
		state.Buff['Last Resort'] = buffactive['Last Resort'] or false
		state.SouleaterMode = M(false, 'Soul Eater Mode')
		state.LastResortMode = M(false, 'Last Resort Mode')
		gsList = S{'Lionheart', 'Aettir'}
		state.mainWeapon = M{'Lionheart', 'Aettir'}
	--[[ Define the Weapon Skills that benefit from Moonshade Earring ]]
		moonshade_WS = S{
			"Resolution", "Dimidiation", "Savage Blade", "Vorpal Blade", 
			"Requiescat", "Sanguine Blade"
		}
	--[[ Various form functions ]]
		get_combat_form()
		get_combat_weapon()
		update_melee_groups()
		define_rune_info()
	--[[ Spell Sections ]]
		BlueMagic = {}
		blue_magic_maps = {}
		blue_magic_maps.Physical = S {
			'Bludgeon', 'Body Slam', 'Feather Storm', 'Mandibular Bite', 
			'Queasyshroom', 'Power Attack', 'Screwdriver', 'Sickle Slash', 
			'Smite of Rage', 'Terror Touch', 'Battle Dance', 'Claw Cyclone',
			'Foot Kick', 'Grand Slam', 'Sprout Smack', 'Helldive', 'Jet Stream',
			'Pinecone Bomb', 'Wild Oats', 'Uppercut'
		}		
		blue_magic_maps.Buff = S {
			'Refueling', 'Cocoon'
		}
		blue_magic_maps.Healing = S {
			'Healing Breeze', 'Pollen', 'Wild Carrot'
		}
		blue_magic_maps.Enmity = S { 
			'Blank Gaze', 'Jettatura', 'Geist Wall', 
			'Sheep Song', 'Soporific', 'Stinking Gas'
		}
		RUNMagic_Enmity = S {
			'Flash', 'Stun', 'Sleepga', 'Foil'
		}
		absorbs = S{ 
			'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 'Absorb-AGI', 
			'Absorb-INT', 'Absorb-MND', 'Absorb-CHR', 'Absorb-Attri', 
			'Absorb-ACC', 'Absorb-TP'
		}
	end 
--------------------------
--  User Setup Section  --
--------------------------
	function user_setup()
		state.OffenseMode:options('none', 'PDT', 'MagicEva')
		state.IdleMode:options('Normal', 'PDT', 'MagicEva')
		state.HybridMode:options('none', 'TankHyb', 'DDHyb')
		state.WeaponskillMode:options('Normal', 'MidAcc', 'HighAcc')
	--[[ Overriding default hot keys ]]
		--send_command('bind f12 gs c cycle OffenseMode')
		send_command('bind f9 gs c cycle IdleMode')
		send_command('bind f12 gs c cycle OffenseMode')
		send_command('bind f10 gs c cycle HybridMode')      --F10
		send_command('bind f11 gs c cycle WeaponskillMode') --F11
		send_command('bind != gs c toggle CapacityMode')    --alt=.
		send_command('bind @f11 gs c set mainWeapon "Lionheart"') --Windows+f11
		send_command('bind @f12 gs c set mainWeapon "Aettir"')
		send_command('bind ^f9 gs c cycle SouleaterMode')
		send_command('bind ^f10 gs c cycle LastResortMode')
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
	--[[ Loading other functions ]]
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
--  This tells Gearswap what sets to fetch  --
--  Recommend creating a Car file.          --
----------------------------------------------
	function init_gear_sets()
		--[[Gear has been collected in a separate file]]
	end
-----------------------------------------------------------
--  Rune Fencer Rune section for displaying rune info    --
-----------------------------------------------------------
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
--------------------------
--  Custom Idle Gearset --
--------------------------
	function customize_idle_set(idleSet)
		if player.mpp < 50 then 
			idleSet = set_combine(idleSet, sets.latent_refresh)
		end 
		if player.mpp < 80 then 
			idleSet = set_combine(idleSet, sets.refresh)
		end 
		if player.hpp < 80 then 
			idleSet = set_combine(idleSet, sets.regen)
		end 
		if state.Buff.Doom then
			idleSet = set_combine(idleSet, sets.buff.Doom)
		end
		if player.hp < 800 then
			idleSet = set_combine(idleSet, sets.Reraise)
			add_to_chat(8, 'Low HP - Switching to Reraise set')
		end
		if state.CapacityMode.value then 
			idleSet = set_combine(sets.idle, sets.CapacityMantle)
		end
		if S{"Eastern Adoulin","Western Adoulin"}:contains(world.area) then
			idleSet = set_combine(idleSet,{body="Councilor's Garb"})
		end
		return idleSet
	end 
------------------------------
--  Custom melee Gearset    --
------------------------------
	function customize_melee_set(meleeSet)
		local abil_recasts = windower.ffxi.get_ability_recasts()	
		if state.HybridMode.value == "DDHyb" then 
			meleeSet = set_combine(meleeSet, sets.engaged.DDHyb)
			
		elseif state.HybridMode.value == "TankHyb" then 
			meleeSet = set_combine(meleeSet, sets.engaged.TankHyb)
			
		end 
		if state.OffenseMode.value == "PDT" then 
			meleeSet = set_combine(meleeSet, sets.idle.PDT)
			add_to_chat(7,'Time to Turtle it up!')
		elseif  state.OffenseMode.value == "MagicEva" then 
			meleeSet = set_combine(meleeSet, sets.idle.Magic)
			add_to_chat(7,'Setting gear selection to Magic Evasion')
		end
		if player.sub_job == 'SAM' then 
			if buffactive.Seigan and abil_recasts[133] == 0 then 
					send_command('@wait 1.0; input /ja "Third Eye" <me>')
				elseif buff == 'Hasso' then 
					cancel_spell()
				elseif not buffactive['Hasso'] and not buffactive['Seigan'] and not midaction() then 
					send_command('@wait 1.0; input /ja "Hasso" <me>')
			end
		end
		if state.Buff.Sleep and player.hp > 120 and player.status == "Engaged" then 
		-- Equip Berserker's Torque When You Are Asleep
			meleeSet = set_combine(meleeSet,{neck="Frenzy sallet"})
		end
		if state.Buff.Doom then
			meleeSet = set_combine(meleeSet, sets.buff.Doom)
		end
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
	function job_status_change(newStatus, oldStatus, eventArgs)
		
	end
	function job_update(cmdParams, eventArgs)
		war_sj = player.sub_job == 'WAR' or false
		get_combat_form()
		get_combat_weapon()
		update_melee_groups()
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
		if state.mainWeapon.value == "Aettir" then 
				equip({main="Aettir", sub="Refined grip +1"})
				--set_macro_page(2, 6)
		elseif state.mainWeapon.value == "Lionheart" then 
				equip({main="Lionheart", sub="Utu grip"})
				--set_macro_page(3, 6)
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
	function update_melee_groups()
		
	end
--------------------------------------------------
--  Creating a custom spellMap,                 --
--  since Mote capitalized absorbs incorrectly  --
--------------------------------------------------
	function job_get_spell_map(spell, default_spell_map)
		if spell.skill == 'Dark Magic' and absorbs:contains(spell.english) then
			return 'absorbs'
		end
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
		if spell.type=='WeaponSkill' then
			if moonshade_WS:contains(spell.english) and player.tp < 2900 then
				equip({ear2="Moonshade Earring"})
			end
		end
	--[[ Lock weaponskill if you are to far from the mob as to not lose TP ]]
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
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if state.Buff[buff] ~= nil then
			state.Buff[buff] = gain
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
		if state.LastResortMode.value == true then 
			send_command('@wait 1; cancel Last Resort')
		end 
		if state.SouleaterMode.value == true then 
			send_command('@wait 1; cancel Souleater')
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
------------------------------------------------------------------
--  Selecting and Setting the default Macro book and Lock style --
------------------------------------------------------------------
	function select_default_macro_book()
		-- Default macro set/book
		if player.sub_job == 'WAR' then 
			set_macro_page(3, 9)
		elseif player.sub_job == 'BLU' then 
			set_macro_page(2, 9)
		elseif player.sub_job == 'SAM' then 
			set_macro_page(1, 9)
		else 
			set_macro_page(3, 9)
		end 
	end
	function set_lockstyle()
		send_command('wait 4; input /lockstyleset 3')
	end