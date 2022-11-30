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





-------------------------------------
----------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Beach Background
local background = display.newImage("beach.png")
background.x = display.contentCenterX
background.y = display.contentCenterY
background.xScale = 1.5
background.yScale = 1.5
background.alpha = 0.8

local backgroundA = audio.loadStream( "beach_music.mp3" )   --Very fitting Pokemon Ruby/Sapphire Dive music
audio.setVolume( 0.8, { channel=2 } )
audio.play( backgroundA, { channel=2, loops=-1 } )









local global = display.newGroup()
local balls = display.newGroup()
local bt = {}
local physics = require( "physics" )
local phy;
pachinko = 100;
local hud = display.newText(pachinko, 100, 100, system.nativeFont, 50)
hud:setFillColor(1,1,0)


-- physics.start()
-- physics.pause()
-- physics.stop()
-- physics.setGravity(x,y)
-- physics.addBody(object, method, options)
-- Physics.removeBody(object)
-- kinematic  static  dynamic
-- friction: default is 0.3
-- bounce:  default is 0.2. 1 bounce forever
-- outline: graphics.newOutline()

physics.start()
local red = display.newRect(0,1110,display.contentWidth*2,25)
red:setFillColor(1,0,0)
global:insert(red)
global:insert(balls)

----------boarderline
local left = display.newRect(0,0,5, display.contentHeight);
local right = display.newRect(display.contentWidth-5,0,5,display.contentHeight);
local bottom = display.newRect(0,display.contentHeight-10, display.contentWidth, 20);
left.anchorX = 0;left.anchorY = 0;
right.anchorX = 0;right.anchorY = 0;
bottom.anchorX = 0;bottom.anchorY = 0;

physics.addBody( bottom, "static",{bounce=0.1} );
physics.addBody( left, "static" );
physics.addBody( right, "static" );
--local ball = display.newCircle (display.contentCenterX, display.contentCenterY-420, 15);

------------------   color balls    ---------------------------------------------------------------------
for i = 0, 3, 1 do -- ROLL 1 RED
    local b = display.newCircle(150 + 110*i, display.contentCenterY, 10)
    b:setFillColor(0,1,1)
    physics.addBody (b, "static",{bounce=0.1, radius=5});
   
end

for i = 0, 3, 1 do -- ROLL 3 YELLOW
    local b = display.newCircle(0 + 110*i, display.contentCenterY +100, 10)
    b:setFillColor(0,1,0.7)
    physics.addBody (b, "static",{bounce=0.1, radius=5});
end

for i = 0, 3, 1 do -- ROLL 4 GREEN
    local b = display.newCircle(320 + 110*i, display.contentCenterY+150, 10)
    b:setFillColor(0,1,0.5)
    physics.addBody (b, "static",{bounce=0.1, radius=5});
end
for i = 0, 3, 1 do -- ROLL 5 CYAN
    local b = display.newCircle(160 + 110*i, display.contentCenterY +250, 10)
    b:setFillColor(0,1,0,3)
    physics.addBody (b, "static",{bounce=0.1, radius=5});
end





--------------------  GOAL GATE   ----------------------------------------------------------------------------
--Goals
local tt = 10
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
ss= ss/2
    local r7 = display.newRect(ss+155-tt, 960+tt, 20*2,4)
    local r8 = display.newRect(ss+134-tt, 945+tt+3, 3,13*2)
    r8.rotation = -20

    local r9 = display.newRect(ss+175-tt, 945+tt+3, 3,13*2)
    r9.rotation = 20
        physics.addBody (r7, "static",{bounce=0.1})
        physics.addBody (r8, "static",{bounce=0.1})
        physics.addBody (r9, "static",{bounce=0.1})


----------------------------------------------------------------

--Spinners
local w = display.newGroup()
local g1 = display.newRect(100, 800, 100,5)
local g2 = display.newRect(100, 800, 5, 100)

local g3 = display.newRect(550, 600, 100, 5)
local g4 = display.newRect(550, 600, 5, 100)

local g5 = display.newRect(150, 300, 200,10)
local g6 = display.newRect(150, 300, 10, 200)

local g7 = display.newRect(500, 300, 200, 5)
local g8 = display.newRect(500, 300, 10, 200)

w:insert(g1)
g1.anchorX = 0.5;
g1.anchorY = 0.5;
w:insert(g2)
g2.anchorX = 0.5;
g2.anchorY = 0.5;

w:insert(g3)
g3.anchorX = 0.5;
g3.anchorY = 0.5;
w:insert(g4)
g4.anchorX = 0.5;
g4.anchorY = 0.5;

w:insert(g5)
g5.anchorX = 0.5;
g5.anchorY = 0.5;
w:insert(g6)
g6.anchorX = 0.5;
g6.anchorY = 0.5;

w:insert(g7)
g7.anchorX = 0.5;
g7.anchorY = 0.5;
w:insert(g8)
g8.anchorX = 0.5;
g8.anchorY = 0.5;

physics.addBody (g1, "static",{bounce=0.1})
physics.addBody (g2, "static",{bounce=0.1})
physics.addBody (g3, "static",{bounce=0.1})
physics.addBody (g4, "static",{bounce=0.1})
physics.addBody (g5, "static",{bounce=0.1})
physics.addBody (g6, "static",{bounce=0.1})
physics.addBody (g7, "static",{bounce=0.1})
physics.addBody (g8, "static",{bounce=0.1})


