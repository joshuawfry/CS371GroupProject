local composer = require( "composer" )
local scene = composer.newScene()
 
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------
 
-- "scene:create()"
function scene:create( event )
 
   local sceneGroup = self.view
 
   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.

local cx = display.contentCenterX;
local cy = display.contentCenterY;
local exit = display.newRect(cx*2 - 100, 100, 100,100)
exit:setFillColor(0.5,0.5,0.5)
local exittext = display.newText("<", cx*2 - 100, 90, system.nativeFont, 100)
   sceneGroup:insert(exit)
      sceneGroup:insert(exittext)
local function back()
   composer.gotoScene("MenuScene")
end
exit:addEventListener("tap", back)




local physics = require("physics")
physics.start()
physics.setGravity(0, 9.8)

local soundTable = require("soundTable");
local widget = require("widget")


local sheetOptions = 
{
    frames =
    { 
        { --bamboo themed ball
            x = 36,
            y = 44,
            width = 47,
            height = 36 
        },
        { --bamboo themed bouncer
            x = 175,
            y = 48,
            width = 37,
            height = 37
        },
        { --bamboo themed spinner
            x = 296,
            y = 43,
            width = 44,
            height = 37
        },
        { --jackpot gate frame 1
            x = 0,
            y = 155,
            width = 128,
            height = 77
        },
        { --jackpot gate frame 2
            x = 129,
            y = 155,
            width = 128,
            height = 77
        },
        { --jackpot gate frame 3
            x = 257,
            y = 155,
            width = 128,
            height = 77
        },
        { --jackpot gate frame 4
            x = 0,
            y = 280,
            width = 128,
            height = 77
        },
    },
}
local objectSheet = graphics.newImageSheet("Game Images.png", sheetOptions)
--initializing variables
local score = 100
local phy
local ballGroup = display.newGroup()
local ballsTable = {}
local minVel = 100
local ball 
local bouncer1
local bouncer2
local bouncer3
local bouncer4
local bouncer5
local bouncer6
local jackpotGate
local spinner1
local spinner2
local spinner3
local bouncer
local scoreText
local slidePercent = 0
local launchWall
local function sliderListener( event )
      slidePercent = event.value;
end

function exitAndSaveScore(event)
    local data = score
    local path = system.pathForFile("Hiscores.txt", system.DocumentsDirectory)
    local file = io.open(path, "w")
    file:write(data)
    io.close(file)
    file = nil
    native.requestExit()

end  


local slider = widget.newSlider(
    {
         x = display.contentCenterX + 200,
         y = 1100,
         width = 100,
         value = 0,  -- Start slider at 10% (optional)
         listener = sliderListener
    }
)

--button to exit and save hiscores to file, does not work on iOS emulation, but will work for all other devices
local exitButton = widget.newButton(
    {
        label = "button",
        onEvent = handleButtonEvent,
        shape = "roundedRect",
        width = 100,
        height = 40,
        cornerRadius = 2,
        fillColor = {default = {0.5, 0, 0, 1}, over = {1, 0.1, 0.7, 0.4}},
        strokeWidth = 2
    }
)
exitButton:setLabel ("Exit")
exitButton.x = display.contentCenterX - 200
exitButton.y = 1100
--exitButton:addEventListener( "tap", exitAndSaveScore )
exitButton:addEventListener("tap", back)

local launchButton = widget.newButton(
    {
        label = "button",
        onEvent = handleButtonEvent,
        shape = "roundedRect",
        width = 100,
        height = 40,
        cornerRadius = 2,
        fillColor = {default = {0, 1, 0, 1}, over = {1, 0.1, 0.7, 0.4}},
        strokeWidth = 2
    }
)
launchButton:setLabel ("Launch")
launchButton.x = display.contentCenterX
launchButton.y = 1100

--set up display groups
local backGroup = display.newGroup()
local spinnerGroup1 = display.newGroup()
local spinnerGroup2 = display.newGroup()
local bouncerGroup = display.newGroup()
local balls= display.newGroup()
local mainGroup = display.newGroup()
local uiGroup = display.newGroup()
mainGroup:insert(balls)
mainGroup:insert(exitButton)
--Background insertion for bamboo theme
local width = display.contentWidth
local height = display.contentHeight
local background = display.newImageRect(backGroup, "Bamboo Pachinko Background.png", width, height)
background.x = display.contentCenterX
background.y = display.contentCenterY

