blockWidth = 100
blockHeight = 80
width, height = 0,0
containerWidth, containerHeight = 0,0
blocks = {}

function love.load()
  width, height = love.graphics.getDimensions()
  padding = 5
  containerWidth = 3 * blockWidth + 2 * padding
  containerHeight = 3 * blockHeight + 2 * padding
  startX = (width - containerWidth) /2
  startY = (height - containerHeight) /2

  for line = 0, 2 do
    for column = 0, 2 do
        local x = startX + column * (blockWidth + padding)
        local y = startY + line * (blockHeight + padding)
        table.insert(blocks, {x = x, y = y})
    end
  end
  
end
  
function love.draw()
    --love.graphics.print("Iniciar Jogo", 100, 100)
    love.graphics.rectangle("line", (width - containerWidth)/2, (height - containerHeight)/2, containerWidth, containerHeight)
    
    for i, block in ipairs(blocks) do
      love.graphics.rectangle("line", block.x, block.y, blockWidth, blockHeight)
    end
end
