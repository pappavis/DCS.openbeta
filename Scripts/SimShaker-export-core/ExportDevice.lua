local require = require
local loadfile = loadfile

package.path = package.path..";.\\LuaSocket\\?.lua"
package.cpath = package.cpath..";.\\LuaSocket\\?.dll"

local JSON = loadfile("Scripts\\JSON.lua")()
local socket = require("socket")

local dev = GetSelf()

local update_time_step = (1/30)
make_default_activity(update_time_step)
--sensor_data = get_base_data()

local exportedDrawModelArguments = {}
local udp = socket.udp()
udp:settimeout(0)
socket.try(udp:sendto("NEW_UNIT="..get_aircraft_type(), "127.0.0.1", 12846))

function round2(num, idp)
  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

function update()
	msg = ""
	for k, _ in pairs(exportedDrawModelArguments) do
		msg = msg .. tostring(k) .. "=" .. tostring(round2(get_aircraft_draw_argument_value(k), 2 )) .. "\n"
	end
	socket.try(udp:sendto(msg, "127.0.0.1", 12846))
end

function SetCommand(a,b)
	if a == 0 then
		exportedDrawModelArguments[b] = true
	end
	if a == 1 then
		exportedDrawModelArguments = {}
	end
end
