-- Imports
local Controls = require "controls"

-- Set debug to false for production
debug = true

-- Objects
height = love.graphics.getHeight()
width = love.graphics.getWidth()
player = {
  img = nil,
  x = 100,
  y = 100,
  speed = 350
}

function love.load(arg)
  player.img = love.graphics.newImage('assets/aircraft.png')
end

function love.update(dt)
	if love.keyboard.isDown('escape') then
		love.event.push('quit')
  end
  Controls.moveAvatar(dt)
end

function love.draw(dt)
  love.graphics.draw(player.img, player.x, player.y)
end
