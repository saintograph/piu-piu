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

  if love.keyboard.isDown('left','a') then
    if player.x > 0 then
      player.x = player.x - (player.speed * dt)
    end
  elseif love.keyboard.isDown('right','d') then
    if player.x < width - 107 then
      player.x = player.x + (player.speed * dt)
    end
  elseif love.keyboard.isDown('down','s') then
    if player.y < (height - 93) then
      player.y = player.y + (player.speed * dt)
    end
  elseif love.keyboard.isDown('up','w') then
    if player.y > 0 then
      player.y = player.y - (player.speed * dt)
    end
	end
end

function love.draw(dt)
  love.graphics.draw(player.img, player.x, player.y)
end
