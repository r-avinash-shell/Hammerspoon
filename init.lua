local common = require('Common')

local switchmonitors = require("SwitchMonitors")
local openapps = require("OpenApps")
local windowmanagement = require('WindowManagement')

local modifier = {"alt", "shift"} 

-- Open apps 
openAllApps(modifier)

-- Switch Monitors
bind(modifier, "tab", moveToNextScreen)

-- Window Management
bindWindows(modifier)