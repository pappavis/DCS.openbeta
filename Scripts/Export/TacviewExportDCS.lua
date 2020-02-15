-- Tacview ACMI - Universal Flight Analysis Tool 1.4.0
-- Export script for DCS: Black Shark, DCS: A-10C Warthog, Lock-On: Flaming Cliffs 1.2, DCS World
-- Copyright (C) 2006-2015 - Stra Software
-- http://tacview.strasoftware.com/

-- TO ENABLE THIS SCRIPT:
--		Set [EnableExportScript = true] in [./Config/export/config.lua]
--		Add [dofile("./Config/Export/TacviewExportDCS.lua")] at the end of [./Config/Export/Export.lua]

-- ACMI text files are exported to %TACVIEW_EXPORT_PATH% folder
-- if this environment variable is not valid, files are exported to [./Temp/] folder

-- Documentation about DCS export:
-- http://en.wiki.eagle.ru/wiki/Export_1_0_1
-- http://forums.eagle.ru/showthread.php?t=45071

if Tacview==nil then	-- Protection against multiple references (typically wrong script installation)

-- Headers
dofile("./Config/World/World.lua")				-- Required to get mission date
dofile("./Scripts/Database/wsTypes.lua")		-- Required to get object types definitions

-- Tacview Exporter
Tacview=
{
	-- Log parameters
	DefaultObjectsUpdatePeriod=1/10,	-- Delay between two log updates (in seconds) for default objects, use [0] to force update at each frame
	BallisticObjectsUpdatePeriod=1/2,	-- Delay between two log updates (in seconds) for ballistic objects, use [0] to force update at each frame
	LatitudeOffset=41,					-- To improve log resolution
	LongitudeOffset=36,					-- To improve log resolution

	-- Convert Lock-On Object_Type To Tacview Object_Type
	-- \DCSWorld\Scripts\Database\wsTypes.lua
	-- \DCSWorld\Scripts\Database\wsTypesTree.lua
	ObjectTypeLookupTable=
	{
		[-1]								=	-1,		-- Invalid object type [0.0.0.0] first repported during network flights on DCS 1.1.1
		[wsType_Air]= -- 1
		{
			[-1]							=	0x10,	-- Aeroplanes (including fixed-wing drones)
			[wsType_Airplane]=
			{
				[-1]						=	0x10,	-- Aeroplanes (including fixed-wing drones)
				[wsType_Fighter]			=	0x10,	-- Aeroplanes (including fixed-wing drones)
				[wsType_F_Bomber]			=	0x10,	-- Aeroplanes (including fixed-wing drones)
				[wsType_Intercepter]		=	0x10,	-- Aeroplanes (including fixed-wing drones)
				[wsType_Intruder]			=	0x10,	-- Aeroplanes (including fixed-wing drones)
				[wsType_Cruiser]			=	0x10,	-- Aeroplanes (including fixed-wing drones)
				[wsType_Battleplane]		=	0x10,	-- Aeroplanes (including fixed-wing drones)
			},
			[wsType_Helicopter]				=	0x18,	-- Helicopters (including rotary-wing drones)
			[wsType_Free_Fall]=	-- 3
			{
				[-1]						=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
				[wsType_Snars]=
				{
					[-1]					=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
					[wsType_Chaff]    		=	0x50,	-- Chaff (obviously a chaff cluster)
					[wsType_Flare]    		=	0x54,	-- Flare
				},
				[wsType_Parts]=
				{
					[-1]					=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
					[PILOT_PARASHUT]		=	0x2e,	-- Parachutist
					[PILOT_PARASHUT_US]		=	0x2e,	-- Parachutist
					[203]					=	0x60,	-- Minor object (e.g. cartridge)
					[204]					=	0x60,	-- Minor object (e.g. cartridge)
				},
				[wsType_FuelTank]			=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
				[wsType_Jam_Cont]			=	0x60,	-- Minor object (e.g. cartridge)
			},
		},
		[wsType_Ground]=
		{
			[-1]							=	0x28,	-- Light/Unarmed vehicles
			[wsType_Moving]=
			{
				[-1]						=	0x28,	-- Light/Unarmed vehicles
				[wsType_NoWeapon]			=	0x28,	-- Light/Unarmed vehicles
				[wsType_Gun]				=	0x28,	-- Light/Unarmed vehicles
				[wsType_Miss]				=	0x24,	-- Armored fighting vehicle
				[wsType_ChildMiss]			=	0x24,	-- Armored fighting vehicle
				[wsType_MissGun]			=	0x24,	-- Armored fighting vehicle
				[wsType_Civil]				=	0x28,	-- Light/Unarmed vehicles
			},
			[wsType_Tank]=
			{
				[-1]						=	0x24,	-- Armored fighting vehicle
				[wsType_Gun]=
				{
					[-1]					=	0x24,	-- Armored fighting vehicle
					[90]					=	0x2c,	-- (wsType_GenericInfantry) Infantry
					[91]					=	0x2c,	-- (wsTypeAutogun) Infantry
					[93] 				  	=	0x2c,	-- (wsTypeSoldier_AK) Infantry
					[96]  			  		=	0x89,	-- (wsTypeSandbox) Building
					[97]  			  		=	0x89,	-- (wsTypeBunker) Building
				},
				[wsType_MissGun]=
				{
					[-1]		  			=	0x24,	-- Armored fighting vehicle
					[90]    				=	0x2c,	-- (wsTypeRPG) Infantry
					[94]			 	 	=	0x2c,	-- (wsTypeSoldier_RPG) Infantry
				},
				[wsType_NoWeapon]=
				{
					[-1]					=	0x28,	-- Light/Unarmed vehicles
					[47]					=	0x89,	-- Buildings or Airshow Crowd
					[72] 					=	0x28,	-- (wsTypePredator_GCS) Light/Unarmed vehicles
					[73]					=	0x28,	-- (wsTypePredator_TrojanSpirit) Light/Unarmed vehicles
				},
			},
			[wsType_SAM]=
			{
				[-1]						=	0x20,	-- Anti-aircraft warfare (usually: SAM and AAA)
				[wsType_Miss]=
				{
					[-1]					=	0x20,	-- Anti-aircraft warfare (usually: SAM and AAA)
					[IglaGRG_2]				=	0x2c,	-- Infantry
					[IglaRUS_2]				=	0x2c,	-- Infantry
					[StingerIZR_2]			=	0x2c,	-- Infantry
					[StingerUSA_2]			=	0x2c,	-- Infantry
				}
			},
			[wsType_Standing]=
			{
				[-1]						=	0x89,	-- Building
				[wsType_NoWeapon]			=	0x89,	-- Building
				[wsType_Gun]				=	0x89,	-- Building
				[wsType_Miss]				=	0x20,	-- Anti-aircraft warfare (usually: SAM and AAA)
				[wsType_ChildMiss]			=	0x20,	-- Anti-aircraft warfare (usually: SAM and AAA)
				[wsType_MissGun]			=	0x20,	-- Anti-aircraft warfare (usually: SAM and AAA)
				[wsType_Civil]				=	0x89,	-- Building
			},
		},
		[wsType_Navy]=
		{
			[-1]							=	0x30,	-- Armed Watercraft (including submarines)
			[wsType_Ship]=
			{
				[-1]						=	0x30,	-- Armed Watercraft (including submarines)
				[wsType_AirCarrier]			=	0x34,	-- Aircraft carrier (including Helicopter carrier)
				[wsType_HCarrier]			=	0x34,	-- Aircraft carrier (including Helicopter carrier)
				[wsType_ArmedShip]			=	0x30,	-- Armed Watercraft (including submarines)
				[wsType_CivilShip]			=	0x38,	-- Light/Unarmed Watercraft
			},
		},
		[wsType_Weapon]=
		{
			[-1]							=	0x40,	-- Missile (guided missiles)
			[wsType_GContainer]=
			{
				[-1]						=	0x46,	-- External equipment / Shrapnel (e.g. Drop tank, cluster-bomb fragments, exploded plane parts, ...)
			},
			[wsType_Missile]=
			{
				[-1]						=	0x40,	-- Missile (guided missiles)
				[wsType_AA_Missile]			=	0x40,	-- Missile (guided missiles)
				[wsType_AS_Missile]			=	0x40,	-- Missile (guided missiles)
				[wsType_SA_Missile]			=	0x40,	-- Missile (guided missiles)
				[wsType_SS_Missile]			=	0x40,	-- Missile (guided missiles)
				[wsType_AA_TRAIN_Missile]	=	0x40,	-- Missile (guided missiles)
				[wsType_AS_TRAIN_Missile]	=	0x40,	-- Missile (guided missiles)
			},
			[wsType_Bomb]=
			{
				[-1]						=	0x4c,	-- Bomb (guided and unguided)
				[wsType_Bomb_A]				=	0x4c,	-- Bomb (guided and unguided)
				[wsType_Bomb_Guided]		=	0x4c,	-- Bomb (guided and unguided)
				[wsType_Bomb_BetAB]			=	0x4c,	-- Bomb (guided and unguided)
				[wsType_Bomb_Cluster]		=	0x4c,	-- Bomb (guided and unguided)
				[wsType_Bomb_Antisubmarine]	=	0x4c,	-- Bomb (guided and unguided)
				[wsType_Bomb_ODAB]			=	0x4c,	-- Bomb (guided and unguided)
				[wsType_Bomb_Fire]			=	0x4c,	-- Bomb (guided and unguided)
				[wsType_Bomb_Nuclear]		=	0x4c,	-- Bomb (guided and unguided)
				[wsType_Bomb_Lighter]		=	0x4c,	-- Bomb (guided and unguided)
			},
			[wsType_Shell]=
			{
				[-1]						=	0x48,	-- Shell
				[wsType_Shell_A]			=	0x48,	-- Shell
			},
			[wsType_NURS]=
			{
				[-1]						=	0x44,	-- Rocket (unguided missiles)
				[wsType_Container]			=	0x44,	-- Rocket (unguided missiles)
				[wsType_Rocket]				=	0x44,	-- Rocket (unguided missiles)
			},
		},
		[wsType_Static]=
		{
			[-1]							=	0x89,	-- Building
			[wsType_AirdromePart]			=	0x89,	-- Building
			[wsType_WingPart]				=	0x89,	-- Building
			[wsType_Free_Fall]=
			{
				[-1]						=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
				[wsType_Parts]				=	-1,		-- Particles (e.g. landing gear marks or dust on runways)
			},
			[wsType_Airdrome]=
			{
				[-1]						=	0x81,	-- Aerodrome
				[wsType_RW1]				=	0x81,	-- Aerodrome
				[wsType_RW2]				=	0x81,	-- Aerodrome
				[wsType_Heliport]			=	0x81,	-- Aerodrome
			},
			[wsType_Explosion]=
			{
				[-1]						=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
				[wsType_GroundExp]			=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
			},
			[wsType_GContainer]=
			{
				[-1]						=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
				[wsType_Control_Cont]		=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
				[wsType_Jam_Cont]			=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
				[wsType_Cannon_Cont]		=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
				[wsType_Support]			=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
				[wsType_Snare_Cont]			=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
				[wsType_Smoke_Cont]			=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
			},
			[wsType_Standing]=
			{
				[-1]						=	0x89,	-- Building
				[wsType_NoWeapon]=
				{
					[-1]					=	0x89,	-- Building
					[201]					=	-1,		-- Unknown object attached to the Mi-8 (must be discarded)
				},
			},
		},
		[wsType_Destroyed]					=	0x46,	-- Shrapnel (e.g. Cluster-bomb fragments or exploded plane parts)
	},

	-- Object Names Table (used to fix missing names DCS bug)
	-- See: \dcs a-10c warthog\Scripts\Database\wsTypes.lua
	-- Some types are used for multiple units like [2,17,26,93], in that case I'm using a generic name [Infantry]
	ObjectNamesLookupTable=
	{
		[wsType_Ground]=	-- 2
		{
			[wsType_SAM]=		-- 16
			{
				[wsType_Gun]=		-- 26
				{
					[ZU_23_insurgent]		=	"ZU-23-2",					-- 70
					[ZU_23_insurgent_okop]	=	"ZU-23-2",					-- 71
					[ZU_23_insurgent_ural]	=	"Ural-375 ZU-23",			-- 72
				},
				[wsType_Miss]=		-- 27
				{
					[IglaRUS_1]				=	"SAM SA-18 Igla-S manpad",	-- 52
					[IglaRUS_2]				=	"SAM SA-18 Igla-S comm",	-- 53
					[IglaGRG_1]				=	"SAM SA-18 Igla MANPADS",	-- 54
					[IglaGRG_2]				=	"SAM SA-18 Igla comm",		-- 55
					[StingerUSA_1]			=	"SAM Stinger MANPADS",		-- 56
					[StingerUSA_2]			=	"SAM Stinger comm",			-- 57
					[74]					=	"SAM SA-3 S-125 LN 5P73",	-- 74 (SA3_LN is not defined in Black Shark)
				},
				[wsType_Radar]=		-- 101
				{
					[73]					=	"SAM SA-3 S-125 TR SNR",	-- 73 (SA3_TR is not defined in Black Shark)
					[75]					=	"SAM SA-3 S-125 SR P-19",	-- 75 (SA3_SR is not defined in Black Shark)
				},
			},
			[wsType_Tank]=		-- 17
			{
				[wsType_Gun]=		-- 26
				{
					[93]					=	"Infantry",					-- 93 (Infantry M249 / Infantry M4)
					[95]					=	"ARV MTLB-U BOMAN",			-- 95 (wsTypeBOMAN)
					[96]					=	"Bunker",					-- 96 (wsTypeSandbox)
					[97]					=	"Bunker",					-- 97 (wsTypeBunker)
				},
				[wsType_MissGun]=	-- 104
				{
					[94]					=	"Infantry RPG-7",			-- 94 (wsTypeSoldier_RPG)
				},
			},
		},
		[wsType_Weapon]=	-- 4
		{
			[wsType_Bomb]=		-- 5
			{
				[wsType_Bomb_Cluster]		=	"",							-- no name available for cluster bombs
			},
			[wsType_NURS]=		-- 7
			{
				[wsType_Rocket]=	-- 33
				{
					[145]					=	"HYDRA_70_MK5",
					[147]					=	"HYDRA_70_M151",
					[148]					=	"HYDRA_70_M156",
					[150]					=	"HYDRA_70_M274",
					[151]					=	"HYDRA_70_M257",
					[152]					=	"HYDRA_70_M278",
				},
			},
		},
		[wsType_Static]=	-- 5
		{
			[wsType_Airdrome]=	-- 13
			{
				[wsType_Heliport]=	-- 40
				{
					[Heliport_standart]		=	"Heliport",					-- 100
				},
			},
		},
	},

	-- Convert Lock-On Coalition_ID To Tacview Coalition_ID
	CoalitionLookupTable=
	{
		["Allies"]			=	0,
		["Enemies"]			=	1,
	},

	-- Convert Lock-On Country_Name To ISO Country_Code
	-- \DCS World\Scripts\World\Countries.lua
	-- http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
	CountryCodeLookupTable=
	{
		[ 0]				=	"ru",
		[ 1]				=	"ua",
		[ 2]				=	"us",
		[ 3]				=	"tr",
		[ 4]				=	"uk",
		[ 5]				=	"fr",
		[ 6]				=	"de",
		[ 7]				=	"xu",		-- USAF Aggressors
		[ 8]				=	"ca",
		[ 9]				=	"es",
		[10]				=	"nl",
		[11]				=	"be",
		[12]				=	"no",
		[13]				=	"dk",
--		[14]				=	"",
		[15]				=	"il",
		[16]				=	"ge",
		[17]				=	"xi",		-- [Insurgents] (free for use ISO code)
		[18]				=	"xa",		-- Abkhazia
		[19]				=	"xo",		-- South Osetia
		[20]				=	"it",		-- Italy
		[21]				=	"au",
		[22]				=	"ch",
		[23]				=	"at",
		[24]				=	"by",
		[25]				=	"bg",
		[26]				=	"cz",
		[27]				=	"cn",
		[28]				=	"hr",
		[29]				=	"eg",
		[30]				=	"fi",
		[31]				=	"gr",
		[32]				=	"hu",
		[33]				=	"in",
		[34]				=	"ir",
		[35]				=	"iq",
		[36]				=	"jp",
		[37]				=	"kz",
		[38]				=	"kp",
		[39]				=	"pk",
		[40]				=	"pl",
		[41]				=	"ro",
		[42]				=	"sa",
		[43]				=	"rs",
		[44]				=	"sk",
		[45]				=	"kr",
		[46]				=	"se",
		[47]				=	"sy",
	},

	-- Fast File Class (lazy write cache)
	FastFile=
	{
		-- Constants
		MaxCacheSize=64*1024,			-- Maximum data in cache before automatic flush

		-- Create file
		Create=function(self,FileName)

			-- Check Parameters
			if self.File then
				self:Close()
			end

			-- Create a new file
			self.File=io.open(FileName,"wb");

			if not self.File then
				return false;			-- Operation failed
			end

			-- Complete
			return true;
		end,

		-- Inject data into file (lazy write)
		Write=function(self,Data)

			-- Check Parameters
			if not self.File then
				return false;			-- File not open
			end

			-- Update Cache
			if self.CacheSize+string.len(Data)>=self.MaxCacheSize then

				-- Add Part Of Data To Cache
				if self.CacheSize<self.MaxCacheSize then

					local DataToCutSize=self.MaxCacheSize-self.CacheSize;

					self.Cache[#self.Cache+1]=string.sub(Data,1,DataToCutSize);
					self.CacheSize=self.CacheSize+DataToCutSize;

					Data=string.sub(Data,DataToCutSize+1);

				end

				-- Flush Cache To Disk
				self:Flush();

			end

			-- Add Data Left To Cache
			self.Cache[#self.Cache+1]=Data;
			self.CacheSize=self.CacheSize+string.len(Data);

			-- Complete
			return true;
		end,

		-- Close file (flush cache)
		Close=function(self)

			-- Check Parameters
			if not self.File then
				return false;			-- File not open
			end

			-- Flush Cache
			self:Flush();

			-- Close file
			io.close(self.File);
			self.File=nil;

			-- Complete
			return true;
		end,

		-- Flush Cache
		Flush=function(self)

			-- Check Parameters
			if not self.File then
				return false;			-- File not open
			end

			if self.CacheSize==0 then
				return true;			-- Nothing to flush (not an error)
			end

			-- Write Data To Disk
			self.File:write(table.concat(self.Cache));

			-- Empty Cache
			self.Cache={};
			self.CacheSize=0;

			-- Complete
			return true;
		end,

		-- Data Lazy Cache
		Cache={};						-- List if strings
		CacheSize=0;					-- Total size of strings in cache (char count)
	},

	-- Reduce ID size (to compact text log)
	-- OptimizedID=ID^0x2000000  (free in C, hard to do with LUA...)
	GetOptimizedID=function(ID)

		if math.mod(math.floor(ID/0x2000000),2)==1 then
			return ID-0x2000000;	-- Clear bit
		end

		return ID+0x2000000;		-- Set bit
	end,

	-- Trim Given String
    Trim=function(StringToTrim)
		return string.gsub(StringToTrim,"^%s*(.-)%s*$","%1");
    end,

	-- Add escape characters
	DecorateName=function(Name)

		if Name then
			Name=string.gsub(Name,"\\","\\\\");
			Name=string.gsub(Name,",","\\,");
			Name=string.gsub(Name,"=","\\=");
			return Name;
		end

		return "";
	end,

	-- Trim and decorate name for log output
	CleanupName=function(Name)
		return Tacview.DecorateName(Tacview.Trim(Name));
	end,

	-- Return true if Minor object without name
	IsSimpleObject=function(ObjectType)
		return ObjectType==0x48 or ObjectType==0x49 or ObjectType==0x4a or ObjectType==0x50 or ObjectType==0x54 or ObjectType==0x58 or ObjectType==0x60;
	end,

	-- Fix Invalid Objects Names
	FixInvalidObjectName=function(LockOnObjectType,GroupName)

		-- Attempt to find object name
		local ObjectName=Tacview.ObjectNamesLookupTable[LockOnObjectType.level1];

		if ObjectName then

			ObjectName=ObjectName[LockOnObjectType.level2];

			if ObjectName then

				ObjectName=ObjectName[LockOnObjectType.level3];

				if ObjectName then

					if type(ObjectName)=="string" then
						return ObjectName;
					end

					ObjectName=ObjectName[LockOnObjectType.level4];

					if ObjectName then
						return ObjectName;
					end
				end
			end
		end

		-- Failsafe
		return string.format("INVALID_NAME[%s.%s.%s.%s] (%s)",LockOnObjectType.level1,LockOnObjectType.level2,LockOnObjectType.level3,LockOnObjectType.level4,GroupName);
	end,

	-- Convert Lock-On unit type to Tacview unit type
	ConvertObjectType=function(LockOnObjectType)

		local TacviewObjectType;

		TacviewObjectType=Tacview.ObjectTypeLookupTable[LockOnObjectType.level1];

		if not TacviewObjectType then
			return Tacview.ObjectTypeLookupTable[-1];
		end

		if type(TacviewObjectType)~="table" then
			return TacviewObjectType;
		end

 		TacviewObjectType=TacviewObjectType[LockOnObjectType.level2];

		if not TacviewObjectType then
			return Tacview.ObjectTypeLookupTable[LockOnObjectType.level1][-1];
		end

		if type(TacviewObjectType)~="table" then
			return TacviewObjectType;
		end

 		TacviewObjectType=TacviewObjectType[LockOnObjectType.level3];

		if not TacviewObjectType then
			return Tacview.ObjectTypeLookupTable[LockOnObjectType.level1][LockOnObjectType.level2][-1];
		end

		if type(TacviewObjectType)~="table" then
			return TacviewObjectType;
		end

 		TacviewObjectType=TacviewObjectType[LockOnObjectType.level4];

		if not TacviewObjectType then
			return Tacview.ObjectTypeLookupTable[LockOnObjectType.level1][LockOnObjectType.level2][LockOnObjectType.level3][-1];
		end

 		return TacviewObjectType;
	end,

	-- Begin to log ACMI data
	BeginLog=function(self)

		function Concatenate(lhs,rhs)

			if lhs then
				return lhs..rhs;
			end

			return nil;
		end

		-- Reset objects lists
		self.LastObjectsStatus={};		-- Last frame object status
		self.LoggedObjectsStatus={};	-- Last logged object status (usually older than LastObjectsStatus)

		-- Reset tools
		self.NextDefaultObjectsUpdateTime=0;
		self.NextBallisticObjectsUpdateTime=0;

		-- Create a new log file for each mission
		local FileName="Tacview-"..os.date("%Y%m%d-%H%M%S").."-DCS.txt.acmi";
		local AcmiFileIsValid=false;
		local TargetFolders=
		{
			-- My Documents folder
			os.getenv("TACVIEW_EXPORT_PATH"),
			Concatenate(os.getenv("USERPROFILE"),"\\Documents\\Tacview"),
			Concatenate(os.getenv("USERPROFILE"),"\\Documents"),

			-- \Temp\DCS\ folder
			Concatenate(os.getenv("TEMP"),"\\DCS"),
			Concatenate(os.getenv("TMP"),"\\DCS"),

			-- \Temp\ folder
			os.getenv("TEMP"),
			os.getenv("TMP"),

			-- DCS application folder
			"./Temp",
			".",
		}

		self.AcmiFile=self.FastFile;

		for _,TargetFolder in pairs(TargetFolders) do

			if TargetFolder then

				local LastCharacter=string.sub(TargetFolder,-1);

				if LastCharacter~="/" and LastCharacter~="\\" then
					TargetFolder=TargetFolder.."\\";
				end
			end

			if self.AcmiFile:Create(TargetFolder..FileName)==true then
				AcmiFileIsValid=true;
				break
			end
		end

		if AcmiFileIsValid==false then
			self.AcmiFile=nil;
			return;
		end

		-- UTF-8 BOM header
		self.AcmiFile:Write(string.char(0xEF,0xBB,0xBF));

		-- Core Header
		self.AcmiFile:Write("FileType=text/acmi/tacview\n");
		self.AcmiFile:Write("FileVersion=1.7\n");

		local VersionInfo;

		if LoGetVersionInfo then
			VersionInfo=LoGetVersionInfo();
		end

		if VersionInfo then

			-- Version Info Available

			local ProductName=VersionInfo.ProductName;
			local ProductVersion;

			if VersionInfo.FileVersion then
				ProductVersion=string.format("%d.%d.%d.%d",VersionInfo.FileVersion[1],VersionInfo.FileVersion[2],VersionInfo.FileVersion[3],VersionInfo.FileVersion[4]);
			else
				ProductVersion=string.format("%d.%d",VersionInfo.ProductVersion[1],VersionInfo.ProductVersion[2]);
			end

			self.AcmiFile:Write("Source="..ProductName.." "..ProductVersion.."\n");

		else

			-- Manually Detect Product Version

			if self.FileExist("./Config/Input/Aircrafts/su-27/keyboard/default.lua")==true then
				self.AcmiFile:Write("Source=Lock-On: Flaming Cliffs 1.2\n");
			else
				if self.FileExist("./Config/Input/Aircrafts/A-10C/keyboard/default.lua")==true then
					self.AcmiFile:Write("Source=DCS: A-10C Warthog 1.1\n");
				else
					self.AcmiFile:Write("Source=DCS: Black Shark 1.0\n");
				end
			end
		end

		self.AcmiFile:Write("Recorder=Tacview 1.4.0\n");
		self.AcmiFile:Write("RecordingTime="..os.date("!%Y-%m-%dT%H:%M:%SZ",now).."\n");

		local PlayerName=LoGetPilotName();

		if PlayerName then
			self.AcmiFile:Write("Author="..self.CleanupName(PlayerName).."\n");
		end

		-- Find Global Position On Earth to Optimize file size
		local CameraPosition=LoGetCameraPosition();
		local CameraTranslation=CameraPosition.p;
		local CameraCoordinates=LoLoCoordinatesToGeoCoordinates(CameraTranslation.x,CameraTranslation.z);

		self.LatitudeOffset=CameraCoordinates.latitude-5;		-- Optimize file size
		self.LongitudeOffset=CameraCoordinates.longitude-5;

		-- Declarations
		if MissionDate then

			-- Time Zone Calculation
			local LocalRefTime;

			if math.abs(CameraCoordinates.longitude+115)<10 then
				-- Crimea Time Zone: Winter(UTC-8) Summer(DST=UTC-7)
				-- -7 hours time shift calculation (assume summer Nevada time shift)
				LocalRefTime=os.time{year=2011,month=6,day=1,hour=12-7};
			else
				-- Georgia Time Zone: Winter(UTC+3) Summer(DST=UTC+4)
				-- +4 hours time shift calculation (assume summer Georgia time shift)
				-- Includes the error of +1 hour in DCS sun position calculation
				LocalRefTime=os.time{year=2011,month=6,day=1,hour=12+4+1};
			end

			local UTCRefTime=os.time{year=2011,month=6,day=1,hour=12};
			local TimeShift=LocalRefTime-UTCRefTime;

			-- Need to manually apply DST bias because nothing is simple with LUA
			local CurrentDate=os.date("*t",now);
			local IsDst;

			if CurrentDate and CurrentDate.isdst==true then
				IsDst=true;
			else
				IsDst=false;
			end

			-- Convert Local Time to UTC Time
			local LocalMissionTime=os.time{year=MissionDate.Year,month=MissionDate.Month,day=MissionDate.Day,hour=24,isdst=false};-- IsDst};
			local UTCMissionTime=LocalMissionTime-TimeShift+LoGetMissionStartTime();
			local MissionTimeTable=os.date("*t",UTCMissionTime);

			self.AcmiFile:Write("MissionTime="..string.format("%04u-%02u-%02uT%02u:%02u:%02uZ",MissionTimeTable.year,MissionTimeTable.month,MissionTimeTable.day,MissionTimeTable.hour,MissionTimeTable.min,MissionTimeTable.sec).."\n");
		end

		self.AcmiFile:Write("LatitudeOffset="..self.LatitudeOffset.."\n");
		self.AcmiFile:Write("LongitudeOffset="..self.LongitudeOffset.."\n");
		self.AcmiFile:Write("Coalition=Allies,Red\n");
		self.AcmiFile:Write("Coalition=Enemies,Blue\n");
		self.AcmiFile:Write("ProvidedEvents=Removed\n");
		self.AcmiFile:Write("AdvancedTelemetry=XYYaw,Interpolated(Distance,Distance,Angle)\n");	-- 0
		self.AcmiFile:Write("AdvancedTelemetry=IAS,Interpolated(Velocity)\n");					-- 1
		self.AcmiFile:Write("AdvancedTelemetry=Throttle,Float\n");								-- 2
		self.AcmiFile:Write("AdvancedTelemetry=Afterburner,Bool\n");							-- 3
		self.AcmiFile:Write("AdvancedTelemetry=AirBrakes,Bool\n");								-- 4
		self.AcmiFile:Write("AdvancedTelemetry=LandingGear,Bool\n");							-- 5
		self.AcmiFile:Write("AdvancedTelemetry=Flaps,Float\n");									-- 6
		self.AcmiFile:Write("AdvancedTelemetry=Hook,Bool\n");									-- 7
		self.AcmiFile:Write("AdvancedTelemetry=RadarLock0,ID\n");								-- 8

		-- Additional Information
		local PlayerPlaneId=LoGetPlayerPlaneId();

		if PlayerPlaneId then
			self.AcmiFile:Write(string.format("MainAircraftID=%x\n",self.GetOptimizedID(PlayerPlaneId)));
		end
	end,

	-- Update ACMI log
	UpdateLog=function(self)

		-- Check parameters
		if not Tacview.AcmiFile then
			return;
		end

		-- Format current frame time
		local CurrentTime=LoGetModelTime();
		local FormatedTime=string.format("#%.2f\n",CurrentTime);
		local ShouldUpdateLog;

		-- Add/Update default objects
		if CurrentTime>=self.NextDefaultObjectsUpdateTime then
			ShouldUpdateLog=true;
			self.NextDefaultObjectsUpdateTime=CurrentTime+self.DefaultObjectsUpdatePeriod;
		else
			ShouldUpdateLog=false;
		end

		local DefaultObjectsList=LoGetWorldObjects();	-- LoGetWorldObjects("units");

		if DefaultObjectsList==nil and LoGetSelfData then	-- Failsafe to export local plane data even when the host has disabled export in network

			local PlayerPlaneId=LoGetPlayerPlaneId();

			if PlayerPlaneId then
				DefaultObjectsList={[PlayerPlaneId]=LoGetSelfData()};
			end
		end

		if self:AddUpdateObjects(DefaultObjectsList,FormatedTime,ShouldUpdateLog)==true then
			FormatedTime=nil;
		end

		-- Add/Update ballistic objects
		if CurrentTime>=self.NextBallisticObjectsUpdateTime then
			ShouldUpdateLog=true;
			self.NextBallisticObjectsUpdateTime=CurrentTime+self.BallisticObjectsUpdatePeriod;
		else
			ShouldUpdateLog=false;
		end

		local BallisticObjectsList=LoGetWorldObjects("ballistic");

		if self:AddUpdateObjects(BallisticObjectsList,FormatedTime,ShouldUpdateLog)==true then
			FormatedTime=nil;
		end

		-- Remove destroyed objects
		self:RemoveObjects(DefaultObjectsList,BallisticObjectsList,FormatedTime);

	end,

	-- Add/Update objects
	AddUpdateObjects=function(self,CurrentObjectsList,FormatedTime,ShouldUpdateLog)

		-- Check parameters
		if not CurrentObjectsList then
			return false;
		end

		-- Dump objects
		local LogWasUpdated=false;

		for ID,Object in pairs(CurrentObjectsList) do

			-- Check Object Type
			local ObjectType=self.ConvertObjectType(Object.Type);

			if ObjectType~=-1 then	-- Ignore some objects (like particles clouds)

				-- Add new object
				if not self.LastObjectsStatus[ID] then

					local LogLine;

					-- Time prefix
					if FormatedTime then
						LogLine=FormatedTime;
						FormatedTime=nil;
					else
						LogLine="";
					end

					-- Object/Pilot Name
					local ObjectName=Object.Name;
					local PilotName;

					if Object.UnitName then
						PilotName=Object.UnitName;
					else
						PilotName="";
					end

					-- Object Type
					local ObjectTypeFormated;

					if ObjectType and type(ObjectType)=="number" then
						ObjectTypeFormated=string.format("%x",ObjectType);
					else
						-- This will help to debug unknown types
						ObjectTypeFormated=string.format("%s.%s.%s.%s",Object.Type.level1,Object.Type.level2,Object.Type.level3,Object.Type.level4);
					end

					-- Coalition
					local CoalitionID;

					if ObjectType==0x2e or self.IsSimpleObject(ObjectType)==true then
						CoalitionID="?";			-- Chaff/Flare/Shell/Parachutist coalition is not reliable in DCS
					else
						if Object.Coalition then
							CoalitionID=self.CoalitionLookupTable[Object.Coalition];

							if not CoalitionID then
								CoalitionID="?";
							end
						else
							CoalitionID="?";
						end
					end

					-- Country
					local CountryCode;

					if Object.Country then
						CountryCode=self.CountryCodeLookupTable[Object.Country];

						if not CountryCode then
							CountryCode="?";
						end
					else
						CountryCode="?";
					end

					-- Group Name
					local GroupName;

					if Object.GroupName then
						GroupName=Object.GroupName;
					else
						GroupName="?";
					end

					-- Debug Invalid Names
					if not ObjectName or ObjectName=="" then								-- If object name is invalid
						if self.IsSimpleObject(ObjectType)==false and ObjectType~=0x46 then	-- and this is not a Shell/Chaff/Flare
							ObjectName=self.FixInvalidObjectName(Object.Type,GroupName);
						end
					end

					-- Reduce ID size (to compact text log)
					local OptimizedID=self.GetOptimizedID(ID);

					-- Declare new object
					self.AcmiFile:Write(LogLine..string.format("+%x,?,%s,%s,%s,%s,%s,%s,?\n",OptimizedID,ObjectTypeFormated,CoalitionID,CountryCode,self.CleanupName(ObjectName),self.CleanupName(PilotName),self.CleanupName(GroupName)));

					-- Done
					LogWasUpdated=true;
				end

				-- Update object data as required
				if self:UpdateObject(ID,Object,ObjectType,self.LoggedObjectsStatus[ID],FormatedTime,ShouldUpdateLog)==true then
					FormatedTime=nil;
					LogWasUpdated=true;
				end
			end
		end

		-- Completed
		return LogWasUpdated;
	end,

	-- Fix Yaw (because FC/BS map is a 2D projection, not a true 3D sphere)
	FixedYaw=function(Yaw,RefX,RefZ,Latitude,Longitude)

		-- Calculate vector to north in Lock-On coordinates
		local ToNorthPos=LoGeoCoordinatesToLoCoordinates(Longitude,Latitude+1);

		local ToNorthX=ToNorthPos.z-RefZ;
		local ToNorthY=ToNorthPos.x-RefX;

		local ToNorthLength=math.sqrt(ToNorthX*ToNorthX+ToNorthY*ToNorthY);

		-- Normalize vector
		if ToNorthLength>0 then

			ToNorthX=ToNorthX/ToNorthLength;
			ToNorthY=ToNorthY/ToNorthLength;

		end

		-- Calculate Yaw Error
		return Yaw+math.atan2(ToNorthY,ToNorthX)-math.pi/2;
	end,

	-- Update one object
	UpdateObject=function(self,ID,CurrentObjectData,ObjectType,PrevObjectData,FormatedTime,ShouldUpdateLog)

		-- Log object dynamic properties
		local ChangeDetected=false;
		local LogWasUpdated=false;
		local Log="";

		-- Latitude
		if not PrevObjectData or CurrentObjectData.LatLongAlt.Lat~=PrevObjectData.LatLongAlt.Lat then
			Log=Log..string.format(",%.6f",CurrentObjectData.LatLongAlt.Lat-self.LatitudeOffset);
			ChangeDetected=true;
		else
			Log=Log..",";
		end

		-- Longitude
		if not PrevObjectData or CurrentObjectData.LatLongAlt.Long~=PrevObjectData.LatLongAlt.Long then
			Log=Log..string.format(",%.6f",CurrentObjectData.LatLongAlt.Long-self.LongitudeOffset);
			ChangeDetected=true;
		else
			Log=Log..",";
		end

		-- Altitude
		if not PrevObjectData or CurrentObjectData.LatLongAlt.Alt~=PrevObjectData.LatLongAlt.Alt then
			Log=Log..string.format(",%.2f",CurrentObjectData.LatLongAlt.Alt);
			ChangeDetected=true;
		else
			Log=Log..",";
		end

		-- Roll/Pitch/Yaw
		if self.IsSimpleObject(ObjectType)==true then	-- shell/bullet/ballistic-shell/flare/chaff/smoke-grenade/cartridge

			-- Do not log roll/pitch/yaw to reduce recording size
			Log=Log.."\n";

		elseif ObjectType==0x46 or (ObjectType==0x4c and CurrentObjectData.Name=="") then	-- bombs without names => bomblets

			-- Emulate bomblets and shrapnel orientation
			if not PrevObjectData then
				Log=Log..",?,?,?\n";
			else
				Log=Log.."\n";
			end

		else

			-- Roll
			if not PrevObjectData or CurrentObjectData.Bank~=PrevObjectData.Bank then

				local NewFormatedRoll=string.format(",%.1f",math.mod(math.deg(CurrentObjectData.Bank),360));
				local RollIsDifferent=true;

				if PrevObjectData then

					local OldFormatedRoll=string.format(",%.1f",math.mod(math.deg(PrevObjectData.Bank),360));

					if NewFormatedRoll==OldFormatedRoll then
						RollIsDifferent=false;
					end
				end

				if RollIsDifferent==true then
					Log=Log..NewFormatedRoll;
					ChangeDetected=true;
				else
					Log=Log..",";		-- not different enough to be dumped
				end

			else
				Log=Log..",";
			end

			-- Pitch
			if not PrevObjectData or CurrentObjectData.Pitch~=PrevObjectData.Pitch then

				local NewFormatedPitch=string.format(",%.1f",-math.mod(math.deg(-CurrentObjectData.Pitch),360));
				local PitchIsDifferent=true;

				if PrevObjectData then

					local OldFormatedPitch=string.format(",%.1f",-math.mod(math.deg(-PrevObjectData.Pitch),360));

					if NewFormatedPitch==OldFormatedPitch then
						PitchIsDifferent=false;
					end
				end

				if PitchIsDifferent==true then
					Log=Log..NewFormatedPitch;
					ChangeDetected=true;
				else
					Log=Log..",";		-- not different enough to be dumped
				end

			else
				Log=Log..",";
			end

			-- Yaw
			if not PrevObjectData or CurrentObjectData.Heading~=PrevObjectData.Heading then

				local NewFormatedYaw=string.format(",%.1f\n",math.mod(math.deg(Tacview.FixedYaw(CurrentObjectData.Heading,CurrentObjectData.Position.x,CurrentObjectData.Position.z,CurrentObjectData.LatLongAlt.Lat,CurrentObjectData.LatLongAlt.Long)),360));
				local YawIsDifferent=true;

				if PrevObjectData then

					local OldFormatedYaw=string.format(",%.1f\n",math.mod(math.deg(Tacview.FixedYaw(PrevObjectData.Heading,PrevObjectData.Position.x,PrevObjectData.Position.z,PrevObjectData.LatLongAlt.Lat,PrevObjectData.LatLongAlt.Long)),360));

					if NewFormatedYaw==OldFormatedYaw then
						YawIsDifferent=false;
					end
				end

				if YawIsDifferent==true then
					Log=Log..NewFormatedYaw;
					ChangeDetected=true;
				else
					Log=Log..",\n";		-- not different enough to be dumped
				end

			else
				Log=Log..",\n";
			end
		end

		-- Advanced Telemetry
		local AdvancedLog="";
		local AdvancedLogChangeDetected=false;

		if self.IsSimpleObject(ObjectType)==false and ObjectType~=0x46 and ObjectType<0x80 then

			-- 0: X,Y,Yaw (from: z,x)
			if not PrevObjectData or CurrentObjectData.Position.z~=PrevObjectData.Position.z or CurrentObjectData.Position.x~=PrevObjectData.Position.x or CurrentObjectData.Heading~=PrevObjectData.Heading then
				AdvancedLog=AdvancedLog..string.format(",,%.1f,%.1f,%.1f",CurrentObjectData.Position.z,CurrentObjectData.Position.x,math.mod(math.deg(CurrentObjectData.Heading),360));
				AdvancedLogChangeDetected=true;
			end

			-- Data available only for the main aicraft
			local PlayerPlaneId=LoGetPlayerPlaneId();

			if PlayerPlaneId==ID then

				-- Get and Update Parameters
				local MainPanel=GetDevice(0);			-- Player plane main panel information

				if MainPanel and type(MainPanel)=="table" then
					MainPanel:update_arguments();		-- Ensure cockpit info is up-to-date even when not in cockpit (works in DCS only)
				end

				-- Detect Plane (DCS) and corresponding parameters
				-- \DCSWorld\Mods\aircraft\A-10C\Cockpit\Scripts\mainpanel_init.lua
				-- Look for the code around CreateGauge() to find the index of different data

				local PlayerPlaneName=string.lower(CurrentObjectData.Name);
				local FlapsPanel=MainPanel;

				-- General mechanical information (older version of Lock-On) 
				-- Not reliable and not available for all aicrafts in DCS
				local MechInfo=LoGetMechInfo();

				local IASIndex =-1;
				local IASInput ={};						-- Values in real-life (interpolated)
				local IASOutput={};						-- Values read in cockpit
				local IASFactor=1;

				local LeftThrottleIndex=-1;
				local RightThrottleIndex=-1;
				local ThrottleFactor=1;

				local FlapsIndex=-1;
				local FlapsFactor=1;
				local FlapsUpIndex=-1;

				local AirBrakesIndex=-1;
				local LandingGearDownIndex=-1;
				local LandingGearOutIndex=-1;
				local LandingGearNoseUpIndex=-1;
				local LandingGearLeftUpIndex=-1;
				local LandingGearRightUpIndex=-1;
				local LandingGearUpPosition=0;
				local HookIndex=-1;
				local ACMIRecording=-1;
				local ACMIBookmark=-1;

				if MainPanel then

--AdvancedLog=AdvancedLog..string.format("MainPanel_IsValid=[")..Tacview.ObjectToString(MainPanel).."]\n";
--AdvancedLogChangeDetected=true;

					-- From mainpanel_init.lua

					if PlayerPlaneName=="a-10c" then

						IASIndex =48;
						IASInput ={  0,    50,   100,   150,   200,   250,   300,   350,   400,   450,   500, 550};
						IASOutput={0.0, 0.053, 0.146, 0.234, 0.322, 0.412, 0.517, 0.620, 0.719, 0.811, 0.906, 1.0};
						IASFactor=0.514444;				-- kts to m/s factor

						LeftThrottleIndex=78;			-- Left Engine Throttle
						RightThrottleIndex=80;			-- Right Engine Throttle

						LandingGearDownIndex=716;		-- Gear Handle

						FlapsIndex=653;
						FlapsFactor=3/2;				-- Max position = 2/3

					elseif PlayerPlaneName=="ka-50" then

						IASIndex =51;
						IASFactor=350*10/36;			-- 1.0 => 350 Km/h

						LeftThrottleIndex=104;			-- Collective position
						RightThrottleIndex=104;			-- Collective position

						LandingGearNoseUpIndex=63;
						LandingGearLeftUpIndex=59;
						LandingGearRightUpIndex=61;

					elseif PlayerPlaneName=="mi-8mt" then

						IASIndex =24;
						IASInput ={0.0, 13.5, 13.889, 27.78, 41.6, 55.5, 127.7};
						IASOutput={0.0, 0.001, 0.028, 0.165, 0.277, 0.393, 1.0};
						IASFactor=1.0;					-- Already in m/s

						LeftThrottleIndex=191;			-- Collective position
						RightThrottleIndex=191;			-- Collective position

					elseif PlayerPlaneName=="uh-1h" then

						IASIndex =117;
						IASInput ={0.0, 20.0, 30.0, 40.0, 50.0, 60.0, 80.0, 120.0, 150.0};
						IASOutput={0.0, 0.075, 0.19, 0.32, 0.395, 0.44, 0.55, 0.825, 1.0};
						IASFactor=0.514444;				-- kts to m/s factor

						LeftThrottleIndex=200;			-- Collective position
						RightThrottleIndex=200;			-- Collective position

					elseif PlayerPlaneName=="p-51d" or PlayerPlaneName=="tf-51d" then

						IASIndex =11;
						IASInput ={0,   50,   100,  150,  200, 250,  300, 350,  400, 450,  500, 550,  600, 650,  700}
						IASOutput={0.0, 0.05, 0.10, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7}
						IASFactor=0.44704;				-- mph to m/s

						LeftThrottleIndex=10;			-- Manifold Pressure
						RightThrottleIndex=10;			-- Manifold Pressure
						ThrottleFactor=75/61;			-- Max = 75 PSI (red-bar at 61 PSI)

						LandingGearDownIndex=80;
						LandingGearOutIndex=82;

--						FlapsPanel=GetDevice(12);		-- Flaps status are only available in the CONTROL_SYSTEM panel
--						FlapsIndex=;

					elseif PlayerPlaneName=="fw-190d9" then

						IASIndex =36;
						IASInput ={0, 100, 150, 200, 250, 300, 400, 500, 600, 700, 750, 800, 850, 900};
						IASOutput={0.0, 0.065, 0.124, 0.185, 0.234, 0.290, 0.417, 0.547, 0.664, 0.782,0.842, 0.896, 0.958, 1.0};
						IASFactor=0.277778;				-- km/h to m/s

						LeftThrottleIndex=2;			-- Manifold Pressure
						RightThrottleIndex=2;			-- Manifold Pressure
						ThrottleFactor=1;

						LandingGearLeftUpIndex=68;
						LandingGearRightUpIndex=70;

						FlapsUpIndex=72;

					elseif PlayerPlaneName=="bf-109k-4" then

						IASIndex =2;
						IASInput ={0,   100,  150,   200,  700,  750,   900,  1000};
						IASOutput={0.0, 0.1,  0.15,  0.2,  0.7,  0.75,  0.9,  1.0};
						IASFactor=0.277778;				-- km/h to m/s

						LeftThrottleIndex=32;			-- Manifold Pressure
						RightThrottleIndex=32;			-- Manifold Pressure
						ThrottleFactor=1;

						LandingGearLeftUpIndex=56;
						LandingGearRightUpIndex=56;

					elseif PlayerPlaneName=="f-86f sabre" then

						IASIndex =178;
						IASInput ={0.0, 25.7,  180.06, 334.4};
						IASOutput={0.0, 0.019, 0.494,  0.965};
						IASFactor=1;

						LeftThrottleIndex=104;
						RightThrottleIndex=104;
						ThrottleFactor=1;

						--LandingGearLeftUpIndex=68;
						--LandingGearRightUpIndex=70;

						--FlapsUpIndex=72;

					elseif PlayerPlaneName=="mig-21bis" then

						IASIndex =100;
						IASInput ={ 0, 83.33, 166.67, 250, 333.33, 416.67, 555.55 };
						IASOutput={ 0, 0.15, 0.30, 0.45, 0.60, 0.75, 1 };
						IASFactor=1;

						LeftThrottleIndex=50;
						RightThrottleIndex=50;		-- Use RPM1 as the official throttle reference (from the official documentation)
						ThrottleFactor=1.1;

						LandingGearNoseUpIndex=9;
						LandingGearLeftUpIndex=10;
						LandingGearRightUpIndex=13;
						LandingGearUpPosition=1;

						FlapsIndex=521;
						AirBrakesIndex=7;

						ACMIRecording=193;
						ACMIBookmark=239;			-- CANOPY_anti_ice

					elseif PlayerPlaneName=="mig-15bis" then

						IASIndex =4;
						IASInput ={100.0, 1100.0};
						IASOutput={0.0,   1.0};
						IASFactor=0.277778;				-- km/h to m/s

						LeftThrottleIndex=205;
						RightThrottleIndex=205;
						ThrottleFactor=1;

						LandingGearNoseUpIndex=76;
						LandingGearLeftUpIndex=74;
						LandingGearRightUpIndex=78;

						FlapsIndex=59;
						AirBrakesIndex=124;
					end
				end

				-- 1: IAS (Must be updated "every" frame to ensure proper interpolation)
				CurrentObjectData.TacviewIAS=LoGetIndicatedAirSpeed();

				if not CurrentObjectData.TacviewIAS and IASIndex>=0 then

					CurrentObjectData.TacviewIAS=MainPanel:get_argument_value(IASIndex);
				end

				if CurrentObjectData.TacviewIAS then

					if table.getn(IASOutput)>0 then

						-- Non linear interpolation

						-- Fail safe for low/negatives values
						local IsNegative=false;

						if CurrentObjectData.TacviewIAS<0 then
							CurrentObjectData.TacviewIAS=-CurrentObjectData.TacviewIAS;
							IsNegative=true;
						end

						-- Fail safe for too high values
						local ItemCount=#IASOutput;

						-- Find and convert value
						for i,CurrentInput in ipairs(IASOutput) do

							if CurrentObjectData.TacviewIAS<CurrentInput or i==ItemCount then

								local PreviousInput=IASOutput[i-1];
								local DeltaInput=CurrentInput-PreviousInput;
								local PreviousOutput=IASInput[i-1];
								local DeltaOutput=IASInput[i]-PreviousOutput;

								CurrentObjectData.TacviewIAS=(((CurrentObjectData.TacviewIAS-PreviousInput)/DeltaInput)*DeltaOutput+PreviousOutput)*IASFactor;

								break;
							end
						end

						if IsNegative then
							CurrentObjectData.TacviewIAS=-CurrentObjectData.TacviewIAS;
						end
					else
						-- Linear scale conversion
						CurrentObjectData.TacviewIAS=CurrentObjectData.TacviewIAS*IASFactor;
					end
				end

				if CurrentObjectData.TacviewIAS then
					AdvancedLog=AdvancedLog..string.format(",1,%.1f",CurrentObjectData.TacviewIAS);
					AdvancedLogChangeDetected=true;
				end

				-- 2: Throttle
				local EngineInfo=LoGetEngineInfo();

				if EngineInfo then
					CurrentObjectData.TacviewThrottle=math.max(EngineInfo.RPM.left,EngineInfo.RPM.right)/100;
				end

				if not CurrentObjectData.TacviewThrottle and LeftThrottleIndex>=0 and RightThrottleIndex>=0 then

					local LeftThrottle=MainPanel:get_argument_value(LeftThrottleIndex);
					local RightThrottle=MainPanel:get_argument_value(RightThrottleIndex);

					if LeftThrottle and RightThrottle then
						CurrentObjectData.TacviewThrottle=math.max(LeftThrottle,RightThrottle);
					end
				end

				if CurrentObjectData.TacviewThrottle then
					CurrentObjectData.TacviewThrottle=CurrentObjectData.TacviewThrottle*ThrottleFactor;
				end

				if CurrentObjectData.TacviewThrottle and (not PrevObjectData or CurrentObjectData.TacviewThrottle~=PrevObjectData.TacviewThrottle) then
					AdvancedLog=AdvancedLog..string.format(",2,%.2f",CurrentObjectData.TacviewThrottle);
					AdvancedLogChangeDetected=true;
				end

				-- 3: Afterburner
				if CurrentObjectData.TacviewThrottle and CurrentObjectData.TacviewThrottle>1.015 then
					CurrentObjectData.TacviewAfterburner=1;
				else
					CurrentObjectData.TacviewAfterburner=0;
				end

				if not PrevObjectData or CurrentObjectData.TacviewAfterburner~=PrevObjectData.TacviewAfterburner then
					AdvancedLog=AdvancedLog..string.format(",3,%u",CurrentObjectData.TacviewAfterburner);
					AdvancedLogChangeDetected=true;
				end

				-- 4: AirBrakes
				-- Does not work well with DCS 1.2.8 (e.g. for the A-10A)
				if MechInfo then
					CurrentObjectData.TacviewAirBrakes=MechInfo.speedbrakes.status;
				end

				if not CurrentObjectData.TacviewAirBrakes and AirBrakesIndex>=0 then
					if MainPanel:get_argument_value(AirBrakesIndex)>0 then
						CurrentObjectData.TacviewAirBrakes=1;
					else
						CurrentObjectData.TacviewAirBrakes=0;
					end
				end

				if CurrentObjectData.TacviewAirBrakes and (not PrevObjectData or CurrentObjectData.TacviewAirBrakes~=PrevObjectData.TacviewAirBrakes) then
					AdvancedLog=AdvancedLog..string.format(",4,%u",CurrentObjectData.TacviewAirBrakes);
					AdvancedLogChangeDetected=true;
				end

				-- 5: LandingGear
				if MechInfo then
					if MechInfo.gear.value>0 then
						CurrentObjectData.TacviewLandingGear=1;
					else
						CurrentObjectData.TacviewLandingGear=0;
					end
				end

				if not CurrentObjectData.TacviewLandingGear then

					if (LandingGearNoseUpIndex>=0 and MainPanel:get_argument_value(LandingGearNoseUpIndex)==LandingGearUpPosition)
					or (LandingGearLeftUpIndex>=0 and MainPanel:get_argument_value(LandingGearLeftUpIndex)==LandingGearUpPosition)
					or (LandingGearRightUpIndex>=0 and MainPanel:get_argument_value(LandingGearRightUpIndex)==LandingGearUpPosition)
					or (LandingGearDownIndex>=0 and MainPanel:get_argument_value(LandingGearDownIndex)==1)
					or (LandingGearOutIndex>=0 and MainPanel:get_argument_value(LandingGearOutIndex)==1)
					then
						CurrentObjectData.TacviewLandingGear=1;		-- Gear Down or Unsafe
					else
						CurrentObjectData.TacviewLandingGear=0;		-- Gear Up
					end
				end

				if CurrentObjectData.TacviewLandingGear and (not PrevObjectData or CurrentObjectData.TacviewLandingGear~=PrevObjectData.TacviewLandingGear) then
					AdvancedLog=AdvancedLog..string.format(",5,%u",CurrentObjectData.TacviewLandingGear);
					AdvancedLogChangeDetected=true;
				end

				-- 6: Flaps
				if MechInfo then
					CurrentObjectData.TacviewFlaps=MechInfo.flaps.value;
				end

				if not CurrentObjectData.TacviewFlaps and FlapsIndex>=0 then
					CurrentObjectData.TacviewFlaps=MainPanel:get_argument_value(FlapsIndex);
				end

				if not CurrentObjectData.TacviewFlaps and FlapsUpIndex>=0 then

					if MainPanel:get_argument_value(FlapsUpIndex)==1 then
						CurrentObjectData.TacviewFlaps=0;
					else
						CurrentObjectData.TacviewFlaps=1;
					end
				end

				if CurrentObjectData.TacviewFlaps then
					CurrentObjectData.TacviewFlaps=CurrentObjectData.TacviewFlaps*FlapsFactor;
				end

				if CurrentObjectData.TacviewFlaps and (not PrevObjectData or CurrentObjectData.TacviewFlaps~=PrevObjectData.TacviewFlaps) then
					AdvancedLog=AdvancedLog..string.format(",6,%.1f",CurrentObjectData.TacviewFlaps);
					AdvancedLogChangeDetected=true;
				end

				-- 7: Hook
				if MechInfo then
					CurrentObjectData.TacviewHook=MechInfo.hook.status;
				end

				if not CurrentObjectData.TacviewHook and HookIndex>=0 then
					CurrentObjectData.TacviewHook=MainPanel:get_argument_value(HookIndex);
				end

				if CurrentObjectData.TacviewHook and (not PrevObjectData or CurrentObjectData.TacviewHook~=PrevObjectData.TacviewHook) then
					AdvancedLog=AdvancedLog..string.format(",7,%u",CurrentObjectData.TacviewHook);
					AdvancedLogChangeDetected=true;
				end

				-- 8: RadarLock0
				local LockedTargets=LoGetLockedTargetInformation();

				CurrentObjectData.TacviewRadarLock0=0;

				if LockedTargets then

					for TargetIndex,Target in pairs(LockedTargets) do

						if Target.target then
							CurrentObjectData.TacviewRadarLock0=Target.target.ID;
						end

						break;
					end
				end

				if not PrevObjectData or CurrentObjectData.TacviewRadarLock0~=PrevObjectData.TacviewRadarLock0 then

					if not CurrentObjectData.TacviewRadarLock0 or CurrentObjectData.TacviewRadarLock0==0 then
						AdvancedLog=AdvancedLog..",8,0";
					else
						AdvancedLog=AdvancedLog..string.format(",8,%x",self.GetOptimizedID(CurrentObjectData.TacviewRadarLock0));
					end

					AdvancedLogChangeDetected=true;
				end

				-- Flight Recording Bookmarks #1
				if ACMIRecording>=0 then
					if MainPanel:get_argument_value(ACMIRecording)>.5 then
						CurrentObjectData.ACMIRecording=1;
					else
						CurrentObjectData.ACMIRecording=0;
					end
				end

				if PrevObjectData and CurrentObjectData.ACMIRecording~=PrevObjectData.ACMIRecording then

					local OptimizedID=self.GetOptimizedID(ID);

					if CurrentObjectData.ACMIRecording==1 then
						self.AcmiFile:Write("!90,"..string.format("%x",OptimizedID)..",,Flight recorder started\n");
					else
						self.AcmiFile:Write("!90,"..string.format("%x",OptimizedID)..",,Flight recorder stopped\n");
					end

					ShouldUpdateLog=true;
				end

				-- Flight Recording Bookmarks #2
				if ACMIBookmark>=0 then
					if MainPanel:get_argument_value(ACMIBookmark)>.5 then
						CurrentObjectData.ACMIBookmark=1;
					else
						CurrentObjectData.ACMIBookmark=0;
					end
				end

				if PrevObjectData and CurrentObjectData.ACMIBookmark~=PrevObjectData.ACMIBookmark then

					local OptimizedID=self.GetOptimizedID(ID);

					if CurrentObjectData.ACMIBookmark==1 then
						self.AcmiFile:Write("!90,"..string.format("%x",OptimizedID)..",,Bookmark\n");
					end

					ShouldUpdateLog=true;
				end
			end
		end

		-- Log data
		if not PrevObjectData or (( ChangeDetected==true or AdvancedLogChangeDetected==true ) and ShouldUpdateLog==true ) then

			if FormatedTime then
				self.AcmiFile:Write(FormatedTime);
			end

			local OptimizedID=self.GetOptimizedID(ID);

			if ChangeDetected==true then
				self.AcmiFile:Write(string.format("%x",OptimizedID)..Log);
			end

			if AdvancedLogChangeDetected==true then

				if ChangeDetected==true then

					self.AcmiFile:Write("@"..AdvancedLog.."\n");

				else

					self.AcmiFile:Write("@"..string.format("%x",OptimizedID)..AdvancedLog.."\n");

				end
			end

			LogWasUpdated=true;

			-- Remember Last Logged Object Properties (used to optimize log update)
			self.LoggedObjectsStatus[ID]=CurrentObjectData;
		end

		-- Remember Current Frame Object Properties (used to add/remove objects)
		self.LastObjectsStatus[ID]=CurrentObjectData;

		-- Complete
		return LogWasUpdated;
	end,

	-- Remove any destroyed objects
	RemoveObjects=function(self,DefaultObjectsList,BallisticObjectsList,FormatedTime)

		local Log;

		if not DefaultObjectsList then
			DefaultObjectsList={};
		end

		if not BallisticObjectsList then
			BallisticObjectsList={};
		end

		for ID,Object in pairs(self.LastObjectsStatus) do

			if (not DefaultObjectsList[ID]) and (not BallisticObjectsList[ID]) then

				-- Log last position if required
				local ObjectType=self.ConvertObjectType(Object.Type);

				if self:UpdateObject(ID,Object,ObjectType,self.LoggedObjectsStatus[ID],FormatedTime,true)==true then
					FormatedTime=nil;
				end

				-- Prefix event with time if required
				if FormatedTime then
					Log=FormatedTime;
					FormatedTime=nil;
				else
					Log="";
				end

				-- Log Event
				self.AcmiFile:Write(Log..string.format("!20,%x\n",self.GetOptimizedID(ID)));

				-- Remove object from lists
				self.LoggedObjectsStatus[ID]=nil;
				self.LastObjectsStatus[ID]=nil;
			end
		end
	end,

	-- Stop ACMI logging
	EndLog=function(self)

		if self.AcmiFile then
			self.AcmiFile:Close();
			self.AcmiFile=nil;
		end

	end,

	-- Files Tools
	FileExist=function(FileName)

		local FileToTest=io.open(FileName);

		if FileToTest then
			io.close(FileToTest);
			return true;
		end

		return false;
	end,

	-- Export One Sector in SRTM3 text format
	ExportSector=function(Latitude,Longitude)

		local LatitudeName;

		if Latitude>=0 then
			LatitudeName=string.format("N%02u",Latitude);
		else
			LatitudeName=string.format("S%02u",-Latitude);
		end

		local LongitudeName;

		if Longitude>=0 then
			LongitudeName=string.format("E%03u",Longitude);
		else
			LongitudeName=string.format("W%03u",-Longitude);
		end

		local TerrainFile=io.open("C:/Downloads/DCS World Terrain/"..LatitudeName..LongitudeName..".hgt.txt","wb");

		for y=1200,0,-1 do

			local CurrentLatitude=Latitude+y/1200;

			for x=0,1200 do

				local CurrentLongitude=Longitude+x/1200;
				local DCSCoordinates=LoGeoCoordinatesToLoCoordinates(CurrentLongitude,CurrentLatitude);
				local SampleValue=LoGetAltitude(DCSCoordinates.x,DCSCoordinates.z);

				-- To make DCS World edges of the map nicer, flag all of them as "invalid"
				-- this will tell Tacview fill them with niced data from the ETOPO2 map
				-- Must compare to 0.1 because sea level is not perfecly zero

--[[
				if SampleValue<=0.1 and
				(
					CurrentLatitude>45.25
					or
					CurrentLatitude<41.02
					or
					CurrentLongitude>41.81
					or
					(
						CurrentLongitude>40
						and
						CurrentLatitude>44
					)
					or
					(
						CurrentLongitude<40.546
						and
						CurrentLatitude<41.1
					)
				)
				then
					TerrainFile:write("-32768\n");
				else
--]]
					TerrainFile:write(SampleValue.."\n");
--				end
			end
		end

		io.close(TerrainFile);
	end,

	-- Export Nevada Terrain
	ExportNevadaTerrain=function(self)

		-- Do not forget to create the target folder
		-- C:\Downloads\DCS World Terrain\

		-- Ignore low resolution edges sectors to save some storage space

		for Latitude=33+1,40-1 do

			for Longitude=-120+1,-111-1 do

				self.ExportSector(Latitude,Longitude);

			end
		end

	end,

	-- Export Caucasus Terrain
	ExportCaucasusTerrain=function(self)

		-- Do not forget to create the target folder
		-- C:\Downloads\DCS World Terrain\

		self.ExportSector(40,40);
		self.ExportSector(40,41);
		self.ExportSector(40,42);
		self.ExportSector(40,43);
		self.ExportSector(40,44);
		self.ExportSector(40,45);
		self.ExportSector(41,40);
		self.ExportSector(41,41);
		self.ExportSector(41,42);
		self.ExportSector(41,43);
		self.ExportSector(41,44);
		self.ExportSector(41,45);
		self.ExportSector(42,40);
		self.ExportSector(42,41);
		self.ExportSector(42,42);
		self.ExportSector(42,43);
		self.ExportSector(42,44);
		self.ExportSector(42,45);

		self.ExportSector(43,39);
		self.ExportSector(43,40);
		self.ExportSector(43,41);
		self.ExportSector(43,42);
		self.ExportSector(43,43);
		self.ExportSector(43,44);
		self.ExportSector(43,45);

		self.ExportSector(44,37);
		self.ExportSector(44,38);
		self.ExportSector(44,39);
		self.ExportSector(44,40);
		self.ExportSector(44,41);
		self.ExportSector(44,42);
		self.ExportSector(44,43);
		self.ExportSector(44,44);
		self.ExportSector(45,37);
		self.ExportSector(45,38);
		self.ExportSector(45,39);
		self.ExportSector(45,40);

	end,

	-- Converts an Object to String (recursive)
	ObjectToString=function(ObjectToDump,Level)

		-- Default Value
		if not Level then
			Level=0;
		end

		-- Prevent recursion issues
		if Level>7 then
			return "";
		end

		if type(ObjectToDump)=="string" then
			return "\""..string.gsub(ObjectToDump,"\n"," ").."\",";
		end

		if type(ObjectToDump)=="number" then
			return string.format("%.6g,", ObjectToDump);
		end

		if type(ObjectToDump)=="boolean" then

			if ObjectToDump==true then
				return "true,";
			else
				return "false,";
			end
		end

		if type(ObjectToDump)=="table" then

			local TableDump="\n"..string.rep("\t",Level).."{\n";

			-- Sort Table
			local SortedTable={};
			local ItemIndex=0;

			for k in pairs(ObjectToDump) do
				ItemIndex=ItemIndex+1;
				SortedTable[ItemIndex]=k;
			end

			table.sort(SortedTable);

			for k,v in pairs(SortedTable) do

				-- Get source data from sorted array
				k=v;
				v=ObjectToDump[v];

				-- Prevent recursion issues
				if v~=ObjectToDump and not (Level>0 and k=="_G") and not (Level>1 and k=="package") then
					TableDump=TableDump..string.rep("\t",Level+1)..k.." = "..Tacview.ObjectToString(v,Level+1).."\n";
				end
			end

			return TableDump..string.rep("\t",Level).."},";
		end

		if type(ObjectToDump)=="userdata" then

			local MetaTable=getmetatable(ObjectToDump);

			if MetaTable then
				return Tacview.ObjectToString(MetaTable,Level)
			end
		end

		return tostring(ObjectToDump)..",";
	end,

	-- Dump Global Variables
	DumpVariable=function(Name,ObjectToDump)

		local TargetFolder=os.getenv("TACVIEW_EXPORT_PATH");
		local DumpFile=io.open(TargetFolder.."/"..Name..".lua","wb");

		if DumpFile then
			DumpFile:write(Name.."=");
			DumpFile:write(Tacview.ObjectToString(ObjectToDump));
			io.close(DumpFile);
		end
	end,

	-- Dump Devices Interfaces
	DumpDevices=function()

		-- Get Devices List
		dofile("./Scripts/Aircrafts/P-51D/Cockpit/devices.lua");

		-- Initialize Default Panel
		devices["MAIN_PANEL"]=0;

		-- Open File
		local TargetFolder=os.getenv("TACVIEW_EXPORT_PATH");
		local DumpFile=io.open(TargetFolder.."/Devices.lua","wb");

		if DumpFile then

			for k,v in pairs(devices) do
				local dev = GetDevice(v);
				local mDev = getmetatable(dev);
				DumpFile:write("devices."..k.."=");
				DumpFile:write(Tacview.ObjectToString(mDev));
				DumpFile:write("\n");
			end

			io.close(DumpFile);
		end
	end,
}

-- (Hook) Works once just before mission start.
do
	local PrevLuaExportStart=LuaExportStart;

	LuaExportStart=function()

--		Tacview.DumpDevices();
--		Tacview.DumpVariable("_G",_G);
--		Tacview:ExportNevadaTerrain();
--		Tacview:ExportCaucasusTerrain();

		Tacview:BeginLog();

		if PrevLuaExportStart then
			PrevLuaExportStart();
		end
	end
end

-- (Hook) Works just before every simulation frame.
do
	local PrevLuaExportBeforeNextFrame=LuaExportBeforeNextFrame;

	LuaExportBeforeNextFrame=function()

--		Tacview:UpdateLog();

		if PrevLuaExportBeforeNextFrame then
			PrevLuaExportBeforeNextFrame();
		end
	end
end

-- (Hook) Works just after every simulation frame.
do
	local PrevLuaExportAfterNextFrame=LuaExportAfterNextFrame;

	LuaExportAfterNextFrame=function()

		Tacview:UpdateLog();

		if PrevLuaExportAfterNextFrame then
			PrevLuaExportAfterNextFrame();
		end
	end
end

-- (Hook) Works once just after mission stop.
do
	local PrevLuaExportStop=LuaExportStop;

	LuaExportStop=function()

		Tacview:EndLog();

		if PrevLuaExportStop then
			PrevLuaExportStop();
		end
	end
end

end	-- Protection against multiple references (typically wrong script installation)
