local stackline = require('stackline')
local conf = require('stackline.conf')

conf.paths.yabai = '/opt/homebrew/bin/yabai'
conf.appearance.showIcons = false

stackline:init()
