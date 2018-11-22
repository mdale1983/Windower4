_addon.name = 'AutoWS'
_addon.version = '1.0.0'
_addon.author = 'Enuri'
_addon.command = 'AWS'

require 'tables'
require 'strings'
require 'actions'
packets = require('packets')

windower.register_event('load', function()
	--tp = 1500
	wsid = 'Rudra\'s Storm'
	version = '1.0.0'
end)
function start()
	windower.add_to_chat(7, 'Commencing Auto Weapon Skill Mode')	
	player = windower.ffxi.get_player()
	if player.status == 1 then
		auto = 1
	elseif player.status == 0 then
		auto = 0
	end
	WS()
end
function stop()
	windower.add_to_chat(17, 'AutoWS  STOPPING')	
	auto = 0
end
function WS()
	local player = windower.ffxi.get_player()
	if player.vitals['tp'] >= 1000 then 
	windower.send_command('input /ws '..wsid.. ' <t>')
	end 
end
windower.register_event('action',function (act)
	local actor = act.actor_id
	local category = act.category
	local player = windower.ffxi.get_player()
	
	if ((actor == (player.id or player.index))) then
		if player.vitals['tp'] > 1000 then
			if auto == 1 then
				if  player.status == 1 then
					auto = 1
				elseif  player.status == 0 then
					auto = 0
					return
				end
			end
			if auto == 1 and player.vitals['tp'] > 1000 then
				windower.send_command('@wait 1.5;input /ws '..wsid..' <t>')
			elseif auto == 0 then
			end
		end
	end
end)
function split(msg, match)
	local length = msg:len()
	local splitarr = {}
	local u = 1
	while u <= length do
		local nextanch = msg:find(match,u)
		if nextanch ~= nil then
			splitarr[#splitarr+1] = msg:sub(u,nextanch-match:len())
			if nextanch~=length then
				u = nextanch+match:len()
			else
				u = lengthlua 
			end
		else
			splitarr[#splitarr+1] = msg:sub(u,length)
			u = length+1
		end
	end
	return splitarr
end
windower.register_event('addon command',function (...)
    local term = table.concat({...}, ' ')
    local splitarr = split(term,' ')
	if splitarr[1]:lower() == 'start' then
		start()
	elseif splitarr[1]:lower() == 'help' then
		windower.add_to_chat(17, 'AutoRA  v'..version..'commands:')
		windower.add_to_chat(17, '//ara [options]')
		windower.add_to_chat(17, '    start  	- Starts auto attack with ranged weapon')
		windower.add_to_chat(17, '    stop   	- Stops auto attack with ranged weapon')
		windower.add_to_chat(17, '    haltontp	- Toggles automatic halt upon reaching 1000 TP')
		windower.add_to_chat(17, '    help   	- Displays this help text')
		windower.add_to_chat(17, ' ')
		windower.add_to_chat(17, 'AutoRA will only automate ranged attacks if your status is "Engaged".  Otherwise it will always fire a single ranged attack.')
		windower.add_to_chat(17, 'To start auto ranged attacks without commands use the key:  Ctrl+d')
		windower.add_to_chat(17, 'To stop auto ranged attacks in the same manner:  Atl+d')
	end
end)