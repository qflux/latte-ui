--[[
###### - LatteUI - #####
  'a Love2D UX suite'
------------------------
------------------------
------------------------
########################

###### - Module Info - #####
----------------------------
 Latte environment
 depending on settings
----------------------------
 1) none
----------------------------
 author: @qfluxeu
############################
]]

local l = {

	--load settings
	settings = require 'settings'

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

--#######Load elements#######

if settings.element then

	local fs = love.filesystem

	--find all files inside the ~./elements/
	local elementContents = fs.getDirectoryItems( settings.root..'/elements/' )
	local elReqs = { }
	local missReq

	--process all files with .lua extension inside the ~./elements/
	for i, e in ipairs( elementContents ) do
		if e:find( '.lua' ) then
			local el = fs.load( settings.root..'/elements/'..e..'.lua' )

			local res = el( )

			if l[res.name] == nil then
				l[res.name] == res.chunk
			end

			if res.req~= nil then
				for x, r in ipairs( res.req ) do
					table.insert( elReqs, { req = res.name, need = r } )
				end
			end
		end
	end

	--process requires
	for i, r in ipairs( elReqs ) do
		if l[r.need] == nil then
			print( r.req..' is missing module: ')
			missReq = true
		end
	end

	--[[
	if missReq then
		Do something???
	end
	]]

end

return l
