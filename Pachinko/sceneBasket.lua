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
 

-------------------------------------
----------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
widget = require("widget")

-- Your code here
local bgdata = { width=378, height=500, numFrames=1, sheetContentWidth=378, sheetContentHeight=500 }
local bgsheet = graphics.newImageSheet( "bg-court.png", bgdata )
local bgcourt = display.newImage(bgsheet,1)
bgcourt:scale(2.5,2.5)
bgcourt.x = display.contentCenterX
bgcourt.y = display.contentCenterY
local global = display.newGroup()
local balls = display.newGroup()
local bt = {}
local physics = require( "physics" )
local phy;
pachinko = 100;
local hud = display.newText(pachinko, 60, 60, system.nativeFont, 50)


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
left.alpha=0
right.alpha=0
bottom.alpha=0
left.anchorX = 0;left.anchorY = 0;
right.anchorX = 0;right.anchorY = 0;
bottom.anchorX = 0;bottom.anchorY = 0;

physics.addBody( bottom, "static",{bounce=0.1} );
physics.addBody( left, "static" );
physics.addBody( right, "static" );
--local ball = display.newCircle (display.contentCenterX, display.contentCenterY-420, 15);

------------------   color balls    ---------------------------------------------------------------------
for i = 0, 2, 1 do -- ROLL 1 RED
    local b = display.newCircle(100 + 110*i, display.contentCenterY, 10)
    physics.addBody (b, "static",{bounce=0.1, radius=5});
   
end
for i = 0, 2, 1 do -- ROLL 2 ORANGE
    local b = display.newCircle(45 + 110*i, display.contentCenterY+50, 10)
    physics.addBody (b, "static",{bounce=0.1, radius=5});
end
for i = 0, 2, 1 do -- ROLL 3 YELLOW
    local b = display.newCircle(100 + 110*i, display.contentCenterY +100, 10)
    physics.addBody (b, "static",{bounce=0.1, radius=5});
end
for i = 0, 2, 1 do -- ROLL 4 GREEN
    local b = display.newCircle(45 + 110*i, display.contentCenterY+150, 10)
    physics.addBody (b, "static",{bounce=0.1, radius=5});
end
for i = 0, 1, 1 do -- ROLL 5 CYAN
    local b = display.newCircle(100 + 110*i, display.contentCenterY +200, 10)
    physics.addBody (b, "static",{bounce=0.1, radius=5});
end
for i = 0, 2, 1 do -- ROLL 6 LIGHT BLUE
    local b = display.newCircle(45 + 110*i, display.contentCenterY+250, 10)
    physics.addBody (b, "static",{bounce=0.1, radius=5});
end
for i = 0, 1, 1 do -- ROLL 7 BLUE
    local b = display.newCircle(100 + 110*i, display.contentCenterY +300, 10)
    physics.addBody (b, "static",{bounce=0.1, radius=5});
end
for i = 0, 2, 1 do -- ROLL 8 purple
    local b = display.newCircle(45 + 110*i, display.contentCenterY+350, 10)
    physics.addBody (b, "static",{bounce=0.1, radius=5});
end

local ballForce = 2.4
local function sliderListener( event )
    ballForce = .5+event.value/25
end

local forceSlider = widget.newSlider(
  {
     x = display.contentCenterX,
     y = 75,
     width = 300,
     value = 50,  
     listener = sliderListener
  }
)
forceSlider.text = display.newText("Power", forceSlider.x+150, forceSlider.y+40, native.systemBold, 50)
forceSlider.text:setFillColor( 1, 1, 1 )

local function handleButtonEvent( event )
    if ( "ended" == event.phase ) then
        makeball();
    end
end
 
-- Create the widget
local button1 = widget.newButton(
    {
        left = 100,
        top = 200,
        shape = "circle",
        fillColor = { default={ 1, 1, 1 }, over={ 1, 0.2, 0.5 } },
        id = "button1",
        label = "SHOOT!",
        onEvent = handleButtonEvent
    }
)
button1.x = forceSlider.x + 400
button1.y = forceSlider.y + 10

local stephdata = { width=254, height=576, numFrames=1, sheetContentWidth=255, sheetContentHeight=577 }
local stephsheet = graphics.newImageSheet( "steph-curry.png", stephdata )
local steph = display.newImage(stephsheet,1)
steph:scale(.35,.35)
steph.x = 40
steph.y = display.contentCenterY-150

