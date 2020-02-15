-- Written by Holton181
-- Version 1.3
-- Use this to export GPS NMEA GGA and RMC sentences to be used with any application or device capable of using them, or AHRS sentences (ForFlight, SkyDemon, WingX Pro, FltPlan Go, etc.).
-- UDP or Serial Port export is available. To activate any of these see the COMMUNICATIONS sections (three of them).
-- REMEMBER!!! The world is flat! ...at least according to Eagle Dynamics. Therefor the position information taken from DCSW
-- does not perfectly correspond to the same in the real world. It gets worse the closer to map boarders you get.
-- Should not cause troubles in MP, but since I'm an exclusive SP myself I can't make any promises.
-- Use, distribute and copy any parts of this script as you like, but please acknowledge your source.
-- Thanks to:
-- * leonpo, who created the telemetry export file upon which this script is based on originally.
-- Not much of the original file is left. His (no longer active) project can be found here:
-- https://forums.eagle.ru/showthread.php?t=97890
-- * BR=55=Sevas, who pointed me in the right direction regarding ground speed and course.
-- * Eagle_Rising for pointing me to ForeFlight communication instructions
-- * muehlema for testing ForeFlight functionality
-- * "The Internet" for its vast amount of information required for me to complete this project...
--
-- Change-log
-- 1.0
-- * Initial release
-- 1.1
-- * Corrected how LoGetSelfData is handled when it returns nil (happens in spectator mode, when crashed, etc)
--	 Still do not know for sure if LoGetSelfData is handled correctly when allow_ownship_export = false
-- 1.2
-- * ForeFlight support
-- 1.3
-- * Hopefully simplified setup procedure, everything in the same section in the beginning of DCS_NMEA.lua




---------------------------------------------------------------------------------------------------
-- Export start 
---------------------------------------------------------------------------------------------------

dofile("./Config/World/World.lua")				-- Required to get mission date


DCS_NMEA =
{
Start=function(self) 
	
----------------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGURATION
----------------------------------------------------------------------------------------------------------------------------------------------
	
-- This "CONFIGURATION" is the only section you need to edit!
	
-- What output do You want? 0 = disabled, 1 = enabled, can be several
	AHRS_UDP = 0		-- AHRS sentences via UDP (ForFlight, SkyDemon, WingX Pro, FltPlan Go, etc. Enable X-Plane as data provider)
	NMEA_UDP = 0		-- NMEA sentences via UDP
	NMEA_Serial = 0		-- NMEA sentences via Serial port, you can configure a virtual Bluetooth serial port and connect to a Bluetooth devise
	-- INPORTANT!!!
	-- If Bluetooth is used, be aware that DCS will freeze as long as the used device isn't listening to the port. As soon as it listen, DCS will un-freeze.
	-- I do not know if this freezing behavior exist when a physical serial port is used, since I do not have one to test with.
	-- Remember to comment out the "dofile" line related to this MOD in Export.lua or set NMEA_Serial = 0 in this file if you are not going to use it to avoid freezing.


-- Where to connect?
	host_AHRS, port_AHRS = "127.0.0.1", 49002		-- Only needed if AHRS_UDP = 1, replace IP with device IP and leave the port as 49002
	host_udp, port_udp = "127.0.0.1", 4353		-- Only needed if NMEA_UDP = 1, replace IP with device IP and select preferred port, use the same port in your GPS device.
	sPort_Nr = 3									-- Only needed if NMEA_Serial = 1, replace the number with the serial port You want to use
	-- INPORTANT!!!
	-- Make sure the ports port_udp and port_AHRS are correctly opened in any firewall and router. You might need to open it as UDP exclusively and not as TCP/UDP.
	
	
-- How often do You want information to be sent, Nr of times per second? from 1 to 10 (ForFlight requirement)
	-- Doesn't affect AHRS position updates, need to be ones per second (ForFlight requirement), but does affect AHRS Attitude and all NMEA updates 
	ActivityNextEventFrequency = 5
	
	
-- STOP!!! Go no further! ;)
	
----------------------------------------------------------------------------------------------------------------------------------------------
-- END OF CONFIGURATION
----------------------------------------------------------------------------------------------------------------------------------------------
	
	package.path = package.path..";.\\LuaSocket\\?.lua"
	package.cpath = package.cpath..";.\\LuaSocket\\?.dll"
	socket = require("socket")
	
