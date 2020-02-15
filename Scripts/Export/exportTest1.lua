-- Data export script for Lock On version 1.2.
-- Copyright (C) 2006, Eagle Dynamics.
-- See http://www.lua.org for Lua script system info 
-- We recommend to use the LuaSocket addon (http://www.tecgraf.puc-rio.br/luasocket) 
-- to use standard network protocols in Lua scripts.
-- LuaSocket 2.0 files (*.dll and *.lua) are supplied in the Scripts/LuaSocket folder
-- and in the installation folder of the Lock On version 1.2. 

-- Please, set EnableExportScript = true in the Config/Export/Config.lua file
-- to activate this script!

-- Expand the functionality of following functions for your external application needs.
-- Look into ./Temp/Error.log for this script errors, please.

-- you can export render targets via shared memory interface 
-- using next functions  
--        LoSetSharedTexture(name)          -- register texture with name "name"  to export
--        LoRemoveSharedTexture(name)   -- copy texture with name "name"  to named shared memory area "name"
--        LoUpdateSharedTexture(name)    -- unregister texture
--       texture exported like Windows BMP file 
--      --------------------------------
--      |BITMAPFILEHEADER   |
--      |BITMAPINFOHEADER |
--      |bits                                  |
--      --------------------------------
--      sample textures   :  "mfd0"    -  full  SHKVAL screen
--                                      "mfd1"     -  ABRIS map screen
--                                      "mfd2"    - not used
--                                      "mfd3"    - not used
--                                      "mirrors" - mirrors
 

local default_output_file = nil
local after_next_frame_called_once = false

function LuaExportStart()
	LoSetSharedTexture("mfd0")
	local lfs = require('lfs')
	default_output_file = io.open(lfs.writedir() .. "Logs\\ExportTest1.log", "w");
	if default_output_file then
		default_output_file:write("ExportTest1 --> LuaExportStart aangeroept.\r\n")
	end

	local version = LoGetVersionInfo() --request current version info (as it showed by Windows Explorer fo DCS.exe properties)
    if version and default_output_file then
 	    
 		default_output_file:write("ProductName: "..version.ProductName..'\n')
 		default_output_file:write(string.format("FileVersion: %d.%d.%d.%d\n",
 												version.FileVersion[1],
 												version.FileVersion[2],
 												version.FileVersion[3],
 												version.FileVersion[4]))
 		default_output_file:write(string.format("ProductVersion: %d.%d.%d.%d\n",
 												version.ProductVersion[1],
 												version.ProductVersion[2],
 												version.ProductVersion[3],  -- head  revision (Continuously growth)
												version.ProductVersion[4])) -- build number   (Continuously growth)	
	end
	
end

function LuaExportBeforeNextFrame()
end

function LuaExportAfterNextFrame()
	LoUpdateSharedTexture("mfd0")
	if default_output_file and not after_next_frame_called_once then
		default_output_file:write("LuaExportAfterNextFrame was called.\r\n")
		after_next_frame_called_once = true
	end

 if default_output_file then
	  default_output_file:write(string.format("t = %.2f, name = %s, altBar = %.2f, altRad = %.2f, pitch = %.2f, bank = %.2f, yaw = %.2f\n", t, name, altBar, altRad, 57.3*pitch, 57.3*bank, 57.3*yaw))
	  default_output_file:write(string.format("t = %.2f ,RPM left = %f  fuel_internal = %f \n",t,engine.RPM.left,engine.fuel_internal))
	  default_output_file:write(string.format("ADF = %f  RMI = %f\n ",57.3*HSI.ADF,57.3*HSI.RMI))
	end
-- 2) Socket
--	socket.try(c:send(string.format("t = %.2f, name = %s, altBar = %.2f, alrRad = %.2f, pitch = %.2f, bank = %.2f, yaw = %.2f\n", t, name, altRad, altBar, pitch, bank, yaw)))
	
end

function LuaExportStop()
	LoRemoveSharedTexture("mfd0")
	if default_output_file then
		default_output_file:write("LuaExportStop aangeroept.\r\n")
		default_output_file:close()
		default_output_file = nil
   end
end

function LuaExportActivityNextEvent(t)
	local tNext = t

-- For example:
-- 1) File
  if default_output_file then
		local o = LoGetWorldObjects()
			for k,v in pairs(o) do
				default_output_file:write(string.format("<t>%.2f</t><ID>%d</ID><name>%s</name><country> = %s(%s)</country>, LatLongAlt = (%f, %f, %f), heading = %f\n", t, k, v.Name, v.Country, v.Coalition, v.LatLongAlt.Lat, v.LatLongAlt.Long, v.LatLongAlt.Alt, v.Heading))
			end
		local trg = LoGetLockedTargetInformation()
	  default_output_file:write(string.format("<locked_targets_time>%.2f</locked_targets_time>\n",t))
		for i,cur in pairs(trg) do
		  default_output_file:write(string.format("<details1><ID>%d</ID>, position = (%f,%f,%f) , V = (%f,%f,%f),flags = 0x%x</details1>\n",cur.ID,cur.position.p.x,cur.position.p.y,cur.position.p.z,cur.velocity.x,cur.velocity.y,cur.velocity.z,cur.flags))
		end
		local route = LoGetRoute()
		default_output_file:write(string.format("t = %f\n",t))
		if route then
			  default_output_file:write(string.format("Goto_point :\n point_num = %d ,wpt_pos = (%f, %f ,%f) ,next %d\n",route.goto_point.this_point_num,route.goto_point.world_point.x,route.goto_point.world_point.y,route.goto_point.world_point.z,route.goto_point.next_point_num))
			  default_output_file:write(string.format("Route points:\n"))
			for num,wpt in pairs(route.route) do
			  default_output_file:write(string.format("point_num = %d ,wpt_pos = (%f, %f ,%f) ,next %d\n",wpt.this_point_num,wpt.world_point.x,wpt.world_point.y,wpt.world_point.z,wpt.next_point_num))
			end
		end

		local stations = LoGetPayloadInfo()
		if stations then
			default_output_file:write(string.format("Current = %d \n",stations.CurrentStation))

			for i_st,st in pairs (stations.Stations) do
				local name = LoGetNameByType(st.weapon.level1,st.weapon.level2,st.weapon.level3,st.weapon.level4);
				if name then
				default_output_file:write(string.format("weapon = %s ,count = %d \n",name,st.count))
				else
				default_output_file:write(string.format("weapon = {%d,%d,%d,%d} ,count = %d \n", st.weapon.level1,st.weapon.level2,st.weapon.level3,st.weapon.level4,st.count))
				end
			end
		end 

		local Nav = LoGetNavigationInfo()
		if Nav then
			default_output_file:write(string.format("%s ,%s  ,ACS: %s\n",Nav.SystemMode.master,Nav.SystemMode.submode,Nav.ACS.mode))
			default_output_file:write(string.format("Requirements :\n\t  roll %d\n\t pitch %d\n\t speed %d\n",Nav.Requirements.roll,Nav.Requirements.pitch,Nav.Requirements.speed))
		end
	end



	tNext = tNext + 1.0
-- 2) Socket
--	local o = LoGetWorldObjects()
--	for k,v in pairs(o) do
--      socket.try(c:send(string.format("t = %.2f, ID = %d, name = %s, country = %s(%s), LatLongAlt = (%f, %f, %f), heading = %f\n", t, k, v.Name, v.Country, v.Coalition, v.LatLongAlt.x, v.LatLongAlt.Long, v.LatLongAlt.Alt, v.Heading)))
--	end
	tNext = tNext + 1.0

	return tNext
end
