--[[
v022 changelog Mist 3.3
-added mist.dynAddStatic()
-added mist.random()
-added mist.getmist.nextUnitId()
-added mist.getmist.nextGroupId()
-added shape_name to DBs for static objects to use
-added static object support for teleportToPoint and related scripting functions
-changed print statements to env.info for some functions
-Fixed Bug with makeVec3GL
-fixed bug with mist.flagFuncs.point_in_polygon related to the toggle parameter
-fixed bug with messages not correctly being sent to the right groups
-numerous changes mist.dynAdd and mist.dbUpdate to be more effecient and squash bugs

-- mist.dynAdd now returns a string of the groups name instead of the table of the group object

v021 changelog Mist 3.2 Hofix release
- fixed bug with mist.getCurrentGroupData so that it returns a string for both coalition and category
- fixed bug with mist.teleportToPoint to properly default to correct surface types
- added online documentation. Available at: http://wiki.hoggit.us/view/Mission_Scripting_Tools_Documentation

v020 changelog Mist v3.2 release
- added mist.utils.makeVec3GL() returns a vec 3 coordinate at ground level of a given vec2/vec3 coordinate
- added mist.ground.patrol
- added mist.ground.patrolRoute
- fixed bug with mist.ground.buildWP not accepting formations. Minor organizational changes
- helipad Id is now retrieved on mist.getGroupRoute
- added livery_id to DBs so helicopters don't spawn without skins
- added task to DBs and dynAdd scripts so that AI aircraft will engage targets if respawned

v019 changelog -- Mist v3.1 Release
- fixed bug with sending sounds to clients
- if an audio message is sent to correct coalition or 'all', CA players will now hear it
- added speed entry to units DBs
- fixed typo with mist.respawnGroup returning a nil value
- modified mist.cloneGroup, mist.teleportGroup, mist.respawnGroup behavior if task variable is given.
--If task is anything except for a number, the task become the groups default route.
--if task is a number, then the route will be assigned after however many seconds you specify. 
- mist.dynAdd now accepts a route variable as part of the table passed to it
- overloaded mist.dynAdd to accept route data if the points part of the table is missing. groupTable.route[1]... instead of the correct format groupTable.route.points[1]...
- fixed mist.getPayload, must now be sent a string 

v018 changelog -- Mist v3.0 Release
- mist.message.add now accepts a "sound" vars to play audio. Due to how it is implemented, Combined Arms players will be UNABLE hear any sounds.
- Reorganized documentations a bit
- Fixed bug with how functions called mist.toStringLL
- Fixed bug with mist.teleportToPoint

v017 changelog
- fixed stuff broken by v016 additions
- Flag funcs now accept a toggle variable. This will set the flag to false when the conditions arent met. 
	Applies to:
	-mist.flagFunc.units_in_polygon
	-mist.flagFunc.units_in_zones
	-mist.flagFunc.units_in_moving_zones
	-mist.flagFunc.units_LOS
- added mist.DBs.MEunits
- mist.DBs.units now updates live as needed
- added getAvgGroupPos
- added mist.msgMGRS	
- added mist.msgLL	
- added mist.msgBR	
- added mist.msgBRA	
- added mist.msgBullseye	
- added mist.msgLeadingMGRS	
- added mist.msgLeadingLL	
- added mist.msgLeadingBR	


v016 Changelog
- Several DBs are now updated as units are dynamically added to the mission
- Country names in DBs are all now lower case.
- Fixed bug with DBs where countryId was the mission table index of the country table and not the actual country Id
- Added startTime to group tables
- Imported and renamed several Spawn/Clone/Teleport functions
-- Added mist.dbUpdate()
-- added mist.dynAdd()
-- added mist.getCurrentGroupData()
-- added mist.getGroupData()
-- added mist.getPayload()
-- added mist.teleportToPoint()
-- added mist.respawnInZone()
-- added mist.teleportInZone()
-- added mist.cloneInZone()
-- added mist.respawnGroup()
-- added mist.cloneGroup()
-- added mist.teleportGroup()

v015 chagelog 
- added mist.DBs.MEunitsByName 
- added mist.DBs.MEunitsById 
- added mist.DBs.MEunitsByCat 
- added mist.DBs.MEunitsByNum
- added mist.DBs.MEgroupsByName
- added mist.DBs.MEgroupsById

- added mist.isTerrainValid
- added mist.DBs.const.callsigns
- mist.getRandPointInCircle now accepts both vec 2 and 3
- addded alt and alt_type to units databases

- bug with mist.removeFunction should be fixed now.
- mist.message.remove now accepts a self variable, not an integer
- mist.message.removeById added; works like the old mist.message.remove
- fixed mist.getUnitsInZones and mist.getUnitsInMovingZones to return only activated units


v014 changelog  -- Mist 2.0 Release
- fixed compatibility for SSE v1.2.4
- added mist.fixedWing.buildWP
- added mist.heli.buildWP
- added heading and player can drive to units database

]]

--[[v013 change log
- added mist.getLeadingLLString
- added mist.getLeadingBRString
- added mist.getRandPointInCircle
]]

--[[v012 change log
- added innerRadius optional variable to mist.groupToRandomPoint
- mist.groupToRandomPoint now mist.groupToRandomPoint
- fixed some problems in mist.groupToRandomPoint
- removed randomized speed from mist.ground.buildWP
- added default speed to mist.groupToRandomPoint
- mist.getAvgPos returns nil if no units found alive.
- added mist.utils.getDir
- mist.vec.scalar_mult officially renamed to mist.vec.scalarMult; old name still works though.
- mist.vec.getUnitVec added
- mist.utils.makeVec2 and mist.utils.makeVec3 always return back a new vector now.
- added mist.utils.get2DDist
- added mist.utils.get3DDist
- added mist.vec.rotateVec2
- added mist.getMGRSString
- added mist.getLeadingMGRSString
- added mist.getLLString
- added mist.getBRString
- added mist.utils.zoneToVec3
]]


--[[
v011 change log
- added mist.utils.metersToNM
- added mist.utils.metersToFeet
- added mist.utils.NMToMeters
- added mist.utils.feetToMeters
- added mist.utils.mpsToKnots
- added mist.utils.mpsToKmph
- added mist.utils.knotsToMps
- added mist.utils.kmphToMps

- added mist.tostringMGRS
- added mist.tostringLL
- added mist.tostringBR

- added mist.getAvgPos
- added mist.getLeadPos 

- added mist.message.add
- added mist.message.remove

- added mist.goRoute
- added mist.getGroupRoute 
- added mist.groupToPoint
- added mist.groupToRandomZone
- added mist.groupRandomDistSelf

- added mist.ground.buildWP


v010 change log mist 1.1
- fixed a bug with mist.addEventHandler

v009 changelog
- renamed mist.unitsInZonesByName to mist.getUnitsInZones
- renamed mist.getDeadMapObjsInZonesByName to mist.getDeadMapObjsInZones
- renamed mist.unitsInMovingZonesByName to mist.getUnitsInMovingZones
- renamed mist.unitsLOSByName to mist.getUnitsLOS
- renamed mist.mapobjs_dead_in_zones to mist.flagFunc.mapobjs_dead_zones
- renamed mist.mapobjs_dead_in_polygon_zone to mist.flagFunc.mapobjs_dead_polygon
- renamed mist.units_in_zones to mist.flagFunc.units_in_zones
- renamed mist.units_in_moving_zones to mist.flagFunc.units_in_moving_zones
- renamed mist.units_LOS to mist.flagFunc.units_LOS
- renamed mist.units_in_polygon_zone to mist.flagFunc.units_in_polygon
- mist.scheduleFunction now calls scheduled functions with pcall

- mist.getAttitude now accepts a Unit instead of a unit name
- mist.getHeading now accepts a Unit instead of a unit name 
- mist.getPitch now accepts a Unit instead of a unit name 
- mist.getRoll now accepts a Unit instead of a unit name
- mist.getYaw now accepts a Unit instead of a unit name
- mist.getAoA now accepts a Unit instead of a unit name
- mist.getClimbAngle now accepts a Unit instead of a unit name
- mist.demos.printAngles now accepts a Unit instead of a unit name 
- renamed mist.demos.printAngles to mist.demos.printFlightData
- mist.demos.printFlgihtData now additionally displays absolute velocity, absolute acceleration, Yaw plus AoA, transverse G loading, axial G loading, absolute G loading, energy, dE/dt
- added country, countryId, and coalition to the group level of the DBs.

- added energy, dE/dt, G loading 

- added mist.build, mist.majorVersion, mist.minorVersion
   - mist.build - the build version.  Increments every time changes are made and debugged.
   - mist.majorVersion - changes with publicly released major content additions
   - mist.minorVersion - changes with publicly released bug fixes/minor edits.

- added a "Mist version X.X.X loaded." message to dcs.log.

- FIXED A BUG WITH mist.scheduleFunction where functions with rep values would not run!!!!
- Adjusted timer.scheduleFunction in mist.main.
 
- mist.DBs.deadObjects should now behave properly when an object dies that has the same runtime id_ value of another object that has previously died (no longer uses the __newindex metatable event).
- mist.addEventHandler now returns an integer value for id, rather than accepts a variable for id (this makes it more like mist.scheduleFunction).
- mist.removeEventHandler now returns true or false
]]

