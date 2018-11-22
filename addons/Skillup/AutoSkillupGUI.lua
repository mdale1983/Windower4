function on_load()
	skillup.box={
		pos={x=211,y=402},
			text={
				font='Segoe UI Symbol',
				size=12,
				Fonts={'sans-serif'},
			},
			bg={alpha=255}
	}
	skillup.boxa = { 
		pos=
		{
			x=gs_skillup.box.pos.x - 145,
			y=gs_skillup.box.pos.y
		},
			text={font='Segoe UI Symbol',size=9},
			bg={alpha=255}
	}
	button = texts.new(skillup.boxa)
	window = texts.new(skillup.box)
	initialize(button, skillup.boxa, 'button')
	initialize(window, skillup.box, 'window')
	button:show()
	window:show()
	
end 
function file_unload()
		if user_settings.save_settings then
			file_write()
		end
		window:destroy()
		button:destroy()
end
function self_command(command)
	 if command == "skillstop" then
        skilluprun = false
    elseif command == 'aftershutdown' then
        end_skillup.stoptype = "Shutdown"
        end_skillup.shutdown = true
        end_skillup.logoff = false
    elseif command == 'afterlogoff' then
        end_skillup.stoptype = "Logoff"
        end_skillup.shutdown = false
        end_skillup.logoff = true
    elseif command == 'afterStop' then
        end_skillup.stoptype = "Stop"
        end_skillup.shutdown = false
        end_skillup.logoff = false
    elseif command == 'settrust' then
        gs_skillup.use_trust = not gs_skillup.use_trust
    elseif command == 'setitem' then
        gs_skillup.use_item = not gs_skillup.use_item
    elseif command == 'setgeo' then
        gs_skillup.use_geo = not gs_skillup.use_geo
    elseif command == 'changeinstrament' then
        gs_skillup.test_brd = (gs_skillup.test_brd=="Wind" and "String" or "Wind")
    end
    initialize(window, skillup.box, 'window')
    updatedisplay()
end 
function shutdown_logoff()
    add_to_chat(123,"Stoping skillup")
    if end_skillup.logoff then
        send_command('wait 3.0;input /logout')
    elseif end_skillup.shutdown then
        send_command('wait 3.0;input /shutdown')
    end
    initialize(window, gs_skillup.box, 'window')
    updatedisplay()
end
function initialize(text, settings, a)
    if a == 'window' then
        local properties = L{}
        if gs_skillup.test_mode then
            properties:append('--TEST MODE--')
            properties:append('Bard item = ${barditem|Wind}')
        end
        properties:append('--Skill Up--')
        if gs_skillup.use_trust then
            properties:append('\\crUsing Moogle Trust')
        end
        if gs_skillup.use_geo then
            properties:append("\\crUsing Geo's Refresh")
        end
        if gs_skillup.use_item then
            properties:append('\\crUsing Skill Up Item')
        end
        properties:append('Mode :\n   ${mode}')
        if gs_skill.skillup_type == 'Singing' then
            properties:append('\\crCurrent Singing Skill LVL:\n   ${skillssing|0}')
            properties:append('\\crCurrent String Skill LVL:\n   ${skillstring|0}')
            properties:append('\\crCurrent Wind Skill LVL:\n   ${skillwind|0}')
        elseif gs_skill.skillup_type == 'Geomancy' then
            properties:append('\\crCurrent Geomancy Skill LVL:\n   ${skillgeo|0}')
            properties:append('\\crCurrent Handbell Skill LVL:\n   ${skillbell|0}')
        else
            properties:append('\\crCurrent Skilling LVL:\n   ${skillbulk|0}')
        end
        if end_skillup.shutdown then
            properties:append('\\crWill Shutdown When Skillup Done')
        elseif end_skillup.logoff then
            properties:append('\\crWill Logoff When Skillup Done')
        else
            properties:append('\\crWill Stop When Skillup Done')
        end
        properties:append('\\crSkillup ${start|\\cs(255,0,0)Stoped}')
        properties:append("\\crSkillup's Per Hour \\cs(255,255,0)${skill_ph|0}")
        properties:append("\\crTotal Skillup's \\cs(255,255,0)${skill_total|0}")
        text:clear()
        text:append(properties:concat('\n'))
    end
	if a == 'button' then
        local properties = L{}
        properties:append('${TRUSTc}')
        properties:append('${REFc}')
        properties:append('${ITEMc}')
        properties:append('${HELc}')
        properties:append('${ENHc}')
        properties:append('${NINc}')
        properties:append('${SINc}')
        properties:append('${BLUc}')
        properties:append('${SMNc}')
        properties:append('${GEOc}')
        properties:append('${STOPc}')
        properties:append('${DOWNc}')
        properties:append('${LOGc}')
        if gs_skillup.test_mode then
            properties:append('${TESTc}')
        end
        text:clear()
        text:append(properties:concat('\n'))
    end
