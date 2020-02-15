love.graphics.setDefaultFilter("nearest", "nearest", 1)


local push = require "libs/push"
local gameWidth, gameHeight = 128, 128
push:setupScreen(gameWidth, gameHeight, 512, 512, {fullscreen = false, resizable = true})

local screen = require "libs/shack"
screen:setDimensions(push:getDimensions())

bg = love.graphics.newImage("bg.png")

function love.draw()
    push:start()
    love.graphics.draw(bg)
    push:finish()
end

function love.update(dt)
end

function love.keypressed(key)
    if key == "escape" then love.event.quit() end
    if key == "return" and love.keyboard.isDown("lalt") then push:switchFullscreen() end
    updateKonami(key)
end

function love.resize(w, h)
  push:resize(w, h)
end

code = {"up", "up", "down", "down", "left", "right", "left", "right", "b", "a"}
currentPlace = 1
function updateKonami(key)
    if key == code[currentPlace] then
        print("OOF")
        currentPlace = currentPlace + 1
        if currentPlace > #code then
            love.system.openURL("https://www.youtube.com/watch?v=G8iEMVr7GFg")
        end
    else
        currentPlace = 1
    end
end