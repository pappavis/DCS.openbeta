local unitPayloads = {
	["name"] = "A-4E-C",
	["payloads"] = {
		[1] = {
			["name"] = "AGM-62B Walleye *2, Fuel 300G",
			["pylons"] = {
				[1] = {
					["CLSID"] = "{C40A1E3A-DD05-40D9-85A4-217729E37FAE}",
					["num"] = 4,
				},
				[2] = {
					["CLSID"] = "{C40A1E3A-DD05-40D9-85A4-217729E37FAE}",
					["num"] = 2,
				},
				[3] = {
					["CLSID"] = "{DFT-300gal}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{AGM_45A}",
					["num"] = 5,
				},
				[5] = {
					["CLSID"] = "{AGM_45A}",
					["num"] = 1,
				},
			},
			["tasks"] = {
				[1] = 29,
			},
		},
	},
	["tasks"] = {
	},
	["unitType"] = "A-4E-C",
}
return unitPayloads
