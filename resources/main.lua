--[[
  Created by Thiarley Rocha (ThDev-only)
  First project using Lua, don't judge me ;-;
]]
  
blockWidth = 100
blockHeight = 80
width, height = 0,0
containerWidth, containerHeight = 0,0
blocks = {}
bomb = 0
result = 0
clickedBlocks = 0

function love.load()
  width, height = love.graphics.getDimensions()
  padding = 5
  containerWidth = 3 * blockWidth + 2 * padding + 10
  containerHeight = 3 * blockHeight + 2 * padding + 10
  startX = (width - containerWidth) /2 + 5
  startY = (height - containerHeight) /2 + 5
  bomb = love.math.random(1, 9)
  
  for line = 0, 2 do
    for column = 0, 2 do
        local x = startX + column * (blockWidth + padding)
        local y = startY + line * (blockHeight + padding)
        table.insert(blocks, {x = x, y = y, clicked = false})
    end
  end
  
end
  
function love.draw()
    love.graphics.print("Blocks Game", (width - 40)/2, 5)
    love.graphics.rectangle("line", (width - containerWidth)/2, (height - containerHeight)/2, containerWidth, containerHeight)
    
    for i, block in ipairs(blocks) do
       if block.clicked then
          love.graphics.setColor(0.5, 1, 1)
          love.graphics.rectangle("fill", block.x, block.y, blockWidth, blockHeight)
       end
       
       if block.clicked and i == bomb and result ~= 1 then
          love.graphics.setColor(1, 0, 0)
          love.graphics.rectangle("fill", block.x, block.y, blockWidth, blockHeight)
       end
       
       if not block.clicked then
          love.graphics.setColor(0.5, 0.7, 1)
          love.graphics.rectangle("fill", block.x, block.y, blockWidth, blockHeight)
       end
       
    end
    love.graphics.setColor(1, 1, 1)
    
    if result == 1 then
       love.graphics.print("You Win!", 0, 30)
    end
    
    if result == 2 then
      love.graphics.print("You Lose", 0, 30)
    end
    --Activate if you want to see where the bomb is located
     --love.graphics.print("Bomb is here: " .. bomb, 0, 0)
end

function love.touchpressed(id, x, y)
  local touchX, touchY = x, y
  
  for i, block in ipairs(blocks) do
    if touchX >= block.x and touchX <= block.x + blockWidth and
      touchY >= block.y and touchY <= block.y + blockHeight and
      not block.clicked and result ~= 1 and result ~= 2 then
      block.clicked = true
      if i == bomb then
        result = 2
        break
      end
      clickedBlocks = clickedBlocks + 1
      end
  end
  if clickedBlocks == 8 then
    result = 1
  end
end