-- Imports
local Controls = require "modules/controls"
suit = require 'modules/suit'
-- local class = require 'middleclass'
require "modules/class"

-- Set debug to false for production
debug = true
gamestate = "menu"

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

world = {
  background = nil
}

function printMe()
  return love.graphics.print('Fire!', player.x, player.y)
end

function love.load(arg)
  world.background = love.graphics.newImage('assets/background.png')
  player.img = love.graphics.newImage('assets/submarine.png')
  torpedoImg = love.graphics.newImage('assets/torpedo.png')
end

function love.update(dt)
  if gamestate == "menu" then
    if suit.Button("Hello, World!", 0, 0, 300, 30).hit then
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
  if gamestate == "menu" then
    suit.draw()
  end
  if gamestate == "playing" then
    love.graphics.draw(world.background, 0, 0)
    love.graphics.draw(player.img, player.x, player.y)
    for i, torpedo in ipairs(torpedoes) do
      love.graphics.draw(torpedo.img, torpedo.x, torpedo.y)
    end
  end
end