local basketballdata = { width=340, height=340, numFrames=1, sheetContentWidth=340, sheetContentHeight=340 }
local basketballsheet = graphics.newImageSheet( "basketball.png", basketballdata )
local goaldata = { width=612, height=612, numFrames=1, sheetContentWidth=612, sheetContentHeight=612 }
local goalsheet = graphics.newImageSheet( "goal-gate.png", goaldata )

--------------------  GOAL GATE   ----------------------------------------------------------------------------
local tt = 15
local r1 = display.newRect(155-tt, 1015+tt, 20*2,4)
local r2 = display.newRect(134-tt, 999+tt+3, 3,13*2)
local r3 = display.newRect(175-tt, 999+tt+3, 3,13*2)
r1.alpha=0
r2.alpha=0
r3.alpha=0
 physics.addBody (r1, "static",{bounce=0.1})
 physics.addBody (r2, "static",{bounce=0.1})
 physics.addBody (r3, "static",{bounce=0.1})
local goal1 = display.newImage(goalsheet,1)
goal1:scale(.1,.1)
goal1.x = r1.x
goal1.y = r1.y

local ss = 350
local r4 = display.newRect(ss+155-tt, 1015+tt, 20*2,4)
local r5 = display.newRect(ss+134-tt, 999+tt+3, 3,13*2)
local r6 = display.newRect(ss+175-tt, 999+tt+3, 3,13*2)
r4.alpha=0
r5.alpha=0
r6.alpha=0
 physics.addBody (r4, "static",{bounce=0.1})
 physics.addBody (r5, "static",{bounce=0.1})
 physics.addBody (r6, "static",{bounce=0.1})
local goal2 = display.newImage(goalsheet,1)
goal2:scale(.1,.1)
goal2.x = r4.x
goal2.y = r4.y

local r7 = display.newRect(ss+155-tt, 315+tt, 20*2,4)
local r8 = display.newRect(ss+134-tt, 299+tt+3, 3,13*2)
local r9 = display.newRect(ss+175-tt, 299+tt+3, 3,13*2)
r7.alpha=0
r8.alpha=0
r9.alpha=0
 physics.addBody (r7, "static",{bounce=0.1})
 physics.addBody (r8, "static",{bounce=0.1})
 physics.addBody (r9, "static",{bounce=0.1})
local goal3 = display.newImage(goalsheet,1)
goal3:scale(.1,.1)
goal3.x = r7.x
goal3.y = r7.y



----------------------------------------------------------------

local w = display.newGroup()
local g1 = display.newRect(510, 500, 100,5)
local g2 = display.newRect(510, 500, 5, 100)

local g3 = display.newRect(400, 620, 100, 5)
local g4 = display.newRect(400, 620, 5, 100)

w:insert(g1)
g1.anchorX = 0.5;
g1.anchorY = 0.5;
w:insert(g2)
g2.anchorX = 0.5;
g2.anchorY = 0.5;

physics.addBody (g1, "static",{bounce=0.1})
physics.addBody (g2, "static",{bounce=0.1})
physics.addBody (g3, "static",{bounce=0.1})
physics.addBody (g4, "static",{bounce=0.1})


local function spin()
g1.rotation = g1.rotation - 1.5;
g2.rotation = g2.rotation - 1.5;

g3.rotation = g3.rotation + 1.5;
g4.rotation = g4.rotation + 1.5;
end
timer.performWithDelay(0.5,spin,0)

local bL = display.newRect(370, 800, 35, 10)
local bR = display.newRect(610, 800, 35, 10)
local bwl = display.newRect(370, 830, 35, 250)
local bwr = display.newRect(595, 650, 5, 500)
local btp = display.newRect(610, 395, 35, 10)

physics.addBody (bL, "static",{bounce=0.1})
physics.addBody (bR, "static",{bounce=0.1})
physics.addBody (bwl, "static",{bounce=0.1})
physics.addBody (bwr, "static",{bounce=0.1})
physics.addBody (btp, "static",{bounce=0.1})



local function block()
local b = display.newRect(610, 800, 31, 5)
physics.addBody (b, "static",{bounce=0.1})
transition.to(b,{time = 1500, x = 370} )

local b2 = display.newRect(370, 900, 31, 5)
physics.addBody (b2, "static",{bounce=0.1})
transition.to(b2,{time = 1500, x = 610} )
end
timer.performWithDelay(600,block,0)




