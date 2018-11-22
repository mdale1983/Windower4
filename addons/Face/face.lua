_addon.name = 'Face'
_addon.author = 'Lowclock'
_addon.version = '4.2.0.69'
_addon.command = 'face'

require 'tables'
require 'sets'
require 'strings'
require 'actions'
require 'pack'
require 'logger'
files = require 'files'
require('chat')
res = require 'resources'

function facemob()
	local target = {}
	target = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().target_index or 0)
	local self_vector = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().index or 0)
	if target then  -- Please note if you target yourself you will face Due East
		local angle = (math.atan2((target.y - self_vector.y), (target.x - self_vector.x))*180/math.pi)*-1
		windower.ffxi.turn((angle):radian())
	else
		windower.add_to_chat(10,"Face: You're not targeting anything to face")
	end
end

function turnaround() 
	local target = {}
	target = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().target_index or 0)
	local self_vector = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().index or 0)
	if target then  -- Pleaes note if you target yourself you will face due West
		local angle = (math.atan2((target.y - self_vector.y), (target.x - self_vector.x))*180/math.pi)*-1
		windower.ffxi.turn((angle+180):radian())
	else 
		windower.add_to_chat(10,"Face: You're not targeting anything to turn around from")
	end
end

windower.register_event('addon command', function(command, ...)
	local args = L{...}
	if command:lower() == 'at' then
		facemob()
	end
	if command:lower() == 'away' then
		turnaround()
	end
end)
