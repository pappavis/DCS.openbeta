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
	default_output_file = io.open(lfs.writedir() .. "Logs\\ExportSkval.log", "w");
	if default_output_file then
		default_output_file:write("ExportSkval --> LuaExportStart aangeroept.\r\n")
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
end

function LuaExportStop()
	LoRemoveSharedTexture("mfd0")
	if default_output_file then
		default_output_file:write("LuaExportStop was called.\r\n")
		default_output_file:close()
		default_output_file = nil
   end
end

function LuaExportActivityNextEvent(t)
	local tNext = t
	return tNext
end