----------------------------------------------------------------------------------------------------------------------------------------------
-- COMMUNICATIONS
----------------------------------------------------------------------------------------------------------------------------------------------
	
	-- For UDP and Serial Port there are three sections each, one here in the Start() function, below. The second in the end of ActivityNextEvent() function. The third in the Stop() function.

	-- AHRS ----------------------------------------------------------------------------------------------------------------------------------
	if AHRS_UDP == 1 then
		my_init_AHRS = socket.protect(function()
			AHRS = socket.try(socket.udp())
			--AHRS:setoption('broadcast', true)
			--AHRS:settimeout(0)
		end)
		my_init_AHRS()
	end
	
	
	-- UDP -----------------------------------------------------------------------------------------------------------------------------------
	if NMEA_UDP == 1 then
		my_init_udp = socket.protect(function()
			udp = socket.try(socket.udp())
			--udp:setoption('broadcast', true)
			--udp:settimeout(0)
		end)
		my_init_udp()	
	end
	
	
	-- Serial Port ---------------------------------------------------------------------------------------------------------------------------
	if NMEA_Serial == 1 then
		sPort = string.format("COM%s",sPort_Nr)
		com = io.open(sPort,"w+b")
	end
	
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
	
	-- Create a TXT file for debugging or a NMEA log or whatever
	-- Need to be activated or de-activated at three locations, all located below corresponding communication section.
	-- Remember to adjust the path below to DCS or DCS.openbeta or whatever path you have to your Saved Games section.
	
	--[[	To activate section, add a "-" among the other two on this row. To deactivate remove one of the tree.
	--Test_file = os.getenv ("userprofile"):gsub("\\","/") .. "/Saved Games/DCS/Scripts/NMEA_Test.txt"
	Test_file = os.getenv ("userprofile"):gsub("\\","/") .. "/Saved Games/DCS.openbeta/Scripts/NMEA_Test.txt"
	file = io.open(Test_file, "w")
	file:write(string.format("%s\r\n",sPort))
	--]]
	
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
	
	xortbl = {
        { 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, },
        { 1,  0,  3,  2,  5,  4,  7,  6,  9,  8, 11, 10, 13, 12, 15, 14, },
        { 2,  3,  0,  1,  6,  7,  4,  5, 10, 11,  8,  9, 14, 15, 12, 13, },
        { 3,  2,  1,  0,  7,  6,  5,  4, 11, 10,  9,  8, 15, 14, 13, 12, },
        { 4,  5,  6,  7,  0,  1,  2,  3, 12, 13, 14, 15,  8,  9, 10, 11, },
        { 5,  4,  7,  6,  1,  0,  3,  2, 13, 12, 15, 14,  9,  8, 11, 10, },
        { 6,  7,  4,  5,  2,  3,  0,  1, 14, 15, 12, 13, 10, 11,  8,  9, },
        { 7,  6,  5,  4,  3,  2,  1,  0, 15, 14, 13, 12, 11, 10,  9,  8, },
        { 8,  9, 10, 11, 12, 13, 14, 15,  0,  1,  2,  3,  4,  5,  6,  7, },
        { 9,  8, 11, 10, 13, 12, 15, 14,  1,  0,  3,  2,  5,  4,  7,  6, },
        {10, 11,  8,  9, 14, 15, 12, 13,  2,  3,  0,  1,  6,  7,  4,  5, },
        {11, 10,  9,  8, 15, 14, 13, 12,  3,  2,  1,  0,  7,  6,  5,  4, },
        {12, 13, 14, 15,  8,  9, 10, 11,  4,  5,  6,  7,  0,  1,  2,  3, },
        {13, 12, 15, 14,  9,  8, 11, 10,  5,  4,  7,  6,  1,  0,  3,  2, },
        {14, 15, 12, 13, 10, 11,  8,  9,  6,  7,  4,  5,  2,  3,  0,  1, },
        {15, 14, 13, 12, 11, 10,  9,  8,  7,  6,  5,  4,  3,  2,  1,  0, },
    }
	
	ANEt = 1/ActivityNextEventFrequency -- Update interval in seconds, 1/1 to 1/10
	AHRSt = 1
end,

