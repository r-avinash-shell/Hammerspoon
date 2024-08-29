local common = require('Common')

function open(name)
  return function()
    hs.application.launchOrFocus(name)
    if name == 'Finder' then
        hs.appfinder.appFromName(name):activate()
    end
  end
end

function openFinder(modifier, key)
  bind(modifier, key, open("Finder"))
end
-- Open apps
function openAllApps(modifier)
  -- bind(modifier, "C", open("Google Chrome"))
  bind(modifier, "E", open("Microsoft Edge"))
  bind(modifier, "G", open("GitHub Desktop"))
  bind(modifier, "L", open("OpenLens"))
  bind(modifier, "O", open("Microsoft Outlook"))
  bind(modifier, "T", open("Microsoft Teams New"))

  bind(modifier, "S", open("Slack"))
  bind(modifier, "A", open("Slack"))

  -- bind(modifier, "S", open("Safari"))

  -- bind(modifier, "V", open("Code"))
  bind(modifier, "V", open("Visual Studio Code"))

end
