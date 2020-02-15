--ref == http://forums.eagle.ru/showpost.php?p=2626874&postcount=182

BIOS.protocol.beginModule("M-2000C", 0x2400)
BIOS.protocol.setExportModuleAircrafts({"M-2000C"})

local document = BIOS.util.document
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineIndicatorLight = BIOS.util.defineIndicatorLight

defineToggleSwitch("BATTERY_POWER", 8, 3520, 520, "Electrical Power Panel", "Battery Power")

-- caution panel light argument numbers start at 525
defineIndicatorLight("CLP_BAT", 525, "Caution Lights Panel", "BAT")
defineIndicatorLight("CLP_TRW", 525, "Caution Lights Panel", "TRW")
-- increasing argument numbers from left to right, top to bottom
defineIndicatorLight("CLP_DSY", 551, "Caution Lights Panel", "DSY")

BIOS.protocol.endModule()
