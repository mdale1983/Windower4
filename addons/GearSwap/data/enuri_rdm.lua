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
		--select_default_macro_book()
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
			equip({main="Vampirism", sub="Almace"})
		elseif state.mainWeapon.value == "Sequence" then 
			equip({main="Colada", sub="Almace"})
		elseif state.mainWeapon.value == "Excalibur" then 
			equip({main="Atoyac", sub="Almace"})
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
		--determine_haste_group()
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
			equip({main="Vampirism", sub="Almace"})
		end 
		if state.mainWeapon.value == "Sequence" then 
			equip({main="Colada", sub="Almace"})
		end 
		if state.mainWeapon.value == "Excalibur" then 
			equip({main="Atoyac", sub="Almace"})
		end
	end