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
       name: element.lua
----------------------------
    func: handle the element
superclass
----------------------------
  dependencies:
 1) none
----------------------------
  author: @qfluxeu
############################
]]

--top level element
local e = { }

function e.create( table )
  local eCont, contProp, eSugar

  if l.sugar ~= nil then
    eSugar = l.sugar.create( table.sugar )
  end

  if l[table.type] ~= nil then
    if l.sugar ~= nil then
      eCont = l[table.type].create( table.content, table.properties, eSugar )
    else
      eCont = l[table.type].create( table.content, table.properties )
    end
  end
end

function e:update( downtime )

end

function e:draw( x, y, w, h )

end

--[[

  Callbacks

]]

function e:mouseover( key, glob, loc )

end

function e:mousepressed( key, glob, loc )

end

function e:mousereleased( key, glob, loc )

end

function e:mousedown( key, glob, loc )

end

function e:beforedraw( )

end

function e:afterdraw( )

end

function e:atupdate()

end

--(dummy logic check for collapsing)
if true then
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
				--l[res.name] == res.chunk
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

return e