local launchPlatform = display.newRect(mainGroup, 0, 300, 100, 10)
physics.addBody( launchPlatform, "static")

local tt = 15
local r1 = display.newRect(155-tt, 1015+tt, 20*2,4)
r1:setFillColor(1,1,1)
local r2 = display.newRect(134-tt, 999+tt+3, 3,13*2)
local r3 = display.newRect(175-tt, 999+tt+3, 3,13*2)
 physics.addBody (r1, "static",{bounce=0.1})
 physics.addBody (r2, "static",{bounce=0.1})
 physics.addBody (r3, "static",{bounce=0.1})
 local ss = 350
local r4 = display.newRect(ss+155-tt, 1015+tt, 20*2,4)
local r5 = display.newRect(ss+134-tt, 999+tt+3, 3,13*2)
local r6 = display.newRect(ss+175-tt, 999+tt+3, 3,13*2)
 physics.addBody (r4, "static",{bounce=0.1})
 physics.addBody (r5, "static",{bounce=0.1})
 physics.addBody (r6, "static",{bounce=0.1})

mainGroup:insert( slider )
mainGroup:insert(launchButton)

function makeBall(event)
    if score > 0 then
    local ball = display.newImageRect(ballGroup, objectSheet, 1, 20, 20)
    ball:scale(2, 1.5)
    ball.x = 10
    ball.y = 290
    ballGroup:insert(ball)
    table.insert(ballsTable,ball)
    physics.addBody(ball, "dynamic", {bounce = 0, radius = 15})
    ball.phy = true
    ball:setLinearVelocity(minVel+slider.value, minVel+math.random(100,500))
    balls:insert(ballGroup)
    score = score - 1
    scoreText.text = "Score: " .. score
    audio.play(soundTable["launchSound"])
    end
end

launchButton:addEventListener("tap", makeBall)

scoreText = display.newText(uiGroup, "Score:" .. score, 100, 80, nativesystemFont, 36)
scoreText:setFillColor(0, 0, 0)
display.setStatusBar(display.HiddenStatusBar)

--bouncer1
bouncer1 = display.newImageRect( bouncerGroup, objectSheet, 2, 37, 37 )
bouncer1.x = display.contentCenterX - 150
bouncer1.y = display.contentCenterY - 200
bouncer1:scale(2, 2)
physics.addBody(bouncer1, "static", {radius = 28, bounce = 1})
--bouncer2
bouncer2 = display.newImageRect( bouncerGroup, objectSheet, 2, 37, 37 )
bouncer2.x = display.contentCenterX + 150
bouncer2.y = display.contentCenterY - 200
bouncer2:scale(2, 2)
physics.addBody(bouncer2, "static", {radius = 28, bounce = 1})
--bouncer3
bouncer3 = display.newImageRect( bouncerGroup, objectSheet, 2, 37, 37 )
bouncer3.x = display.contentCenterX + 75
bouncer3.y = display.contentCenterY
bouncer3:scale(2, 2)
physics.addBody(bouncer3, "static", {radius = 28, bounce = 1})
--bouncer4
bouncer4 = display.newImageRect( bouncerGroup, objectSheet, 2, 37, 37 )
bouncer4.x = display.contentCenterX + 225
bouncer4.y = display.contentCenterY 
bouncer4:scale(2, 2)
physics.addBody(bouncer4, "static", {radius = 28, bounce = 1})
--bouncer5
bouncer5 = display.newImageRect( bouncerGroup, objectSheet, 2, 37, 37 )
bouncer5.x = display.contentCenterX - 75
bouncer5.y = display.contentCenterY
bouncer5:scale(2, 2)
physics.addBody(bouncer5, "static", {radius = 28, bounce = 1})
--bouncer6
bouncer6 = display.newImageRect( bouncerGroup, objectSheet, 2, 37, 37 )
bouncer6.x = display.contentCenterX - 225
bouncer6.y = display.contentCenterY
bouncer6:scale(2, 2)
physics.addBody(bouncer6, "static", {radius = 28, bounce = 1})
--spinner1
spinner1 = display.newImageRect(spinnerGroup1, objectSheet, 3, 44, 37)
spinner1.x = display.contentCenterX
spinner1.y = display.contentCenterY - 100
spinner1.anchorX = 0.5
spinner1.anchorY = 0.5
spinner1:scale(3,3)
physics.addBody(spinner1, "static", {bounce = 0.1})
--spinner2
spinner2 = display.newImageRect(spinnerGroup1, objectSheet, 3, 44, 37)
spinner2.x = display.contentCenterX - 150
spinner2.y = display.contentCenterY + 100
spinner2.anchorX = 0.5
spinner2.anchorY = 0.5
spinner2:scale(3,3)
physics.addBody(spinner2, "static", {bounce = 0.1})
--spinner3
spinner3 = display.newImageRect(spinnerGroup2, objectSheet, 3, 44, 37)
spinner3.x = display.contentCenterX + 150
spinner3.y = display.contentCenterY + 100
spinner3.anchorX = 0.5
spinner3.anchorY = 0.5
spinner3:scale(3,3)
physics.addBody(spinner3, "static", {bounce = 0.1})

