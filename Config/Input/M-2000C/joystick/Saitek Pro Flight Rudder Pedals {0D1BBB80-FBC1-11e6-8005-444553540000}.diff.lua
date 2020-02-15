local diff = {
	["axisDiffs"] = {
		["a2001cdnil"] = {
			["name"] = "Pitch",
			["removed"] = {
				[1] = {
					["key"] = "JOY_Y",
				},
			},
		},
		["a2002cdnil"] = {
			["name"] = "Roll",
			["removed"] = {
				[1] = {
					["key"] = "JOY_X",
				},
			},
		},
		["a2004cdnil"] = {
			["name"] = "Thrust",
			["removed"] = {
				[1] = {
					["key"] = "JOY_Z",
				},
			},
		},
		["a2112cdnil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_X",
				},
			},
			["name"] = "Wheel Brake Left",
		},
		["a2113cdnil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_Y",
				},
			},
			["name"] = "Wheel Brake Right",
		},
	},
	["keyDiffs"] = {
		["d100pnilunilcdnilvdnilvpnilvunil"] = {
			["name"] = "STT/TWS Toggle (Target Lock)",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN2",
				},
			},
		},
		["d564pnilu563cdnilvdnilvpnilvunil"] = {
			["name"] = "Nosewheel Steering/IFF Interrogate",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN3",
				},
			},
		},
	},
}
return diff