--[[v008 changelog
- added mist.DBs.missionData   (database of basic mission information. Start time, theatre of war, and filenames saved within mission
- added mist.DBs.removedAliveUnits
- some debug messages commented out

- fixed? a bug with mist.DBs.dead_objects when trying to list dead players
	also, dead objects with duplicate runtime ids as a previous dead object will be indexed differently (as a string, such as "11454224 #1")
- fixed an oversight with mist.DBs.aliveUnits where units that were dead would be listed.

- renamed mist.schedule_function to mist.scheduleFunction
- renamed mist.remove_function to mist.removeFunction
- renamed mist.utils.deepcopy to mist.utils.deepCopy
- renamed mist.utils.TypeCheck to mist.utils.typeCheck
- renamed mist.utils.serialize_wcycles to mist.utils.serializeWithCycles
- renamed mist.utils.one_line_serialize to mist.utils.oneLineSerialize
- renamed mist.utils.tableshow to mist.utils.tableShow
- renamed mist.debug.write_data to mist.debug.writeData
- renamed mist.debug.dump_DBs to mist.debug.dumpDBs
- renamed mist.DBs.zones_by_name to mist.DBs.zonesByName
- renamed mist.DBs.zones_by_num to mist.DBs.zonesByNum
- renamed mist.DBs.NavPoints to mist.DBs.navPoints
- renamed mist.DBs.units_by_name to mist.DBs.unitsByName
- renamed mist.DBs.units_by_Id to mist.DBs.unitsById 
- renamed mist.DBs.units_by_cat to mist.DBs.unitsByCat
- renamed mist.DBs.units_by_num to mist.DBs.unitsByNum
- renamed mist.DBs.groups_by_name to mist.DBs.groupsByName
- renamed mist.DBs.groups_by_Id to mist.DBs.groupsById
- renamed mist.DBs.humans_by_name to mist.DBs.humansByName
- renamed mist.DBs.humans_by_Id to mist.DBs.humansById
- renamed mist.DBs.alive_units to mist.DBs.aliveUnits
- renamed mist.DBs.dead_objects to mist.DBs.deadObjects
- renamed mist.UnitsInZonesByName to mist.unitsInZonesByName
- renamed mist.UnitsInMovingZonesByName to mist.unitsInMovingZonesByName
- renamed mist.UnitsLOS to mist.unitsLOSByName

DB field name changes:
Unit -> unit
rt_id removed
Object -> object
ObjectType -> objectType
ObjectPos -> objectPos
ObjectData -> objectData
country_id -> countryId
unit_name -> unitName
group_name -> groupName
resources -> files
]]

--[[v007 change log
- added mist.DBs.zones_by_name  	(DB of trigger zones placed in editor, organized by name)
- added mist.DBs.zones_by_num		(DB of trigger zones placed in editor, in numerical order)
- added mist.DBs.NavPoints		(DB of Initial Points/nav points placed in editor, sorted by coalition)


- added mist.getDeadMapObjsInZonesByName
- added mist.getDeadMapObjsInPolygonZone 

- added mist.mapobjs_dead_in_zones
- added mist.mapobjs_dead_in_polygon_zone

]]

--[[ v006 change log
- added mist.units_in_polygon_zone
- added maxalt variable to mist.pointInPolygon  -- Code from http://softsurfer.com/Archive/algorithm_0103/algorithm_0103.htm
- fixed probable bug with stopflag conditions in trigger functions
- mist.units_in_zones now uses new type check function, so it needs to be re-tested.
- added mist.units_in_moving_zones
- fixed a bug with mist.getGroupPoints
- fixed a bug with mist.pointInPolygon

]]
--[[ v005 change log  (changes over uploaded v004:)

- Added mist.debug
- Added mist.debug.dump_DBs
- mist.utils.write_table renamed to mist.debug.write_data 
- mist.utils.dump_G renamed to mist.debug.dump_G
- error messages adjusted in mist.debug.dump_G and mist.debug.write_data

- mist.demos.printAngles now accepts unitname string input variable

- added mist.DBs.units_by_cat (units by category, such as ship, plane, vehicle, helicopter, static).  Inside each category, units indexed numerically.

- added mist.DBs.units_by_num - units, indexed numerically (BUT NOT BY unitId!).

- added mist.DBs.alive_units - indexed by runtime id_, contains all the alive units (not static objects) (same info as in the other DBs), 
  PLUS the alive unit's Unit object, and Pos3 position.  Updated no less frequently than once per second.
     
	 - added update_alive_units coroutine to populate this table.
	 - modified mist.main to run this coroutine.
	(NOTE TO SELF: May need to make an old_alive_units table too)

- mist.DBs.dead_objects table added- table of dead objects, indexed by runtime id_.  
	Example entries:
	mist.DBs.dead_objects = {
		[11553252] = {
			object = { id_ = 11553252 },
			objectType = 'vehicle',
			objectData = { ..... }, -- the same data contained in the alive_units entry for this vehicle
			Pos = {x = -562214.67543, y = 2243.4221, z = 1150221.54514 }, -- Position the vehicle died at.
		},
		[16231153] = {
			object = { id_ = 16231153 },
			objectType = 'static',
			objectData = { ..... }, -- the same data contained in the regular DBs for this static object
			Pos = {x = -6423121.23342, y = 152.1231, z = 1055212.331 }, --Position the static object died at.
		},
		[123555223] = {
			object = { id_ = 123555223 },
			objectType = 'building',
			Pos = {x = -505213.5532, y = 531.3365, z = 10733913.33214 }, --Position the map object died at
		},
		[21255292] = {
			object = { id_ = 21255292 },  -- object that could be be correlated to a unit, or a static object, and that getPosition failed on.
			objectType = 'unknown',
		},
	}
	
	- added default event handler to add objects to mist.dead_objects
	- modified __newindex metamethod for mist.DBs.dead_objects to derive dead object properites

]]
--MiST Mission Scripting Tools
mist = {}

-- don't change these
mist.majorVersion = 3
mist.minorVersion = 3
mist.build = 22 

--------------------------------------------------------------------------------------------------------------
-- the main area
do
	local coroutines = {}
	
	local function update_alive_units()  -- coroutine function
		local lalive_units = mist.DBs.aliveUnits -- local references for faster execution
		local lunits = mist.DBs.unitsByNum
		local ldeepcopy = mist.utils.deepCopy
		local lUnit = Unit
		local lremovedAliveUnits = mist.DBs.removedAliveUnits
		local updatedUnits = {}
		
		if #lunits > 0 then
			local units_per_run = math.ceil(#lunits/20)
			if units_per_run < 5 then
				units_per_run = 5
			end
			
			for i = 1, #lunits do
				if lunits[i].category ~= 'static' then -- can't get statics with Unit.getByName :(
					local unit = lUnit.getByName(lunits[i].unitName)
					if unit then
						--print('unit named ' .. lunits[i].unitName .. ' alive!')
						local pos = unit:getPosition()
						local newtbl = ldeepcopy(lunits[i])
						if pos then
							newtbl['pos'] = pos.p
						end
						newtbl['unit'] = unit
						--newtbl['rt_id'] = unit.id_
						lalive_units[unit.id_] = newtbl
						updatedUnits[unit.id_] = true
					end
				end
				if i%units_per_run == 0 then  
					--print('yielding at: ' .. tostring(i))
					coroutine.yield()
					--print('resuming at: ' .. tostring(i))
				end
			end
			-- All units updated, remove any "alive" units that were not updated- they are dead!
			for unit_id, unit in pairs(lalive_units) do
				if not updatedUnits[unit_id] then
					lremovedAliveUnits[unit_id] = unit
					lalive_units[unit_id] = nil
				end
			end
		end
	end
	local update_alive_units_counter = 0
	
	-- THE MAIN FUNCTION --   Accessed 100 times/sec.
	mist.main = function()
		timer.scheduleFunction(mist.main, {}, timer.getTime() + 0.01)  --reschedule first in case of Lua error
		----------------------------------------------------------------------------------------------------------
		--area to add new stuff in
		
		
		
		
		-----------------------------------------------------------------------------------------------------------
		--updating alive units
		update_alive_units_counter = update_alive_units_counter + 1
		if update_alive_units_counter == 5 then 
			update_alive_units_counter = 0
			
			if not coroutines.update_alive_units then
				coroutines['update_alive_units'] = coroutine.create(update_alive_units)
			end
			
			coroutine.resume(coroutines.update_alive_units)
			
			if coroutine.status(coroutines.update_alive_units) == 'dead' then
				coroutines.update_alive_units = nil
			end
		end
		
		mist.do_scheduled_functions()
	end -- end of mist.main
	
end
------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
--Modified Slmod task scheduler, superior to timer.scheduleFunction
do
	local Tasks = {}
	local task_id = 0
	--[[ mist.scheduleFunction:
	int id = mist.schedule_task(f function, vars table, t number, rep number, st number)
	id - integer id of this function task
	f - function to run
	vars - table of vars for that function
	t - time to run function
	rep - time between repetitions of this function (OPTIONAL)
	st - time when repetitions of this function will stop automatically (OPTIONAL)
	]]
	mist.scheduleFunction = function(f, vars, t, rep, st)
		--verify correct types
		assert(type(f) == 'function', 'variable 1, expected function, got ' .. type(f))
		assert(type(vars) == 'table' or vars == nil, 'variable 2, expected table or nil, got ' .. type(f))
		assert(type(t) == 'number', 'variable 3, expected number, got ' .. type(t))
		assert(type(rep) == 'number' or rep == nil, 'variable 4, expected number or nil, got ' .. type(rep))
		assert(type(st) == 'number' or st == nil, 'variable 5, expected number or nil, got ' .. type(st))
		if not vars then
			vars = {}
		end
		task_id = task_id + 1
		table.insert(Tasks, {f = f, vars = vars, t = t, rep = rep, st = st, id = task_id})
		return task_id
	end
	
	-- removes a scheduled function based on the function's id.  returns true if successful, false if not successful.
	mist.removeFunction = function(id)
		local i = 1
		while i <= #Tasks do
			if Tasks[i].id == id then
				table.remove(Tasks, i)
			else
				i = i + 1
			end
		end
	end

	--------------------------------------------------------------------------------------------------------------------
	-- not intended for users to use this function.
	mist.do_scheduled_functions = function()
		local i = 1
		while i <= #Tasks do
			if not Tasks[i].rep then -- not a repeated process
				if Tasks[i].t <= timer.getTime() then 
					local Task = Tasks[i] -- local reference
					table.remove(Tasks, i)
					local err, errmsg = pcall(Task.f, unpack(Task.vars, 1, table.maxn(Task.vars)))
					if not err then
						env.info('mist.scheduleFunction, error in scheduled function: ' .. errmsg)
					end
					--Task.f(unpack(Task.vars, 1, table.maxn(Task.vars)))  -- do the task, do not increment i
				else
					i = i + 1
				end
			else
				if Tasks[i].st and Tasks[i].st <= timer.getTime() then   --if a stoptime was specified, and the stop time exceeded
					table.remove(Tasks, i) -- stop time exceeded, do not execute, do not increment i
				elseif Tasks[i].t <= timer.getTime() then
					local Task = Tasks[i] -- local reference
					Task.t = timer.getTime() + Task.rep  --schedule next run
					local err, errmsg = pcall(Task.f, unpack(Task.vars, 1, table.maxn(Task.vars)))
					if not err then
						env.info('mist.scheduleFunction, error in scheduled function: ' .. errmsg)
					end
					--Tasks[i].f(unpack(Tasks[i].vars, 1, table.maxn(Tasks[i].vars)))  -- do the task
					i = i + 1
				else
					i = i + 1
				end
			end
		end
	end

	
end
do
	local idNum = 0

	--Simplified event handler
	mist.addEventHandler = function(f) --id is optional!
		local handler = {}
		idNum = idNum + 1
		handler.id = idNum
		handler.f = f
		handler.onEvent = function(self, event)
			self.f(event)
		end
		world.addEventHandler(handler)
	end

	mist.removeEventHandler = function(id)
		for key, handler in pairs(world.eventHandlers) do
			if handler.id and handler.id == id then
				world.eventHandlers[key] = nil
				return true
			end
		end
		return false
	end

end

----------------------------------------------------------------------------------------------
-- Utils- conversion, Lua utils, etc.
mist.utils = {}

mist.utils.toDegree = function(angle)
	return angle*180/math.pi
end

mist.utils.toRadian = function(angle)
	return angle*math.pi/180
end

mist.utils.metersToNM = function(meters)
	return meters/1852
end

mist.utils.metersToFeet = function(meters)
	return meters/0.3048
end

mist.utils.NMToMeters = function(NM)
	return NM*1852
end

mist.utils.feetToMeters = function(feet)
	return feet*0.3048
end

mist.utils.mpsToKnots = function(mps)
	return mps*3600/1852
end

mist.utils.mpsToKmph = function(mps)
	return mps*3.6
end

mist.utils.knotsToMps = function(knots)
	return knots*1852/3600
end

mist.utils.kmphToMps = function(kmph)
	return kmph/3.6
end

function mist.utils.makeVec2(Vec3)
	if Vec3.z then
		return {x = Vec3.x, y = Vec3.z}
	else
		return {x = Vec3.x, y = Vec3.y}  -- it was actually already vec2.
	end
end

function mist.utils.makeVec3(Vec2, y)
	if not Vec2.z then
		if not y then
			y = 0
		end
		return {x = Vec2.x, y = y, z = Vec2.y}
	else
		return {x = Vec2.x, y = Vec2.y, z = Vec2.z}  -- it was already Vec3, actually.
	end
end

function mist.utils.makeVec3GL(Vec2, offset)
	local adj = offset or 0
	
	if not Vec2.z then
		return {x = Vec2.x, y = (land.getHeight(Vec2) + adj), z = Vec2.y}
	else
		return {x = Vec2.x, y = (land.getHeight({x = Vec2.x, y = Vec2.z}) + adj), z = Vec2.z}
	end
end

mist.utils.zoneToVec3 = function(zone)
	local new = {}
	if type(zone) == 'table' and zone.point then
		new.x = zone.point.x
		new.y = zone.point.y
		new.z = zone.point.z
		return new
	elseif type(zone) == 'string' then
		zone = trigger.misc.getZone(zone)
		if zone then
			new.x = zone.point.x
			new.y = zone.point.y
			new.z = zone.point.z
			return new
		end
	end
end

-- gets heading-error corrected direction from point along vector vec.
function mist.utils.getDir(vec, point)
	local dir = math.atan2(vec.z, vec.x)
	dir = dir + mist.getNorthCorrection(point)
	if dir < 0 then
		dir = dir + 2*math.pi  -- put dir in range of 0 to 2*pi
	end
	return dir
end

-- gets distance in meters between two points (2 dimensional)
function mist.utils.get2DDist(point1, point2)
	point1 = mist.utils.makeVec3(point1)
	point2 = mist.utils.makeVec3(point2)
	return mist.vec.mag({x = point1.x - point2.x, y = 0, z = point1.z - point2.z})
end

-- gets distance in meters between two points (3 dimensional)
function mist.utils.get3DDist(point1, point2)
	return mist.vec.mag({x = point1.x - point2.x, y = point1.y - point2.y, z = point1.z - point2.z})
end





--from http://lua-users.org/wiki/CopyTable
mist.utils.deepCopy = function(object)
	local lookup_table = {}
	local function _copy(object)
		if type(object) ~= "table" then
			return object
		elseif lookup_table[object] then
			return lookup_table[object]
		end
		local new_table = {}
		lookup_table[object] = new_table
		for index, value in pairs(object) do
			new_table[_copy(index)] = _copy(value)
		end
		return setmetatable(new_table, getmetatable(object))
	end
	return _copy(object)
end

-- From http://lua-users.org/wiki/SimpleRound
-- use negative idp for rounding ahead of decimal place, positive for rounding after decimal place
mist.utils.round = function(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

-- porting in Slmod's dostring
mist.utils.dostring = function(s)
	local f, err = loadstring(s)
	if f then
		return true, f()
	else
		return false, err
	end
end


--[[ mist.utils.typeCheck(fname, type_tbl, var_tbl)
Type-checking function:
Checks a var_tbl to a type_tbl.  Returns true if the var_tbl passes the type check, returns false plus an error message if the var_tbl fails.

type_tbl examples: 
type_tbl = { {'table', 'number'}, 'string', 'number', 'number', {'string', 'nil'}, {'number', 'nil'} } 
Compare to a var_tbl with up to six entries; var_tbl index 1 must be a table or a number; index 2, a string; index 3, a number;
index 4, a number; index 5, either a string or nil; and index 6, either a number or nil.

Another example:
type_tbl = { {'text', 'msg', 'text_out'} = 'string', display_time = 'number', display_mode = {'string', 'nil'} coa = {'string', 'nil'}}

var_tbl must have a string at one of the following table keys: "text", "msg", or "text_out".  var_tbl must have a number at table key "display_time", 
the table key "display_mode" must be either a string or nil, and the table key "coa" must be either a string or nil.
]]
function mist.utils.typeCheck(fname, type_tbl, var_tbl)
	--env.info('type check')
	for type_key, type_val in pairs(type_tbl) do
		--print('type_key:')
		--print(type_key)
		--print('type_val:')
		--print(type_val)
		
		--type_key can be a table of accepted keys- so try to find one that is not nil
		local type_key_str = ''
		local act_key = type_key -- actual key within var_tbl - necessary to use for multiple possible key variables.  Initialize to type_key
		if type(type_key) == 'table' then
	
			for i = 1, #type_key do
				if i ~= 1 then
					type_key_str = type_key_str .. '/'
				end
				type_key_str = type_key_str .. tostring(type_key[i])
				if var_tbl[type_key[i]] ~= nil then
					act_key = type_key[i]  -- found a non-nil entry, make act_key now this val.
				end
			end
		else
			type_key_str = tostring(type_key)
		end
		
		local err_msg = 'Error in function ' .. fname .. ', parameter "' .. type_key_str .. '", expected: '
		local passed_check = false
		
		if type(type_tbl[type_key]) == 'table' then
			--print('err_msg, before and after:')
			--print(err_msg)
			for j = 1, #type_tbl[type_key] do
				
				if j == 1 then
					err_msg = err_msg .. type_tbl[type_key][j]
				else
					err_msg = err_msg .. ' or ' .. type_tbl[type_key][j]
				end
				
				if type(var_tbl[act_key]) == type_tbl[type_key][j] then
					passed_check = true
				end
			end
			--print(err_msg)
		else
			--print('err_msg, before and after:')
			--print(err_msg)
			err_msg = err_msg .. type_tbl[type_key]
			--print(err_msg)
			if type(var_tbl[act_key]) == type_tbl[type_key] then
				passed_check = true
				
			end
			
		end
		
		if not passed_check then
			err_msg = err_msg .. ', got ' .. type(var_tbl[act_key])
			return false, err_msg
		end
	end
	return true
end

--porting in Slmod's "safestring" basic serialize
mist.utils.basicSerialize = function(s)
	if s == nil then
		return "\"\""
	else
		if ((type(s) == 'number') or (type(s) == 'boolean') or (type(s) == 'function') or (type(s) == 'table') or (type(s) == 'userdata') ) then
			return tostring(s)
		elseif type(s) == 'string' then
			s = string.format('%q', s)
			return s
		end
	end	
end

--porting in Slmod's serialize_slmod
mist.utils.serialize = function(name, value, level)
	-----Based on ED's serialize_simple2
	local basicSerialize = function (o)
	  if type(o) == "number" then
		return tostring(o)
	  elseif type(o) == "boolean" then
		return tostring(o)
	  else -- assume it is a string
		return mist.utils.basicSerialize(o)
	  end
	end
	
	local serialize_to_t = function (name, value, level)
	----Based on ED's serialize_simple2


	  local var_str_tbl = {}
	  if level == nil then level = "" end
	  if level ~= "" then level = level.."  " end
	  
	  table.insert(var_str_tbl, level .. name .. " = ")
	  
	  if type(value) == "number" or type(value) == "string" or type(value) == "boolean" then
		table.insert(var_str_tbl, basicSerialize(value) ..  ",\n")
	  elseif type(value) == "table" then
		  table.insert(var_str_tbl, "\n"..level.."{\n")
		  
		  for k,v in pairs(value) do -- serialize its fields
			local key
			if type(k) == "number" then
			  key = string.format("[%s]", k)
			else
			  key = string.format("[%q]", k)
			end

			table.insert(var_str_tbl, mist.utils.serialize(key, v, level.."  "))

		  end
		  if level == "" then
			table.insert(var_str_tbl, level.."} -- end of "..name.."\n")

		  else
			table.insert(var_str_tbl, level.."}, -- end of "..name.."\n")

		  end
	  else
		env.info("Cannot serialize a "..type(value))
	  end
	  return var_str_tbl
	end
	
	local t_str = serialize_to_t(name, value, level)
	
	return table.concat(t_str)
end

-- porting in slmod's serialize_wcycles
mist.utils.serializeWithCycles = function(name, value, saved)
	--mostly straight out of Programming in Lua
	local basicSerialize = function (o)
		if type(o) == "number" then
			return tostring(o)
		elseif type(o) == "boolean" then
			return tostring(o)
		else -- assume it is a string
			return mist.utils.basicSerialize(o)
		end
	end
	
	local t_str = {}
	saved = saved or {}       -- initial value
	if ((type(value) == 'string') or (type(value) == 'number') or (type(value) == 'table') or (type(value) == 'boolean')) then
		table.insert(t_str, name .. " = ")
		if type(value) == "number" or type(value) == "string" or type(value) == "boolean" then
			table.insert(t_str, basicSerialize(value) ..  "\n")
		else

			if saved[value] then    -- value already saved?
				table.insert(t_str, saved[value] .. "\n")
			else
				saved[value] = name   -- save name for next time
				table.insert(t_str, "{}\n")
				for k,v in pairs(value) do      -- save its fields
					local fieldname = string.format("%s[%s]", name, basicSerialize(k))
					table.insert(t_str, mist.utils.serializeWithCycles(fieldname, v, saved))
				end
			end
		end
		return table.concat(t_str)
	else
		return ""
	end
end

-- porting in Slmod's serialize_slmod2
mist.utils.oneLineSerialize = function(tbl)  -- serialization of a table all on a single line, no comments, made to replace old get_table_string function
	if type(tbl) == 'table' then --function only works for tables!

		local tbl_str = {}

		tbl_str[#tbl_str + 1] = '{ '
		
		for ind,val in pairs(tbl) do -- serialize its fields
			if type(ind) == "number" then
				tbl_str[#tbl_str + 1] = '[' 
				tbl_str[#tbl_str + 1] = tostring(ind)
				tbl_str[#tbl_str + 1] = '] = '
			else --must be a string
				tbl_str[#tbl_str + 1] = '[' 
				tbl_str[#tbl_str + 1] = mist.utils.basicSerialize(ind)
				tbl_str[#tbl_str + 1] = '] = '
			end
				
			if ((type(val) == 'number') or (type(val) == 'boolean')) then
				tbl_str[#tbl_str + 1] = tostring(val)
				tbl_str[#tbl_str + 1] = ', '		
			elseif type(val) == 'string' then
				tbl_str[#tbl_str + 1] = mist.utils.basicSerialize(val)
				tbl_str[#tbl_str + 1] = ', '
			elseif type(val) == 'nil' then -- won't ever happen, right?
				tbl_str[#tbl_str + 1] = 'nil, '
			elseif type(val) == 'table' then
				tbl_str[#tbl_str + 1] = mist.utils.oneLineSerialize(val)
				tbl_str[#tbl_str + 1] = ', '   --I think this is right, I just added it
			else
				env.info('unable to serialize value type ' .. mist.utils.basicSerialize(type(val)) .. ' at index ' .. tostring(ind))
			end
		
		end
		tbl_str[#tbl_str + 1] = '}'
		return table.concat(tbl_str)
	end
end

--Function to create string for viewing the contents of a table -NOT for serialization
mist.utils.tableShow = function(tbl, loc, indent, tableshow_tbls) --based on serialize_slmod, this is a _G serialization
	tableshow_tbls = tableshow_tbls or {} --create table of tables
	loc = loc or ""
	indent = indent or ""
	if type(tbl) == 'table' then --function only works for tables!
		tableshow_tbls[tbl] = loc
		
		local tbl_str = {}

		tbl_str[#tbl_str + 1] = indent .. '{\n'
		
		for ind,val in pairs(tbl) do -- serialize its fields
			if type(ind) == "number" then
				tbl_str[#tbl_str + 1] = indent 
				tbl_str[#tbl_str + 1] = loc .. '['
				tbl_str[#tbl_str + 1] = tostring(ind)
				tbl_str[#tbl_str + 1] = '] = '
			else
				tbl_str[#tbl_str + 1] = indent 
				tbl_str[#tbl_str + 1] = loc .. '['
				tbl_str[#tbl_str + 1] = mist.utils.basicSerialize(ind)
				tbl_str[#tbl_str + 1] = '] = '
			end
					
			if ((type(val) == 'number') or (type(val) == 'boolean')) then
				tbl_str[#tbl_str + 1] = tostring(val)
				tbl_str[#tbl_str + 1] = ',\n'		
			elseif type(val) == 'string' then
				tbl_str[#tbl_str + 1] = mist.utils.basicSerialize(val)
				tbl_str[#tbl_str + 1] = ',\n'
			elseif type(val) == 'nil' then -- won't ever happen, right?
				tbl_str[#tbl_str + 1] = 'nil,\n'
			elseif type(val) == 'table' then
				if tableshow_tbls[val] then
					tbl_str[#tbl_str + 1] = tostring(val) .. ' already defined: ' .. tableshow_tbls[val] .. ',\n'
				else
					tableshow_tbls[val] = loc ..  '[' .. mist.utils.basicSerialize(ind) .. ']'
					tbl_str[#tbl_str + 1] = tostring(val) .. ' '
					tbl_str[#tbl_str + 1] = mist.utils.tableShow(val,  loc .. '[' .. mist.utils.basicSerialize(ind).. ']', indent .. '    ', tableshow_tbls)
					tbl_str[#tbl_str + 1] = ',\n'  
				end
			elseif type(val) == 'function' then
				if debug and debug.getinfo then
					fcnname = tostring(val)
					local info = debug.getinfo(val, "S")
					if info.what == "C" then
						tbl_str[#tbl_str + 1] = string.format('%q', fcnname .. ', C function') .. ',\n'
					else 
						if (string.sub(info.source, 1, 2) == [[./]]) then
							tbl_str[#tbl_str + 1] = string.format('%q', fcnname .. ', defined in (' .. info.linedefined .. '-' .. info.lastlinedefined .. ')' .. info.source) ..',\n'
						else
							tbl_str[#tbl_str + 1] = string.format('%q', fcnname .. ', defined in (' .. info.linedefined .. '-' .. info.lastlinedefined .. ')') ..',\n'
						end
					end
					
				else
					tbl_str[#tbl_str + 1] = 'a function,\n'	
				end
			else
				tbl_str[#tbl_str + 1] = 'unable to serialize value type ' .. mist.utils.basicSerialize(type(val)) .. ' at index ' .. tostring(ind)
			end
		end
		
		tbl_str[#tbl_str + 1] = indent .. '}'
		return table.concat(tbl_str)
	end
end

mist.debug = {}

mist.debug.dump_G = function(fname)
	if lfs and io then
		local fdir = lfs.writedir() .. [[Logs\]] .. fname
		local f = io.open(fdir, 'w')
		f:write(mist.utils.tableShow(_G))
		f:close()
		local errmsg = 'mist.debug.dump_G wrote data to ' .. fdir
		env.info(errmsg)
		trigger.action.outText(errmsg, 10)
	else
		local errmsg = 'Error: insufficient libraries to run mist.debug.dump_G, you must disable the sanitization of the io and lfs libraries in ./Scripts/MissionScripting.lua'
		env.info(errmsg)
		trigger.action.outText(errmsg, 10)
	end
end

mist.debug.writeData = function(fcn, fcnVars, fname)
	if lfs and io then
		local fdir = lfs.writedir() .. [[Logs\]] .. fname
		local f = io.open(fdir, 'w')
		f:write(fcn(unpack(fcnVars, 1, table.maxn(fcnVars))))
		f:close()
		local errmsg = 'mist.debug.writeData wrote data to ' .. fdir
		env.info(errmsg)
		trigger.action.outText(errmsg, 10)
	else
		local errmsg = 'Error: insufficient libraries to run mist.debug.writeData, you must disable the sanitization of the io and lfs libraries in ./Scripts/MissionScripting.lua'
		env.info(errmsg)
		trigger.action.outText(errmsg, 10)
	end
end

mist.debug.dumpDBs = function()
	for DBname, DB in pairs(mist.DBs) do
		if type(DB) == 'table' and type(DBname) == 'string' then
			mist.debug.writeData(mist.utils.serialize, {DBname, DB}, 'mist_DBs_' .. DBname .. '.lua')
		end
	end
end

-----------------------------------------------------------------------------------------------------------------
--3D Vector manipulation
mist.vec = {}

mist.vec.add = function(vec1, vec2)
	return {x = vec1.x + vec2.x, y = vec1.y + vec2.y, z = vec1.z + vec2.z}
end

mist.vec.sub = function(vec1, vec2)
	return {x = vec1.x - vec2.x, y = vec1.y - vec2.y, z = vec1.z - vec2.z}
end

mist.vec.scalarMult = function(vec, mult)
	return {x = vec.x*mult, y = vec.y*mult, z = vec.z*mult}
end

mist.vec.scalar_mult = mist.vec.scalarMult

mist.vec.dp = function(vec1, vec2)
	return vec1.x*vec2.x + vec1.y*vec2.y + vec1.z*vec2.z
end

mist.vec.cp = function(vec1, vec2)
	return { x = vec1.y*vec2.z - vec1.z*vec2.y, y = vec1.z*vec2.x - vec1.x*vec2.z, z = vec1.x*vec2.y - vec1.y*vec2.x}
end

mist.vec.mag = function(vec)
	return (vec.x^2 + vec.y^2 + vec.z^2)^0.5
end

mist.vec.getUnitVec = function(vec) 
	local mag = mist.vec.mag(vec)
	return { x = vec.x/mag, y = vec.y/mag, z = vec.z/mag }
end

mist.vec.rotateVec2 = function(vec2, theta)
	return { x = vec2.x*math.cos(theta) - vec2.y*math.sin(theta), y = vec2.x*math.sin(theta) + vec2.y*math.cos(theta)}
end
---------------------------------------------------------------------------------------------------------------------------

-- acc- the accuracy of each easting/northing.  0, 1, 2, 3, 4, or 5.
mist.tostringMGRS = function(MGRS, acc) 
	if acc == 0 then
		return MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph
	else
		return MGRS.UTMZone .. ' ' .. MGRS.MGRSDigraph .. ' ' .. string.format('%0' .. acc .. 'd', mist.utils.round(MGRS.Easting/(10^(5-acc)), 0)) 
		       .. ' ' .. string.format('%0' .. acc .. 'd', mist.utils.round(MGRS.Northing/(10^(5-acc)), 0))
	end
end

--[[acc: 
in DM: decimal point of minutes.  
In DMS: decimal point of seconds.
position after the decimal of the least significant digit:
So:
42.32 - acc of 2.
]]
mist.tostringLL = function(lat, lon, acc, DMS)
	
	local latHemi, lonHemi
	if lat > 0 then
		latHemi = 'N'
	else
		latHemi = 'S'
	end
	
	if lon > 0 then
		lonHemi = 'E'
	else
		lonHemi = 'W'
	end
	
	lat = math.abs(lat)
	lon = math.abs(lon)
	
	local latDeg = math.floor(lat)
	local latMin = (lat - latDeg)*60
	
	local lonDeg = math.floor(lon)
	local lonMin = (lon - lonDeg)*60
	
	if DMS then  -- degrees, minutes, and seconds.
		local oldLatMin = latMin
		latMin = math.floor(latMin)
		local latSec = mist.utils.round((oldLatMin - latMin)*60, acc)
		
		local oldLonMin = lonMin
		lonMin = math.floor(lonMin)
		local lonSec = mist.utils.round((oldLonMin - lonMin)*60, acc)
		
		if latSec == 60 then
			latSec = 0
			latMin = latMin + 1
		end
			
		if lonSec == 60 then
			lonSec = 0
			lonMin = lonMin + 1
		end
		
		local secFrmtStr -- create the formatting string for the seconds place
		if acc <= 0 then  -- no decimal place.
			secFrmtStr = '%02d'
		else
			local width = 3 + acc  -- 01.310 - that's a width of 6, for example.
			secFrmtStr = '%0' .. width .. '.' .. acc .. 'f'
		end
		
		return string.format('%02d', latDeg) .. ' ' .. string.format('%02d', latMin) .. '\' ' .. string.format(secFrmtStr, latSec) .. '"' .. latHemi .. '   '
		       .. string.format('%02d', lonDeg) .. ' ' .. string.format('%02d', lonMin) .. '\' ' .. string.format(secFrmtStr, lonSec) .. '"' .. lonHemi

	else  -- degrees, decimal minutes.
		latMin = mist.utils.round(latMin, acc)
		lonMin = mist.utils.round(lonMin, acc)
		
		if latMin == 60 then
			latMin = 0
			latDeg = latDeg + 1
		end
			
		if lonMin == 60 then
			lonMin = 0
			lonDeg = lonDeg + 1
		end
		
		local minFrmtStr -- create the formatting string for the minutes place
		if acc <= 0 then  -- no decimal place.
			minFrmtStr = '%02d'
		else
			local width = 3 + acc  -- 01.310 - that's a width of 6, for example.
			minFrmtStr = '%0' .. width .. '.' .. acc .. 'f'
		end
		
		return string.format('%02d', latDeg) .. ' ' .. string.format(minFrmtStr, latMin) .. '\'' .. latHemi .. '   '
	   .. string.format('%02d', lonDeg) .. ' ' .. string.format(minFrmtStr, lonMin) .. '\'' .. lonHemi
	
	end
end

--[[ required: az - radian
     required: dist - meters
	 optional: alt - meters (set to false or nil if you don't want to use it).
	 optional: metric - set true to get dist and alt in km and m.
	 precision will always be nearest degree and NM or km.]]
mist.tostringBR = function(az, dist, alt, metric)
	az = mist.utils.round(mist.utils.toDegree(az), 0)
	
	if metric then
		dist = mist.utils.round(dist/1000, 0)
	else
		dist = mist.utils.round(mist.utils.metersToNM(dist), 0)
	end
	
	local s = string.format('%03d', az) .. ' for ' .. dist
	
	if alt then
		if metric then
			s = s .. ' at ' .. mist.utils.round(alt, 0)
		else
			s = s .. ' at ' .. mist.utils.round(mist.utils.metersToFeet(alt), 0)
		end
	end	
	return s
end

mist.getNorthCorrection = function(point)  --gets the correction needed for true north
	if not point.z then --Vec2; convert to Vec3
		point.z = point.y
		point.y = 0
	end
	local lat, lon = coord.LOtoLL(point)
	local north_posit = coord.LLtoLO(lat + 1, lon)
	return math.atan2(north_posit.z - point.z, north_posit.x - point.x)
end

function mist.getGroupPoints(groupname)   -- if groupname exists in env.mission, then returns table of the group's points in numerical order, such as: { [1] = {x = 299435.224, y = -1146632.6773}, [2] = { x = 663324.6563, y = 322424.1112}}
	for coa_name, coa_data in pairs(env.mission.coalition) do
		if (coa_name == 'red' or coa_name == 'blue') and type(coa_data) == 'table' then			
			if coa_data.country then --there is a country table
				for cntry_id, cntry_data in pairs(coa_data.country) do
					for obj_type_name, obj_type_data in pairs(cntry_data) do
						if obj_type_name == "helicopter" or obj_type_name == "ship" or obj_type_name == "plane" or obj_type_name == "vehicle" then	-- only these types have points						
							if ((type(obj_type_data) == 'table') and obj_type_data.group and (type(obj_type_data.group) == 'table') and (#obj_type_data.group > 0)) then  --there's a group!				
								for group_num, group_data in pairs(obj_type_data.group) do		
									if group_data and group_data.name and group_data.name == groupname then -- this is the group we are looking for
										if group_data.route and group_data.route.points and #group_data.route.points > 0 then
											local points = {}
											for point_num, point in pairs(group_data.route.points) do
												if not point.point then
													points[point_num] = { x = point.x, y = point.y }
												else
													points[point_num] = point.point  --it's possible that the ME could move to the point = Vec2 notation.
												end
											end
											return points
										end
										return
									end  --if group_data and group_data.name and group_data.name == 'groupname'
								end --for group_num, group_data in pairs(obj_type_data.group) do		
							end --if ((type(obj_type_data) == 'table') and obj_type_data.group and (type(obj_type_data.group) == 'table') and (#obj_type_data.group > 0)) then	
						end --if obj_type_name == "helicopter" or obj_type_name == "ship" or obj_type_name == "plane" or obj_type_name == "vehicle" or obj_type_name == "static" then
					end --for obj_type_name, obj_type_data in pairs(cntry_data) do
				end --for cntry_id, cntry_data in pairs(coa_data.country) do
			end --if coa_data.country then --there is a country table
		end --if coa_name == 'red' or coa_name == 'blue' and type(coa_data) == 'table' then	
	end --for coa_name, coa_data in pairs(mission.coalition) do
end



--[[ table attitude = getAttitude(string unitname) -- will work on any unit, even if not an aircraft.

attitude = { 
	Heading = number, -- in radians, range of 0 to 2*pi, relative to true north
	Pitch = number, -- in radians, range of -pi/2 to pi/2
	Roll = number, -- in radians, range of 0 to 2*pi, right roll is positive direction
	
	--Yaw, AoA, ClimbAngle - relative to earth reference- DOES NOT TAKE INTO ACCOUNT WIND.
	Yaw = number, -- in radians, range of -pi to pi, right yaw is positive direction
	AoA = number, -- in radians, range of -pi to pi, rotation of aircraft to the right in comparison to flight direction being positive
	ClimbAngle = number, -- in radians, range of -pi/2 to pi/2
	
	--Maybe later?
	AxialVel = table, velocity of the aircraft transformed into directions of aircraft axes
	Speed = number -- absolute velocity in meters/sec

	} 

]]
function mist.getAttitude(unit)
	local unitpos = unit:getPosition()
	if unitpos then
		
		local Heading = math.atan2(unitpos.x.z, unitpos.x.x)
		
		Heading = Heading + mist.getNorthCorrection(unitpos.p)
		
		if Heading < 0 then
			Heading = Heading + 2*math.pi  -- put heading in range of 0 to 2*pi
		end
		---- heading complete.----
		
		local Pitch = math.asin(unitpos.x.y)
		---- pitch complete.----
		
		-- now get roll:
		--maybe not the best way to do it, but it works.
		
		--first, make a vector that is perpendicular to y and unitpos.x with cross product
		local cp = mist.vec.cp(unitpos.x, {x = 0, y = 1, z = 0})
		
		--now, get dot product of of this cross product with unitpos.z
		local dp = mist.vec.dp(cp, unitpos.z)
		
		--now get the magnitude of the roll (magnitude of the angle between two vectors is acos(vec1.vec2/|vec1||vec2|)
		local Roll = math.acos(dp/(mist.vec.mag(cp)*mist.vec.mag(unitpos.z)))

		--now, have to get sign of roll.
		-- by convention, making right roll positive
		-- to get sign of roll, use the y component of unitpos.z.  For right roll, y component is negative.
	   
		if unitpos.z.y > 0 then -- left roll, flip the sign of the roll
			Roll = -Roll
		end
		---- roll complete. ----
		
		--now, work on yaw, AoA, climb, and abs velocity
		local Yaw
		local AoA
		local ClimbAngle
		
		-- get unit velocity
		local unitvel = unit:getVelocity()
		if mist.vec.mag(unitvel) ~= 0 then --must have non-zero velocity!
			local AxialVel = {}  --unit velocity transformed into aircraft axes directions
			
			--transform velocity components in direction of aircraft axes.
			AxialVel.x = mist.vec.dp(unitpos.x, unitvel)  
			AxialVel.y = mist.vec.dp(unitpos.y, unitvel)
			AxialVel.z = mist.vec.dp(unitpos.z, unitvel)
			
			--Yaw is the angle between unitpos.x and the x and z velocities
			--define right yaw as positive
			Yaw = math.acos(mist.vec.dp({x = 1, y = 0, z = 0}, {x = AxialVel.x, y = 0, z = AxialVel.z})/mist.vec.mag({x = AxialVel.x, y = 0, z = AxialVel.z}))
			
			--now set correct direction:
			if AxialVel.z > 0 then
				Yaw = -Yaw
			end
			
			-- AoA is angle between unitpos.x and the x and y velocities
			AoA = math.acos(mist.vec.dp({x = 1, y = 0, z = 0}, {x = AxialVel.x, y = AxialVel.y, z = 0})/mist.vec.mag({x = AxialVel.x, y = AxialVel.y, z = 0}))
			
			--now set correct direction:
			if AxialVel.y > 0 then
				AoA = -AoA
			end
			
			ClimbAngle = math.asin(unitvel.y/mist.vec.mag(unitvel))
		end
		return { Heading = Heading, Pitch = Pitch, Roll = Roll, Yaw = Yaw, AoA = AoA, ClimbAngle = ClimbAngle}
	else
		env.info('unit:getPosition() is nil!')
	end
end

function mist.getHeading(unit)
	local unitpos = unit:getPosition()
	if unitpos then
		local Heading = math.atan2(unitpos.x.z, unitpos.x.x)
		
		Heading = Heading + mist.getNorthCorrection(unitpos.p)
		
		if Heading < 0 then
			Heading = Heading + 2*math.pi  -- put heading in range of 0 to 2*pi
		end
		return Heading
	end
end

function mist.getPitch(unit)
	local unitpos = unit:getPosition()
	if unitpos then
		return math.asin(unitpos.x.y)
	end
end

function mist.getRoll(unit)
	local unitpos = unit:getPosition()
	if unitpos then
		-- now get roll:
		--maybe not the best way to do it, but it works.
		
		--first, make a vector that is perpendicular to y and unitpos.x with cross product
		local cp = mist.vec.cp(unitpos.x, {x = 0, y = 1, z = 0})
		
		--now, get dot product of of this cross product with unitpos.z
		local dp = mist.vec.dp(cp, unitpos.z)
		
		--now get the magnitude of the roll (magnitude of the angle between two vectors is acos(vec1.vec2/|vec1||vec2|)
		local Roll = math.acos(dp/(mist.vec.mag(cp)*mist.vec.mag(unitpos.z)))

		--now, have to get sign of roll.
		-- by convention, making right roll positive
		-- to get sign of roll, use the y component of unitpos.z.  For right roll, y component is negative.
	   
		if unitpos.z.y > 0 then -- left roll, flip the sign of the roll
			Roll = -Roll
		end
		return Roll
	end
end

function mist.getYaw(unit)
	local unitpos = unit:getPosition()
	if unitpos then
		-- get unit velocity
		local unitvel = unit:getVelocity()
		if mist.vec.mag(unitvel) ~= 0 then --must have non-zero velocity!
			local AxialVel = {}  --unit velocity transformed into aircraft axes directions
			
			--transform velocity components in direction of aircraft axes.
			AxialVel.x = mist.vec.dp(unitpos.x, unitvel)  
			AxialVel.y = mist.vec.dp(unitpos.y, unitvel)
			AxialVel.z = mist.vec.dp(unitpos.z, unitvel)
			
			--Yaw is the angle between unitpos.x and the x and z velocities
			--define right yaw as positive
			local Yaw = math.acos(mist.vec.dp({x = 1, y = 0, z = 0}, {x = AxialVel.x, y = 0, z = AxialVel.z})/mist.vec.mag({x = AxialVel.x, y = 0, z = AxialVel.z}))
			
			--now set correct direction:
			if AxialVel.z > 0 then
				Yaw = -Yaw
			end
			return Yaw	
		end
	end
end

function mist.getAoA(unit)
	local unitpos = unit:getPosition()
	if unitpos then
		local unitvel = unit:getVelocity()
		if mist.vec.mag(unitvel) ~= 0 then --must have non-zero velocity!
			local AxialVel = {}  --unit velocity transformed into aircraft axes directions
			
			--transform velocity components in direction of aircraft axes.
			AxialVel.x = mist.vec.dp(unitpos.x, unitvel)  
			AxialVel.y = mist.vec.dp(unitpos.y, unitvel)
			AxialVel.z = mist.vec.dp(unitpos.z, unitvel)
			
			-- AoA is angle between unitpos.x and the x and y velocities
			local AoA = math.acos(mist.vec.dp({x = 1, y = 0, z = 0}, {x = AxialVel.x, y = AxialVel.y, z = 0})/mist.vec.mag({x = AxialVel.x, y = AxialVel.y, z = 0}))
			
			--now set correct direction:
			if AxialVel.y > 0 then
				AoA = -AoA
			end
			return AoA
		end
	end
end

function mist.getClimbAngle(unit)
	local unitpos = unit:getPosition()
	if unitpos then
		local unitvel = unit:getVelocity()
		if mist.vec.mag(unitvel) ~= 0 then --must have non-zero velocity!
			return math.asin(unitvel.y/mist.vec.mag(unitvel))
		end
	end
end
-----------------------------------------------------------------------------------------------------------
-- Database building
mist.DBs = {}

mist.DBs.missionData = {}
-----------------------------------------
if env.mission then 
	
	mist.DBs.missionData['startTime'] = env.mission.start_time
	mist.DBs.missionData['theatre'] = env.mission.theatre
	mist.DBs.missionData['version'] = env.mission.version
	mist.DBs.missionData['files'] = {}
	if type(env.mission.resourceCounter) == 'table' then
		for fIndex, fData in pairs (env.mission.resourceCounter) do
			mist.DBs.missionData.files[#mist.DBs.missionData.files + 1] =  mist.utils.deepCopy(fIndex)
		end
	end
	mist.DBs.missionData['bullseye'] = {['red'] = {}, ['blue'] = {}} -- if we add more coalition specific data then bullsye should be categorized by coaliton. For now its just the bullseye table
	mist.DBs.missionData.bullseye.red['x'] = env.mission.coalition.red.bullseye.x --should it be point.x?
	mist.DBs.missionData.bullseye.red['y'] = env.mission.coalition.red.bullseye.y
	mist.DBs.missionData.bullseye.blue['x'] = env.mission.coalition.blue.bullseye.x
	mist.DBs.missionData.bullseye.blue['y'] = env.mission.coalition.blue.bullseye.y
	
end

----------------------------------------

mist.DBs.zonesByName = {}
mist.DBs.zonesByNum = {}


if env.mission.triggers and env.mission.triggers.zones then
	for zone_ind, zone_data in pairs(env.mission.triggers.zones) do
		if type(zone_data) == 'table' then
			local zone = mist.utils.deepCopy(zone_data)
			zone['point'] = {}  -- point is used by SSE
			zone['point']['x'] = zone_data.x
			zone['point']['y'] = 0
			zone['point']['z'] = zone_data.y
			
			mist.DBs.zonesByName[zone_data.name] = zone
			mist.DBs.zonesByNum[#mist.DBs.zonesByNum + 1] = mist.utils.deepCopy(zone)  --[[deepcopy so that the zone in zones_by_name and the zone in
																								zones_by_num se are different objects.. don't want them linked.]]
		end
	end
end

mist.DBs.navPoints = {}
mist.DBs.units = {}
 --Build mist.db.units and mist.DBs.navPoints
for coa_name, coa_data in pairs(env.mission.coalition) do

	if (coa_name == 'red' or coa_name == 'blue') and type(coa_data) == 'table' then
		mist.DBs.units[coa_name] = {}
		
		----------------------------------------------
		-- build nav points DB
		mist.DBs.navPoints[coa_name] = {}
		if coa_data.nav_points then --navpoints
			--mist.debug.writeData (mist.utils.serialize,{'NavPoints',coa_data.nav_points}, 'NavPoints.txt')
			for nav_ind, nav_data in pairs(coa_data.nav_points) do
				
				if type(nav_data) == 'table' then
					mist.DBs.navPoints[coa_name][nav_ind] = mist.utils.deepCopy(nav_data)

					mist.DBs.navPoints[coa_name][nav_ind]['name'] = nav_data.callsignStr  -- name is a little bit more self-explanatory.
					mist.DBs.navPoints[coa_name][nav_ind]['point'] = {}  -- point is used by SSE, support it.
					mist.DBs.navPoints[coa_name][nav_ind]['point']['x'] = nav_data.x
					mist.DBs.navPoints[coa_name][nav_ind]['point']['y'] = 0
					mist.DBs.navPoints[coa_name][nav_ind]['point']['z'] = nav_data.y
				end
			end
		end
		-------------------------------------------------		
		if coa_data.country then --there is a country table
			for cntry_id, cntry_data in pairs(coa_data.country) do
				
				local countryName = string.lower(cntry_data.name)
				mist.DBs.units[coa_name][countryName] = {}
				mist.DBs.units[coa_name][countryName]["countryId"] = cntry_data.id

				if type(cntry_data) == 'table' then  --just making sure
				
					for obj_type_name, obj_type_data in pairs(cntry_data) do
					
						if obj_type_name == "helicopter" or obj_type_name == "ship" or obj_type_name == "plane" or obj_type_name == "vehicle" or obj_type_name == "static" then --should be an unncessary check 
							
							local category = obj_type_name
							
							if ((type(obj_type_data) == 'table') and obj_type_data.group and (type(obj_type_data.group) == 'table') and (#obj_type_data.group > 0)) then  --there's a group!
							
								mist.DBs.units[coa_name][countryName][category] = {}
								
								for group_num, group_data in pairs(obj_type_data.group) do
									
									if group_data and group_data.units and type(group_data.units) == 'table' then  --making sure again- this is a valid group
											
										mist.DBs.units[coa_name][countryName][category][group_num] = {}
										mist.DBs.units[coa_name][countryName][category][group_num]["groupName"] = group_data.name
										mist.DBs.units[coa_name][countryName][category][group_num]["groupId"] = group_data.groupId	
										mist.DBs.units[coa_name][countryName][category][group_num]["category"] = category
										mist.DBs.units[coa_name][countryName][category][group_num]["coalition"] = coa_name
										mist.DBs.units[coa_name][countryName][category][group_num]["country"] = countryName
										mist.DBs.units[coa_name][countryName][category][group_num]["countryId"] = cntry_id
										mist.DBs.units[coa_name][countryName][category][group_num]["startTime"] = group_data.start_time
										mist.DBs.units[coa_name][countryName][category][group_num]["task"] = group_data.task
										mist.DBs.units[coa_name][countryName][category][group_num]["units"] = {}
															
										for unit_num, unit_data in pairs(group_data.units) do
											local units_tbl = mist.DBs.units[coa_name][countryName][category][group_num]["units"]  --pointer to the units table for this group
											
											units_tbl[unit_num] = {}
											units_tbl[unit_num]["unitName"] = unit_data.name
											units_tbl[unit_num]["type"] = unit_data.type
											units_tbl[unit_num]["skill"] = unit_data.skill  --will be nil for statics
											units_tbl[unit_num]["unitId"] = unit_data.unitId
											units_tbl[unit_num]["category"] = category
											units_tbl[unit_num]["coalition"] = coa_name
											units_tbl[unit_num]["country"] = countryName
											units_tbl[unit_num]["countryId"] = cntry_id
											units_tbl[unit_num]["heading"] = unit_data.heading
											units_tbl[unit_num]["playerCanDrive"] = unit_data.playerCanDrive
											units_tbl[unit_num]["alt"] = unit_data.alt
											units_tbl[unit_num]["alt_type"] = unit_data.alt_type
											units_tbl[unit_num]["speed"] = unit_data.speed
											units_tbl[unit_num]["livery_id"] = unit_data.livery_id
											if unit_data.point then  --ME currently does not work like this, but it might one day
												units_tbl[unit_num]["point"] = unit_data.point
											else
												units_tbl[unit_num]["point"] = {}
												units_tbl[unit_num]["point"]["x"] = unit_data.x
												units_tbl[unit_num]["point"]["y"] = unit_data.y
											end
											
											
											units_tbl[unit_num]["shape_name"] = unit_data.shape_name
											
											units_tbl[unit_num]["groupName"] = group_data.name
											units_tbl[unit_num]["groupId"] = group_data.groupId
										end --for unit_num, unit_data in pairs(group_data.units) do
									end --if group_data and group_data.units then
								end --for group_num, group_data in pairs(obj_type_data.group) do
							end --if ((type(obj_type_data) == 'table') and obj_type_data.group and (type(obj_type_data.group) == 'table') and (#obj_type_data.group > 0)) then
						end --if obj_type_name == "helicopter" or obj_type_name == "ship" or obj_type_name == "plane" or obj_type_name == "vehicle" or obj_type_name == "static" then
					end --for obj_type_name, obj_type_data in pairs(cntry_data) do
				end --if type(cntry_data) == 'table' then
			end --for cntry_id, cntry_data in pairs(coa_data.country) do
		end --if coa_data.country then --there is a country table
	end --if coa_name == 'red' or coa_name == 'blue' and type(coa_data) == 'table' then
end --for coa_name, coa_data in pairs(mission.coalition) do

mist.DBs.unitsByName = {}
mist.DBs.unitsById = {}
mist.DBs.unitsByCat = {}

mist.DBs.unitsByCat['helicopter'] = {}  -- adding default categories
mist.DBs.unitsByCat['plane'] = {}
mist.DBs.unitsByCat['ship'] = {}
mist.DBs.unitsByCat['static'] = {}
mist.DBs.unitsByCat['vehicle'] = {}

mist.DBs.unitsByNum = {}

mist.DBs.groupsByName = {}
mist.DBs.groupsById = {}
mist.DBs.humansByName = {}
mist.DBs.humansById = {}

mist.DBs.dynGroupsAdded = {} -- will be filled by mist.dbUpdate from dynamically spawned groups

mist.DBs.aliveUnits = {}  -- will be filled in by the "update_alive_units" coroutine in mist.main.

mist.DBs.removedAliveUnits = {} -- will be filled in by the "update_alive_units" coroutine in mist.main.
-- create mist.DBs.oldAliveUnits
-- do
	-- local intermediate_alive_units = {}  -- between 0 and 0.5 secs old
	-- local function make_old_alive_units() -- called every 0.5 secs, makes the old_alive_units DB which is just a copy of alive_units that is 0.5 to 1 sec old
		-- if intermediate_alive_units then 
			-- mist.DBs.oldAliveUnits = mist.utils.deepCopy(intermediate_alive_units)
		-- end
		-- intermediate_alive_units = mist.utils.deepCopy(mist.DBs.aliveUnits) 
		-- timer.scheduleFunction(make_old_alive_units, nil, timer.getTime() + 0.5) 
	-- end
	
	-- make_old_alive_units()
-- end


--Build DBs
for coa_name, coa_data in pairs(mist.DBs.units) do
	for cntry_name, cntry_data in pairs(coa_data) do
		for category_name, category_data in pairs(cntry_data) do
			if type(category_data) == 'table' then
				for group_ind, group_data in pairs(category_data) do
					if type(group_data) == 'table' and group_data.units and type(group_data.units) == 'table' and #group_data.units > 0 then  -- OCD paradigm programming
						mist.DBs.groupsByName[group_data.groupName] = mist.utils.deepCopy(group_data)
						mist.DBs.groupsById[group_data.groupId] = mist.utils.deepCopy(group_data)
						for unit_ind, unit_data in pairs(group_data.units) do
							mist.DBs.unitsByName[unit_data.unitName] = mist.utils.deepCopy(unit_data)
							mist.DBs.unitsById[unit_data.unitId] = mist.utils.deepCopy(unit_data)
			
							mist.DBs.unitsByCat[unit_data.category] = mist.DBs.unitsByCat[unit_data.category] or {} -- future-proofing against new categories...
							table.insert(mist.DBs.unitsByCat[unit_data.category], mist.utils.deepCopy(unit_data))
							--print('inserting ' .. unit_data.unitName)
							table.insert(mist.DBs.unitsByNum, mist.utils.deepCopy(unit_data))
							
							if unit_data.skill and (unit_data.skill == "Client" or unit_data.skill == "Player") then
								mist.DBs.humansByName[unit_data.unitName] = mist.utils.deepCopy(unit_data)
								mist.DBs.humansById[unit_data.unitId] = mist.utils.deepCopy(unit_data)
							end
						end
					end
				end
			end
		end
	end
end

--------------
--DynDBs
mist.DBs.MEunits = mist.utils.deepCopy(mist.DBs.units)
mist.DBs.MEunitsByName = mist.utils.deepCopy(mist.DBs.unitsByName)
mist.DBs.MEunitsById = mist.utils.deepCopy(mist.DBs.unitsById)
mist.DBs.MEunitsByCat = mist.utils.deepCopy(mist.DBs.unitsByCat)
mist.DBs.MEunitsByNum = mist.utils.deepCopy(mist.DBs.unitsByNum)
mist.DBs.MEgroupsByName = mist.utils.deepCopy(mist.DBs.groupsByName)
mist.DBs.MEgroupsById = mist.utils.deepCopy(mist.DBs.groupsByID)
-------------


mist.DBs.deadObjects = {}

do
	local mt = {}
	
	mt.__newindex = function(t, key, val)
		---------------------------------------------------------------
		local original_key = key --only for duplicate runtime IDs.
		local key_ind = 1
		while mist.DBs.deadObjects[key] do
			--print('duplicate runtime id of previously dead object- key: ' .. tostring(key))
			key = tostring(original_key) .. ' #' .. tostring(key_ind)
			key_ind = key_ind + 1
		end
		---------------------------------------------------------------
		
		if mist.DBs.aliveUnits and mist.DBs.aliveUnits[val.object.id_] then
			--print('object found in alive_units')
			val['objectData'] = mist.utils.deepCopy(mist.DBs.aliveUnits[val.object.id_])
			local pos = Object.getPosition(val.object)
			if pos then
				val['objectPos'] = pos.p
			end
			val['objectType'] = mist.DBs.aliveUnits[val.object.id_].category
		
		elseif mist.DBs.removedAliveUnits and mist.DBs.removedAliveUnits[val.object.id_] then  -- it didn't exist in alive_units, check old_alive_units
			--print('object found in old_alive_units')
			val['objectData'] = mist.utils.deepCopy(mist.DBs.removedAliveUnits[val.object.id_])
			local pos = Object.getPosition(val.object)
			if pos then
				val['objectPos'] = pos.p
			end
			val['objectType'] = mist.DBs.removedAliveUnits[val.object.id_].category
			
		else  --attempt to determine if static object...
			--print('object not found in alive units or old alive units')
			local pos = Object.getPosition(val.object)
			if pos then
				local static_found = false
				for ind, static in pairs(mist.DBs.unitsByCat['static']) do
					if ((pos.p.x - static.point.x)^2 + (pos.p.z - static.point.y)^2)^0.5 < 0.1 then --really, it should be zero...
						--print('correlated dead static object to position')
						val['objectData'] = static
						val['objectPos'] = pos.p
						val['objectType'] = 'static'
						static_found = true
						break
					end
				end
				if not static_found then
					val['objectPos'] = pos.p
					val['objectType'] = 'building'
				end
			else
				val['objectType'] = 'unknown'
			end
		end
		rawset(t, key, val)
	end

	setmetatable(mist.DBs.deadObjects, mt)
end

-- Event handler to start creating the dead_objects table
do 

	local function addDeadObject(event)
		if event.id == world.event.S_EVENT_DEAD or event.id == world.event.S_EVENT_CRASH then
			if event.initiator and event.initiator.id_ and event.initiator.id_ > 0 then
			
				local id = event.initiator.id_  -- initial ID, could change if there is a duplicate id_ already dead.
				local val = {object = event.initiator} -- the new entry in mist.DBs.deadObjects.
				
				---------------------------------------------------------------
				local original_id = id  --only for duplicate runtime IDs.
				local id_ind = 1
				while mist.DBs.deadObjects[id] do
					--print('duplicate runtime id of previously dead object- id: ' .. tostring(id))
					id = tostring(original_id) .. ' #' .. tostring(id_ind)
					id_ind = id_ind + 1
				end
				---------------------------------------------------------------
				
				if mist.DBs.aliveUnits and mist.DBs.aliveUnits[val.object.id_] then
					--print('object found in alive_units')
					val['objectData'] = mist.utils.deepCopy(mist.DBs.aliveUnits[val.object.id_])
					local pos = Object.getPosition(val.object)
					if pos then
						val['objectPos'] = pos.p
					end
					val['objectType'] = mist.DBs.aliveUnits[val.object.id_].category
				
				elseif mist.DBs.removedAliveUnits and mist.DBs.removedAliveUnits[val.object.id_] then  -- it didn't exist in alive_units, check old_alive_units
					--print('object found in old_alive_units')
					val['objectData'] = mist.utils.deepCopy(mist.DBs.removedAliveUnits[val.object.id_])
					local pos = Object.getPosition(val.object)
					if pos then
						val['objectPos'] = pos.p
					end
					val['objectType'] = mist.DBs.removedAliveUnits[val.object.id_].category
					
				else  --attempt to determine if static object...
					--print('object not found in alive units or old alive units')
					local pos = Object.getPosition(val.object)
					if pos then
						local static_found = false
						for ind, static in pairs(mist.DBs.unitsByCat['static']) do
							if ((pos.p.x - static.point.x)^2 + (pos.p.z - static.point.y)^2)^0.5 < 0.1 then --really, it should be zero...
								--print('correlated dead static object to position')
								val['objectData'] = static
								val['objectPos'] = pos.p
								val['objectType'] = 'static'
								static_found = true
								break
							end
						end
						if not static_found then
							val['objectPos'] = pos.p
							val['objectType'] = 'building'
						end
					else
						val['objectType'] = 'unknown'
					end
				end
				mist.DBs.deadObjects[id] = val

			end
		end
	end

	
	mist.addEventHandler(addDeadObject)
	
end





function mist.makeUnitTable(tbl)

--[[
Prefixes:
"[-u]<unit name>" - subtract this unit if its in the table
"[g]<group name>" - add this group to the table
"[-g]<group name>" - subtract this group from the table
"[c]<country name>"  - add this country's units
"[-c]<country name>" - subtract this country's units if any are in the table

Stand-alone identifiers
"[all]" - add all units
"[-all]" - subtract all units (not very useful by itself)
"[blue]" - add all blue units
"[-blue]" - subtract all blue units
"[red]" - add all red coalition units
"[-red]" - subtract all red units

Compound Identifiers:
"[c][helicopter]<country name>"  - add all of this country's helicopters
"[-c][helicopter]<country name>" - subtract all of this country's helicopters
"[c][plane]<country name>"  - add all of this country's planes
"[-c][plane]<country name>" - subtract all of this country's planes
"[c][ship]<country name>"  - add all of this country's ships
"[-c][ship]<country name>" - subtract all of this country's ships
"[c][vehicle]<country name>"  - add all of this country's vehicles
"[-c][vehicle]<country name>" - subtract all of this country's vehicles

"[all][helicopter]" -  add all helicopters
"[-all][helicopter]" - subtract all helicopters
"[all][plane]" - add all  planes
"[-all][plane]" - subtract all planes
"[all][ship]" - add all ships
"[-all][ship]" - subtract all ships
"[all][vehicle]" - add all vehicles
"[-all][vehicle]" - subtract all vehicles

"[blue][helicopter]" -  add all blue coalition helicopters
"[-blue][helicopter]" - subtract all blue coalition helicopters
"[blue][plane]" - add all blue coalition planes
"[-blue][plane]" - subtract all blue coalition planes
"[blue][ship]" - add all blue coalition ships
"[-blue][ship]" - subtract all blue coalition ships
"[blue][vehicle]" - add all blue coalition vehicles
"[-blue][vehicle]" - subtract all blue coalition vehicles

"[red][helicopter]" -  add all red coalition helicopters
"[-red][helicopter]" - subtract all red coalition helicopters
"[red][plane]" - add all red coalition planes
"[-red][plane]" - subtract all red coalition planes
"[red][ship]" - add all red coalition ships
"[-red][ship]" - subtract all red coalition ships
"[red][vehicle]" - add all red coalition vehicles
"[-red][vehicle]" - subtract all red coalition vehicles


Country names to be used in [c] and [-c] short-cuts:
"Turkey" 
"Norway"
"The Netherlands"
"Spain"
"UK"
"Denmark"
"USA"
"Georgia"
"Germany"
"Belgium"
"Canada"
"France"
"Israel"
"Ukraine"
"Russia"
"South Osetia"
"Abkhazia"
"Italy"
]]

	--Assumption: will be passed a table of strings, sequential
	local units_by_name = {}

	local l_munits = mist.DBs.units  --local reference for faster execution
	for i = 1, #tbl do
		local unit = tbl[i]
		if unit:sub(1,4) == '[-u]' then --subtract a unit
			if units_by_name[unit:sub(5)] then -- 5 to end
				units_by_name[unit:sub(5)] = nil  --remove
			end
		elseif unit:sub(1,3) == '[g]' then -- add a group
			for coa, coa_tbl in pairs(l_munits) do
				for country, country_table in pairs(coa_tbl) do
					for unit_type, unit_type_tbl in pairs(country_table) do
						if type(unit_type_tbl) == 'table' then 
							for group_ind, group_tbl in pairs(unit_type_tbl) do
								if type(group_tbl) == 'table' and group_tbl.groupName == unit:sub(4) then -- index 4 to end
									for unit_ind, unit in pairs(group_tbl.units) do
										units_by_name[unit.unitName] = true  --add	
									end
								end
							end
						end
					end
				end
			end
		elseif unit:sub(1,4) == '[-g]' then -- subtract a group
			for coa, coa_tbl in pairs(l_munits) do
				for country, country_table in pairs(coa_tbl) do
					for unit_type, unit_type_tbl in pairs(country_table) do
						if type(unit_type_tbl) == 'table' then 
							for group_ind, group_tbl in pairs(unit_type_tbl) do
								if type(group_tbl) == 'table' and group_tbl.groupName == unit:sub(5) then -- index 5 to end
									for unit_ind, unit in pairs(group_tbl.units) do
										if units_by_name[unit.unitName] then
											units_by_name[unit.unitName] = nil --remove
										end
									end
								end
							end
						end
					end
				end
			end
		elseif unit:sub(1,3) == '[c]' then -- add a country
			local category = ''
			local country_start = 4
			if unit:sub(4,15) == '[helicopter]' then 
				category = 'helicopter'
				country_start = 16
			elseif unit:sub(4,10) == '[plane]' then 
				category = 'plane'
				country_start = 11
			elseif unit:sub(4,9) == '[ship]' then 
				category = 'ship'
				country_start = 10
			elseif unit:sub(4,12) == '[vehicle]' then 
				category = 'vehicle'
				country_start = 13
			end	
			for coa, coa_tbl in pairs(l_munits) do
				for country, country_table in pairs(coa_tbl) do
					if country == string.lower(unit:sub(country_start)) then   -- match
						for unit_type, unit_type_tbl in pairs(country_table) do
							if type(unit_type_tbl) == 'table' and (category == '' or unit_type == category) then 
								for group_ind, group_tbl in pairs(unit_type_tbl) do
									if type(group_tbl) == 'table' then
										for unit_ind, unit in pairs(group_tbl.units) do
											units_by_name[unit.unitName] = true  --add	
										end
									end
								end
							end
						end
					end
				end
			end
		elseif unit:sub(1,4) == '[-c]' then -- subtract a country
			local category = ''
			local country_start = 5
			if unit:sub(5,16) == '[helicopter]' then 
				category = 'helicopter'
				country_start = 17
			elseif unit:sub(5,11) == '[plane]' then 
				category = 'plane'
				country_start = 12
			elseif unit:sub(5,10) == '[ship]' then 
				category = 'ship'
				country_start = 11
			elseif unit:sub(5,13) == '[vehicle]' then 
				category = 'vehicle'
				country_start = 14
			end	
			for coa, coa_tbl in pairs(l_munits) do
				for country, country_table in pairs(coa_tbl) do
					if country == string.lower(unit:sub(country_start)) then   -- match
						for unit_type, unit_type_tbl in pairs(country_table) do
							if type(unit_type_tbl) == 'table' and (category == '' or unit_type == category) then 
								for group_ind, group_tbl in pairs(unit_type_tbl) do
									if type(group_tbl) == 'table' then 
										for unit_ind, unit in pairs(group_tbl.units) do
											if units_by_name[unit.unitName] then
												units_by_name[unit.unitName] = nil  --remove
											end
										end
									end
								end
							end
						end
					end
				end
			end
		elseif unit:sub(1,6) ==  '[blue]' then -- add blue coalition
			local category = ''
			if unit:sub(7) == '[helicopter]' then 
				category = 'helicopter'
			elseif unit:sub(7) == '[plane]' then 
				category = 'plane'
			elseif unit:sub(7) == '[ship]' then 
				category = 'ship'
			elseif unit:sub(7) == '[vehicle]' then 
				category = 'vehicle'
			end	
			for coa, coa_tbl in pairs(l_munits) do
				if coa == 'blue' then
					for country, country_table in pairs(coa_tbl) do
						for unit_type, unit_type_tbl in pairs(country_table) do
							if type(unit_type_tbl) == 'table' and (category == '' or unit_type == category) then 
								for group_ind, group_tbl in pairs(unit_type_tbl) do
									if type(group_tbl) == 'table' then
										for unit_ind, unit in pairs(group_tbl.units) do
											units_by_name[unit.unitName] = true  --add										
										end
									end
								end
							end
						end
					end
				end
			end	
		elseif unit:sub(1,7) == '[-blue]' then -- subtract blue coalition
			local category = ''
			if unit:sub(8) == '[helicopter]' then 
				category = 'helicopter'
			elseif unit:sub(8) == '[plane]' then 
				category = 'plane'
			elseif unit:sub(8) == '[ship]' then 
				category = 'ship'
			elseif unit:sub(8) == '[vehicle]' then 
				category = 'vehicle'
			end	
			for coa, coa_tbl in pairs(l_munits) do
				if coa == 'blue' then
					for country, country_table in pairs(coa_tbl) do
						for unit_type, unit_type_tbl in pairs(country_table) do
							if type(unit_type_tbl) == 'table' and (category == '' or unit_type == category) then  
								for group_ind, group_tbl in pairs(unit_type_tbl) do
									if type(group_tbl) == 'table' then
										for unit_ind, unit in pairs(group_tbl.units) do
											if units_by_name[unit.unitName] then
												units_by_name[unit.unitName] = nil  --remove
											end
										end
									end
								end
							end
						end
					end
				end
			end	
		elseif unit:sub(1,5) == '[red]' then -- add red coalition
			local category = ''
			if unit:sub(6) == '[helicopter]' then 
				category = 'helicopter'
			elseif unit:sub(6) == '[plane]' then 
				category = 'plane'
			elseif unit:sub(6) == '[ship]' then 
				category = 'ship'
			elseif unit:sub(6) == '[vehicle]' then 
				category = 'vehicle'
			end	
			for coa, coa_tbl in pairs(l_munits) do
				if coa == 'red' then
					for country, country_table in pairs(coa_tbl) do
						for unit_type, unit_type_tbl in pairs(country_table) do
							if type(unit_type_tbl) == 'table' and (category == '' or unit_type == category) then  
								for group_ind, group_tbl in pairs(unit_type_tbl) do
									if type(group_tbl) == 'table' then
										for unit_ind, unit in pairs(group_tbl.units) do
											units_by_name[unit.unitName] = true  --add									
										end
									end
								end
							end
						end
					end
				end
			end
		elseif unit:sub(1,6) == '[-red]' then -- subtract red coalition
			local category = ''
			if unit:sub(7) == '[helicopter]' then 
				category = 'helicopter'
			elseif unit:sub(7) == '[plane]' then 
				category = 'plane'
			elseif unit:sub(7) == '[ship]' then 
				category = 'ship'
			elseif unit:sub(7) == '[vehicle]' then 
				category = 'vehicle'
			end	
			for coa, coa_tbl in pairs(l_munits) do
				if coa == 'red' then
					for country, country_table in pairs(coa_tbl) do
						for unit_type, unit_type_tbl in pairs(country_table) do
							if type(unit_type_tbl) == 'table' and (category == '' or unit_type == category) then  
								for group_ind, group_tbl in pairs(unit_type_tbl) do
									if type(group_tbl) == 'table' then
										for unit_ind, unit in pairs(group_tbl.units) do
											if units_by_name[unit.unitName] then
												units_by_name[unit.unitName] = nil  --remove
											end
										end
									end
								end
							end
						end
					end
				end
			end	
		elseif unit:sub(1,5) == '[all]' then -- add all of a certain category (or all categories)
			local category = ''
			if unit:sub(6) == '[helicopter]' then 
				category = 'helicopter'
			elseif unit:sub(6) == '[plane]' then 
				category = 'plane'
			elseif unit:sub(6) == '[ship]' then 
				category = 'ship'
			elseif unit:sub(6) == '[vehicle]' then 
				category = 'vehicle'
			end	
			for coa, coa_tbl in pairs(l_munits) do
				for country, country_table in pairs(coa_tbl) do
					for unit_type, unit_type_tbl in pairs(country_table) do
						if type(unit_type_tbl) == 'table' and (category == '' or unit_type == category) then  
							for group_ind, group_tbl in pairs(unit_type_tbl) do
								if type(group_tbl) == 'table' then
									for unit_ind, unit in pairs(group_tbl.units) do
										units_by_name[unit.unitName] = true  --add										
									end
								end
							end
						end
					end
				end
			end
		elseif unit:sub(1,6) == '[-all]' then -- subtract all of a certain category (or all categories)
			local category = ''
			if unit:sub(7) == '[helicopter]' then 
				category = 'helicopter'
			elseif unit:sub(7) == '[plane]' then 
				category = 'plane'
			elseif unit:sub(7) == '[ship]' then 
				category = 'ship'
			elseif unit:sub(7) == '[vehicle]' then 
				category = 'vehicle'
			end	
			for coa, coa_tbl in pairs(l_munits) do
				for country, country_table in pairs(coa_tbl) do
					for unit_type, unit_type_tbl in pairs(country_table) do
						if type(unit_type_tbl) == 'table' and (category == '' or unit_type == category) then  
							for group_ind, group_tbl in pairs(unit_type_tbl) do
								if type(group_tbl) == 'table' then
									for unit_ind, unit in pairs(group_tbl.units) do
										if units_by_name[unit.unitName] then
											units_by_name[unit.unitName] = nil  --remove
										end
									end
								end
							end
						end
					end
				end
			end				
		else -- just a regular unit
			units_by_name[unit] = true  --add	
		end
	end
	
	local units_tbl = {}  -- indexed sequentially
	for unit_name, val in pairs(units_by_name) do
		if val then 
			units_tbl[#units_tbl + 1] = unit_name  -- add all the units to the table
		end
	end
	
	
	units_tbl['processed'] = true  --add the processed flag
	return units_tbl
end


mist.getDeadMapObjsInZones = function(zone_names)  
-- zone_names: table of zone names
-- returns: table of dead map objects (indexed numerically)
	local map_objs = {}
	local zones = {}
	for i = 1, #zone_names do
		if mist.DBs.zonesByName[zone_names[i]] then
			zones[#zones + 1] = mist.DBs.zonesByName[zone_names[i]]
		end
	end
	for obj_id, obj in pairs(mist.DBs.deadObjects) do
		if obj.objectType and obj.objectType == 'building' then --dead map object
			for i = 1, #zones do
				if ((zones[i].point.x - obj.objectPos.x)^2 + (zones[i].point.z - obj.objectPos.z)^2)^0.5 <= zones[i].radius then
					map_objs[#map_objs + 1] = mist.utils.deepCopy(obj)
				end
			end
		end
	end
	return map_objs
end


mist.getDeadMapObjsInPolygonZone = function(zone)  
-- zone_names: table of zone names
-- returns: table of dead map objects (indexed numerically)
	local map_objs = {}
	for obj_id, obj in pairs(mist.DBs.deadObjects) do
		if obj.objectType and obj.objectType == 'building' then --dead map object
			if mist.pointInPolygon(obj.objectPos, zone) then
				map_objs[#map_objs + 1] = mist.utils.deepCopy(obj)
			end
		end
	end
	return map_objs
end

mist.flagFunc = {}

mist.flagFunc.mapobjs_dead_zones = function(vars)
--[[vars needs to be:
zones = table or string,
flag = number,
stopflag = number or nil,
req_num = number or nil

AND used by function,
initial_number

]]
-- type_tbl
	local type_tbl = {
		[{'zones', 'zone'}] = {'table', 'string'},
		flag = 'number', 
		stopflag = {'number', 'nil'}, 
		[{'req_num', 'reqnum'}] = {'number', 'nil'},
	}
	
	local err, errmsg = mist.utils.typeCheck('mist.flagFunc.mapobjs_dead_zones', type_tbl, vars)
	assert(err, errmsg)
	local zones = vars.zones or vars.zone
	local flag = vars.flag
	local stopflag = vars.stopflag or -1
	local req_num = vars.req_num or vars.reqnum or 1
	local initial_number = vars.initial_number
	
	if type(zones) == 'string' then
		zones = {zones}
	end
	
	if not initial_number then 
		initial_number = #mist.getDeadMapObjsInZones(zones)
	end
	
	if stopflag == -1 or (type(trigger.misc.getUserFlag(stopflag)) == 'number' and trigger.misc.getUserFlag(stopflag) == 0) or (type(trigger.misc.getUserFlag(stopflag)) == 'boolean' and trigger.misc.getUserFlag(stopflag) == false) then
		if (#mist.getDeadMapObjsInZones(zones) - initial_number) >= req_num then
			trigger.action.setUserFlag(flag, true)
			return
		else
			mist.scheduleFunction(mist.flagFunc.mapobjs_dead_zones, {{zones = zones, flag = flag, stopflag = stopflag, req_num = req_num, initial_number = initial_number}}, timer.getTime() + 1)
		end
	end
end



mist.flagFunc.mapobjs_dead_polygon = function(vars)
--[[vars needs to be:
zone = table,
flag = number,
stopflag = number or nil,
req_num = number or nil

AND used by function,
initial_number

]]
-- type_tbl
	local type_tbl = {
		[{'zone', 'polyzone'}] = 'table',
		flag = 'number', 
		stopflag = {'number', 'nil'}, 
		[{'req_num', 'reqnum'}] = {'number', 'nil'},
	}
	
	local err, errmsg = mist.utils.typeCheck('mist.flagFunc.mapobjs_dead_polygon', type_tbl, vars)
	assert(err, errmsg)
	local zone = vars.zone or vars.polyzone
	local flag = vars.flag
	local stopflag = vars.stopflag or -1
	local req_num = vars.req_num or vars.reqnum or 1
	local initial_number = vars.initial_number
	
	if not initial_number then 
		initial_number = #mist.getDeadMapObjsInPolygonZone(zone)
	end
	
	if stopflag == -1 or (type(trigger.misc.getUserFlag(stopflag)) == 'number' and trigger.misc.getUserFlag(stopflag) == 0) or (type(trigger.misc.getUserFlag(stopflag)) == 'boolean' and trigger.misc.getUserFlag(stopflag) == false) then
		if (#mist.getDeadMapObjsInPolygonZone(zone) - initial_number) >= req_num then
			trigger.action.setUserFlag(flag, true)
			return
		else
			mist.scheduleFunction(mist.flagFunc.mapobjs_dead_polygon, {{zone = zone, flag = flag, stopflag = stopflag, req_num = req_num, initial_number = initial_number}}, timer.getTime() + 1)
		end
	end
end



function mist.pointInPolygon(point, poly, maxalt) --raycasting point in polygon. Code from http://softsurfer.com/Archive/algorithm_0103/algorithm_0103.htm
	point = mist.utils.makeVec3(point)
	local px = point.x
	local pz = point.z
	local cn = 0
	local newpoly = mist.utils.deepCopy(poly)
	
	if not maxalt or (point.y <= maxalt) then
		local polysize = #newpoly
		newpoly[#newpoly + 1] = newpoly[1]
		
		newpoly[1] = mist.utils.makeVec3(newpoly[1])
		
		for k = 1, polysize do
			newpoly[k+1] = mist.utils.makeVec3(newpoly[k+1])
			if ((newpoly[k].z <= pz) and (newpoly[k+1].z > pz)) or ((newpoly[k].z > pz) and (newpoly[k+1].z <= pz)) then 
				local vt = (pz - newpoly[k].z) / (newpoly[k+1].z - newpoly[k].z)
				if (px < newpoly[k].x + vt*(newpoly[k+1].x - newpoly[k].x)) then
				   cn = cn + 1    
				end
			end
		end
		
		return cn%2 == 1 
	else
		return false
	end
end


function mist.flagFunc.units_in_polygon(vars)
--[[vars needs to be:
units = table,
zone = table,
flag = number,
stopflag = number or nil,
maxalt = number or nil,
interval  = number or nil,
req_num = number or nil
toggle = boolean or nil
]]
-- type_tbl
	local type_tbl = {
		[{'units', 'unit'}] = 'table', 
		[{'zone', 'polyzone'}] = 'table', 
		flag = 'number', 
		stopflag = {'number', 'nil'}, 
		[{'maxalt', 'alt'}] = {'number', 'nil'}, 
		interval = {'number', 'nil'}, 
		[{'req_num', 'reqnum'}] = {'number', 'nil'},
		toggle = {'boolean', 'nil'}, 
	}
	
	local err, errmsg = mist.utils.typeCheck('mist.flagFunc.units_in_polygon', type_tbl, vars)
	assert(err, errmsg)
	local units = vars.units or vars.unit
	local zone = vars.zone or vars.polyzone
	local flag = vars.flag
	local stopflag = vars.stopflag or -1
	local interval = vars.interval or 1
	local maxalt = vars.maxalt or vars.alt
	local req_num = vars.req_num or vars.reqnum or 1
	local toggle = vars.toggle
	
	if not units.processed then -- run unit table short cuts
		units = mist.makeUnitTable(units)
		--mist.debug.writeData(mist.utils.serialize,{'vars', vars}, 'vars.txt')
	end
	
	if stopflag == -1 or (type(trigger.misc.getUserFlag(stopflag)) == 'number' and trigger.misc.getUserFlag(stopflag) == 0) or (type(trigger.misc.getUserFlag(stopflag)) == 'boolean' and trigger.misc.getUserFlag(stopflag) == false) then
		local num_in_zone = 0
		for i = 1, #units do
			local unit = Unit.getByName(units[i])
			if unit then
				local pos = unit:getPosition().p
				if mist.pointInPolygon(pos, zone, maxalt) then
					num_in_zone = num_in_zone + 1
					if num_in_zone >= req_num then
						trigger.action.setUserFlag(flag, true)
						break
					end
				end
			end
		end
		if toggle and (num_in_zone < req_num) and trigger.action.getUserFlag(flag) == true then
			trigger.action.setUserFlag(flag, false)
		end
		
		
		
		-- do another check in case stopflag was set true by this function
		if (type(trigger.misc.getUserFlag(stopflag)) == 'number' and trigger.misc.getUserFlag(stopflag) == 0) or (type(trigger.misc.getUserFlag(stopflag)) == 'boolean' and trigger.misc.getUserFlag(stopflag) == false) then
			mist.scheduleFunction(mist.flagFunc.units_in_polygon, {{units = units, zone = zone, flag = flag, stopflag = stopflag, interval = interval, req_num = req_num, maxalt = maxalt, toggle = toggle}}, timer.getTime() + interval)
		end
	end
end




function mist.getUnitsInZones(unit_names, zone_names, zone_type)
	
	zone_type = zone_type or 'cylinder'
	if zone_type == 'c' or zone_type == 'cylindrical' or zone_type == 'C' then
		zone_type = 'cylinder'
	end
	if zone_type == 's' or zone_type == 'spherical' or zone_type == 'S' then
		zone_type = 'sphere'
	end
	
	assert(zone_type == 'cylinder' or zone_type == 'sphere', 'invalid zone_type: ' .. tostring(zone_type))

	local units = {}
	local zones = {}

	for k = 1, #unit_names do
		local unit = Unit.getByName(unit_names[k])
		if unit then
			units[#units + 1] = unit
		end
	end
	
	
	for k = 1, #zone_names do
		local zone = trigger.misc.getZone(zone_names[k])
		if zone then
			zones[#zones + 1] = {radius = zone.radius, x = zone.point.x, y = zone.point.y, z = zone.point.z}
		end
	end
	
	local in_zone_units = {}
	
	for units_ind = 1, #units do
		for zones_ind = 1, #zones do
			if zone_type == 'sphere' then  --add land height value for sphere zone type
				local alt = land.getHeight({x = zones[zones_ind].x, y = zones[zones_ind].z})
				if alt then
					zones[zones_ind].y = alt
				end
			end
			local unit_pos = units[units_ind]:getPosition().p
			if unit_pos and units[units_ind]:isActive() == true then
				if zone_type == 'cylinder' and (((unit_pos.x - zones[zones_ind].x)^2 + (unit_pos.z - zones[zones_ind].z)^2)^0.5 <= zones[zones_ind].radius) then
					in_zone_units[#in_zone_units + 1] = units[units_ind]
					break
				elseif zone_type == 'sphere' and (((unit_pos.x - zones[zones_ind].x)^2 + (unit_pos.y - zones[zones_ind].y)^2 + (unit_pos.z - zones[zones_ind].z)^2)^0.5 <= zones[zones_ind].radius) then
					in_zone_units[#in_zone_units + 1] = units[units_ind]
					break
				end
			end
		end
	end
	return in_zone_units
end


function mist.flagFunc.units_in_zones(vars)
	--[[vars needs to be:
	units = table,
	zones = table,
	flag = number,
	stopflag = number or nil,
	zone_type = string or nil,
	req_num = number or nil,
	interval  = number or nil
	toggle = boolean or nil
	]]
	-- type_tbl
	local type_tbl = {
		units = 'table', 
		zones = 'table', 
		flag = 'number', 
		stopflag = {'number', 'nil'}, 
		[{'zone_type', 'zonetype'}] = {'string', 'nil'}, 
		[{'req_num', 'reqnum'}] = {'number', 'nil'},
		interval = {'number', 'nil'},
		toggle = {'boolean', 'nil'},
	}
	
	local err, errmsg = mist.utils.typeCheck('mist.flagFunc.units_in_zones', type_tbl, vars)
	assert(err, errmsg)
	local units = vars.units
	local zones = vars.zones
	local flag = vars.flag
	local stopflag = vars.stopflag or -1
	local zone_type = vars.zone_type or vars.zonetype or 'cylinder'
	local req_num = vars.req_num or vars.reqnum or 1
	local interval = vars.interval or 1
	local toggle = vars.toggle or nil
	
	if not units.processed then -- run unit table short cuts
		units = mist.makeUnitTable(units)
	end
	if stopflag == -1 or (type(trigger.misc.getUserFlag(stopflag)) == 'number' and trigger.misc.getUserFlag(stopflag) == 0) or (type(trigger.misc.getUserFlag(stopflag)) == 'boolean' and trigger.misc.getUserFlag(stopflag) == false) then
	
		local in_zone_units = mist.getUnitsInZones(units, zones, zone_type)
	
		if #in_zone_units >= req_num then
			trigger.action.setUserFlag(flag, true)
		elseif #in_zone_units < req_num and toggle then
			trigger.action.setUserFlag(flag, false)
		end		
		-- do another check in case stopflag was set true by this function
		if (type(trigger.misc.getUserFlag(stopflag)) == 'number' and trigger.misc.getUserFlag(stopflag) == 0) or (type(trigger.misc.getUserFlag(stopflag)) == 'boolean' and trigger.misc.getUserFlag(stopflag) == false) then
			mist.scheduleFunction(mist.flagFunc.units_in_zones, {{units = units, zones = zones, flag = flag, stopflag = stopflag, zone_type = zone_type, req_num = req_num, interval = interval, toggle = toggle}}, timer.getTime() + interval)
		end
	end
	
end


function mist.getUnitsInMovingZones(unit_names, zone_unit_names, radius, zone_type)
	
	zone_type = zone_type or 'cylinder'
	if zone_type == 'c' or zone_type == 'cylindrical' or zone_type == 'C' then
		zone_type = 'cylinder'
	end
	if zone_type == 's' or zone_type == 'spherical' or zone_type == 'S' then
		zone_type = 'sphere'
	end
	
	assert(zone_type == 'cylinder' or zone_type == 'sphere', 'invalid zone_type: ' .. tostring(zone_type))

	local units = {}
	local zone_units = {}

	for k = 1, #unit_names do
		local unit = Unit.getByName(unit_names[k])
		if unit then
			units[#units + 1] = unit
		end
	end
	
	for k = 1, #zone_unit_names do
		local unit = Unit.getByName(zone_unit_names[k])
		if unit then
			zone_units[#zone_units + 1] = unit
		end
	end

	local in_zone_units = {}
	
	for units_ind = 1, #units do
		for zone_units_ind = 1, #zone_units do
			local unit_pos = units[units_ind]:getPosition().p
			local zone_unit_pos = zone_units[zone_units_ind]:getPosition().p
			if unit_pos and zone_unit_pos and units[units_ind]:isActive() == true then
				if zone_type == 'cylinder' and (((unit_pos.x - zone_unit_pos.x)^2 + (unit_pos.z - zone_unit_pos.z)^2)^0.5 <= radius) then
					in_zone_units[#in_zone_units + 1] = units[units_ind]
					break
				elseif zone_type == 'sphere' and (((unit_pos.x - zone_unit_pos.x)^2 + (unit_pos.y - zone_unit_pos.y)^2 + (unit_pos.z - zone_unit_pos.z)^2)^0.5 <= radius) then
					in_zone_units[#in_zone_units + 1] = units[units_ind]
					break
				end
			end
		end
	end
	return in_zone_units
end



function mist.flagFunc.units_in_moving_zones(vars)
	--[[vars needs to be:
	units = table,
	zone_units = table,
	radius = number,
	flag = number,
	stopflag = number or nil,
	zone_type = string or nil,
	req_num = number or nil,
	interval  = number or nil
	toggle = boolean or nil
	]]
	-- type_tbl
	local type_tbl = {
		units = 'table', 
		[{'zone_units', 'zoneunits'}]  = 'table', 
		radius = 'number',
		flag = 'number', 
		stopflag = {'number', 'nil'}, 
		[{'zone_type', 'zonetype'}] = {'string', 'nil'}, 
		[{'req_num', 'reqnum'}] = {'number', 'nil'},
		interval = {'number', 'nil'},
		toggle = {'boolean', 'nil'},
	}
	
	local err, errmsg = mist.utils.typeCheck('mist.flagFunc.units_in_moving_zones', type_tbl, vars)
	assert(err, errmsg)
	local units = vars.units
	local zone_units = vars.zone_units or vars.zoneunits
	local radius = vars.radius
	local flag = vars.flag
	local stopflag = vars.stopflag or -1
	local zone_type = vars.zone_type or vars.zonetype or 'cylinder'
	local req_num = vars.req_num or vars.reqnum or 1
	local interval = vars.interval or 1
	local toggle = vars.toggle or nil
	
	if not units.processed then -- run unit table short cuts
		units = mist.makeUnitTable(units)
	end
	
	if not zone_units.processed then -- run unit table short cuts
		zone_units = mist.makeUnitTable(zone_units)
	end
	
	if stopflag == -1 or (type(trigger.misc.getUserFlag(stopflag)) == 'number' and trigger.misc.getUserFlag(stopflag) == 0) or (type(trigger.misc.getUserFlag(stopflag)) == 'boolean' and trigger.misc.getUserFlag(stopflag) == false) then
	
		local in_zone_units = mist.getUnitsInMovingZones(units, zone_units, radius, zone_type)
	
		if #in_zone_units >= req_num then
			trigger.action.setUserFlag(flag, true)
		elseif #in_zone_units < req_num and toggle then
			trigger.action.setUserFlag(flag, false)
		end		
		-- do another check in case stopflag was set true by this function
		if (type(trigger.misc.getUserFlag(stopflag)) == 'number' and trigger.misc.getUserFlag(stopflag) == 0) or (type(trigger.misc.getUserFlag(stopflag)) == 'boolean' and trigger.misc.getUserFlag(stopflag) == false) then
			mist.scheduleFunction(mist.flagFunc.units_in_moving_zones, {{units = units, zone_units = zone_units, radius = radius, flag = flag, stopflag = stopflag, zone_type = zone_type, req_num = req_num, interval = interval, toggle = toggle}}, timer.getTime() + interval)
		end
	end
	
end


mist.getUnitsLOS = function(unitset1, altoffset1, unitset2, altoffset2, radius)
	radius = radius or math.huge
	
	local unit_info1 = {}
	local unit_info2 = {}
	
	-- get the positions all in one step, saves execution time.
	for unitset1_ind = 1, #unitset1 do
		local unit1 = Unit.getByName(unitset1[unitset1_ind])
		if unit1 then
			unit_info1[#unit_info1 + 1] = {}
			unit_info1[#unit_info1]["unit"] = unit1
			unit_info1[#unit_info1]["pos"]  = unit1:getPosition().p
		end
	end
	
	for unitset2_ind = 1, #unitset2 do
		local unit2 = Unit.getByName(unitset2[unitset2_ind])
		if unit2 then
			unit_info2[#unit_info2 + 1] = {}
			unit_info2[#unit_info2]["unit"] = unit2
			unit_info2[#unit_info2]["pos"]  = unit2:getPosition().p
		end
	end

	local LOS_data = {}
	-- now compute los
	for unit1_ind = 1, #unit_info1 do
		local unit_added = false
		for unit2_ind = 1, #unit_info2 do
			if radius == math.huge or (mist.vec.mag(mist.vec.sub(unit_info1[unit1_ind].pos, unit_info2[unit2_ind].pos)) < radius) then -- inside radius
				local point1 = { x = unit_info1[unit1_ind].pos.x, y = unit_info1[unit1_ind].pos.y + altoffset1, z = unit_info1[unit1_ind].pos.z}
				local point2 = { x = unit_info2[unit2_ind].pos.x, y = unit_info2[unit2_ind].pos.y + altoffset2, z = unit_info2[unit2_ind].pos.z}
				if land.isVisible(point1, point2) then
					if unit_added == false then
						unit_added = true
						LOS_data[#LOS_data + 1] = {}
						LOS_data[#LOS_data]['unit'] = unit_info1[unit1_ind].unit
						LOS_data[#LOS_data]['vis'] = {}
						LOS_data[#LOS_data]['vis'][#LOS_data[#LOS_data]['vis'] + 1] = unit_info2[unit2_ind].unit 
					else
						LOS_data[#LOS_data]['vis'][#LOS_data[#LOS_data]['vis'] + 1] = unit_info2[unit2_ind].unit 
					end
				end
			end
		end
	end
	
	return LOS_data
end

mist.flagFunc.units_LOS = function(vars)
--[[vars needs to be:
unitset1 = table, 
altoffset1 = number, 
unitset2 = table, 
altoffset2 = number,
flag = number,
stopflag = number or nil,
radius = number or nil,
interval  = number or nil,
req_num = number or nil
toggle = boolean or nil
]]
-- type_tbl
	local type_tbl = {
		[{'unitset1', 'units1'}] = 'table', 
		[{'altoffset1', 'alt1'}] = 'number', 
		[{'unitset2', 'units2'}] = 'table', 
		[{'altoffset2', 'alt2'}] = 'number', 
		flag = 'number', 
		stopflag = {'number', 'nil'}, 
		[{'req_num', 'reqnum'}] = {'number', 'nil'}, 
		interval = {'number', 'nil'}, 
		radius = {'number', 'nil'},
		toggle = {'boolean', 'nil'},
	}
	
	local err, errmsg = mist.utils.typeCheck('mist.flagFunc.units_LOS', type_tbl, vars)
	assert(err, errmsg)
	local unitset1 = vars.unitset1 or vars.units1
	local altoffset1 = vars.altoffset1 or vars.alt1
	local unitset2 = vars.unitset2 or vars.units2
	local altoffset2 = vars.altoffset2 or vars.alt2
	local flag = vars.flag
	local stopflag = vars.stopflag or -1
	local interval = vars.interval or 1
	local radius = vars.radius or math.huge
	local req_num = vars.req_num or vars.reqnum or 1
	local toggle = vars.toggle or nil
	
	
	if not unitset1.processed then -- run unit table short cuts
		unitset1 = mist.makeUnitTable(unitset1)
	end
	
	if not unitset2.processed then -- run unit table short cuts
		unitset2 = mist.makeUnitTable(unitset2)
	end
	
	if stopflag == -1 or (type(trigger.misc.getUserFlag(stopflag)) == 'number' and trigger.misc.getUserFlag(stopflag) == 0) or (type(trigger.misc.getUserFlag(stopflag)) == 'boolean' and trigger.misc.getUserFlag(stopflag) == false) then
	
		local unitLOSdata = mist.getUnitsLOS(unitset1, altoffset1, unitset2, altoffset2, radius)
	
		if #unitLOSdata >= req_num then
			trigger.action.setUserFlag(flag, true)
		elseif #unitLOSdata < req_num and toggle then
			trigger.action.setUserFlag(flag, false)
		end		
		-- do another check in case stopflag was set true by this function
		if (type(trigger.misc.getUserFlag(stopflag)) == 'number' and trigger.misc.getUserFlag(stopflag) == 0) or (type(trigger.misc.getUserFlag(stopflag)) == 'boolean' and trigger.misc.getUserFlag(stopflag) == false) then
			mist.scheduleFunction(mist.flagFunc.units_LOS, {{unitset1 = unitset1, altoffset1 = altoffset1, unitset2 = unitset2, altoffset2 = altoffset2, flag = flag, stopflag = stopflag, radius = radius, req_num = req_num, interval = interval, toggle = toggle}}, timer.getTime() + interval)
		end
	end
end

--Gets the average position of a group of units (by name)
mist.getAvgPos = function(unitNames)
	local avgX, avgY, avgZ, totNum = 0, 0, 0, 0
	for i = 1, #unitNames do
		local unit = Unit.getByName(unitNames[i])
		if unit then
			oneUnit = true  -- at least one unit existed.
			local pos = unit:getPosition().p
			avgX = avgX + pos.x
			avgY = avgY + pos.y
			avgZ = avgZ + pos.z
			totNum = totNum + 1
		end	
	end
	if totNum ~= 0 then
		return {x = avgX/totNum, y = avgY/totNum, z = avgZ/totNum}
	end
end

mist.getAvgGroupPos = function(groupName)
	if type(groupName) == 'string' and Group.getByName(groupName) then
		groupName = Group.getByName(groupName)
	end
	local units = {}
	for i = 1, #groupName:getSize() do
		table.insert(units, groupName.getUnit(i):getName())
	end
	
	return mist.getAvgPos(units)

end

---------------------------------------------------------------------------------------
-- demos
mist.demos = {}

mist.demos.printFlightData = function(unit)
	if unit:isExist() then
		local function printData(unit, prevVel, prevE, prevTime)
			local angles = mist.getAttitude(unit)
			if angles then
				local Heading = angles.Heading
				local Pitch = angles.Pitch
				local Roll = angles.Roll
				local Yaw = angles.Yaw
				local AoA = angles.AoA
				local ClimbAngle = angles.ClimbAngle
				
				if not Heading then
					Heading = 'NA'
				else
					Heading = string.format('%12.2f', mist.utils.toDegree(Heading))
				end
				
				if not Pitch then
					Pitch = 'NA'
				else
					Pitch = string.format('%12.2f', mist.utils.toDegree(Pitch))
				end
				
				if not Roll then 
					Roll = 'NA'
				else
					Roll = string.format('%12.2f', mist.utils.toDegree(Roll))
				end
				
				local AoAplusYaw = 'NA'
				if AoA and Yaw then
					AoAplusYaw = string.format('%12.2f', mist.utils.toDegree((AoA^2 + Yaw^2)^0.5))
				end
				
				if not Yaw then
					Yaw = 'NA'
				else
					Yaw = string.format('%12.2f', mist.utils.toDegree(Yaw))
				end
				
				if not AoA then
					AoA = 'NA'
				else
					AoA = string.format('%12.2f', mist.utils.toDegree(AoA))
				end
				
				if not ClimbAngle then 
					ClimbAngle = 'NA'
				else
					ClimbAngle = string.format('%12.2f', mist.utils.toDegree(ClimbAngle))
				end
				local unitPos = unit:getPosition()
				local unitVel = unit:getVelocity()
				local curTime = timer.getTime()
				local absVel = string.format('%12.2f', mist.vec.mag(unitVel))
				
				
				local unitAcc = 'NA'
				local Gs = 'NA'
				local axialGs = 'NA'
				local transGs = 'NA'
				if prevVel and prevTime then
					xAcc = (unitVel.x - prevVel.x)/(curTime - prevTime)
					yAcc = (unitVel.y - prevVel.y)/(curTime - prevTime)
					zAcc = (unitVel.z - prevVel.z)/(curTime - prevTime)
					
					unitAcc = string.format('%12.2f', mist.vec.mag({x = xAcc, y = yAcc, z = zAcc}))
					Gs = string.format('%12.2f', mist.vec.mag({x = xAcc, y = yAcc + 9.81, z = zAcc})/9.81)
					axialGs = string.format('%12.2f', mist.vec.dp({x = xAcc, y = yAcc + 9.81, z = zAcc}, unitPos.x)/9.81)
					transGs = string.format('%12.2f', mist.vec.mag(mist.vec.cp({x = xAcc, y = yAcc + 9.81, z = zAcc}, unitPos.x))/9.81)
				end
				
				local E = 0.5*mist.vec.mag(unitVel)^2 + 9.81*unitPos.p.y
				
				local energy = string.format('%12.2e', E)
				
				local dEdt = 'NA'
				if prevE and prevTime then
					dEdt = string.format('%12.2e', (E - prevE)/(curTime - prevTime))
				end
				
				trigger.action.outText(string.format('%-25s', 'Heading: ') .. Heading .. ' degrees\n' .. string.format('%-25s', 'Roll: ') .. Roll .. ' degrees\n' .. string.format('%-25s', 'Pitch: ') .. Pitch
													.. ' degrees\n' .. string.format('%-25s', 'Yaw: ') .. Yaw .. ' degrees\n' .. string.format('%-25s', 'AoA: ') .. AoA .. ' degrees\n' .. string.format('%-25s', 'AoA plus Yaw: ') .. AoAplusYaw .. ' degrees\n' .. string.format('%-25s', 'Climb Angle: ') .. 
													ClimbAngle .. ' degrees\n' .. string.format('%-25s', 'Absolute Velocity: ') .. absVel .. ' m/s\n' .. string.format('%-25s', 'Absolute Acceleration: ') .. unitAcc ..' m/s^2\n'
													.. string.format('%-25s', 'Axial G loading: ') .. axialGs .. ' g\n' .. string.format('%-25s', 'Transverse G loading: ') .. transGs .. ' g\n' .. string.format('%-25s', 'Absolute G loading: ') .. Gs .. ' g\n' .. string.format('%-25s', 'Energy: ') .. energy .. ' J/kg\n' .. string.format('%-25s', 'dE/dt: ') .. dEdt .. 
													' J/(kg*s)', 1)

				return unitVel, E, curTime
			end
		end
		
		local function frameFinder(unit, prevVel, prevE, prevTime)
			if unit:isExist() then
				local currVel = unit:getVelocity()
				if prevVel and (prevVel.x ~= currVel.x or prevVel.y ~= currVel.y or prevVel.z ~= currVel.z) or (prevTime and (timer.getTime() - prevTime) > 0.25) then
					prevVel, prevE, prevTime = printData(unit, prevVel, prevE, prevTime)
				end
				mist.scheduleFunction(frameFinder, {unit, prevVel, prevE, prevTime}, timer.getTime() + 0.005)  -- it can't go this fast, limited to the 100 times a sec check right now.
			end
		end
		
		
		local curVel = unit:getVelocity()
		local curTime = timer.getTime()
		local curE = 0.5*mist.vec.mag(curVel)^2 + 9.81*unit:getPosition().p.y
		frameFinder(unit, curVel, curE, curTime)
	
	end
	
end
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
--start of Mission task functions
--*****************************************************
mist.ground = {}
mist.fixedWing = {}
mist.heli = {}
mist.air = {}
mist.air.fixedWing = {}
mist.air.heli = {}

mist.goRoute = function(group, path)
	local misTask = { 
		id = 'Mission', 
		params = { 
			route = { 
				points = mist.utils.deepCopy(path),
			},	
		},
	}	
	if type(group) == 'string' then
		group = Group.getByName(group)
	end
	local groupCon = group:getController()
	if groupCon then
		groupCon:setTask(misTask)
		return true
	end
	--Controller.setTask(groupCon, misTask)
	return false
end

function mist.getGroupRoute(groupname, task)   -- same as getGroupPoints but returns speed and formation type along with vec2 of point}
	for coa_name, coa_data in pairs(env.mission.coalition) do
		if (coa_name == 'red' or coa_name == 'blue') and type(coa_data) == 'table' then			
			if coa_data.country then --there is a country table
				for cntry_id, cntry_data in pairs(coa_data.country) do
					for obj_type_name, obj_type_data in pairs(cntry_data) do
						if obj_type_name == "helicopter" or obj_type_name == "ship" or obj_type_name == "plane" or obj_type_name == "vehicle" then	-- only these types have points						
							if ((type(obj_type_data) == 'table') and obj_type_data.group and (type(obj_type_data.group) == 'table') and (#obj_type_data.group > 0)) then  --there's a group!				
								for group_num, group_data in pairs(obj_type_data.group) do		
									if group_data and group_data.name and group_data.name == groupname then -- this is the group we are looking for
										if group_data.route and group_data.route.points and #group_data.route.points > 0 then
											local points = {}
											
											for point_num, point in pairs(group_data.route.points) do
												local routeData = {}
												if not point.point then
													routeData.x = point.x
													routeData.y = point.y
												else
													routeData.point = point.point  --it's possible that the ME could move to the point = Vec2 notation.
												end
												routeData.form = point.action
												routeData.speed = point.speed
												routeData.alt = point.alt
												routeData.alt_type = point.alt_type
												routeData.airdromeId = point.airdromeId
												routeData.helipadId = point.helipadId
												routeData.type = point.type
												routeData.action = point.action
												if task then
													routeData.task = point.task
												end
												points[point_num] = routeData
											end
											
												
											return points
										end
										return
									end  --if group_data and group_data.name and group_data.name == 'groupname'
								end --for group_num, group_data in pairs(obj_type_data.group) do		
							end --if ((type(obj_type_data) == 'table') and obj_type_data.group and (type(obj_type_data.group) == 'table') and (#obj_type_data.group > 0)) then	
						end --if obj_type_name == "helicopter" or obj_type_name == "ship" or obj_type_name == "plane" or obj_type_name == "vehicle" or obj_type_name == "static" then
					end --for obj_type_name, obj_type_data in pairs(cntry_data) do
				end --for cntry_id, cntry_data in pairs(coa_data.country) do
			end --if coa_data.country then --there is a country table
		end --if coa_name == 'red' or coa_name == 'blue' and type(coa_data) == 'table' then	
	end --for coa_name, coa_data in pairs(mission.coalition) do
end



mist.ground.buildPath = function() end -- ????


-- No longer accepts path
mist.ground.buildWP = function(point, overRideForm, overRideSpeed)

	local wp = {}
	wp.x = point.x
	
	if point.z then
		wp.y = point.z
	else
		wp.y = point.y
	end
	local form, speed
	
	if point.speed and not overRideSpeed then  
		wp.speed = point.speed
	elseif type(overRideSpeed) == 'number' then
		wp.speed = overRideSpeed
	else
		wp.speed = mist.utils.kmphToMps(20)
	end
	
	if point.form and not overRideForm then
		form = point.form
	else 
		form = overRideForm
	end
	
	if not form then
		wp.action = 'Cone'
	else
		form = string.lower(form)
		if form == 'off_road' or form == 'off road' then
			wp.action = 'Off Road'
		elseif form == 'on_road' or form == 'on road' then
			wp.action = 'On Road'
		elseif form == 'rank' or form == 'line_abrest' or form == 'line abrest' or form == 'lineabrest'then
			wp.action = 'Rank'
		elseif form == 'cone' then
			wp.action = 'Cone'
		elseif form == 'diamond' then
			wp.action = 'Diamond'
		elseif form == 'vee' then
			wp.action = 'Vee'
		elseif form == 'echelon_left' or form == 'echelon left' or form == 'echelonl' then
			wp.action = 'EchelonL'
		elseif form == 'echelon_right' or form == 'echelon right' or form == 'echelonr' then
			wp.action = 'EchelonR'
		else
			wp.action = 'Cone' -- if nothing matched
		end
	end

	wp.type = 'Turning Point'

	return wp 

end

mist.fixedWing.buildWP = function(point, WPtype, speed, alt, altType)

	local wp = {}
	wp.x = point.x
	
	if point.z then
		wp.y = point.z
	else
		wp.y = point.y
	end
	
	if alt and type(alt) == 'number' then
		wp.alt = alt
	else
		wp.alt = 2000
	end
	
	if altType then
		altType = string.lower(altType)
		if altType == 'radio' or 'agl' then
			wp.alt_type = 'RADIO'
		elseif altType == 'baro' or 'asl' then
			wp.alt_type = 'BARO'
		end
	else
		wp.alt_type = 'RADIO'
	end
	
	if point.speed then  
		speed = point.speed
	end
	
	if point.type then
		WPtype = point.type
	end
	
	if not speed then
		wp.speed = mist.utils.kmphToMps(500)
	else
		wp.speed = speed
	end
	
	if not WPtype then
		wp.action =  'Turning Point'
	else
		WPtype = string.lower(WPtype)
		if WPtype == 'flyover' or WPtype == 'fly over' or WPtype == 'fly_over' then
			wp.action =  'Fly Over Point'
		elseif WPtype == 'turningpoint' or WPtype == 'turning point' or WPtype == 'turning_point' then
			wp.action =  'Turning Point'
		else
			wp.action = 'Turning Point'
		end
	end
	
	wp.type = 'Turning Point'
	return wp 
end

mist.heli.buildWP = function(point, WPtype, speed, alt, altType)

	local wp = {}
	wp.x = point.x
	
	if point.z then
		wp.y = point.z
	else
		wp.y = point.y
	end
	
	if alt and type(alt) == 'number' then
		wp.alt = alt
	else
		wp.alt = 500
	end
	
	if altType then
		altType = string.lower(altType)
		if altType == 'radio' or 'agl' then
			wp.alt_type = 'RADIO'
		elseif altType == 'baro' or 'asl' then
			wp.alt_type = 'BARO'
		end
	else
		wp.alt_type = 'RADIO'
	end
	
	if point.speed then  
		speed = point.speed
	end
	
	if point.type then
		WPtype = point.type
	end
	
	if not speed then
		wp.speed = mist.utils.kmphToMps(200)
	else
		wp.speed = speed
	end
	
	if not WPtype then
		wp.action =  'Turning Point'
	else
		WPtype = string.lower(WPtype)
		if WPtype == 'flyover' or WPtype == 'fly over' or WPtype == 'fly_over' then
			wp.action =  'Fly Over Point'
		elseif WPtype == 'turningpoint' or WPtype == 'turning point' or WPtype == 'turning_point' then
			wp.action = 'Turning Point'
		else
			wp.action =  'Turning Point'
		end
	end
	
	wp.type = 'Turning Point'
	return wp 
end



---------------------------------

--


-- need to return a Vec3 or Vec2?
function mist.getRandPointInCircle(point, radius, innerRadius)
	local theta = 2*math.pi*math.random()
	local rad = math.random() + math.random()
	if rad > 1 then 
		rad = 2 - rad
	end
	
	local radMult
	if innerRadius and innerRadius <= radius then
		radMult = (radius - innerRadius)*rad + innerRadius
	else
		radMult = radius*rad
	end
	
	if not point.z then --might as well work with vec2/3
		point.z = point.y
	end
	
	local rndCoord
	if radius > 0 then
		rndCoord = {x = math.cos(theta)*radMult + point.x, y = math.sin(theta)*radMult + point.z}
	else
		rndCoord = {x = point.x, y = point.z}
	end
	return rndCoord
end





mist.groupToRandomPoint = function(vars)
	local group = vars.group --Required
	local point = vars.point --required
	local radius = vars.radius or 0
	local innerRadius = vars.innerRadius
	local form = vars.form or 'Cone'
	local heading = vars.heading or math.random()*2*math.pi
	local headingDegrees = vars.headingDegrees
	local speed = vars.speed or mist.utils.kmphToMps(20)
	
	
	local useRoads
	if not vars.disableRoads then
		useRoads = true
	else
		useRoads = false
	end
	
	local path = {}
	
	if headingDegrees then
		heading = headingDegrees*math.pi/180
	end
	
	if heading >= 2*math.pi then
		heading = heading - 2*math.pi
	end
	
	local rndCoord = mist.getRandPointInCircle(point, radius, innerRadius)
	
	local offset = {}
	local posStart = mist.getLeadPos(group)

	offset.x = mist.utils.round(math.sin(heading - (math.pi/2)) * 50 + rndCoord.x, 3)
	offset.z = mist.utils.round(math.cos(heading + (math.pi/2)) * 50 + rndCoord.y, 3)
	path[#path + 1] = mist.ground.buildWP(posStart, form, speed)

	
	if useRoads == true and ((point.x - posStart.x)^2 + (point.z - posStart.z)^2)^0.5 > radius * 1.3 then
		path[#path + 1] = mist.ground.buildWP({['x'] = posStart.x + 11, ['z'] = posStart.z + 11}, 'off_road', speed)
		path[#path + 1] = mist.ground.buildWP(posStart, 'on_road', speed)
		path[#path + 1] = mist.ground.buildWP(offset, 'on_road', speed)
	else 
		path[#path + 1] = mist.ground.buildWP({['x'] = posStart.x + 25, ['z'] = posStart.z + 25}, form, speed)
	end
		
	path[#path + 1] = mist.ground.buildWP(offset, form, speed)
	path[#path + 1] = mist.ground.buildWP(rndCoord, form, speed)
	
	mist.goRoute(group, path)
	
	return
end

mist.groupRandomDistSelf = function(gpData, dist, form, heading, speed)
	local pos = mist.getLeadPos(gpData)
	local fakeZone = {}
	fakeZone.radius = dist or math.random(300, 1000)
	fakeZone.point = {x = pos.x, y, pos.y, z = pos.z}
	mist.groupToRandomZone(gpData, fakeZone, form, heading, speed)

	return
end

mist.groupToRandomZone = function(gpData, zone, form, heading, speed)
	if type(gpData) == 'string' then
		gpData = Group.getByName(gpData)
	end
	
	if type(zone) == 'string' then
		zone = trigger.misc.getZone(zone)
	elseif type(zone) == 'table' and not zone.radius then
		zone = trigger.misc.getZone(zone[math.random(1, #zone)])
	end

	if speed then
		speed = mist.utils.kmphToMps(speed)
	end
	
	local vars = {}
	vars.group = gpData
	vars.radius = zone.radius
	vars.form = form
	vars.headingDegrees = heading
	vars.speed = speed
	vars.point = mist.utils.zoneToVec3(zone)
	
	mist.groupToRandomPoint(vars)

	return
end

mist.isTerrainValid = function(coord, terrainTypes) -- vec2/3 and enum or table of acceptable terrain types
	if coord.z then
		coord.y = coord.z
	end
	local typeConverted = {}
	
	if type(terrainTypes) == 'string' then -- if its a string it does this check
		for constId, constData in pairs(land.SurfaceType) do
			if string.lower(constId) == string.lower(terrainTypes) or string.lower(constData) == string.lower(terrainTypes) then
				table.insert(typeConverted, constId)
			end
		end
	elseif type(terrainTypes) == 'table' then -- if its a table it does this check 
		for typeId, typeData in pairs(terrainTypes) do
			for constId, constData in pairs(land.SurfaceType) do
				if string.lower(constId) == string.lower(typeData) or string.lower(constData) == string.lower(typeId) then
					table.insert(typeConverted, constId)
				end
			end
		end
	end
	for validIndex, validData in pairs(typeConverted) do 
		if land.getSurfaceType(coord) == land.SurfaceType[validData] then
			return true
		end
	end
	return false
end





mist.groupToPoint = function(gpData, point, form, heading, speed, useRoads)
	if type(point) == 'string' then
		point = trigger.misc.getZone(point)
	end
	if speed then
		speed = mist.utils.kmphToMps(speed)
	end
	
	local vars = {}
	vars.group = gpData
	vars.form = form
	vars.headingDegrees = heading
	vars.speed = speed
	vars.disableRoads = useRoads
	vars.point = mist.utils.zoneToVec3(point)
	mist.groupToRandomPoint(vars)
		
	return
end


mist.getLeadPos = function(group)
	if type(group) == 'string' then -- group name
		group = Group.getByName(group)
	end
	
	local units = group:getUnits()
	
	local leader = units[1]
	if not leader then  -- SHOULD be good, but if there is a bug, this code future-proofs it then.
		local lowestInd = math.huge 
		for ind, unit in pairs(units) do
			if ind < lowestInd then
				lowestInd = ind
				leader = unit
			end
		end
	end
	if leader and Unit.isExist(leader) then  -- maybe a little too paranoid now...
		return leader:getPosition().p
	end
end

-- end of Mission task functions
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-------MESAGGES------
--[[
local msg = {}
msg.text = string (required)
msg.displayTime = number (required)
msg.msgFor = table (required)
msg.name = string (optional)
mist.message.add(msg) 

msgFor accepts a table 


]]


--[[ 
Need to change to this format...
scope:
	{
		units = {...},  -- unit names.
		coa = {...}, -- coa names
		countries = {...}, -- country names
		CA = {...}, -- looks just like coa.
		unitTypes = { red = {}, blue = {}, all = {}, Russia = {},}
	}
	
	
scope examples:

{  units = { 'Hawg11', 'Hawg12' }, CA = {'blue'} }

{ countries = {'Georgia'}, unitTypes = {blue = {'A-10C', 'A-10A'}}}

{ coa = {'all'}}

{unitTypes = { blue = {'A-10C'}}}
]]


--[[ vars for mist.message.add
	vars.text = 'Hello World'
	vars.displayTime = 20
	vars.msgFor = {coa = {'red'}, countries = {'Ukraine', 'Georgia'}, unitTypes = {'A-10C'}}

]]
do
	local messageList = {}
	local messageDisplayRate = 0.1 -- this defines the max refresh rate of the message box it honestly only needs to go faster than this for precision timing stuff (which could be its own function)
	local messageID = 0
		
	mist.message = {
	

		add = function(vars)
			local function msgSpamFilter(recList, spamBlockOn)
				for id, name in pairs(recList) do
					if name == spamBlockOn then
					--	env.info('already on recList')
						return recList
					end
				end
				--env.info('add to recList')
				table.insert(recList, spamBlockOn)
				return recList
			end
			
			--[[
			local vars = {}
			vars.text = 'Hello World'
			vars.displayTime = 20
			vars.msgFor = {coa = {'red'}, countries = {'Ukraine', 'Georgia'}, unitTypes = {'A-10C'}}
			mist.message.add(vars)

			Displays the message for all red coalition players. Players belonging to Ukraine and Georgia, and all A-10Cs on the map
			
			]]
		
			
			local new = {}
			new.text = vars.text -- The actual message
			new.displayTime = vars.displayTime -- How long will the message appear for
			new.displayedFor = 0 -- how long the message has been displayed so far
			new.name = vars.name   -- ID to overwrite the older message (if it exists) Basically it replaces a message that is displayed with new text.
			new.addedAt = timer.getTime()
			
			
			if vars.sound then -- has no function yet, basic idea is to play the sound file for designated players. Had considered a more complex system similar to On Station audio messaging with staggering mesages, but that isn't entirely needed.
			-- additionally we could have an "outSound" function that will do just the audio alone with no text
				new.sound = vars.sound
				new.playAudio = true
			end
			
			local newMsgFor = {} -- list of all groups message displays for
			for forIndex, forData in pairs(vars.msgFor) do 
				for list, listData in pairs(forData) do
					for clientId, clientData in pairs(mist.DBs.humansById) do
						forIndex = string.lower(forIndex)
						if type(listData) == 'string' then
							listData = string.lower(listData)
						end
						if forIndex == 'coa' and (listData == string.lower(clientData.coalition) or listData == 'all') or forIndex == 'countries' and string.lower(clientData.country) == listData or forIndex == 'units' and string.lower(clientData.unitName) == listData then --
							newMsgFor = msgSpamFilter(newMsgFor, clientId) -- so units dont get the same message twice if complex rules are given
							--table.insert(newMsgFor, clientId)
						elseif forIndex == 'unittypes' then
							for typeId, typeData in pairs(listData) do
								local found = false
								for clientDataEntry, clientDataVal in pairs(clientData) do
									if type(clientDataVal) == 'string' then
										if string.lower(list) == string.lower(clientDataVal) or list == 'all' then
											if typeData == clientData.type then
												found = true
												newMsgFor = msgSpamFilter(newMsgFor, clientId) -- sends info oto other function to see if client is already recieving the current message.
												--table.insert(newMsgFor, clientId)
											end
										end
									end
									if found == true then  -- shouldn't this be elsewhere too?
										break
									end
								end
							end

						end
					end
				    for coaData, coaId in pairs(coalition.side) do
						if string.lower(forIndex) == 'coa' or string.lower(forIndex) == 'ca' then
							if listData == string.lower(coaData) or listData == 'all' then
								newMsgFor = msgSpamFilter(newMsgFor, coaData)
								--table.insert(newMsgFor, coaData)
							-- added redca or blueca to list
							end
						end
					end
				end
			end	
			
			if #newMsgFor > 0 then
				new.msgFor = newMsgFor -- I swear its not confusing
				
			else
				return false
			end
				
				
			if vars.name then
				for i = 1, #messageList do
					if messageList[i].name then
						if messageList[i].name == vars.name then
							messageList[i] = new
							return new  --returning before setting the metatable?
						end
					end
				end
			end
			
			messageID = messageID + 1
			new.messageID = messageID

			--mist.debug.writeData(mist.utils.serialize,{'msg', new}, 'newMsg.txt')
			
			messageList[#messageList + 1] = new
			
			local mt = { __index =  mist.message}
			setmetatable(new, mt)  
								
								
		
			return messageID
			
		end,
				
		-- remove = function(self)  -- not a self variable in this case; this function should be passed a self variable and does not need a message id;  see example below.
			-- for i, msgData in pairs(messageList) do
				-- if messageList[i].messageID == self then
					-- table.remove(messageList, i)
					-- return true --removal successful
				-- end
			-- end
			-- return false -- removal not successful this script fails at life!
		-- end,
		
		------------------------------------------------------
		------------------------------------------------------
		-- proposed changes:
		remove = function(self)  -- Now a self variable; the former functionality taken up by mist.message.removeById.
			for i, msgData in pairs(messageList) do
				if messageList[i] == self then  
					table.remove(messageList, i)
					return true --removal successful
				end
			end
			return false -- removal not successful this script fails at life!
		end,
		
		removeById = function(id)  -- This function is NOT passed a self variable; it is the remove by id function.
			for i, msgData in pairs(messageList) do
				if messageList[i].messageID == id then  
					table.remove(messageList, i)
					return true --removal successful
				end
			end
			return false -- removal not successful this script fails at life!
		end,
		
		
		
		------------------------------------------------------
		------------------------------------------------------
	}	
	
	-----------------------------------------------------------------
	-- No longer necessary, use the self:remove() instead.
	
	-- Local function now
	-- local function mistMSGDestroy(self)  -- not a self variable
		-- for i, msgData in pairs(messageList) do
			-- if messageList[i] == self then
				-- table.remove(messageList, i)
				-- return true --removal successful
			-- end
		-- end
		-- return false -- removal not successful this script fails at life!

	
	-- end
	-------------------------------------------------------------------------------
	
	-- local function now

	--[[
	audio design concept
	Need to stagger messages?
	
	]]
	
	-- local function now
	local function mistdisplayV3() -- adding audio file support
		-- CA roles
		local caMessageRed = false
		local caMessageBlue = false
		local audioRed = false
		local audioBlue = false
		local audioPlaying = false

		if #messageList > 0 then
			
			for messageId, messageData in pairs(messageList) do
				if messageData.displayedFor > messageData.displayTime then
					--mistMSGDestroy(messageData)
					messageData:remove()  -- now using the remove/destroy function.
					
				--[[else
					if messageData.fileName then
						audioPlaying = true
					end]]
				end
				
				messageList[messageId].displayedFor = messageList[messageId].displayedFor + messageDisplayRate
			end
			for coaData, coaId in pairs(coalition.side) do
				local CAmsg = {}
				local newestMsg = 100000000
				
				for messageIndex, messageData in pairs(messageList) do 
					for forIndex, forData in pairs(messageData.msgFor) do
					
						if coaData == forData then
							if messageData.addedAt < newestMsg then
								newestMsg = messageData.addedAt
							end
							if messageData.text then
								CAmsg[#CAmsg + 1] = messageData.text
								CAmsg[#CAmsg + 1] = '\n ---------------- \n'
							end
							if type(messageData.sound) == 'string' and messageData.addedAt + messageDisplayRate > timer.getTime() then
								if coaData == 'RED' then
									audioRed = true
									trigger.action.outSoundForCoalition(coalition.side.RED, messageData.sound)
								elseif coaData == 'BLUE' then
									audioBlue = true
									trigger.action.outSoundForCoalition(coalition.side.BLUE, messageData.sound)
								end
							end							
						end
					end
				end
				if #CAmsg > 0 then
					if newestMsg < timer.getTime() + .5 then
						if coaData == 'BLUE' then
							trigger.action.outTextForCoalition(coalition.side.BLUE, table.concat(CAmsg), 1)
							caMessageBlue = true
						elseif coaData == 'RED' then
							trigger.action.outTextForCoalition(coalition.side.RED, table.concat(CAmsg), 1)
							caMessageRed = true
						end
					end
				end	
			end
			for clientId, clientData in pairs(mist.DBs.humansById) do	
				local clientDisplay = {}
		
				for messageIndex, messageData in pairs(messageList) do 
					for forIndex, forData in pairs(messageData.msgFor) do
						if clientId == forData and Group.getByName(clientData.groupName) then
							if messageData.text then
								clientDisplay[#clientDisplay + 1] = messageData.text
								clientDisplay[#clientDisplay + 1] = '\n ---------------- \n'
							end
							if string.lower(clientData.coalition) == 'red' and audioRed == false or string.lower(clientData.coalition) == 'blue' and audioBlue == false then
								if type(messageData.sound) == 'string' and messageData.addedAt + messageDisplayRate > timer.getTime() then
									trigger.action.outSoundForGroup(clientData.groupId, messageData.sound)
								end
							end
						end
					end
				end
				if #clientDisplay > 0 then
					trigger.action.outTextForGroup(clientData.groupId, table.concat(clientDisplay), 1)
					
				elseif #clientDisplay == 0 then
					if clientData.coalition == 'blue' and caMessageBlue == true then
						trigger.action.outTextForGroup(clientData.groupId, 'Blue CA Recieving Message', 1) -- I'd rather this recive the message with a note that its for CA than a blank message box.
					elseif clientData.coalition == 'red' and caMessageRed == true then
						trigger.action.outTextForGroup(clientData.groupId, 'Red CA Recieving Message', 1)
					end
				end
			
				
			end
		end
		
	end
	

	
	mist.scheduleFunction(mistdisplayV3, {}, timer.getTime() + messageDisplayRate, messageDisplayRate) -- add this to the main mist thing
	
end
-- End of message system
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- Beginning of coordinate messages
--[[
Design:

Already have:
mist.tostringBR = function(az, dist, alt, metric)
mist.tostringLL = function(lat, lon, acc, DMS)
mist.tostringMGRS = function(MGRS, acc)

Need:
mist.getMGRSString(UnitNameTable, acc)
mist.getLeadingMGRSString(UnitNameTable, dir, radius, acc)

mist.getLLString(UnitNameTable, acc)
mist.getLeadingLLString(UnitNameTable, dir, radius acc)

mist.getBRString(UnitNameTable, ref, alt, metric)
mist.getLeadingBRString(UnitNameTable, ref, alt, metric, dir, radius, acc)   -- vars versions?


mist.sendMGRSMsg(vars)
mist.sendLeadingMGRSMsg(vars)

mist.sendLLMsg(vars)
mist.sendLeadingLLMsg(vars)

mist.sendBRMsg(vars)
mist.sendLeadingBRMsg(vars)

]]

--[[RE-EXAMINE USAGE OF VARS FOR SIMPLE FUNCTIONS.
(Answer: the leading functions require a lot of input variables; maybe better to leave in vars
format for consistency.  Maybe individual variable specification could also be supported?)

]]


--[[ vars for mist.getMGRSString:
vars.units - table of unit names (NOT unitNameTable- maybe this should change).
vars.acc - integer between 0 and 5, inclusive
]]
mist.getMGRSString = function(vars)
	local units = vars.units
	local acc = vars.acc or 5
	local avgPos = mist.getAvgPos(units)
	if avgPos then
		return mist.tostringMGRS(coord.LLtoMGRS(coord.LOtoLL(avgPos)), acc)
	end
end

--[[ vars for mist.getLLString
vars.units - table of unit names (NOT unitNameTable- maybe this should change).
vars.acc - integer, number of numbers after decimal place
vars.DMS - if true, output in degrees, minutes, seconds.  Otherwise, output in degrees, minutes.


]]
mist.getLLString = function(vars)
	local units = vars.units
	local acc = vars.acc or 3
	local DMS = vars.DMS
	local avgPos = mist.getAvgPos(units)
	if avgPos then
		local lat, lon = coord.LOtoLL(avgPos)
		return mist.tostringLL(lat, lon, acc, DMS)
	end
end


--[[
vars.units- table of unit names (NOT unitNameTable- maybe this should change).
vars.ref -  vec3 ref point, maybe overload for vec2 as well?
vars.alt - boolean, if used, includes altitude in string
vars.metric - boolean, gives distance in km instead of NM.
]]
mist.getBRString = function(vars)
	local units = vars.units
	local ref = mist.utils.makeVec3(vars.ref, 0)  -- turn it into Vec3 if it is not already.
	local alt = vars.alt
	local metric = vars.metric
	local avgPos = mist.getAvgPos(units)
	if avgPos then
		local vec = {x = avgPos.x - ref.x, y = avgPos.y - ref.y, z = avgPos.z - ref.z}
		local dir = mist.utils.getDir(vec, ref)
		local dist = mist.utils.get2DDist(avgPos, ref)
		if alt then
			alt = avgPos.y
		end
		return mist.tostringBR(dir, dist, alt, metric)
	end
end


-- Returns the Vec3 coordinates of the average position of the concentration of units most in the heading direction.
--[[ vars for mist.getLeadingPos:
vars.units - table of unit names
vars.heading - direction
vars.radius - number
vars.headingDegrees - boolean, switches heading to degrees
]]
mist.getLeadingPos = function(vars)
	local units = vars.units
	local heading = vars.heading
	local radius = vars.radius
	if vars.headingDegrees then
		heading = mist.utils.toRadian(vars.headingDegrees)
	end
	
	local unitPosTbl = {}
	for i = 1, #units do
		local unit = Unit.getByName(units[i])
		if unit and unit:isExist() then
			unitPosTbl[#unitPosTbl + 1] = unit:getPosition().p
		end
	end
	if #unitPosTbl > 0 then  -- one more more units found.
		-- first, find the unit most in the heading direction
		local maxPos = -math.huge 
		
		local maxPosInd  -- maxPos - the furthest in direction defined by heading; maxPosInd = 
		for i = 1, #unitPosTbl do
			local rotatedVec2 = mist.vec.rotateVec2(mist.utils.makeVec2(unitPosTbl[i]), heading)
			if (not maxPos) or maxPos < rotatedVec2.x then
				maxPos = rotatedVec2.x
				maxPosInd = i
			end
		end
		
		--now, get all the units around this unit...
		local avgPos
		if radius then
			local maxUnitPos = unitPosTbl[maxPosInd]
			local avgx, avgy, avgz, totNum = 0, 0, 0, 0
			for i = 1, #unitPosTbl do
				if mist.utils.get2DDist(maxUnitPos, unitPosTbl[i]) <= radius then
					avgx = avgx + unitPosTbl[i].x
					avgy = avgy + unitPosTbl[i].y
					avgz = avgz + unitPosTbl[i].z
					totNum = totNum + 1
				end
			end
			avgPos = { x = avgx/totNum, y = avgy/totNum, z = avgz/totNum}
		else
			avgPos = unitPosTbl[maxPosInd]
		end
	
		return avgPos
	end
end


--[[ vars for mist.getLeadingMGRSString:
vars.units - table of unit names
vars.heading - direction
vars.radius - number
vars.headingDegrees - boolean, switches heading to degrees
vars.acc - number, 0 to 5.
]]
mist.getLeadingMGRSString = function(vars)
	local pos = mist.getLeadingPos(vars)
	if pos then
		local acc = vars.acc or 5
		return mist.tostringMGRS(coord.LLtoMGRS(coord.LOtoLL(pos)), acc)
	end
end

--[[ vars for mist.getLeadingLLString:
vars.units - table of unit names
vars.heading - direction, number
vars.radius - number
vars.headingDegrees - boolean, switches heading to degrees
vars.acc - number of digits after decimal point (can be negative)
vars.DMS -  boolean, true if you want DMS.
]]
mist.getLeadingLLString = function(vars)
	local pos = mist.getLeadingPos(vars)
	if pos then
		local acc = vars.acc or 3
		local DMS = vars.DMS
		local lat, lon = coord.LOtoLL(pos)
		return mist.tostringLL(lat, lon, acc, DMS)
	end
end



--[[ vars for mist.getLeadingBRString:
vars.units - table of unit names
vars.heading - direction, number
vars.radius - number
vars.headingDegrees - boolean, switches heading to degrees
vars.metric - boolean, if true, use km instead of NM.
vars.alt - boolean, if true, include altitude.
vars.ref - vec3/vec2 reference point.
]]
mist.getLeadingBRString = function(vars)
	local pos = mist.getLeadingPos(vars)
	if pos then
		local ref = vars.ref
		local alt = vars.alt
		local metric = vars.metric
		
		local vec = {x = pos.x - ref.x, y = pos.y - ref.y, z = pos.z - ref.z}
		local dir = mist.utils.getDir(vec, ref)
		local dist = mist.utils.get2DDist(pos, ref)
		if alt then
			alt = pos.y
		end
		return mist.tostringBR(dir, dist, alt, metric)
	end
end

--[[ vars for mist.message.add
	vars.text = 'Hello World'
	vars.displayTime = 20
	vars.msgFor = {coa = {'red'}, countries = {'Ukraine', 'Georgia'}, unitTypes = {'A-10C'}}

]]

--[[ vars for mist.msgMGRS
vars.units - table of unit names (NOT unitNameTable- maybe this should change).
vars.acc - integer between 0 and 5, inclusive
vars.text - text in the message
vars.displayTime - self explanatory
vars.msgFor - scope
]]
mist.msgMGRS = function(vars)
	local units = vars.units
	local acc = vars.acc
	local text = vars.text
	local displayTime = vars.displayTime
	local msgFor = vars.msgFor
	
	local s = mist.getMGRSString{units = units, acc = acc}
	local newText
	if string.find(text, '%%s') then  -- look for %s
		newText = string.format(text, s)  -- insert the coordinates into the message
	else  -- else, just append to the end.
		newText = text .. s
	end
	
	mist.message.add{
		text = newText,
		displayTime = displayTime,
		msgFor = msgFor
	}
end

--[[ vars for mist.msgLL
vars.units - table of unit names (NOT unitNameTable- maybe this should change) (Yes).
vars.acc - integer, number of numbers after decimal place
vars.DMS - if true, output in degrees, minutes, seconds.  Otherwise, output in degrees, minutes.
vars.text - text in the message
vars.displayTime - self explanatory
vars.msgFor - scope
]]
mist.msgLL = function(vars)
	local units = vars.units  -- technically, I don't really need to do this, but it helps readability.
	local acc = vars.acc
	local DMS = vars.DMS
	local text = vars.text
	local displayTime = vars.displayTime
	local msgFor = vars.msgFor
	
	local s = mist.getLLString{units = units, acc = acc, DMS = DMS}
	local newText
	if string.find(text, '%%s') then  -- look for %s
		newText = string.format(text, s)  -- insert the coordinates into the message
	else  -- else, just append to the end.
		newText = text .. s
	end
	
	mist.message.add{
		text = newText,
		displayTime = displayTime,
		msgFor = msgFor
	}

end


--[[
vars.units- table of unit names (NOT unitNameTable- maybe this should change).
vars.ref -  vec3 ref point, maybe overload for vec2 as well?
vars.alt - boolean, if used, includes altitude in string
vars.metric - boolean, gives distance in km instead of NM.
vars.text - text of the message
vars.displayTime
vars.msgFor - scope
]]
mist.msgBR = function(vars)
	local units = vars.units  -- technically, I don't really need to do this, but it helps readability.
	local ref = vars.ref -- vec2/vec3 will be handled in mist.getBRString
	local alt = vars.alt
	local metric = vars.metric
	local text = vars.text
	local displayTime = vars.displayTime
	local msgFor = vars.msgFor
	
	local s = mist.getBRString{units = units, ref = ref, alt = alt, metric = metric}
	local newText
	if string.find(text, '%%s') then  -- look for %s
		newText = string.format(text, s)  -- insert the coordinates into the message
	else  -- else, just append to the end.
		newText = text .. s
	end
	
	mist.message.add{
		text = newText,
		displayTime = displayTime,
		msgFor = msgFor
	}

end


--------------------------------------------------------------------------------------------
-- basically, just sub-types of mist.msgBR... saves folks the work of getting the ref point.
--[[
vars.units- table of unit names (NOT unitNameTable- maybe this should change).
vars.ref -  string red, blue
vars.alt - boolean, if used, includes altitude in string
vars.metric - boolean, gives distance in km instead of NM.
vars.text - text of the message
vars.displayTime
vars.msgFor - scope
]]
mist.msgBullseye = function(vars)
	if string.lower(vars.ref) == 'red' then
		vars.ref = mist.DBs.missionData.bullseye.red
		mist.msgBR(vars)
	elseif string.lower(vars.ref) == 'blue' then
		vars.ref = mist.DBs.missionData.bullseye.blue
		mist.msgBR(vars)
	end
end

--[[
vars.units- table of unit names (NOT unitNameTable- maybe this should change).
vars.ref -  unit name of reference point
vars.alt - boolean, if used, includes altitude in string
vars.metric - boolean, gives distance in km instead of NM.
vars.text - text of the message
vars.displayTime
vars.msgFor - scope
]]

mist.msgBRA = function(vars)
	if Unit.getByName(vars.ref) then
		vars.ref = Unit.getByName(vars.ref):getPosition().p
		if not vars.alt then
			vars.alt = true
		end
		mist.msgBR(vars)
	end
end
--------------------------------------------------------------------------------------------

--[[ vars for mist.msgLeadingMGRS:
vars.units - table of unit names
vars.heading - direction
vars.radius - number
vars.headingDegrees - boolean, switches heading to degrees (optional)
vars.acc - number, 0 to 5.
vars.text - text of the message
vars.displayTime
vars.msgFor - scope
]]
mist.msgLeadingMGRS = function(vars)
	local units = vars.units  -- technically, I don't really need to do this, but it helps readability.
	local heading = vars.heading 
	local radius = vars.radius
	local headingDegrees = vars.headingDegrees
	local acc = vars.acc
	local text = vars.text
	local displayTime = vars.displayTime
	local msgFor = vars.msgFor
	
	local s = mist.getLeadingMGRSString{units = units, heading = heading, radius = radius, headingDegrees = headingDegrees, acc = acc}
	local newText
	if string.find(text, '%%s') then  -- look for %s
		newText = string.format(text, s)  -- insert the coordinates into the message
	else  -- else, just append to the end.
		newText = text .. s
	end
	
	mist.message.add{
		text = newText,
		displayTime = displayTime,
		msgFor = msgFor
	}


end
--[[ vars for mist.msgLeadingLL:
vars.units - table of unit names
vars.heading - direction, number
vars.radius - number
vars.headingDegrees - boolean, switches heading to degrees (optional)
vars.acc - number of digits after decimal point (can be negative)
vars.DMS -  boolean, true if you want DMS. (optional)
vars.text - text of the message
vars.displayTime
vars.msgFor - scope
]]
mist.msgLeadingLL = function(vars)
	local units = vars.units  -- technically, I don't really need to do this, but it helps readability.
	local heading = vars.heading 
	local radius = vars.radius
	local headingDegrees = vars.headingDegrees
	local acc = vars.acc
	local DMS = vars.DMS
	local text = vars.text
	local displayTime = vars.displayTime
	local msgFor = vars.msgFor
	
	local s = mist.getLeadingLLString{units = units, heading = heading, radius = radius, headingDegrees = headingDegrees, acc = acc, DMS = DMS}
	local newText
	if string.find(text, '%%s') then  -- look for %s
		newText = string.format(text, s)  -- insert the coordinates into the message
	else  -- else, just append to the end.
		newText = text .. s
	end
	
	mist.message.add{
		text = newText,
		displayTime = displayTime,
		msgFor = msgFor
	}

end

--[[
vars.units - table of unit names
vars.heading - direction, number
vars.radius - number
vars.headingDegrees - boolean, switches heading to degrees  (optional)
vars.metric - boolean, if true, use km instead of NM. (optional)
vars.alt - boolean, if true, include altitude. (optional)
vars.ref - vec3/vec2 reference point.
vars.text - text of the message
vars.displayTime
vars.msgFor - scope
]]
mist.msgLeadingBR = function(vars)
	local units = vars.units  -- technically, I don't really need to do this, but it helps readability.
	local heading = vars.heading 
	local radius = vars.radius
	local headingDegrees = vars.headingDegrees
	local metric = vars.metric
	local alt = vars.alt
	local ref = vars.ref -- vec2/vec3 will be handled in mist.getBRString
	local text = vars.text
	local displayTime = vars.displayTime
	local msgFor = vars.msgFor
	
	local s = mist.getLeadingBRString{units = units, heading = heading, radius = radius, headingDegrees = headingDegrees, metric = metric, alt = alt, ref = ref}
	local newText
	if string.find(text, '%%s') then  -- look for %s
		newText = string.format(text, s)  -- insert the coordinates into the message
	else  -- else, just append to the end.
		newText = text .. s
	end
	
	mist.message.add{
		text = newText,
		displayTime = displayTime,
		msgFor = msgFor
	}
end


-- end of coordinate messages
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
-- start of sct Merge

do -- all function uses of group and unit Ids must be in this do statement
	local mistGpId = 7000
	local mistUnitId = 7000
	local mistDynAddIndex = 1
	
	 mist.nextGroupId = 1
	 mist.nextUnitId = 1
	

	local tempSpawnedUnits = {} -- birth events added here
	local addToDBs = {} -- mist.dynAdd added here
	
	local function checkSpawnedEvents()
		--env.info('check Spawned Events')
		local groupsToAdd = {}
		
		for index, gpData in pairs(addToDBs) do
			groupsToAdd[#groupsToAdd + 1] = gpData
			groupsToAdd[#groupsToAdd].mist = true -- ok now
			
			addToDBs[index] = nil
		end
		--env.info(#groupsToAdd)
		--env.info(#tempSpawnedUnits)
		for eventId, eventData in pairs(tempSpawnedUnits) do
			if eventData then
				if eventData:getCategory() == 1 then -- normal groups
					local match = false
					if #groupsToAdd > 0 then -- if groups are expected
						for groupId, groupData in pairs(groupsToAdd) do -- iterate through known groups to add
							if (type(groupData) == 'string' and groupData == eventData:getGroup():getName()) or (type(groupData) == 'table' and groupData.name == eventData:getGroup():getName()) then -- already added, do nothing
								match = true
								break
							end
						end
						if match == false then -- hasn't been added
							groupsToAdd[#groupsToAdd + 1] = Unit.getByName(eventData):getGroup():getName()
						end
					else -- no groups added by mist
						groupsToAdd[#groupsToAdd + 1] = Unit.getByName(eventData):getGroup():getName()
					end
				elseif  eventData:getCategory() == 3 then -- static objects
					local name = eventData:getName()
					local found = false
					for groupId, groupData in pairs(groupsToAdd) do
						if type(groupData) == 'string' and groupData == name then
							found = true
							break
						end
					end
					if found == false then
						groupsToAdd[#groupsToAdd + 1] = name
					end
				end
			end
			tempSpawnedUnits[eventId] = nil
		end
		
		
		if #groupsToAdd > 0 then
			--env.info('doDBUpdate')
			for groupId, groupData in pairs(groupsToAdd) do
				if not mist.DBs.groupsByName[groupData] or mist.DBs.groupsByName[groupData] and mist.DBs.groupsByName[groupData].startTime + 10 < timer.getAbsTime() then
					mist.dbUpdate(groupData)
				end
			end
		end
	end
	
	mist.scheduleFunction(checkSpawnedEvents, {}, timer.getTime() + 5, 2)
	
	for id, idData in pairs(mist.DBs.unitsById) do
		if idData.unitId > mist.nextUnitId then
			mist.nextUnitId = mist.utils.deepCopy(idData.unitId)
		end
		if idData.groupId > mist.nextGroupId then
			mist.nextGroupId = mist.utils.deepCopy(idData.groupId)
		end
	end
	
	mist.getNextUnitId = function()
		mist.nextUnitId = mist.nextUnitId + 1
		if mist.nextUnitId > 6900 then
			mist.nextUnitId = 14000
		end
		return mist.nextUnitId
	end
	
	mist.getNextGroupId = function()
		mist.nextGroupId = mist.nextGroupId + 1
		if mist.nextGroupId > 6900 then
			mist.nextGroupId = 14000
		end
		return mist.nextGroupId
	end
	
	local function groupSpawned(event)
		

		--trigger.action.outText(mist.utils.tableShow(event), 25)
		if event.id == world.event.S_EVENT_BIRTH and timer.getTime0() < timer.getAbsTime()then -- dont need to add units spawned in at the start of the mission if mist is loaded in init line
			--env.info(#tempSpawnedUnits .. 'S_EVENTBIRTH')
			tempSpawnedUnits[#tempSpawnedUnits + 1] = (event.initiator)

			--[[local msg = {}
			msg.text = mist.utils.tableShow(event)
			msg.text = msg.text .. '\n' .. Unit.getName(event.initiator)
			msg.msgFor = {coa = {'all'}}
			msg.displayTime = 10
		
			mist.message.add(msg)]]
		--	mist.scheduleFunction(checkSpawnedEvents, {}, timer.getTime() + 1.5)
		end

	end
	
	mist.addEventHandler(groupSpawned)
	
	
	mist.dbUpdate = function(event)
		local groupData
	
		--env.info('dbUpdate')
	--[[ Similar to normal DBs, example...
		[unitID] = {
			[instance1] = {fist added unitData}
			[instance2] = {2nd added Unit Data}

	]]
	
	
		if type(event) == 'string' then -- if name of an object. 
			--env.info('event')
			local newObject
			local newType = 'group'
			if Group.getByName(event) then
				newObject = Group.getByName(event)
				--env.info('group')
			elseif StaticObject.getByName(event) then
				newObject = StaticObject.getByName(event)
				newType = 'static'
			--	env.info('its static')
			else
				env.info('WTF')
				return false
			end
			
			groupData = {}
			groupData.name = newObject:getName()
			groupData.groupId = tonumber(newObject:getID())

			local unitOneRef 
			if newType == 'static' then
			
				unitOneRef = newObject	
				groupData.countryId = tonumber(newObject:getCountry())
				groupData.coalitionId = tonumber(newObject:getCoalition())
				groupData.category = 'static'
			else
				unitOneRef = newObject:getUnits()
				groupData.countryId = tonumber(unitOneRef[1]:getCountry())
				groupData.coalitionId = tonumber(unitOneRef[1]:getCoalition())
				groupData.category = tonumber(newObject:getCategory())
			end
			
			groupData.units = {}
			if newType == 'group' then
				for unitId, unitData in pairs(unitOneRef) do
					groupData.units[unitId] = {}
					groupData.units[unitId].name = unitData:getName()
					
					groupData.units[unitId].x = mist.utils.round(unitData:getPosition().p.x)
					groupData.units[unitId].y = mist.utils.round(unitData:getPosition().p.z)
					groupData.units[unitId].alt = mist.utils.round(unitData:getPosition().p.y)
					groupData.units[unitId].alt_type = "BARO"				
					groupData.units[unitId].heading = mist.getHeading(unitData)

					groupData.units[unitId].type = unitData:getTypeName()
					groupData.units[unitId].unitId = tonumber(unitData:getID())
					groupData.units[unitId].skill = "HIGH" 
					
					groupData.units[unitId].groupName = groupData.name
					groupData.units[unitId].groupId = groupData.groupId
					groupData.units[unitId].countryId = groupData.countryId
					groupData.units[unitId].coalitionId = groupData.coalitionId
					
				end
			else -- its a static

				groupData.units[1] = {}
				groupData.units[1].name = newObject:getName()
				
				groupData.units[1].x = mist.utils.round(newObject:getPosition().p.x)
				groupData.units[1].y = mist.utils.round(newObject:getPosition().p.z)
				groupData.units[1].alt = mist.utils.round(newObject:getPosition().p.y)
				groupData.units[1].heading = mist.getHeading(newObject)
				groupData.units[1].type = newObject:getTypeName()
				groupData.units[1].unitId = tonumber(newObject:getID())
				groupData.units[1].groupName = groupData.name
				groupData.units[1].groupId = groupData.groupId
				groupData.units[1].countryId = groupData.countryId
				groupData.units[1].coalitionId = groupData.coalitionId
	
			
			end

		
		else -- its a table
			groupData = event
	
		end
	
		local mistCategory 
		if type(groupData.category) == 'string' then
			mistCategory = string.lower(groupData.category)
		end

		--mist.debug.writeData(mist.utils.serialize,{'DBs', groupData}, 'newUnits.txt')	
		--for newGroupIndex, newGroupData in pairs(groupData) do

		local newTable = {}
		
		local tableSize = #mist.DBs.dynGroupsAdded + 1
		newTable['name'] = groupData.name
		newTable['groupId'] = groupData.groupId
		newTable['startTime'] =  timer.getAbsTime()
		newTable['task'] = groupData.task
		

		for countryData, countryId in pairs(country.id) do
			if groupData.country and string.upper(countryData) == string.upper(groupData.country) or countryId == groupData.countryId then
				newTable['countryId'] = countryId
				newTable['country'] = string.lower(countryData)
				for coaData, coaId in pairs(coalition.side) do
					if coaId == coalition.getCountryCoalition(countryId) then 
						newTable['coalition'] = string.lower(coaData)
					end
				end
			end
		end

		for catData, catId in pairs(Unit.Category) do
			if Group.getByName(groupData.name) then
				if catId == Group.getByName(groupData.name):getCategory() then
					newTable['category'] = string.lower(catData)
				end
			elseif StaticObject.getByName(groupData.name) then
				if catId == StaticObject.getByName(groupData.name):getCategory() then
					newTable['category'] = string.lower(catData)
				end
			end
		end
		

		if string.upper(newTable['category']) == 'GROUND_UNIT' then
			mistCategory = 'vehicle'
			newTable['category'] = mistCategory
		elseif string.upper(newTable['category']) == 'AIRPLANE' then
			mistCategory = 'plane'
			newTable['category'] = mistCategory
		
		end
		newTable['units'] = {}
		for newUnitId, newUnitData in pairs(groupData.units) do
			if not newUnitData.unitId then
				
			end
			
			
			newTable['units'][newUnitId] = {}
			newTable['units'][newUnitId]['unitName'] = newUnitData.name
			newTable['units'][newUnitId]['groupId'] = tonumber(groupData.groupId)
			newTable['units'][newUnitId]['heading'] = newUnitData.heading
			newTable['units'][newUnitId]['point'] = {}
			newTable['units'][newUnitId]['point']['x'] = newUnitData.x
			newTable['units'][newUnitId]['point']['y'] = newUnitData.y
			newTable['units'][newUnitId]['alt'] = newUnitData.alt
			newTable['units'][newUnitId]['alt_type'] = newUnitData.alt_type
			newTable['units'][newUnitId]['unitId'] = tonumber(newUnitData.unitId)
			newTable['units'][newUnitId]['speed'] = newUnitData.speed
			newTable['units'][newUnitId]['airdromeId'] = newUnitData.airdromeId
			newTable['units'][newUnitId]['type'] = newUnitData.type
			newTable['units'][newUnitId]['skill'] = newUnitData.skill
			newTable['units'][newUnitId]['groupName'] = groupData.name
			newTable['units'][newUnitId]['livery_id'] = groupData.livery_id
			newTable['units'][newUnitId]['country'] = string.lower(newTable.country)
			newTable['units'][newUnitId]['countryId'] = newTable.countryId
			newTable['units'][newUnitId]['coalition'] = newTable.coalition
			newTable['units'][newUnitId]['category'] = newTable.category
			
			newTable['units'][newUnitId]['shape_name'] = newTable.shape_name -- for statics
			
						
			
			if newUnitData.unitId then
				mist.DBs.unitsById[tonumber(newUnitData.unitId)] = mist.utils.deepCopy(newTable['units'][newUnitId]) 
			end
			
			mist.DBs.unitsByName[newUnitData.name] = mist.utils.deepCopy(newTable['units'][newUnitId])
			mist.DBs.unitsByCat[mistCategory][#mist.DBs.unitsByCat[mistCategory] + 1] = mist.utils.deepCopy(newTable['units'][newUnitId])
			mist.DBs.unitsByNum[#mist.DBs.unitsByNum + 1] = mist.utils.deepCopy(newTable['units'][newUnitId])  
	
		end

		
		
		-- this is a really annoying DB to populate. Gotta create new tables in case its missing
		if not mist.DBs.units[newTable.coalition] then
			mist.DBs.units[newTable.coalition] = {}
		end

		if not mist.DBs.units[newTable.coalition][newTable.country] then
			mist.DBs.units[newTable.coalition][(newTable.country)] = {}
			mist.DBs.units[newTable.coalition][(newTable.country)]['countryId'] = newTable.countryId
		end
		if not mist.DBs.units[newTable.coalition][newTable.country][mistCategory] then
			mist.DBs.units[newTable.coalition][(newTable.country)][mistCategory] = {}
		end
		mist.DBs.units[newTable.coalition][(newTable.country)][mistCategory][#mist.DBs.units[newTable.coalition][(newTable.country)][mistCategory] + 1] = mist.utils.deepCopy(newTable)
		
		if newTable.groupId then
			mist.DBs.groupsById[groupData.groupId] = mist.utils.deepCopy(newTable)
		end
		
		mist.DBs.groupsByName[groupData.name] = mist.utils.deepCopy(newTable)
		
		newTable['timeAdded'] = timer.getAbsTime() -- only on the dynGroupsAdded table. For other reference, see start time
		mist.DBs.dynGroupsAdded[#mist.DBs.dynGroupsAdded + 1] = mist.utils.deepCopy(newTable)
		

		--mist.debug.dumpDBs()
		--end
		return
	end
	
	
	mist.dynAddStatic = function(staticObj)
		local newObj = {}
		newObj.groupId = staticObj.groupId
		newObj.category = staticObj.category
		newObj.type = staticObj.type
		newObj.unitId = staticObj.unitId
		newObj.y = staticObj.y
		newObj.x = staticObj.x
		newObj.heading = staticObj.heading
		newObj.name = staticObj.name
		newObj.dead = staticObj.dead
		newObj.country = staticObj.country
		newObj.clone = staticObj.clone
		newObj.shape_name = newObj.shape_name
		
		if staticObj.units then -- if its mist format
			newObj.groupId = staticObj.units[1].groupId
			newObj.category = staticObj.units[1].category
			newObj.type = staticObj.units[1].type
			newObj.unitId = staticObj.units[1].unitId
			newObj.y = staticObj.units[1].y
			newObj.x = staticObj.units[1].x
			newObj.heading = staticObj.units[1].heading
			newObj.name = staticObj.units[1].name
			newObj.dead = staticObj.units[1].dead
			newObj.country = staticObj.units[1].country
			newObj.shape_name = staticObj.units[1].shape_name
		end


		newObj.country = staticObj.country
		
		if not newObj.country then
			return false
		end
		
		local newCountry
		for countryName, countryId in pairs(country.id) do
			if type(newObj.country) == 'string' then
				if tostring(countryName) == string.upper(newObj.country) then
					newCountry = countryName
				end
			elseif type(newObj.country) == 'number' then
				if countryId == newObj.country then
					newCountry = countryName
				end
			end
		end
		
		if newObj.clone or not newObj.groupId then
			mistGpId = mistGpId + 1 
			newObj.groupId = mistGpId
		end
		
		if newObj.clone or not newObj.unitId then
			mistUnitId = mistUnitId + 1	
			newObj.unitId = mistUnitId
		end
		
		if newObj.clone or not newObj.name then
			mistDynAddIndex = mistDynAddIndex + 1
			newObj.name = (newCountry .. ' static ' .. mistDynAddIndex)
		end
		
		if not newObj.dead then
			newObj.dead = false
		end
		
		if not newObj.heading then
			newObj.heading = math.random(360)
		end
		
		if newObj.x and newObj.y and newObj.type and type(newObj.x) == 'number' and type(newObj.y) == 'number' and type(newObj.type) == 'string' then
			coalition.addStaticObject(country.id[newCountry], newObj)

			return newObj.name
		end	
		return false
	end

	mist.dynAdd = function(newGroup) -- same as coalition.add function in SSE. checks the passed data to see if its valid. 
--Will generate groupId, groupName, unitId, and unitName if needed
--
	
	
	--env.info('dynAdd')
	local cntry = newGroup.country
	local groupType = newGroup.category
	local newCountry = ''
	
	-- validate data
	for countryName, countryId in pairs(country.id) do
		if type(cntry) == 'string' then
			if tostring(countryName) == string.upper(cntry) then
				newCountry = countryName
			end
		elseif type(cntry) == 'number' then
			if countryId == cntry then
				newCountry = countryName
			end
		end
	end
	
	if newCountry == '' then
		return false
	end
	
	local newCat = ''
	for catName, catId in pairs(Unit.Category) do
		if type(groupType) == 'string' then
			if tostring(catName) == string.upper(groupType) then
				newCat = catName
			end
		elseif type(groupType) == 'number' then
			if catId == groupType then
				newCat = catName
			end
		end
		
		if catName == 'GROUND_UNIT' and (string.upper(groupType) == 'VEHICLE' or string.upper(groupType) == 'GROUND') then
			newCat = 'GROUND_UNIT'
		elseif catName == 'AIRPLANE' and string.upper(groupType) == 'PLANE' then
			newCat = 'AIRPLANE'
		end
	end
	
	local typeName 
	if newCat == 'GROUND_UNIT' then
		typeName = ' gnd '
	elseif newCat == 'AIRPLANE' then
		typeName = ' air '
	elseif newCat == 'HELICOPTER' then
		typeName = ' hel '
	elseif newCat == 'SHIP' then
		typeName = ' shp '
	elseif newCat == 'BUILDING' then
		typeName = ' bld '
	end
	
	if newGroup.clone or not newGroup.groupId then
		mistDynAddIndex = mistDynAddIndex + 1
		mistGpId = mistGpId + 1 
		newGroup.groupId = mistGpId
	end
	if newGroup.groupName or newGroup.name then
		if newGroup.groupName then
			newGroup['name'] = newGroup.groupName
		elseif newGroup.name then
			newGroup['name'] = newGroup.name
		end
	end
	if newGroup.clone or not newGroup.name then
		newGroup['name'] = tostring(tostring(cntry) .. tostring(typeName) .. mistDynAddIndex)
	end
	
	for unitIndex, unitData in pairs(newGroup.units) do

		local originalName = newGroup.units[unitIndex].unitName or newGroup.units[unitIndex].name
		if newGroup.clone or not unitData.unitId then
			mistUnitId = mistUnitId + 1	
			newGroup.units[unitIndex]['unitId'] = mistUnitId
		end
		if newGroup.units[unitIndex].unitName or newGroup.units[unitIndex].name then
			if newGroup.units[unitIndex].unitName then
				newGroup.units[unitIndex].name = newGroup.units[unitIndex].unitName
			elseif newGroup.units[unitIndex].name then
				newGroup.units[unitIndex].name = newGroup.units[unitIndex].name
			end
		end
		if newGroup.clone or not unitData.name then
			newGroup.units[unitIndex].name = tostring(newGroup.name .. ' unit' .. unitIndex)
		end
		
		if not unitData.skill then 
			newGroup.units[unitIndex].skill = 'Random'
		end
		
		if not unitData.alt then
			if newCat == 'AIRPLANE' then
				newGroup.units[unitIndex].alt = 2000
				newGroup.units[unitIndex].alt_type = 'RADIO'
				newGroup.units[unitIndex].speed = 150
			elseif newCat == 'HELICOPTER' then
				newGroup.units[unitIndex].alt = 500
				newGroup.units[unitIndex].alt_type = 'RADIO'
				newGroup.units[unitIndex].speed = 60
			else
				--[[env.info('check height')
				newGroup.units[unitIndex].alt = land.getHeight({x = newGroup.units[unitIndex].x, y = newGroup.units[unitIndex].y})
				newGroup.units[unitIndex].alt_type = 'BARO']]
			end
		

		end
				
		if newCat == 'AIRPLANE' or newCat == 'HELICOPTER' then
			if (newGroup.units[unitIndex].alt_type ~= 'RADIO' or newGroup.units[unitIndex].alt_type ~= 'BARO') or not newGroup.units[unitIndex].alt_type then
				newGroup.units[unitIndex].alt_type = 'RADIO'
			end
			if not unitData.speed then
				if newCat == 'AIRPLANE' then
					newGroup.units[unitIndex].speed = 150
				elseif newCat == 'HELICOPTER' then
					newGroup.units[unitIndex].speed = 60
				end
			end
			if not unitData.payload then
				newGroup.units[unitIndex].payload = mist.getPayload(originalName)
			end
		end
		
	end
	if newGroup.route and not newGroup.route.points then
		if not newGroup.route.points and newGroup.route[1] then
			local copyRoute = newGroup.route
			newGroup.route = {}
			newGroup.route.points = copyRoute
		end
	end
	newGroup.country = newCountry
	
	addToDBs[#addToDBs + 1] = mist.utils.deepCopy(newGroup)
	
	
	-- sanitize table
	newGroup.groupName = nil
	newGroup.clone = nil
	newGroup.category = nil
	newGroup.country = nil
	
	newGroup.tasks = {}
	newGroup.visible = false
	
	for unitIndex, unitData in pairs(newGroup.units) do
		newGroup.units[unitIndex].unitName = nil
	end
	
	--env.info('added')
	coalition.addGroup(country.id[newCountry], Unit.Category[newCat], newGroup)
	
	
	return newGroup.name
	
	end

mist.getCurrentGroupData = function(gpName)
	if Group.getByName(gpName) then
		local newGroup = Group.getByName(gpName)
		local newData = {}
		newData.name = gpName
		newData.groupId = tonumber(newGroup:getID())
		newData.category = newGroup:getCategory()
        
		if newData.category == 2 then
			newData.category = 'vehicle'
		elseif newData.category == 3 then
			newData.category = 'ship'
		end

		newData.units = {}
		local newUnits = newGroup:getUnits()
		for unitNum, unitData in pairs(newGroup:getUnits()) do
			newData.units[unitNum] = {}
			newData.units[unitNum]["unitId"] = tonumber(unitData:getID())
			newData.units[unitNum]['point'] = unitData.point
			newData.units[unitNum]['x'] = unitData:getPosition().p.x
			newData.units[unitNum]['y'] = unitData:getPosition().p.z
			newData.units[unitNum]["type"] = unitData:getTypeName()
			--newData.units[unitNum]["skill"] = unitData.skill
			
			-- get velocity needed
			newData.units[unitNum]["unitName"] = unitData:getName()
			newData.units[unitNum]["heading"] = mist.getHeading(unitData) -- added to DBs
			newData.units[unitNum]['alt'] = unitData:getPosition().p.y
			newData.country = string.lower(country.name[unitData:getCountry()])
			
		end

		return newData
	end

end

mist.getGroupData = function(gpName)
	for groupName, groupData in pairs(mist.DBs.groupsByName) do
		if string.lower(groupName) == string.lower(gpName) then
			local newData = {}
			newData.hidden = false -- maybe add this to DBs
			newData.groupId = groupData.groupId
			newData.groupName = groupName
			newData.category = groupData.category
			newData.units = {}
			newData.task = groupData.task

			for unitNum, unitData in pairs(groupData.units) do
				newData.units[unitNum] = {}
				
				newData.units[unitNum]["unitId"] = unitData.unitId
				--newData.units[unitNum]['point'] = unitData.point
				newData.units[unitNum]['x'] = unitData.point.x
				newData.units[unitNum]['y'] = unitData.point.y
				newData.units[unitNum]['alt'] = unitData.alt
				newData.units[unitNum]['alt_type'] = unitData.alt_type
				newData.units[unitNum]['speed'] = unitData.speed
				newData.units[unitNum]["type"] = unitData.type
				newData.units[unitNum]["skill"] = unitData.skill
				newData.units[unitNum]["unitName"] = unitData.unitName
				newData.units[unitNum]["heading"] = unitData.heading -- added to DBs
				newData.units[unitNum]["playerCanDrive"] = unitData.playerCanDrive -- added to DBs
				
				
				if newData.category == 'plane' or newData.category == 'helicopter' then
					newData.units[unitNum]["payload"] = mist.getPayload(unitData.unitName)
					newData.units[unitNum]['livery_id'] = unitData.livery_id
				end
			end
			return newData	
		end
	end
end

mist.getPayload = function(unitName)
	if unitName and type(unitName) == 'string' then
		for coa_name, coa_data in pairs(env.mission.coalition) do
			if (coa_name == 'red' or coa_name == 'blue') and type(coa_data) == 'table' then			
				if coa_data.country then --there is a country table
					for cntry_id, cntry_data in pairs(coa_data.country) do
						for obj_type_name, obj_type_data in pairs(cntry_data) do
							if obj_type_name == "helicopter" or obj_type_name == "ship" or obj_type_name == "plane" or obj_type_name == "vehicle" then	-- only these types have points						
								if ((type(obj_type_data) == 'table') and obj_type_data.group and (type(obj_type_data.group) == 'table') and (#obj_type_data.group > 0)) then  --there's a group!				
									for group_num, group_data in pairs(obj_type_data.group) do		
										if group_data and group_data.name then
											for unitIndex, unitData in pairs(group_data.units) do --group index
												if string.lower(unitName) == string.lower(unitData.name) then
													return unitData.payload
												end						
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	else
		return false
	end
	return 
end


mist.teleportToPoint = function(vars) -- main teleport function that all of teleport/respawn functions call
	local point = vars.point
	local gpName = vars.gpName
	local action = vars.action
	local isStatic = false

	
	
	local disperse = vars.disperse or false
	local maxDisp = vars.maxDisp
	if not vars.maxDisp then
		maxDisp = 200
	else
		maxDisp = vars.maxDisp
	end
	local radius = vars.radius or 0
	local innerRadius = vars.innerRadius
	
	local route = vars.route

	local newGroupData
	if gpName and not vars.groupData then
		if string.lower(action) == 'teleport' or string.lower(action) == 'tele' then
			newGroupData = mist.getCurrentGroupData(gpName)
		elseif string.lower(action) == 'respawn' then
			newGroupData = mist.getGroupData(gpName)
		elseif string.lower(action) == 'clone' then
			newGroupData = mist.getGroupData(gpName)
			newGroupData.clone = 'order66'
		else
			action = 'tele'
			newGroupData = mist.getCurrentGroupData(gpName)
		end
	else
		action = 'tele'
		newGroupData = vars.groupData
	end


	local diff = {['x'] = 0, ['y'] = 0}
	local newCoord, origCoord
	if point then
		local valid = false
		
		local validTerrain
		if string.lower(newGroupData.category) == 'ship' then
			validTerrain = {'SHALLOW_WATER' , 'WATER'}
		elseif string.lower(newGroupData.category) == 'vehicle' then
			validTerrain = {'LAND', 'ROAD'}
		else
			validTerrain = {'LAND', 'ROAD', 'SHALLOW_WATER', 'WATER', 'RUNWAY'}
		end	
		
		for i = 1, 100  do
			newCoord = mist.getRandPointInCircle(point, radius, innerRadius)
			if mist.isTerrainValid(newCoord, validTerrain) then
				origCoord = mist.utils.deepCopy(newCoord)
				diff = {['x'] = (newCoord.x - newGroupData.units[1].x), ['y'] = (newCoord.y - newGroupData.units[1].y)}
				valid = true
				break
			end
		end
		if valid == false then
			return false
		end
	end
	for unitNum, unitData in pairs(newGroupData.units) do
		if disperse then
			if maxDisp and type(maxDisp) == 'number' and unitNum ~= 1 then
				newCoord = mist.getRandPointInCircle(origCoord, maxDisp)
			--else
				--newCoord = mist.getRandPointInCircle(zone.point, zone.radius)
			end

			newGroupData.units[unitNum]['x'] = newCoord.x
			newGroupData.units[unitNum]['y'] = newCoord.y
		else
			newGroupData.units[unitNum]["x"] = unitData.x + diff.x
			newGroupData.units[unitNum]["y"] = unitData.y + diff.y
		end
	end
	
	--tostring, tostring(),
	
	newGroupData.country = mist.DBs.groupsByName[gpName].country
	newGroupData.category = mist.DBs.groupsByName[gpName].category
	if route then
		newGroupData.route = route
	end
	
	if string.lower(newGroupData.category) == 'static' then
		
		 return mist.dynAddStatic(newGroupData)
	end
	return mist.dynAdd(newGroupData)
	
end

mist.respawnInZone = function(gpName, zone, disperse, maxDisp)

	if type(gpName) == 'table' and gpName:getName() then
		gpName = gpName:getName()
	elseif type(gpName) == 'table' and gpName[1]:getName() then
		gpName = math.random(#gpName)
	else
		gpName = tostring(gpName)
	end
	
	if type(zone) == 'string' then
		zone = trigger.misc.getZone(zone)
	elseif type(zone) == 'table' and not zone.radius then
		zone = trigger.misc.getZone(zone[math.random(1, #zone)])
	end
	local vars = {}
	vars.gpName = gpName
	vars.action = 'respawn'
	vars.point = zone.point
	vars.radius = zone.radius
	vars.disperse = disperse
	vars.maxDisp = maxDisp
	return mist.teleportToPoint(vars)
end

mist.cloneInZone = function(gpName, zone, disperse, maxDisp)
	
	if type(gpName) == 'table' then
		gpName = gpName:getName()
	else
		gpName = tostring(gpName)
	end
	
	if type(zone) == 'string' then
		zone = trigger.misc.getZone(zone)
	elseif type(zone) == 'table' and not zone.radius then
		zone = trigger.misc.getZone(zone[math.random(1, #zone)])
	end
	local vars = {}
	vars.gpName = gpName
	vars.action = 'clone'
	vars.point = zone.point
	vars.radius = zone.radius
	vars.disperse = disperse
	vars.maxDisp = maxDisp
	return mist.teleportToPoint(vars)
end

mist.teleportInZone = function(gpName, zone, disperse, maxDisp) -- groupName, zoneName or table of Zone Names, keepForm is a boolean
	if type(gpName) == 'table' and gpName:getName() then
		gpName = gpName:getName()
	else
		gpName = tostring(gpName)
	end
	
	if type(zone) == 'string' then
		zone = trigger.misc.getZone(zone)
	elseif type(zone) == 'table' and not zone.radius then
		zone = trigger.misc.getZone(zone[math.random(1, #zone)])
	end
		
	local vars = {}
	vars.gpName = gpName
	vars.action = 'tele'
	vars.point = zone.point
	vars.radius = zone.radius
	vars.disperse = disperse
	vars.maxDisp = maxDisp
	return mist.teleportToPoint(vars)
end

mist.respawnGroup = function(gpName, task)
	local vars = {}
	vars.gpName = gpName
	vars.action = 'respawn'
	if task and type(task) ~= 'number' then
		vars.route = mist.getGroupRoute(gpName, 'task')
	end
	local newGroup = mist.teleportToPoint(vars)
	if task and type(task) == 'number' then
		local newRoute = mist.getGroupRoute(gpName, 'task')
		mist.scheduleFunction(mist.goRoute, {newGroup, newRoute}, timer.getTime() + task)
	end
	return newGroup
end

mist.cloneGroup = function(gpName, task)
	local vars = {}
	vars.gpName = gpName
	vars.action = 'clone'
	if task and type(task) ~= 'number' then
		vars.route = mist.getGroupRoute(gpName, 'task')
	end
	local newGroup = mist.teleportToPoint(vars)
	if task and type(task) == 'number' then
		local newRoute = mist.getGroupRoute(gpName, 'task')
		mist.scheduleFunction(mist.goRoute, {newGroup, newRoute}, timer.getTime() + task)
	end
	return newGroup
end

mist.teleportGroup = function(gpName, task)
	local vars = {}
	vars.gpName = gpName
	vars.action = 'teleport'
	if task and type(task) ~= 'number' then
		vars.route = mist.getGroupRoute(gpName, 'task')
	end	
	local newGroup = mist.teleportToPoint(vars)
	if task and type(task) == 'number' then
		local newRoute = mist.getGroupRoute(gpName, 'task')
		mist.scheduleFunction(mist.goRoute, {newGroup, newRoute}, timer.getTime() + task)
	end
	return newGroup
end
	

end

mist.ground.patrolRoute = function(vars)
	
	
	local tempRoute = {}
	local useRoute = {}
	local gpData = vars.gpData
	if type(gpData) == 'string' then
		gpData = Group.getByName(gpData)
	end
	
	local useGroupRoute 
	if not vars.useGroupRoute then
		useGroupRoute = vars.gpData
	else
		useGroupRoute = vars.useGroupRoute
	end
	local routeProvided = false
	if not vars.route then
		if useGroupRoute then
			tempRoute = mist.getGroupRoute(useGroupRoute)
		end
	else
		useRoute = vars.route
		local posStart = mist.getLeadPos(gpData)
		useRoute[1] = mist.ground.buildWP(posStart, useRoute[1].action, useRoute[1].speed)
		routeProvided = true
	end
	
	
	local overRideSpeed = vars.speed or 'default'
	local pType = vars.pType 
	local offRoadForm = vars.offRoadForm or 'default'
	local onRoadForm = vars.onRoadForm or 'default'
		
	if routeProvided == false and #tempRoute > 0 then
		local posStart = mist.getLeadPos(gpData)
		
		
		useRoute[#useRoute + 1] = mist.ground.buildWP(posStart, offRoadForm, overRideSpeed)
		for i = 1, #tempRoute do
			local tempForm = tempRoute[i].action
			local tempSpeed = tempRoute[i].speed
			
			if offRoadForm == 'default' then
				tempForm = tempRoute[i].action
			end
			if onRoadForm == 'default' then
				onRoadForm = 'On Road'
			end
			if (string.lower(tempRoute[i].action) == 'on road' or  string.lower(tempRoute[i].action) == 'onroad' or string.lower(tempRoute[i].action) == 'on_road') then
				tempForm = onRoadForm
			else
				tempForm = offRoadForm
			end
			
			if type(overRideSpeed) == 'number' then
				tempSpeed = overRideSpeed
			end
			
			
			useRoute[#useRoute + 1] = mist.ground.buildWP(tempRoute[i], tempForm, tempSpeed)
		end
			
		if pType and string.lower(pType) == 'doubleback' then
			local curRoute = mist.utils.deepCopy(useRoute)
			for i = #curRoute, 2, -1 do
				useRoute[#useRoute + 1] = mist.ground.buildWP(curRoute[i], curRoute[i].action, curRoute[i].speed)
			end
		end
		
		useRoute[1].action = useRoute[#useRoute].action -- make it so the first WP matches the last WP
	end
	
	cTask3 = {}
	local newPatrol = {}
	newPatrol.route = useRoute
	newPatrol.gpData = gpData:getName()
	cTask3[#cTask3 + 1] = 'mist.ground.patrolRoute('
	cTask3[#cTask3 + 1] = mist.utils.oneLineSerialize(newPatrol)
	cTask3[#cTask3 + 1] = ')'
	cTask3 = table.concat(cTask3)
	local tempTask = {
		id = 'WrappedAction', 
		params = { 
			action = {
				id = 'Script',
				params = {
					command = cTask3, 
					
				},
			},
		},
	}

		
	useRoute[#useRoute].task = tempTask
	mist.goRoute(gpData, useRoute)
	
	return
end

mist.ground.patrol = function(gpData, pType, form, speed)
	local vars = {}
	
	if type(gpData) == 'table' and gpData:getName() then
		gpData = gpData:getName()
	end
	
	vars.useGroupRoute = gpData
	vars.gpData = gpData
	vars.pType = pType
	vars.offRoadForm = form
	vars.speed = speed
	
	mist.ground.patrolRoute(vars)

	return
end


mist.random = function(firstNum, secondNum) -- no support for decimals
	local lowNum, highNum
	if not secondNum then
		highNum = firstNum
		lowNum = 1
	else 
		lowNum = firstNum
		highNum = secondNum
	end
	local total = 1
	if math.abs(highNum - lowNum + 1) < 50 then -- if total values is less than 50
		total = math.modf(50/math.abs(highNum - lowNum + 1)) -- make x copies required to be above 50
	end
	local choices = {}
	for i = 1, total do -- iterate required number of times
		for x = lowNum, highNum do -- iterate between the range
			choices[#choices +1] = x -- add each entry to a table
		end
	end
	local rtnVal = math.random(#choices) -- will now do a math.random of at least 50 choices
	for i = 1, 10 do
		rtnVal = math.random(#choices) -- iterate a few times for giggles
	end
	return choices[rtnVal]
end

mist.DBs.const = {}

--[[
	['LAND'] = 1,
	['SHALLOW_WATER'] = 2,
	['WATER'] = 3,
	['ROAD'] = 4,
	['RUNWAY'] = 5	
]]
--[[mist.DBs.const.ME_SSE_terms = {
	['ME'] = {
		['vehicle'] = {'GROUND', 'GROUND_UNIT'},
		['plane'] = {'AIRPLANE'},
	},
	['SSE'] = {
	},

}]]


mist.DBs.const.callsigns = { -- not accessible by SSE, must use static list :-/
	['NATO'] = {
		['rules'] = {
			['groupLimit'] = 9,
		},
		['AWACS'] = {
			['Overlord'] = 1,
			['Magic'] = 2,
			['Wizard'] = 3,
			['Focus'] =	 4,
			['Darkstar'] =	 5,
		},
		['TANKER'] = {
			['Texaco'] = 1,
			['Arco'] = 2,
			['Shell'] = 3,
		},
		['JTAC'] = {
			['Axeman'] = 1,
			['Darknight'] = 2,
			['Warrior']	= 3,
			['Pointer']	= 4,
			['Eyeball'] = 5,
			['Moonbeam'] = 6,
			['Whiplash'] = 7,
			['Finger'] = 8,
			['Pinpoint'] = 9,
			['Ferret'] = 10,
			['Shaba'] = 11,
			['Playboy'] = 12,
			['Hammer'] = 13,
			['Jaguar'] = 14,
			['Deathstar'] =	15,
			['Anvil'] = 16,
			['Firefly']	= 17,
			['Mantis'] = 18,
			['Badger'] = 19,
		},
		['aircraft'] = {
			['Enfield'] = 1,
			['Springfield'] = 2,
			['Uzi']	= 3,
			['Colt'] = 4,
			['Dodge'] =	5,
			['Ford'] = 6,
			['Chevy'] = 7,
			['Pontiac'] = 8,
		},
		
		['unique'] = {
			['A10'] = {
				['Hawg'] = 9,
				['Boar'] = 10,
				['Pig'] = 11,
				['Tusk'] = 12,	
				['rules'] = {
					['canUseAircraft'] = true,
					['appliesTo'] = {
						'A-10C',
						'A-10A',
					},
				},
			},
		},
	},

}
--[[ scope:
	{
		units = {...},  -- unit names.
		coa = {...}, -- coa names
		countries = {...}, -- country names
		CA = {...}, -- looks just like coa.
		unitTypes = { red = {}, blue = {}, all = {}, Russia = {},}
	}
	
	
scope examples:

{  units = { 'Hawg11', 'Hawg12' }, CA = {'blue'} }

{ countries = {'Georgia'}, unitTypes = {blue = {'A-10C', 'A-10A'}}}

{ coa = {'all'}}

{unitTypes = { blue = {'A-10C'}}}
]]

mist.main()
env.info(('Mist version ' .. mist.majorVersion .. '.' .. mist.minorVersion .. '.' .. mist.build .. ' loaded.'))