ActivityNextEvent=function(self,t)
	--LoGetSelfData return the same result as LoGetObjectById but only for your aircraft and not depended on anti-cheat setting in Export/Config.lua
	--Returned object table structure:
	--{ 
		--Name = 
		--Type =  {level1,level2,level3,level4},  ( see Scripts/database/wsTypes.lua) Subtype is absent  now
		--Country   =   number ( see Scripts/database/db_countries.lua
		--Coalition = 
		--CoalitionID = number ( 1 or 2 )
		--LatLongAlt = { Lat = , Long = , Alt = }
		--Heading =   radians
		--Pitch      =   radians
		--Bank      =  radians
		--Position = {x,y,z} -- in internal DCS coordinate system ( see convertion routnes below)
		-- only for units ( Planes,Hellicopters,Tanks etc)
		--UnitName    = unit name from mission (UTF8)  
		--GroupName = unit name from mission (UTF8)	
	--}
	
	local tNext = t
	local SD = LoGetSelfData
	if not SD() then
		return tNext + 0.5
	end 


	local year = MissionDate.Year
	local month = MissionDate.Month
	local day = MissionDate.Day
	local pt = LoGetMissionStartTime()+LoGetModelTime()
	local h = pt/3600
	local hh = math.floor(h)
	local m = (h-hh)*60
	local mm = math.floor(m)
	local s = (m-mm)*60

	local Lat = SD().LatLongAlt.Lat
	local Long = SD().LatLongAlt.Long
	local Alt = SD().LatLongAlt.Alt
	
	local Heading = SD().Heading*180/math.pi
	local Pitch = SD().Pitch*180/math.pi
	local Bank = SD().Bank*180/math.pi
		
	local Velocity = LoGetVectorVelocity()  --{x,y,z}
	local VX = Velocity.x
	local VY = Velocity.y
	local VZ = Velocity.z
	local Speed_ms = math.sqrt(VX*VX+VZ*VZ)
	local Speed_kt = Speed_ms*1.9438444924574 -- Speed from m/s to knot 
	
	-- Course calculations 
	if VX==0 and VZ==0 then
		radTC = 0
	else
		radTC = math.atan2(VZ,VX)
		if radTC < 0 then
			radTC = 2*math.pi + radTC
		end
	end
	TC = radTC*180/math.pi
	
	-- NMEA specifics
	if NMEA_UDP == 1 or NMEA_Serial == 1 then
		-- Coordinates from decimal degrees to degrees and decimal minutes
		local dLat = math.floor(math.abs(Lat))
		local dLong = math.floor(math.abs(Long))
		local mLat = (math.abs(Lat)-dLat)*60
		local mLong = (math.abs(Long)-dLong)*60
		
		-- Cardinal directions
		local sigLat = Lat/math.abs(Lat)
		local sigLong = Long/math.abs(Long)
		
		if sigLat<0 then NS='S'
		else NS='N'
		end
		
		if sigLong<0 then EW='W'
		else EW='E'
		end
		
		-- Various unimportant GPS values for the GGA sentence not derivable from game
		local Q = 1
		local nSat = 5
		local HDOP = 1.3
		local GeoSep = 00.0
		
		-- GGA sentence
		local GGA = string.format("GPGGA,%02d%02d%05.2f,%02d%010.7f,%s,%03d%0010.7f,%s,%1d,%02d,%03.1f,%06.1f,M,%04.0f,M,,", hh,mm,s,dLat,mLat,NS,dLong,mLong,EW,Q,nSat,HDOP,Alt,GeoSep)
		local csGGA = 0
		for c in string.gmatch(GGA,".") do
			csGGA = bxor(csGGA, string.byte(c))
		end
		
		-- RMC sentence
		local RMC = string.format("GPRMC,%02d%02d%05.2f,A,%02d%010.7f,%s,%03d%0010.7f,%s,%05.1f,%05.1f,%02d%02d%02d,0,E,A", hh,mm,s,dLat,mLat,NS,dLong,mLong,EW,Speed_kt,TC,day,month,string.sub(year,3,4))
		local csRMC = 0
		for c in string.gmatch(RMC,".") do
			csRMC = bxor(csRMC, string.byte(c))
		end
		
		json = string.format("$%s*%x\r\n$%s*%x\r\n",GGA,csGGA,RMC,csRMC)
	end
	
----------------------------------------------------------------------------------------------------------------------------------------------
-- COMMUNICATIONS
----------------------------------------------------------------------------------------------------------------------------------------------
	
	-- AHRS ----------------------------------------------------------------------------------------------------------------------------------
	if AHRS_UDP == 1 then
		if AHRSt == 1 then
			AHRSt = 0
			my_send_AHRS_GPS = socket.protect(function()
				local json = string.format("XGPSDCSW,%.5f,%.5f,%.1f,%.2f,%.1f", Long,Lat,Alt,TC,Speed_ms)
				socket.try(AHRS:sendto(json, host_AHRS, port_AHRS))
			end) -- my_send
			my_send_AHRS_GPS()
		end
		AHRSt = AHRSt + ANEt
		
		my_send_AHRS_ATT = socket.protect(function()
			local json = string.format("XATTDCSW,%.1f,%.1f,%.1f", Heading,Pitch,Bank)
			socket.try(AHRS:sendto(json, host_AHRS, port_AHRS))
		end) -- my_send
		my_send_AHRS_ATT()
	end

	
	-- UDP -----------------------------------------------------------------------------------------------------------------------------------
	if NMEA_UDP == 1 then
		my_send_udp = socket.protect(function()
			socket.try(udp:sendto(json, host_udp, port_udp))
		end) -- my_send
		my_send_udp()
	end
	
	
	-- Serial Port ---------------------------------------------------------------------------------------------------------------------------
	if NMEA_Serial == 1 then
		com:write(json) -- fills the serial buffer
		com:flush() -- send the serial buffer
	end
	
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
	
	--[[	To activate section, add a "-" among the other two on this row. To deactivate remove one of the tree.
	file:write(json)
	--file:write(string.format("XGPSDCSW,%.2f,%.2f,%.1f,%.2f,%.1f\r\n", Long,Lat,Alt,TC,Speed_ms))
	--file:write(string.format("XATTDCSW,%.1f,%.1f,%.1f\r\n", Heading,Pitch,Bank))
	--]]
	
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
		
	-- Repeat every ANEt s
	return tNext + ANEt
end,

Stop=function(self)

----------------------------------------------------------------------------------------------------------------------------------------------
-- COMMUNICATIONS
----------------------------------------------------------------------------------------------------------------------------------------------

	-- AHRS ----------------------------------------------------------------------------------------------------------------------------------
	if AHRS_UDP == 1 then
		my_close_AHRS = socket.protect(function()
			socket.try(AHRS:close())
		end)
		my_close_AHRS()
	end
	
	
	-- UDP -----------------------------------------------------------------------------------------------------------------------------------
	if NMEA_UDP == 1 then
		my_close_udp = socket.protect(function()
			socket.try(udp:close())
		end)
		my_close_udp()
	end
	
	
	-- Serial Port ---------------------------------------------------------------------------------------------------------------------------
	if NMEA_Serial == 1 then
		com:close(sPort)
	end
	
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
	
	--[[	To activate section, add a "-" among the other two on this row. To deactivate remove one of the tree.
	file:close()
	--]]
	
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
	
end
}

--[[ Perform a bitwise Exclusive OR (XOR) ]]--
function bxor(a,b)
    local res, mult = 0, 1
    while a > 0 and b > 0 do
        local a2, b2 = a % 16, b % 16
        res = res + xortbl[a2+1][b2+1] * mult
        a = (a-a2) / 16
        b = (b-b2) / 16
        mult = mult * 16
    end
    res = res + (a+b) * mult
    return res
end

-- =============
-- Overload
-- =============
do
	local PrevLuaExportStart=LuaExportStart
	LuaExportStart=function()
		DCS_NMEA:Start()
		if PrevLuaExportStart then
			PrevLuaExportStart()
		end
	end
end

do
	local PrevLuaExportActivityNextEvent=LuaExportActivityNextEvent
	LuaExportActivityNextEvent=function(t)
		local tNext = t
		tNext = DCS_NMEA:ActivityNextEvent(t)
		if PrevLuaExportActivityNextEvent then
			PrevLuaExportActivityNextEvent()
		end
		return tNext
	end
end

do
	local PrevLuaExportStop=LuaExportStop
	LuaExportStop=function()
		DCS_NMEA:Stop()
		if PrevLuaExportStop then
			PrevLuaExportStop()
		end
	end
end
