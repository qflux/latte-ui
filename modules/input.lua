--[[-----------------------------------------------------
		-- Latte - a - UI library for Lõve2D --
		--	--	- module made by: qflux -- -- --
#############################
		Module Name: Input
		Functionality: Capture input
--]]-----------------------------------------------------

local inp = {}


l.cues = {
--	format: { key = %num%, scancode = %scancode%, isrepeat = %bool%}
	keypressed = { },
--	format: %utf8.string%
	textinput = nil,
--	format: { x = %coord%, y = %coord%, button = %buttoncode%, istouch = %bool% }
	mousepressed = {},
--	format: { x = %coord%, y = %coord%, button = %buttoncode%, istouch = %bool% }
	mousereleased = {},
-- format: { x= %coord%, y = %coord% }
	wheelmoved = {}
}

--[[-----------------------------------

		Intercept Lõve Callbacks

--]]-----------------------------------

function love.keypressed( key, scancode, isrepeat )

	l.cues.keypressed =
	{
		key = key,
		scancode = scancode,
		isrepeat = isrepeat
	}

end

function love.mousepressed( x, y, button, istouch)

	l.cues.mousepressed =
	{
		x = x,
		y = y,
		button = button,
		istouch = istouch
	}

end

function love.mousereleased( x, y, button, istouch)

	l.cues.mousereleased =
	{
		x = x,
		y = y,
		button = button,
		istouch = istouch
	}

end

function love.textinput( t )

	if l.cues.text ~= nil then
		l.cues.text = l.cues.text.t
	else
		l.cues.text = t
	end

end

--[[----------------------------------------------------------------------
		Callbacks for Latte users

		Use the exposed variables for better integration
			( if possible )
--]]----------------------------------------------------------------------

function inp.keypressed( key )

end

function inp.mousepressed( x, y, button, istouch )

end

function inp.mousereleased( x, y, button, istouch)

end

function inp.textinput( t )

end

return inp
