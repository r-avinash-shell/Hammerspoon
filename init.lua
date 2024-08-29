local _ = require('Common')
local _ = require("OpenApps")
local _ = require("SwitchMonitors")
local _ = require('WindowManagement')

local modifier = {"shift", "alt"}
local hyperKeyModifier = {"shift", "ctrl" , "alt", "cmd"}

-- Open apps
openAllApps(modifier)
openAllApps(hyperKeyModifier)

openFinder("cmd","E")

-- Switch Monitors
bind(modifier, "tab", moveToNextScreen)

-- Window Management
bindWindows(modifier)
