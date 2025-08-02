function love.draw()

    local width, height = love.graphics.getDimensions()
    local containerWidth, containerHeight = 300, 250
    
    love.graphics.print("Iniciar Jogo", 100, 100)
    love.graphics.rectangle("line", (width - containerWidth)/2, (height - containerHeight)/2, containerWidth, containerHeight)
end