--spin function for spinners
local function spin()
    spinner1.rotation = spinner1.rotation + 1.5
    spinner2.rotation = spinner2.rotation - 1.5
    spinner3.rotation = spinner3.rotation + 1.5

end
timer.performWithDelay(0.5, spin, 0)

--borders
local top = display.newRect(0, 0, display.contentWidth, 5);
local left = display.newRect(0, 0, 5, display.contentHeight);
local right = display.newRect(display.contentWidth-5, 0, 5, display.contentHeight);
local bottom = display.newRect(0, display.contentHeight, display.contentWidth, 5);
top.anchorX = 0; top.anchorY = 0;
left.anchorX = 0; left.anchorY = 0;
right.anchorX = 0; right.anchorY = 0;
bottom.anchorX = 0; bottom.anchorY = 0;
physics.addBody( top, "static");
physics.addBody( bottom, "static" );
physics.addBody( left, "static" );
physics.addBody( right, "static" );

local function updateText()
    scoreText.text = "Score: " .. score
end
timer.performWithDelay(10, updateText, 0)

local function update()
--fgroup = balls
--g = bg
for _, ball in ipairs(ballsTable) do


    if ball.y > 1105 then
        --image.alpha = 0;
        if ball.phy == true then
                physics.removeBody( ball )
                ball.phy = false;
        transition.to(ball, {time = 250, alpha = 0.0})
      

        local x;
            for i, ball in ipairs(balls) do
                if ballGroup == balls then
                x = i;
                ball:removeSelf()
                display.remove(ball);
                ball = nil
                table.remove(ballsTable, i)
                ballGroup.removeSelf()
            end
        
        end

    end 
end
end
end
timer.performWithDelay(10, update, 0)

local function updatexy()
for _, ball in ipairs(ballsTable) do
    if ball.phy == true then
        print(ball.x.."/"..ball.y)
    end

end
end
timer.performWithDelay(5000, updatexy, 0)

local function goal()
for _, ball in ipairs(ballsTable) do

    if ball.y > 1012 - 1 then
        if ball.y < 1012 + 1 then
        
         if ball.x > 142 - 6 then
            if ball.x < 142 + 1 then
          if ball.phy == true then
                physics.removeBody( ball )
                ball.phy = false;
        transition.to(ball, {time = 375, alpha = 0.0})
        print('WIN LEFT GOAL + 15')
        score = score + 15;

        local x;
            for i, ball in ipairs(balls) do
                   if ballsGroup == balls then
                x = i;
               -- physics.removeBody( ball )
                ball:removeSelf()
                display.remove(ball);
                ball = nil
                table.remove(ballsTable, i)
                ballsGroup.removeSelf()
              end
        
             end
            end 
            end
 if ball.x > 486 - 6 then
            if ball.x < 486+6.5 then
        if ball.phy == true then
                physics.removeBody( ball )
                ball.phy = false;
        transition.to(ball, {time = 375, alpha = 0.0})
        print('WIN RIGHT GOAL + 8')
        score = score + 8;

        local x;
            for i, ball in ipairs(balls) do
                if bg == balls then
                x = i;
               -- physics.removeBody( ball )
                ball:removeSelf()
                display.remove(ball);
                ball = nil
                table.remove(ballsTable, i)
                ballsGroup.removeSelf()
            end
        
        end
end
end
end





    end 
end
end
end
end
timer.performWithDelay(2, goal, 0)











end
 
-- "scene:show()"
function scene:show( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
   end
end
 
-- "scene:hide()"
function scene:hide( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end
 
-- "scene:destroy()"
function scene:destroy( event )
 
   local sceneGroup = self.view
 
   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end
 
---------------------------------------------------------------------------------
 
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
---------------------------------------------------------------------------------
 
return scene