-- Imports
local Controls = require "controls"
local class = require 'middleclass'
local Torpedo = class('Torpedo')

-- Set debug to false for production
debug = true

-- Objects
height = love.graphics.getHeight()
width = love.graphics.getWidth()
player = {
  img = nil,
  torpedoImg = nil,
  x = 100,
  y = 500,
  speed = 150
}

fire = false

torpedo = {
  img = nil,
  x = nil,
  y = nil,
  speed = 350
}

function Torpedo:initialize (x, y)
  self.img = love.graphics.newImage('assets/torpedo.png')
  self.x = x
  self.y = y
  self.speed = 350
  return self
end

world = {
  background = nil
}

function printMe()
  return love.graphics.print('Fire!', player.x, player.y)
end

function love.load(arg)
  world.background = love.graphics.newImage('assets/background.png')
  player.img = love.graphics.newImage('assets/submarine.png')
  torpedo.img = love.graphics.newImage('assets/torpedo.png')
end

function love.update(dt)
	if love.keyboard.isDown('escape') then
		love.event.push('quit')
  end
  Controls.moveAvatar(dt)
  if torpedo.y ~= nil then
    torpedo.y = torpedo.y - (player.speed * dt)
  end

end

function love.draw(dt)
  love.graphics.draw(world.background, 0, 0)
  if torpedo.y ~= nil then
    love.graphics.draw(torpedo.img, torpedo.x, torpedo.y)
  end
  love.graphics.draw(player.img, player.x, player.y)
end
