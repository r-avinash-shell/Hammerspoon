-- Directions window management
local screenFrame = hs.screen.mainScreen():frame()

-- Set the animation duration (in seconds)
hs.window.animationDuration = 0.2

-- Function to move the current window to a specific portion of the screen
function moveWindow(direction)
  local win = hs.window.focusedWindow()
  local frame = win:frame()

  local x, y, w, h = frame.x, frame.y, frame.w, frame.h

  if direction == "left" then
      x = 0
      y = 0
      w = screenFrame.w / 2
      h = screenFrame.h
  elseif direction == "right" then
      x = screenFrame.w / 2
      y = 0
      w = screenFrame.w / 2
      h = screenFrame.h
  elseif direction == "top" then
      x = 0
      y = 0
      w = screenFrame.w
      h = screenFrame.h / 2
  elseif direction == "bottom" then
      x = 0
      y = screenFrame.h / 2
      w = screenFrame.w
      h = screenFrame.h / 2
  end

  frame.x, frame.y, frame.w, frame.h = x, y, w, h

  win:setFrame(frame)
end

function maximizeApp()
  local app = hs.window.focusedWindow()
  app:maximize()
end

function moveWindowToSide(direction)
  -- maximizeApp()
  moveWindow(direction)
end

function moveToLeft()
  moveWindowToSide("left")
end

function moveToRight()
  moveWindowToSide("right")
end

function moveToTop()
  moveWindowToSide("top")
end

function moveToBottom()
  moveWindowToSide("bottom")
end