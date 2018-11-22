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
		send_command('bind f12 gs c cycle CastingMode')
	--[[ AltF9-AltF12 keybinds ]]
		send_command('bind !f9 gs c cycle Empty')
		send_command('bind !f10 gs c cycle DarkSealMode')
		send_command('bind !f11 gs c toggle LastResortMode')
		send_command('bind !f12 gs c toggle SouleaterMode')
		send_command('bind != gs c toggle CapacityMode')
		send_command('bind !` input /ma "Geist Wall" <t>')
		send_command('bind !q input /ma "Soporific" <t>')
	--[[ CtrlF9-CtrlF12 keybinds ]]
		send_command('bind ^f9 gs c cycle Empty')
		send_command('bind ^f10 gs c cycle Empty')
		send_command('bind ^f11 gs c cycle Empty')
		send_command('bind ^f12 gs c cycle Empty')
		send_command('bind ^` input /ma "Blink" <me>')
		send_command('bind ^q input /ma "Temper" <me>')
	--[[ WindowsF9-WindowsF12 keybinds ]]
		send_command('bind @f9 gs c set mainWeapon Lionheart')
		send_command('bind @f10 gs c set mainWeapon Aettir')
		send_command('bind @f11 gs c set mainWeapon Epeolatry')
		send_command('bind @f12 gs c set mainWeapon Empty')
		send_command('bind @` input /ma "Aquaveil" <me>')
		send_command('bind @q input /ma "Sheep Song" <t>')
	end
	function buffer()
		include('caster_buffWatcher.lua')
			buffWatcher.watchList = 
			{
				["Temper"]="Temper",
				["Phalanx"]="Phalanx",
				["Refresh"]="Refresh"
			}
		include('common_info.status.lua')
	end 
