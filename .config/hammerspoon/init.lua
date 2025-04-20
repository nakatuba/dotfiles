if not hs.ipc.cliStatus('/opt/homebrew') then
  hs.ipc.cliInstall('/opt/homebrew')
end

local stackline = require('stackline')
local conf = require('stackline.conf')

conf.paths.yabai = '/opt/homebrew/bin/yabai'
conf.appearance.showIcons = false

stackline:init()

local ctrlDoublePress = require('ctrlDoublePress')

ctrlDoublePress.action = function()
  local app = hs.application.find('Ghostty', true)
  if not app then
    hs.application.launchOrFocus('Ghostty')
  else
    if app:isFrontmost() then
      app:hide()
    else
      local space = hs.spaces.focusedSpace()
      local window = app:mainWindow()
      hs.spaces.moveWindowToSpace(window, space)
      app:activate()
    end
  end
end