end 
function udatedisplay()
	local info = {}
		info.mode = gs_skill.skillup_type
        info.modeb = skilluprun and info.mode or 'None'
        info.start = (skilluprun and '\\cs(0,255,0)Started' or '\\cs(255,0,0)Stoped')
        info.skillssing = (gs_skillup.skill['Singing Capped'] and "Capped" or gs_skillup.skill['Singing Level'])
        info.skillstring = (gs_skillup.skill['Stringed Instrument Capped'] and "Capped" or gs_skillup.skill['Stringed Instrument Level'])
        info.skillwind = (gs_skillup.skill['Wind Instrument Capped'] and "Capped" or gs_skillup.skill['Wind Instrument Level'])
        info.skillgeo = (gs_skillup.skill['Geomancy Capped'] and "Capped" or gs_skillup.skill['Geomancy Level'])
        info.skillbell = (gs_skillup.skill['Handbell Capped'] and "Capped" or gs_skillup.skill['Handbell Level'])
        info.skill = {}
        info.skill.Healing = (gs_skillup.skill['Healing Magic Capped'] and "Capped" or gs_skillup.skill['Healing Magic Level'])
        info.skill.Enhancing = (gs_skillup.skill['Enhancing Magic Capped'] and "Capped" or gs_skillup.skill['Enhancing Magic Level'])
        info.skill.Summoning = gs_skillup.skill['Summoning Magic Capped'] and "Capped" or gs_skillup.skill['Summoning Magic Level']
        info.skill.Ninjutsu = (gs_skillup.skill['Ninjutsu Capped'] and "Capped" or gs_skillup.skill['Ninjutsu Level'])
        info.skill.Blue = (gs_skillup.skill['Blue Magic Capped'] and "Capped" or gs_skillup.skill['Blue Magic Level'])
        info.skillbulk = info.skill[info.mode]
        info.type = end_skillup.stoptype
        info.skill_ph = (get_rate(gs_skillup.skill_ups) or 0) / 10
        info.skill_total = (gs_skillup.total_skill_ups or 0) / 10
	info.GEOc = (gs_skillup.color.GEO and 'Start GEO' or '\\cs(255,0,0)Start GEO\\cr')
        info.HELc = (gs_skillup.color.HEL and 'Start Healing' or '\\cs(255,0,0)Start Healing\\cr')
        info.ENHc = (gs_skillup.color.ENH and 'Start Enhancing' or '\\cs(255,0,0)Start Enhancing\\cr')
        info.NINc = (gs_skillup.color.NIN and 'Start Ninjutsu' or '\\cs(255,0,0)Start Ninjutsu\\cr')
        info.SINc = (gs_skillup.color.SIN and 'Start Singing' or '\\cs(255,0,0)Start Singing\\cr')
        info.BLUc = (gs_skillup.color.BLU and 'Start Blue Magic' or '\\cs(255,0,0)Start Blue Magic\\cr')
        info.SMNc = (gs_skillup.color.SMN and 'Start Summoning Magic  ' or '\\cs(255,0,0)Start Summoning Magic\\cr  ')
        info.STOPc = (gs_skillup.color.STOP and 'Stop Skillups' or '\\cs(255,0,0)Stop Skillups\\cr')
        info.DOWNc = (gs_skillup.color.DOWN and 'Shutdown After Skillup' or '\\cs(255,0,0)Shutdown After Skillup\\cr')
        info.LOGc = (gs_skillup.color.LOG and  'Logoff After Skillup' or '\\cs(255,0,0)Logoff After Skillup\\cr')
        info.TRUSTc = (gs_skillup.color.TRUST and  'Use Moogle Trust' or '\\cs(255,0,0)Use Moogle Trust\\cr')
        info.REFc = (gs_skillup.color.REF and  "Use Geo's Refresh" or "\\cs(255,0,0)Use Geo's Refresh\\cr")
        info.ITEMc = (gs_skillup.color.ITEM and  'Use Skill Up Item' or '\\cs(255,0,0)Use Skill Up Item\\cr')
        info.TESTc = (gs_skillup.color.TEST and  'Change Bard Item' or '\\cs(255,0,0)Change Bard Item\\cr')
	
	button:update(info)
    button:show()
    window:update(info)
    window:show()
