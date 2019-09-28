-- Imports
local Controls = require "modules/controls"
-- local class = require 'middleclass'
require "modules/class"

-- Set debug to false for production
debug = true
gamestate = "playing"

-- Timers
canShoot = true
canShootTimerMax = 0.2 
canShootTimer = canShootTimerMax

-- Image Storage
torpedoImg = nil

-- Entity Storage
torpedoes = {}

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
  torpedoImg = love.graphics.newImage('assets/torpedo.png')
end

function love.update(dt)
  if gamestate == "menu" then
    love.graphics.setBackgroundColor(225, 152, 0)
    if love.keyboard.isDown('k') then
      gamestate = "playing"
    end
  end
  if gamestate == "playing" then
    if canShootTimer < 0 then
      canShoot = true
    end
    if love.keyboard.isDown('escape') then
      love.event.push('quit')
    end
    Controls.moveAvatar(dt)
    if torpedo.y ~= nil then
      torpedo.y = torpedo.y - (player.speed * dt)
    end
    canShootTimer = canShootTimer - (1 * dt)
    for i, torpedo in ipairs(torpedoes) do
      torpedo.y = torpedo.y - (250 * dt)
        if torpedo.y < 0 then
        table.remove(torpedoes, i)
      end
    end
  end
end

function love.draw(dt)
  if gamestate == "playing" then
    love.graphics.draw(world.background, 0, 0)
    if torpedo.y ~= nil then
      love.graphics.draw(torpedo.img, torpedo.x, torpedo.y)
    end
    love.graphics.draw(player.img, player.x, player.y)
    for i, torpedo in ipairs(torpedoes) do
      love.graphics.draw(torpedo.img, torpedo.x, torpedo.y)
    end
  end
end
