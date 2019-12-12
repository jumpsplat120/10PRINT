Object = require "classic"

slashes = {}

function love.load()
	width, height, flags = love.window.getMode()
	math.randomseed(os.time())
	line = 0
	pos = 0
end

function love.draw()
	local i = 1
	while i < #slashes do
		slashes[i]:draw()
		i = i + 1
	end
end

function love.update(dt)
	local i = 0
	while i < 1 do
		local dir = math.floor(.5 + math.random())
		local amt = math.floor(#slashes / (width / 10))
		slashes[#slashes + 1] = Slash(dir, #slashes * 10 - (amt * width), math.floor(#slashes / (width / 10)) * 10)
		i = i + 1
	end
end

-----I TRIED TO DO IT WITH TEXT AND IT DIDN'T LOOK GOOD SO NOW I'M USING CLASSES-----

Slash = Object:extend()

function Slash:new(dir, x, y)
	if dir == 1 then
		self.x1, self.y1 = 0 + x, 0 + y
		self.x2, self.y2 = 10 + x, 10 + y
	else
		self.x1, self.y1 = 0 + x, 10 + y
		self.x2, self.y2 = 10 + x, 0 + y
	end
end

function Slash:draw()
	love.graphics.line(self.x1, self.y1, self.x2, self.y2)
end