	--Copyright (c) 2016, Selindrile
--All rights reserved.

--Redistribution and use in source and binary forms, with or without
--modification, are permitted provided that the following conditions are met:

--    * Redistributions of source code must retain the above copyright
--      notice, this list of conditions and the following disclaimer.
--    * Redistributions in binary form must reproduce the above copyright
--      notice, this list of conditions and the following disclaimer in the
--      documentation and/or other materials provided with the distribution.
--    * Neither the name of RollTracker nor the
--      names of its contributors may be used to endorse or promote products
--      derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
--ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
--WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
--DISCLAIMED. IN NO EVENT SHALL THOMAS ROGERS BE LIABLE FOR ANY
--DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
--LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
--ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
--(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
--SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--[[ Start of Addon ]]
_addon.name = 'SkillUp'
_addon.version = '1.0'
_addon.author = 'Eilwolf of Asura'
_addon.commands = {'Skillup','Skill'}

require('luau')
chat = require('chat')
chars = require('chat.chars')
packets = require('packets')
res = require ('resources')

local Display = require('AutoSkillupGUI')
local display

defaults = {}
zonedelay = 6

settings = config.load(defaults)

if windower.ffxi.get_player() then 
	self = windower.ffxi.get_player().name
	windower.add_to_chat(7,'Hello '..self..' Welcome to Auto Skillup')
end

windower.register_event('addon command', function (...)
	cmd = {...}

	 if cmd[1] ~= nil then
		cmd[1] = cmd[1]:lower()
	end
	
	if cmd[2] ~= nil then
		cmd[2] = cmd[2]:lower()
	end
	
	if cmd[1] == nil or cmd[1] == "begin" then

		if autoskill == true then
			windower.add_to_chat(7,'Auto Skillup is ON.')
		else
			windower.add_to_chat(7,'Auto Skillup is OFF.')
		end

		windower.add_to_chat(7,'Roll 1: '..Rollindex[settings.Roll_ind_1]..'')
		windower.add_to_chat(7,'Roll 2: '..Rollindex[settings.Roll_ind_2]..'')
	else
		if cmd[1] == "help" then
			windower.add_to_chat(7,'To start or stop auto rolling type //roller roll')
			windower.add_to_chat(7,'To set rolls use //roller roll# rollname')
		end
	end 
	
end)

--[[ User settings for setting spells and such]]
	user_settings = {
		user_spells = {
			Healing = T{},
			Geomancy = T{},
			Enhancing = T{'Dia', 'Blind'},
			Ninjutsu = T{},
			Singing = T{},
			Blue = T{},
			Enfeebling = T{},
			Dark = T{},
			Elemental = T{},
			Divine = T{},
			Summoning = T{}},
		save_settings = false
	}

windower.register_event('load', function()
	autoskill = false
end)