--------------------------
--  Job Setup Section   --
--------------------------
	function job_setup()
  	state.mainWeapon = M{'None', 'Lionheart', 'Aettir', 'Epeolatry', 'Empty'}
  	oneHandList = S{'replace with your weapons'}
  	gsList = S{'Macbain', 'Crobaci +1'}
  	scytheList = S{'Cronus', 'Raetic Scythe'}
  --[[Correction to errors in Mote Libs]]
  	absorbs = S{ 
			'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 
			'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 
			'Absorb-CHR', 'Absorb-ACC', 'Absorb-TP',
			'Absorb-Attri'
		}
  --[[ Moonshade earring and Gav. Helmet ]]
		moonshade_WS = S{
			"Resolution", "Dimidiation", 
			"Savage Blade", "Vorpal Blade", 
			"Requiescat", "Sanguine Blade"
		}
		gav_ws = S{
			"Torcleaver","Resolution","Catastrophe",
			"Scourge","Cross Reaper"
		}
  --[[ Nuking sets ]]
		LowTierNuke = S{
			'Stone', 'Stone II', 'Stone III', 
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
		buffList = S { 
			'Temper', 'Crusade', 'Phalanx', 'Shell V'
		}
		rayke_duration = 35
		gambit_duration = 96
  end 
--------------------------
--  User Setup Section  --
--------------------------
	function user_setup()
  	state.IdleMode:options('Normal', 'PDT', 'MagicEva')
  	state.OffenseMode:options('Normal', 'DDHyb', 'TankHyb')
  	state.HybridMode:options('Normal', 'Tanking')
  	state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
  	state.CastingMode:options('Normal', 'Resistant', 'Enmity')
  --[[ User Created states ]]
  	state.SouleaterMode = M(false, 'Soul Eater Mode')
	state.LastResortMode = M(false, 'Last Resort Mode')
	state.CapacityMode = M(false, 'Capacity Point Mantle')
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
  --[[ Loading of various functions ]]
  	getHp()
  	job_update()
  	select_default_macro_book()
  	set_lockstyle()
	get_player_name()
  	job_binds()
	buffer()
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
		if player.hpp < 60 then 
			state.HybridMode:set('DT')
		elseif player.hpp < 53 then 
    		state.HybridMode:set('Reraise')
    	elseif player.hpp > 51 then 
    		state.HybridMode:set('Normal')
    	end 
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
		if cmdParams[1] == 'buffWatcher' then
			buffWatch(cmdParams[2])
		end
		if cmdParams[1] == 'stopBuffWatcher' then
			stopBuffWatcher()
		end
		if cmdParams[1]:lower() == 'rune' then
			send_command('@input /ja '..state.Runes.value..' <me>')
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
		if state.HybridMode.value == 'Reraise' then 
			idleSet = set_combine(idleSet, sets.Reraise)
			add_to_chat(7,'Death is iminent hp is at '..player.hpp..' equiping re-raise set')
		end 
		if state.IdleMode.value == "PDT" then 
			idleSet = set_combine(idleSet, sets.idle.PDT)
		end
		if state.HybridMode.value == "Normal" then 
			enable('Head', 'Body')
		end
		if state.IdleMode.value == "MagicEva" then 
			idleSet = set_combine(idleSet, sets.idle.MagicEva)
		end 
		if state.CapacityMode.value then 
			idleSet = set_combine(idleSet, sets.CapacityMantle)
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
		if state.OffenseMode.value == "DDHyb" then 
			state.IdleMode:set('Normal')
		else
			state.IdleMode:reset()
		end 
		if state.OffenseMode.value == "PDT" then 
			meleeSet = set_combine(meleeSet, sets.idle.PDT)
			add_to_chat(7,'Time to Turtle it up!')
		elseif state.OffenseMode.value == "MagicEva" then 
			meleeSet = set_combine(meleeSet, sets.idle.Magic)
			add_to_chat(7,'Setting gear selection to Magic Evasion')
		elseif state.OffenseMode.value == "Normal" then  
		end 		
		if state.HybridMode.value == "Tanking" then 
			meleeSet = set_combine(meleeSet, sets.engaged.Tanking)
		end 
		if state.HybridMode.value == "DDHyb" then 
			equip(sets.engaged.DDHyb)
		end
		if state.IdleMode.value == "PDT" then 
			meleeSet = set_combine(meleeSet, sets.idle.PDT)
		end
		if state.IdleMode.value == "MagicEva" then 
			meleeSet = set_combine(meleeSet, sets.idle.MagicEva)
		end 
		if state.CapacityMode.value then 
			meleeSet = set_combine(meleeSet, sets.CapacityMantle)
		end 
		if state.Buff.Doom then
			meleeSet = set_combine(meleeSet, sets.buff.Doom)
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
			if gsList:contains(player.equipment.main) then
				state.CombatWeapon:set('GreatSword')
			elseif scytheList:contains(player.equipment.main) then
				state.CombatWeapon:set('Engaged')
			elseif player.equipment.main == 'Lionheart' then
				state.CombatWeapon:set('Lionheart')
			elseif player.equipment.main == 'Aettir' then
				state.CombatWeapon:set('Aettir')
			elseif player.equipment.main == 'Caladbolg' then
				state.CombatWeapon:set('Caladbolg')
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
	end 
	function get_combat_weapon()
		if state.mainWeapon.value == "Aettir" then 
			equip({main="Aettir", sub="Refined grip +1"})
		elseif state.mainWeapon.value == "Lionheart" then 
			equip({main="Lionheart", sub="Utu grip"})
		elseif state.mainWeapon.value == "Epeolatry" then 
			equip({main="Epeolatry", sub="Utu grip"})
		end	
		return get_combat_weapon
	end 
	function job_state_change() 
		
	end 
	function update_melee_group()
	--[[ Can use this to create your own custom Template ]]
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
				add_to_chat(8, '***Apocalypse haste is active. Switching to AM set***')
			end 
		end 
		if buffactive['Samurai Roll'] then
			classes.CustomRangedGroups:append('SamRoll')
		end
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
	end 
	function job_post_precast(spell, action, spellMap, eventArgs)
		if spell.action_type=="Magic" and buffactive.Silence then
			eventArgs.cancel = true
			send_command('input /item "Echo Drops" <me>')
		end
		if spell.type=='WeaponSkill' then
			if moonshade_WS:contains(spell.english) and player.tp < 2850 then
				equip({ear2="Moonshade Earring"})
			end
		end
		--[[ Lock Weaponskill if you are to far from the mob  ]]
		if spell.type == 'WeaponSkill' then 
			if spell.target.distance > 5 then 
				cancel_spell()
				add_to_chat(8, 'Target to far away. Move closer')
				return
			end 
		end
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
	end 
-----------------------
--  Mid-cast Section --
-----------------------
	function job_midcast(spell, spellMap, eventArgs)
		
	end
	function job_post_midcast(spell, spellMap, eventArgs)
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
--  after-cast Section --
-------------------------
	function job_aftercast(spell, spellMap, eventArgs)
		if spell.name == 'Rayke' and not spell.interrupted then
        send_command('@timers c "Rayke ['..spell.target.name..']" '..rayke_duration..' down spells/00136.png')
        send_command('wait '..rayke_duration..';input /p ***Rayke: OFF***')
    elseif spell.name == 'Gambit' and not spell.interrupted then
        send_command('@timers c "Gambit ['..spell.target.name..']" '..gambit_duration..' down spells/00136.png')
        send_command('wait '..gambit_duration..';input /p ***Gambit: OFF***')
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
		for index,value in pairs(buffWatcher.watchList) do
			if index==buff then
				buffWatch()
				break
			end
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
----------------------------------------
--  Selecting and Setting the default --
--	Macro book and Lock style 		  --
----------------------------------------
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