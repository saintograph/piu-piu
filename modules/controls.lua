local controls = {}

function controls.moveAvatar(dt)
  if love.keyboard.isDown('left','a') then
    if player.x > 0 then
      player.x = player.x - (player.speed * dt)
    end
  end
  if love.keyboard.isDown('right','d') then
    if player.x < width - 107 then
      player.x = player.x + (player.speed * dt)
    end
  end
  if love.keyboard.isDown('down','s') then
    if player.y < (height - 93) then
      player.y = player.y + (player.speed * dt)
    end
  end
  if love.keyboard.isDown('up','w') then
    if player.y > 300 then
      player.y = player.y - (player.speed * dt)
    end
  end
  if love.keyboard.isDown('space') and canShoot then
    new_torpedo = { x = player.x, y = player.y, img = torpedoImg }
    table.insert(torpedoes, new_torpedo)
    canShoot = false
    canShootTimer = canShootTimerMax
  end
end

return controls