local function spin()
g1.rotation = g1.rotation - 1.5;
g2.rotation = g2.rotation - 1.5;

g3.rotation = g3.rotation + 1.5;
g4.rotation = g4.rotation + 1.5;

g5.rotation = g5.rotation - 1.5;
g6.rotation = g6.rotation - 1.5;

g7.rotation = g7.rotation + 1.5;
g8.rotation = g8.rotation + 1.5;
end
timer.performWithDelay(0.5,spin,0)


--local bL = display.newRect(370, 800, 35, 10)
--local bR = display.newRect(610, 800, 35, 10)
local bwl = display.newRect(450, 700, 20, 400)
local bwr = display.newRect(200, 700, 20, 400)
--physics.addBody (bL, "static",{bounce=0.1})
--physics.addBody (bR, "static",{bounce=0.1})
physics.addBody (bwl, "static",{bounce=0.1})
physics.addBody (bwr, "static",{bounce=0.1})

local function block()

    local b1 = display.newRect(0, 500, 31, 10)
    physics.addBody (b1, "static",{bounce=0.1})
    transition.to(b1,{time = 3500, x = display.contentWidth+20} )



    local b2 = display.newRect(0, 800, 31, 10)
    physics.addBody (b2, "static",{bounce=0.1})
    transition.to(b2,{time = 3500, x = display.contentWidth+20} )



    local b3 = display.newRect(display.contentWidth+20,650, 31, 10)
    physics.addBody (b3, "static",{bounce=0.1})
    transition.to(b3,{time = 3500, x = -display.contentWidth+20} )

   -- local b2 = display.newRect(370, 900, 31, 5)
    --physics.addBody (b2, "static",{bounce=0.1})
    --transition.to(b2,{time = 1500, x = 610} )

        local b = display.newCircle(0, display.contentCenterY+350, 10)
        b:setFillColor(0.5,1,1)
        physics.addBody (b, "static",{bounce=0.1, radius=5});
        transition.to(b,{time = 2500, x = display.contentWidth+20} )


end


timer.performWithDelay(600,block,0)




--------------------------------------------------------------------------------------------------------------
function makeball(event)
    if pachinko > 0 then
        local bg  = display.newGroup()
        local ball = display.newCircle(event.x, 0, 17);
        ball.y = 100;
        bg:insert(ball)
        table.insert(bt, ball)
        physics.addBody (ball, "dynamic", {bounce=0, radius=15} );
        ball.phy = true;
        local t = math.random(1,15)/100
        local n = math.random(1,2)
        if n%2 == 0 then
           t = t *-1
        end
        physics.setGravity(0, 9.8);
        ball:applyForce(t, 0,5, ball.x, ball.y)
        balls:insert(bg)
        pachinko = pachinko - 1;
        --print('pachinko:'..pachinko)
    end

end






Runtime:addEventListener("tap", makeball)
--timer.performWithDelay(650, makeball2, 0)


local function update()
    for _, ball in ipairs(bt) do
       if ball.y > 1105 then
            if ball.phy == true then
                physics.removeBody( ball )
                ball.phy = false;
                transition.to(ball, {time = 250, alpha = 0.0})
              local x;
             for i, ball in ipairs(balls) do
                 if bg == balls then
                     x = i;
                        ball:removeSelf()
                     display.remove(ball);
                        ball = nil
                    table.remove(bt, i)
                     bg.removeSelf()
                 end
               end

            end 
        end
    end
end

timer.performWithDelay(10, update, 0)

------------------------------------------------- DISPLAY XY
local function updatexy()
    for _, ball in ipairs(bt) do
        if ball.phy == true then
            print(ball.x.."/"..ball.y)
        end

    end
end

timer.performWithDelay(5000, updatexy, 0)


local function hudup()
    display.remove(hud)
    hud = display.newText(pachinko, 60, 60, system.nativeFont, 50)
end

timer.performWithDelay(1, hudup, 0)


----------------------------------------------- GOAL ----------------
-- Left 142, 1012
-- right 486, 1012

local function goal()

    for _, ball in ipairs(bt) do
        if ball.y > 1012 - 1 then
            if ball.y < 1012 + 1 then
                if ball.x > 142 - 6 then
                    if ball.x < 142 + 1 then
                        if ball.phy == true then
                            physics.removeBody( ball )
                            ball.phy = false;
                            transition.to(ball, {time = 375, alpha = 0.0})
                            print('WIN LEFT GOAL + 15')
                            pachinko = pachinko + 15;

                            local x;
                            for i, ball in ipairs(balls) do
                                if bg == balls then
                                    x = i;
                                    ball:removeSelf()
                                    display.remove(ball);
                                    ball = nil
                                    table.remove(bt, i)
                                    bg.removeSelf()
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
                                pachinko = pachinko + 8;

                                local x;
                                for i, ball in ipairs(balls) do
                                    if bg == balls then
                                        x = i;
                                        ball:removeSelf()
                                        display.remove(ball);
                                        ball = nil
                                        table.remove(bt, i)
                                        bg.removeSelf()
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