--------------------------------------------------------------------------------------------------------------

function makeball(event)
if pachinko > 0 then
    --print("MAKE")
local bg  = display.newGroup()
local ball = display.newImage(basketballsheet,1)
ball:scale(.1,.1)
ball.x = steph.x
ball.y = steph.y-100
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
ball:applyForce(ballForce, -ballForce-2,5, ball.x, ball.y)
--ball:applyTorque(10)
balls:insert(bg)
pachinko = pachinko - 1;
--print('pachinko:'..pachinko)
end


local function makeball2(event)
local bg  = display.newGroup()
local ball = display.newCircle(math.random(100,600), 0, 17);
ball.y = 100;
    bg:insert(ball)
    table.insert(bt, ball)
physics.addBody (ball, "dynamic", {bounce=0, radius=17} );
ball.phy = true;
local t = math.random(17,27)/100
local n = math.random(1,2)
if n%2 == 0 then
    t = t *-1
end
physics.setGravity(0, 9.8);
ball:applyForce(0,1, ball.x, ball.y)
--ball:applyTorque(10)
balls:insert(bg)

end
end


--Runtime:addEventListener("tap", makeball)
--timer.performWithDelay(650, makeball2, 0)


local function update()
--fgroup = balls
--g = bg
for _, ball in ipairs(bt) do

   if ball.y > 1105 then
      --image.alpha = 0;
        if ball.phy == true then
                physics.removeBody( ball )
                ball.phy = false;
        transition.to(ball, {time = 250, alpha = 0.0})
      

      local x;
         for i, ball in ipairs(balls) do
             if bg == balls then
             x = i;
               -- physics.removeBody( ball )
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
--fgroup = balls
--g = bg
for _, ball in ipairs(bt) do
    if ball.phy == true then
        print(ball.x.."/"..ball.y)
    end

end
end
timer.performWithDelay(5000, updatexy, 0)

local function hudup()
display.remove(hud)
hud = display.newText(pachinko, 60, 80, system.nativeFont, 70)
end
timer.performWithDelay(1, hudup, 0)
----------------------------------------------- GOAL ----------------
-- Left 142, 1012
-- right 486, 1012

local function goal()
--fgroup = balls
--g = bg
    for _, ball in ipairs(bt) do

        if ball.y > r1.y-tt-3 - 1 then
            if ball.y < r1.y-tt-3 + 1 then        
                if ball.x > 142 - 6 then
                    if ball.x < 142 + 1 then
                        if ball.phy == true then
                            physics.removeBody( ball )
                            ball.phy = false;
                            transition.to(ball, {time = 375, alpha = 0.0})
                            print('WIN LEFT GOAL + 9')
                            pachinko = pachinko + 9;

                            local x;
                            for i, ball in ipairs(balls) do
                                if bg == balls then
                                    x = i;
                                   -- physics.removeBody( ball )
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
                                print('WIN RIGHT GOAL + 6')
                                pachinko = pachinko + 6;

                                local x;
                                for i, ball in ipairs(balls) do
                                    if bg == balls then
                                        x = i;
                                       -- physics.removeBody( ball )
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
        if ball.y > 312 - 1 then
            if ball.y < 312 + 1 then
                if ball.x > 486 - 6 then
                    if ball.x < 486+6.5 then
                        if ball.phy == true then
                            physics.removeBody( ball )
                            ball.phy = false;
                            transition.to(ball, {time = 375, alpha = 0.0})
                            print('WIN TOP GOAL + 3')
                            pachinko = pachinko + 3;

                            local x;
                            for i, ball in ipairs(balls) do
                                if bg == balls then
                                    x = i;
                                   -- physics.removeBody( ball )
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
timer.performWithDelay(2, goal, 0)










 local cx = display.contentCenterX;
local cy = display.contentCenterY;
local exit = display.newRect(50, 140, 75,75)
exit:setFillColor(0.5,0.5,0.5)
local exittext = display.newText("<", cx*2 - 100, 90, system.nativeFont, 100)
   sceneGroup:insert(exit)
      sceneGroup:insert(exittext)
      global:insert(exit)
      global:insert(exittext)
local function back()
   composer.gotoScene("MenuScene")
end
exit:addEventListener("tap", back)
 























   -- Example: add display objects to "sceneGroup", add touch listeners, etc.
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