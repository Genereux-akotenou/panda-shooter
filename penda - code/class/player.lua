Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("assets/sprites/panda.png")
    self.y = 20
    self.speed = 500
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.x = (love.graphics.getWidth() / 2) - (self.width / 2)
end

function Player:update(dt)
    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end

    local window_width = love.graphics.getWidth()

    if self.x < 0 then
        self.x = 0
    elseif self.x >= window_width - self.width then
        self.x = window_width - self.width
    end

    if niv < 3 then
        self.image = love.graphics.newImage("assets/sprites/aie-panda.png")
    else
        self.image = love.graphics.newImage("assets/sprites/panda.png")
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function Player:keyPressed(key)
    if key == "space" then
        table.insert(listOfBullets, Bullet(self.x + self.width / 2 - 5, self.y + self.height - 30))
        check = true
        song:play() 
    end
end