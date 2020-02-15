dofile(lfs.writedir()..[[Scripts\DCS-BIOS\BIOS.lua]])
dofile(lfs.writedir().."Scripts/Export/WitchcraftExport.lua")

dofile(lfs.writedir().."Scripts/Export/telemetry.lua")
dofile(lfs.writedir().."Scripts/Export/exportSkval.lua")
dofile(lfs.writedir().."Scripts/Export/exportTWS.lua")
dofile(lfs.writedir().."Scripts/TARSExport.lua")
dofile(lfs.writedir().."Scripts/Export/telemetryUH1H.lua")
-- dofile(lfs.writedir()..'../AriesWings/AriesRadio.luac')
dofile(".\\A10VCServer\\Main.lua") --A10VCHooklocal Tacviewlfs=require('lfs');
local Tacviewlfs=require('lfs');dofile(Tacviewlfs.writedir()..'Scripts/TacviewGameExport.lua')
dofile(lfs.writedir().."Scripts/Export/exportTest1.lua")
local dcsSr=require('lfs')
dofile(dcsSr.writedir()..[[Scripts\DCS-SimpleRadioStandalone.lua]])

local SimShakerlfs=require('lfs'); dofile(SimShakerlfs.writedir()..'Scripts/SimShaker.lua')

dofile(lfs.writedir()..[[Scripts\SimShaker-export-core\ExportCore.lua]])
dofile(userprofile .. "/Saved Games/DCS.openbeta/Scripts/DCS_NMEA.lua")
