local ctrlDoublePress = require('ctrlDoublePress')

ctrlDoublePress.action = function()
  local app = hs.application.find('WezTerm')
  if app:isFrontmost() then
    app:hide()
  else
    app:activate()
  end
end
