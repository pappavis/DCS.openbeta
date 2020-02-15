-- TARS Export control for DCS Black Shark
--
-- Parameters for the TARS export core component are listed below.
-- The TARS Control panel will manage these values for you if you use it.

-- Guard mode selection
gTARSGuardSelect = 1

-- Change this if you need to have TARS listen on a different port.
gTARSDCSHost = "0.0.0.0"
gTARSDCSPort = 48201

-- Change this to the computer you run TS3 on, if it runs on a different machine.
gTARSTS3Host = "127.0.0.1"
gTARSTS3Port = 48101

-- TARS logfile location
gTARSLogfile = "./Temp/TARS.log"

-- DO NOT EDIT BELOW THIS LINE
package.path  = package.path..";.\\LuaSocket\\?.lua"
package.cpath = package.cpath..";.\\LuaSocket\\?.dll"
socket = require("socket")
dofile(".\\Scripts\\Aircrafts\\Ka-50\\Cockpit\\devices.lua");
dofile(".\\TARS\\tarsexporter.luac")
dofile(".\\TARS\\tarscore_ka50.luac")

-- Prev Export functions.
PrevExport = {}
PrevExport.LuaExportStart = LuaExportStart
PrevExport.LuaExportStop = LuaExportStop
PrevExport.LuaExportAfterNextFrame = LuaExportAfterNextFrame

-- Coroutine setup
gTARSCoroutineStop = false
if not CoroutineIndex then
	CoroutineIndex = 0
end
if not Coroutines then
	Coroutines = {}
end

-- From Export.lua
function CoroutineResume(index, tCurrent)
	-- Resume coroutine and give it current model time value
	coroutine.resume(Coroutines[index], tCurrent)
	return coroutine.status(Coroutines[index]) ~= "dead"
	-- If status == "dead" then Lock On activity for this coroutine dies too 
end

-- Lua Export Functions
LuaExportStart = function()

	-- Initialize TARS
    TARSInit()
   
    -- Chain previously-included export as necessary
    if PrevExport.LuaExportStart then
        PrevExport.LuaExportStart()
    end
end

LuaExportStop = function()

	-- Shut down TARS
    TARSShutdown()
	gTARSCoroutineStop = true;
    
    -- Chain previously-included export as necessary
    if PrevExport.LuaExportStop then
        PrevExport.LuaExportStop()
    end
end

debugOnce = false;
TARSCoroutine = function(t)
	local tNext = t

	while not gTARSCoroutineStop do
	
		TARSCycle()
		tNext = coroutine.yield()
	end
end

--function LuaExportBeforeNextFrame()
--end

gTARSCoroutineInitialized = false;
function LuaExportAfterNextFrame()

    local curTime

    -- Initialize once after first frame to avoid sync issues
    if not gTARSCoroutineInitialized then
        
        scheduleTime = LoGetModelTime() + 1
        
        CoroutineIndex = CoroutineIndex + 1
        Coroutines[CoroutineIndex] = coroutine.create(TARSCoroutine)
        LoCreateCoroutineActivity(CoroutineIndex, scheduleTime, gTARSUpdateInterval) -- Idx, Start, Interval
        gTARSCoroutineInitialized = true
        
        TARSLog("TARS update cycle scheduled at modeltime "..scheduleTime)
    end
    
    -- Chain previously-included export as necessary
    if PrevExport.LuaExportAfterNextFrame then
        PrevExport.LuaExportAfterNextFrame()
    end
end

-- LuaExportActivityNextEvent = function(t)
	--local tNext = t
	--return tNext
--end
