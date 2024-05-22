local stackline = require('stackline')
local config = require('stackline.conf')

config.paths.yabai = '/opt/homebrew/bin/yabai'
config.appearance.showIcons = false

stackline:init(config)
