function love.load()
    windowWidth = love.graphics.getWidth()
    windowHeight = love.graphics.getHeight()

    Object = require "modules/classic"
    require "class/player"
    require "class/enemy"
    require "class/bullet"

    player = Player()
    enemy = Enemy()
    listOfBullets = {}
    niv = 5
    score = 0
    lose = false
    level = {"assets/sprites/1.png", "assets/sprites/2.png", "assets/sprites/3.png", "assets/sprites/4.png" ,"assets/sprites/5.png"}
    chocWithEnemy = false
    chocWithPanda = false
    
    --songs
    song = love.audio.newSource("assets/audio/wing.wav", "static")
    die = love.audio.newSource("assets/audio/die.wav", "static")

    --var
    check = false
    start = false
    welcome = "Welcome to panda shooter !"
    rules1 = "In this game you have to shooter the green snake."
    rules2 = "As far as you do that you inscreased it's speed and you score too"
    rules3 = "If you missed him 3 time you lose"

    hint1 = "Presse \"A\" to start playing Use \"space\" to shoot"
    
end

function love.update(dt)
    if lose ~= true then
        player:update(dt)
        enemy:update(dt)

        for i, bullet in ipairs(listOfBullets) do
            bullet:update(dt)
            bullet:checkCollision(enemy)

            if bullet.dead then
                table.remove(listOfBullets, i)
            end
        end
    end

end

function love.draw()
    -- love.graphics.draw(love.graphics.newImage("assets/sprites/player.png"), 0, 0)

    if start then
        player:draw()
        enemy:draw()

        for i, bullet in ipairs(listOfBullets) do
            bullet:draw()
        end

        love.graphics.draw(love.graphics.newImage(level[niv]), windowWidth - 60 ,50)
        love.graphics.print("Score : " .. score, windowWidth - 100, windowHeight - 30)

    else
        love.graphics.rectangle("line", 15, 15, windowWidth - 30, windowHeight - 30)
        love.graphics.print(welcome, windowWidth / 2 - (#welcome * 3), 40)

        love.graphics.rectangle("fill", 50, 75, windowWidth - 100, 2)
        love.graphics.print("RULES", windowWidth / 2 - 30, 100)
        love.graphics.print(rules1, windowWidth / 2 - 155, 130)
        love.graphics.print(rules2, windowWidth / 2 - 195, 150)
        love.graphics.print(rules3, windowWidth / 2 - 110, 180)

        love.graphics.print(hint1, windowWidth / 2 - 170, 260)

        love.graphics.draw(love.graphics.newImage("assets/sprites/panda.png"), 200, 380)
        love.graphics.draw(love.graphics.newImage("assets/sprites/snake.png"), windowWidth - 300, 380)
    end

    if lose then
        love.graphics.draw(love.graphics.newImage("assets/sprites/gameover.png"), 300, 250)
        love.graphics.print("Press \"R\" to restart", windowWidth / 2 - 70 , 300)
    end
end

function love.keypressed(key)
    player:keyPressed(key)

    if key == "a" then
        start = true
    end

    if key == "r" then
        love.load()
    end
end

