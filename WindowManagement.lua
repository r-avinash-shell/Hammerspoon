-- Directions window management
local screenFrame = hs.screen.mainScreen():frame()

-- Set the animation duration (in seconds)
hs.window.animationDuration = 0.2

-- Function to move the current window to a specific portion of the screen
local function moveWindow(direction)
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local screenFrame = screen:frame()
  local frame = win:frame()

  local x, y, w, h = frame.x, frame.y, frame.w, frame.h

  if direction == "left" then
    x = screenFrame.x
    y = screenFrame.y
    w = screenFrame.w / 2
    h = screenFrame.h
  elseif direction == "right" then
    x = screenFrame.x + (screenFrame.w / 2)
    y = screenFrame.y
    w = screenFrame.w / 2
    h = screenFrame.h
  elseif direction == "top" then
    x = screenFrame.x
    y = screenFrame.y
    w = screenFrame.w
    h = screenFrame.h / 2
  elseif direction == "bottom" then
    x = screenFrame.x
    y = screenFrame.y + (screenFrame.h / 2)
    w = screenFrame.w
    h = screenFrame.h / 2
  end

  frame.x, frame.y, frame.w, frame.h = x, y, w, h

  win:setFrame(frame)
end

local function maximizeApp()
  local app = hs.window.focusedWindow()
  app:maximize()
end

local function moveWindowToSide(direction)
  moveWindow(direction)
end

local function moveToLeft()
  moveWindowToSide("left")
end

local function moveToRight()
  moveWindowToSide("right")
end

local function moveToTop()
  moveWindowToSide("top")
end

local function moveToBottom()
  moveWindowToSide("bottom")
end

-- Function to move all open windows to the next display
local function moveAllWindowsToDisplay(number)
  local allWindows = hs.window.allWindows()
  local allScreens = hs.screen.allScreens()

  for i, win in ipairs(allWindows) do
    local nextScreen = allScreens[number]
    win:moveToScreen(nextScreen)
    win:maximize()
  end
end

local function moveAllWindowsToPrimaryDisplay(number)
  moveAllWindowsToDisplay(1)
end

local function moveAllWindowsToSecondaryDisplay(number)
  moveAllWindowsToDisplay(2)
end

function bindWindows(modifier)
  bind(modifier, "F", maximizeApp)
  bind(modifier, "Left", moveToLeft)
  bind(modifier, "Right", moveToRight)
  bind(modifier, "Up", moveToTop)
  bind(modifier, "Down", moveToBottom)

  bind(modifier , "1",  moveAllWindowsToPrimaryDisplay)
  bind(modifier , "2",  moveAllWindowsToSecondaryDisplay)

  bind({"alt", "shift","cmd"} , "Left", moveAllWindowsToPrimaryDisplay)
  bind({"alt", "shift","cmd"} , "Right",  moveAllWindowsToSecondaryDisplay)
end
