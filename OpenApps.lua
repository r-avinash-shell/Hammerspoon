local common = require('Common')

function open(name)
  return function()
      hs.application.launchOrFocus(name)
      if name == 'Finder' then
          hs.appfinder.appFromName(name):activate()
      end
  end
end

-- Open apps
function openAllApps(modifier) 
  bind(modifier, "C", open("Google Chrome"))
  bind(modifier, "D", open("Diarium"))
  bind(modifier, "E", open("Microsoft Edge"))
  bind(modifier, "F", open("Finder"))
  bind(modifier, "G", open("GitHub Desktop"))
  bind(modifier, "O", open("OpenLens"))
  bind(modifier, "S", open("Safari"))
  -- bind(modifier, "S", open("Slack"))
  bind(modifier, "T", open("Microsoft Teams"))
  bind(modifier, "V", open("Code"))

end