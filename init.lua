--[[
###### - LatteUI - #####
  'a Love2D UX suite'
------------------------
      by: @qfluxeu
------------------------
       (c) 2016
    Elmārs Āboliņš
  License info:
 license.MD
------------------------
visit qflux.eu for
more info
########################

###### - Module Info - #####
       name: init.lua
----------------------------
    func: initialize
 Latte environment
 depending on settings
----------------------------
  dependencies:
 1) none
----------------------------
 author: @qfluxeu
############################
]]

local l = {
	--load settings
	settings = require('settings')
}

print( 'loaded settings!')

--#######Load pre-requisites#######

if settings.element then
	l.element = require 'element'

	print( 'loaded module: element')
end

if settings.coffee then
	l.coffee = require 'coffee'

	print( 'loaded module: coffee')
end

if settings.sugar then
	l.sugar = require '/modules/sugar'

	print( 'loaded module: sugar')
end

if settings.tools then
	l.tools = require '/modules/tools'

	print( 'loaded module: tools')
end

if settings.input then
	l.input = require '/modules/input'

	print( 'loaded module: input')
end

return l