end 
function file_write()
    if not windower.dir_exists(lua_base_path..'data/'..player.name..'/Saves') then
        windower.create_dir(lua_base_path..'data/'..player.name..'/Saves')
    end
    local file = io.open(lua_base_path..'data/'..player.name..'/Saves/skillup_data.lua',"w")
    file:write(
        'skillup.box.pos.x = '..tostring(skillup.box.pos.x)..
        '\ngs_skillup.box.pos.y = '..tostring(skillup.box.pos.y)..
        '\ngs_skillup.boxa.pos.x = '..tostring(skillup.boxa.pos.x)..
        '\ngs_skillup.boxa.pos.y = '..tostring(skillup.boxa.pos.y)..
        '')
    file:close() 
end
windower.register_event('incoming chunk','load', function(id, data, modified, injected, blocked)
    if id == 0x062 then
        local packet = packets.parse('incoming', data)
        gs_skillup.skill = packet
        updatedisplay()
    end
    if id == 0x0DF and skilluprun then
        if data:unpack('I', 0x0D) == player.max_mp and skilluprun then
            windower.send_command('input /heal off')
        end
    end
end)
windower.register_event('mouse','load', function(type, x, y, delta, blocked)
    --local mx, my = texts.extents(button)
    --local button_lines = button:text():count('\n') + 1 
    local hx = (x - gs_skillup.boxa.pos.x)
    local hy = (y - gs_skillup.boxa.pos.y)
    local location = {}
    location.offset = my / button_lines
    location[1] = {}
    location[1].ya = 1
    location[1].yb = location.offset
    local count = 2
    while count <= button_lines do
         location[count] = {}
         location[count].ya = location[count - 1].yb
         location[count].yb = location[count - 1].yb + location.offset
         count = count + 1
    end
    if type == 0 then
        if window:hover(x, y) and window:visible() then
            button:pos((gs_skillup.box.pos.x - 145), gs_skillup.box.pos.y)
            set_color("none")
            updatedisplay()
        elseif button:hover(x, y) and button:visible() then
            window:pos((gs_skillup.boxa.pos.x + 145), gs_skillup.boxa.pos.y)
            for i, v in ipairs(location) do
                local switch = {[1]="TRUST",[2]='REF',[3]='ITEM',[4]="HEL",[5]="ENH",[6]="NIN",[7]="SIN",[8]="BLU",[9]="SMN",[10]="GEO",[11]="STOP",[12]="DOWN",
                                [13]="LOG",[14]="TEST"}
                if hy > location[i].ya and hy < location[i].yb then
                    set_color(switch[i])
                    updatedisplay()
                end
            end
        else
            set_color("none")
            updatedisplay()
        end
    elseif type == 2 then
        if button:hover(x, y) and button:visible() then
            for i, v in ipairs(location) do
                local switchb = {[1]="settrust",[2]="setgeo",[3]="setitem",[4]="start Healing",[5]="start Enhancing",[6]="start Ninjutsu",
                                [7]="start Singing",[8]="start Blue",[9]="start Summoning",[10]="start Geomancy",[11]="skillstop",[12]="aftershutdown",
                                [13]="afterlogoff",[14]="changeinstrament"}
                if hy > location[i].ya and hy < location[i].yb then
                    send_command("gs c "..switchb[i])
                    updatedisplay()
                end
            end
        end
    end
end)
windower.register_event('action message','load', function(actor_id, target_id, actor_index, target_index, message_id, param_1, param_2, param_3)
    if message_id == 38 and target_id == player.id then
        local ts = os.clock()
        gs_skillup.total_skill_ups = gs_skillup.total_skill_ups + param_2
        gs_skillup.skill_ups[ts] = param_2
    end
    updatedisplay()
end)
windower.register_event('action message','load', function(actor_id, target_id, actor_index, target_index, message_id, param_1, param_2, param_3)
    if message_id == 38 and target_id == player.id then
        local ts = os.clock()
        gs_skillup.total_skill_ups = gs_skillup.total_skill_ups + param_2
        gs_skillup.skill_ups[ts] = param_2
    end
    updatedisplay()
end)
frame_count = 0
windower.register_event('prerender','load',function()
    if frame_count%30 == 0 and window:visible() then
        updatedisplay()
    end
    frame_count = frame_count + 1
end)