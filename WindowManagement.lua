-- Directions window management
local screenFrame = hs.screen.mainScreen():frame()

-- Function to move the current window to a specific portion of the screen
function moveWindow(direction)
  local win = hs.window.focusedWindow()
  local frame = win:frame()

  local x, y, w, h = frame.x, frame.y, frame.w, frame.h

  if direction == "left" then
      w = screenFrame.w / 2
  elseif direction == "right" then
      x = screenFrame.w / 2
      w = screenFrame.w / 2
  elseif direction == "top" then
      h = screenFrame.h / 2
  elseif direction == "bottom" then
      y = screenFrame.h / 2
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
  maximizeApp()
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