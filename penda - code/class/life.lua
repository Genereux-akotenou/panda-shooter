Life = Object:extend()

function Life:new()
    self.image = love.graphics.newImage("assets/sprites/catch-life.png")
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() + 50
    self.speed = 700
    self.width = self.image:getWidth()
    self.height = self.image:getWidth()
    self.dead = false
end

function Life:update(dt)
    self.y = self.y - self.speed * dt

    if self.y < 0 then
        self.dead = true
    end
end

function Life:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function Life:checkCollision(obj)
    if  self.x + self.width > obj.x and self.x < obj.x + obj.width and self.y + self.height >obj.y and self.y < obj.y + obj.height then
        self.dead = true
        niv = niv + 1
        score = score + 5
    end       
end

-- not finished | 17062021:1548 - by Redfox