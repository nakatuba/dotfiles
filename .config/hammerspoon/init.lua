local ctrlDoublePress = require('ctrlDoublePress')

ctrlDoublePress.action = function()
  local app = hs.application.find('WezTerm', true)
  if not app then
    hs.application.launchOrFocus('WezTerm')
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
