Bullet = Object:extend()

function Bullet:new(x, y)
    self.image = love.graphics.newImage("assets/sprites/bullet.png")
    self.x = x
    self.y = y
    self.speed = 700
    self.width = self.image:getWidth()
    self.height = self.image:getWidth()
    self.dead = false
end

function Bullet:update(dt)
    self.y = self.y + self.speed * dt

    if self.y > love.graphics.getHeight() then
        if niv ~= 1 then
            niv = niv - 1
        else
            lose = true
            die:play()
        end
        self.dead = true
    end
end

function Bullet:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function Bullet:checkCollision(obj)
    if  self.x + self.width > obj.x and self.x < obj.x + obj.width and self.y + self.height >obj.y and self.y < obj.y + obj.height then
        obj.image = love.graphics.newImage('assets/sprites/aie-snake.png')
        self.dead = true
        if obj.speed > 0 then
            obj.speed = obj.speed + 50
        else
            obj.speed = obj.speed - 50
        end
        score = score + 5
    end       
end