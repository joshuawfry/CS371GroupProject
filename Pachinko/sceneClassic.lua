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
-- EXIT





-- Global
local global = display.newGroup()
local balls = display.newGroup()
local bt = {}
local physics = require( "physics" )
local phy;
pachinko = 30;
local hud = display.newText(pachinko, 60, 60, system.nativeFont, 50)
local widget = require( "widget" )
local cx = display.contentCenterX;
local cy = display.contentCenterY;
 sceneGroup:insert(global)
  sceneGroup:insert(balls)
   sceneGroup:insert(hud)

--background
local bkgd1 = display.newCircle(cx,cy,325)
sceneGroup:insert(bkgd1)
bkgd1:setFillColor(0.8,0.8,0.8)
bkgd1.alpha = 0.5

--exit 
local exit = display.newRect(cx*2 - 100, 100, 100,100)
exit:setFillColor(0.5,0.5,0.5)
local exittext = display.newText("<", cx*2 - 100, 90, system.nativeFont, 100)
   sceneGroup:insert(exit)
      sceneGroup:insert(exittext)
local function back()
   composer.gotoScene("MenuScene")
end
exit:addEventListener("tap", back)




physics.start()
-- Static obstructs
   -- mid gate cover
   local mgcAngle = 90
   local mgcr = display.newRect(cx+16,cy-70,50,6)
   local mgcl = display.newRect(cx-16,cy-70,50,6)

   sceneGroup:insert(mgcr)
   sceneGroup:insert(mgcl)
   mgcr.rotation = mgcAngle
   mgcl.rotation = -mgcAngle
   physics.addBody(mgcr, "static" );
   physics.addBody(mgcl, "static" );

   -- Spinners  
      -- Right spinners
         local rspin = display.newGroup()

         -- close to mid gate
         local rs11 = display.newRect(rspin,cx+75, cy +25, 50, 4)
         local rs12 = display.newRect(rspin,cx+75, cy+25, 4, 50)
         physics.addBody(rs11, "static" );
         physics.addBody(rs12, "static" );

         -- next to rs1
         local rs21 = display.newRect(rspin,cx+200, cy +25, 50, 4)
         local rs22 = display.newRect(rspin,cx+200, cy +25, 4, 50)
         physics.addBody(rs21, "static" );
         physics.addBody(rs22, "static" );
         -- top
         local rs31 = display.newRect(rspin,cx+150, cy - 150, 50, 4)
         local rs32 = display.newRect(rspin,cx+150, cy - 150, 4, 50)
         physics.addBody(rs31, "static" );
         physics.addBody(rs32, "static" );

         sceneGroup:insert(rspin)

      -- Left spinners
         local lspin = display.newGroup()
         -- close to mid gate
         local ls11 = display.newRect(lspin,cx-75, cy +25, 50, 4)
         local ls12 = display.newRect(lspin,cx-75, cy+25, 4, 50)
         physics.addBody(ls11, "static" );
         physics.addBody(ls12, "static" );
         -- next to ls1
         local ls21 = display.newRect(lspin,cx-200, cy +25, 50, 4)
         local ls22 = display.newRect(lspin,cx-200, cy +25, 4, 50)
         physics.addBody(ls21, "static" );
         physics.addBody(ls22, "static" );
         --- top left
         local ls31 = display.newRect(lspin,cx-150, cy - 150, 50, 4)
         local ls32 = display.newRect(lspin,cx-150, cy - 150, 4, 50)
         physics.addBody(ls31, "static" );
         physics.addBody(ls32, "static" );

         sceneGroup:insert(lspin)

            local function spin()
               rs11.rotation = rs11.rotation +1;
               rs12.rotation = rs12.rotation +1;

               rs21.rotation = rs21.rotation+1;
               rs22.rotation = rs22.rotation+1;

               rs31.rotation = rs31.rotation+1;
               rs32.rotation = rs32.rotation+1;

               ls11.rotation = ls11.rotation-1;
               ls12.rotation = ls12.rotation-1;

               ls21.rotation = ls21.rotation-1;
               ls22.rotation = ls22.rotation-1;

               ls31.rotation = ls31.rotation-1;
               ls32.rotation = ls32.rotation-1;
            end
           spinning = timer.performWithDelay(0.5,spin,0)

   -- Obstructs
      for i = 0, 1, 1 do
         local pin = display.newCircle(cx, cy - 200 + i*50, 5)
         pin:setFillColor(1,0,1)
         physics.addBody(pin, "static" );
         sceneGroup:insert(pin)
      end

   -- Right obstruct
      -- top row
         local rboAngle1 = 45
         local rob1 = display.newRect(cx + 85, cy -205, 75, 5)
           sceneGroup:insert(rob1)
         rob1.rotation = rboAngle1
         physics.addBody( rob1, "static" );
         
         local rob2 = display.newRect(cx + 275, cy - 75, 5, 150)
           sceneGroup:insert(rob2)
         rob2.rotation = 33
         physics.addBody( rob2, "static" );

        -- Pins

         local spacing = 50
         for i = 0, 2, 1 do
            local pin = display.newCircle(cx + 25, cy - 225 + i*spacing, 5)
            --pin:setFillColor(0,0,0)
            physics.addBody(pin, "static" );
             sceneGroup:insert(pin)
         end
         
         for i = 0, 2, 1 do
            local pin = display.newCircle(cx + 50, cy - 200 + i*spacing, 5)
             pin:setFillColor(1,0,0)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)

         end

          for i = 0, 2, 1 do
            local pin = display.newCircle(cx + 75, cy - 175 + i*spacing, 5)
             pin:setFillColor(1,0,1)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
         end

          for i = 0, 2, 1 do
            local pin = display.newCircle(cx + 150, cy - 100 + i*spacing, 5)
             pin:setFillColor(0,1,0)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
         end

            for i = 0, 1, 1 do
            local pin = display.newCircle(cx + 100, cy - 100 + i*spacing, 5)
             pin:setFillColor(1,0,1)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end
            for i = 0, 1, 1 do
            local pin = display.newCircle(cx + 125, cy - 75 + i*spacing, 5)
             pin:setFillColor(1,0,0)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end
             for i = 0, 1, 1 do
            local pin = display.newCircle(cx + 175, cy - 75 + i*spacing, 5)
             pin:setFillColor(1,0,0)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end
             for i = 0, 1, 1 do
            local pin = display.newCircle(cx + 200, cy - 100 + i*spacing, 5)
             pin:setFillColor(1,0.5,1)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end

            -- bottom
              for i = 0, 1, 1 do
            local pin = display.newCircle(cx + 75, cy + 75 + i*spacing, 5)
             pin:setFillColor(0,1,0)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end
            for i = 0, 2, 1 do
            local pin = display.newCircle(cx + 125, cy + 75 + i*spacing, 5)
             pin:setFillColor(0,1,1)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end
             for i = 0, 1, 1 do
            local pin = display.newCircle(cx + 175, cy + 75 + i*spacing, 5)
             pin:setFillColor(0,1,1)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end
             for i = 0, 1, 1 do
            local pin = display.newCircle(cx + 150, cy + 100 + i*spacing, 5)
             pin:setFillColor(1,1,0)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end
             for i = 0, 1, 1 do
            local pin = display.newCircle(cx + 100, cy + 100 + i*spacing, 5)
             pin:setFillColor(1,1,0)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end







        

   -- Left obstruct (Copied from Right)
      local lboAngle1 = 45
         local lob1 = display.newRect(cx - 85, cy -205, 75, 5)
         lob1.rotation = -lboAngle1
         physics.addBody( lob1, "static" );
          sceneGroup:insert(lob1)
         
         local lob2 = display.newRect(cx - 275, cy - 75, 5, 150)
         lob2.rotation = -33
         physics.addBody( lob2, "static" );
          sceneGroup:insert(lob2)

      --pins
     for i = 0, 2, 1 do
            local pin = display.newCircle(cx - 25, cy - 225 + i*spacing, 5)
            --pin:setFillColor(0,0,0)
            physics.addBody(pin, "static" );
             sceneGroup:insert(pin)
         end
         
         for i = 0, 2, 1 do
            local pin = display.newCircle(cx - 50, cy - 200 + i*spacing, 5)
             pin:setFillColor(1,0,0)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
         end

          for i = 0, 2, 1 do
            local pin = display.newCircle(cx - 75, cy - 175 + i*spacing, 5)
             pin:setFillColor(1,0,1)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
         end

          for i = 0, 2, 1 do
            local pin = display.newCircle(cx - 150, cy - 100 + i*spacing, 5)
             pin:setFillColor(0,1,0)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
         end

            for i = 0, 1, 1 do
            local pin = display.newCircle(cx - 100, cy - 100 + i*spacing, 5)
             pin:setFillColor(1,0,1)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end
            for i = 0, 1, 1 do
            local pin = display.newCircle(cx - 125, cy - 75 + i*spacing, 5)
             pin:setFillColor(1,0,0)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end
             for i = 0, 1, 1 do
            local pin = display.newCircle(cx - 175, cy - 75 + i*spacing, 5)
             pin:setFillColor(1,0,0)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end
             for i = 0, 1, 1 do
            local pin = display.newCircle(cx - 200, cy - 100 + i*spacing, 5)
             pin:setFillColor(1,0.5,1)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end

            -- bottom
              for i = 0, 1, 1 do
            local pin = display.newCircle(cx - 75, cy + 75 + i*spacing, 5)
             pin:setFillColor(0,1,0)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end
            for i = 0, 2, 1 do
            local pin = display.newCircle(cx - 125, cy + 75 + i*spacing, 5)
             pin:setFillColor(0,1,1)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end
             for i = 0, 1, 1 do
            local pin = display.newCircle(cx - 175, cy + 75 + i*spacing, 5)
             pin:setFillColor(0,1,1)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end
             for i = 0, 1, 1 do
            local pin = display.newCircle(cx - 150, cy + 100 + i*spacing, 5)
             pin:setFillColor(1,1,0)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end
             for i = 0, 1, 1 do
            local pin = display.newCircle(cx - 100, cy + 100 + i*spacing, 5)
             pin:setFillColor(1,1,0)
             physics.addBody(pin, "static" );
              sceneGroup:insert(pin)
            end

-- Gates

local midgates = display.newGroup()
local mg1b = display.newRect(midgates, cx, cy+10, 25,5)
local mg1r = display.newRect(midgates, cx+26/2, cy, 4,25)
local mg1l = display.newRect(midgates, cx-26/2, cy, 4,25)

 sceneGroup:insert(midgates)
physics.addBody( mg1b, "static",{bounce=0} );
physics.addBody( mg1r, "static" );
physics.addBody( mg1l, "static" );

   -- Right side 
   local rgates = display.newGroup()

      -- outer gate
      local rg1b = display.newRect(rgates, cx + 200, cy+175 + 10, 25,5)
      local rg1r = display.newRect(rgates, cx+26/2 + 200, cy+175, 4,25)
      local rg1l = display.newRect(rgates, cx-26/2 + 200, cy+175, 4,25)
      physics.addBody(rg1b , "static",{bounce=0} );
      physics.addBody(rg1r, "static" );
      physics.addBody(rg1l, "static" );

      -- inner gate
      local rg2b = display.newRect(rgates, cx + 75, cy+225 + 10, 25,5)
      local rg2r = display.newRect(rgates, cx+26/2 + 75, cy+225, 4,25)
      local rg2l = display.newRect(rgates, cx-26/2 + 75, cy+225, 4,25)
      physics.addBody(rg2b , "static",{bounce=0} );
      physics.addBody(rg2r, "static" );
      physics.addBody(rg2l, "static" );

       sceneGroup:insert(rgates)


   -- Left side
  local lgates = display.newGroup()

      -- outer gate
      local lg1b = display.newRect(lgates, cx - 200, cy+175 + 10, 25,5)
      local lg1r = display.newRect(lgates, cx+26/2 - 200, cy+175, 4,25)
      local lg1l = display.newRect(lgates, cx-26/2 - 200, cy+175, 4,25)
      physics.addBody(lg1b , "static",{bounce=0} );
      physics.addBody(lg1r, "static" );
      physics.addBody(lg1l, "static" );

      -- inner gate
      local lg2b = display.newRect(lgates, cx - 75, cy+225 + 10, 25,5)
      local lg2r = display.newRect(lgates, cx+26/2 - 75, cy+225, 4,25)
      local lg2l = display.newRect(lgates, cx-26/2 - 75, cy+225, 4,25)
      physics.addBody(lg2b , "static",{bounce=0} );
      physics.addBody(lg2r, "static" );
      physics.addBody(lg2l, "static" );

 sceneGroup:insert(lgates)


global:insert(balls)





-- Ball
local force = 0;
local function sliderListener( event )
    print( "Slider at " .. event.value .. "%" )
    force = event.value;

end
local slider = widget.newSlider(
    {
        x = cx - 100,
        y = cy*2 - 75,
        width = 300,
        value = 25,  -- Start slider at 10% (optional)
        listener = sliderListener
    }
)
 sceneGroup:insert(slider)
local sliderPer = slider.value
local fireBox = display.newRect(cx*1.5 + 25, 1025, 200,120)
fireBox:setFillColor(0.9,0.2,0.2)
local firetext = display.newText("Launch", cx*1.5 + 25, 1025, system.nativeFont, 50)
   sceneGroup:insert(fireBox)
    sceneGroup:insert(firetext)



   -- make
   local function makeball(event)
      if pachinko > 0 then
         local bg  = display.newGroup()
         local ball = display.newCircle(25, 375, 10);
          sceneGroup:insert(ball)
         bg:insert(ball)
             table.insert(bt, ball)
         physics.addBody (ball, "dynamic", {bounce=0, radius=9} );
         ball.phy = true;
         local t = math.random(20,25)/100

         local xx = 1.0 + (0.5/100)*force
         local yy = 0.25 + (1.25/100)*force

         physics.setGravity(0, 9.8);
         ball:applyForce(xx, -yy, ball.x, ball.y)
         ball:applyTorque(math.random(-2,2))
         balls:insert(bg)

      pachinko = pachinko - 1;   
      end

   end
fireBox:addEventListener("tap", makeball)
--timer.performWithDelay(100, makeball, 0)



--HUD
      local function hudup()
      display.remove(hud)
      hud = display.newText(pachinko, 60, 60, system.nativeFont, 50)
      end
      timer.performWithDelay(1, hudup, 0)

-- Delete
local function update()
--fgroup = balls
--g = bg
for _, ball in ipairs(bt) do

   if ball.y > 950 then
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
updating = timer.performWithDelay(10, update, 0)


-- Ball XY
local function updatexy()
--fgroup = balls
--g = bg
for _, ball in ipairs(bt) do
    if ball.phy == true then
        print(ball.x.."/"..ball.y)
    end

end
end
updateXY = timer.performWithDelay(5000, updatexy, 0)

-- GOAL
local function Mgoal()
--fgroup = balls
--g = bg
for _, ball in ipairs(bt) do

    if ball.y > 566 - 1 then -- goal 0 (middle)
        if ball.y < 566 + 1 then
        
         if ball.x > 321 - 6 then
            if ball.x < 321 + 6 then
          if ball.phy == true then
                physics.removeBody( ball )
                ball.phy = false;
        transition.to(ball, {time = 375, alpha = 0.0})
        print('WIN Mid GOAL + 70')
        pachinko = pachinko + 70;

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
midgoal = timer.performWithDelay(2, Mgoal, 0)

local function goalone()
   --fgroup = balls
   --g = bg
   for _, ball in ipairs(bt) do

          if ball.y > 741 - 1 then 
            if ball.y < 741 + 1 then
                          
               if ball.x > 118 - 6 then -- goal 1
                              if ball.x < 118 + 6 then
                            if ball.phy == true then
                                  physics.removeBody( ball )
                                  ball.phy = false;
                          transition.to(ball, {time = 375, alpha = 0.0})
                          print('WIN 741 GOAL + 50')
                          pachinko = pachinko + 50;

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
               if ball.x > 518 - 6 then -- goal 4
                              if ball.x < 518 + 6 then
                            if ball.phy == true then
                                  physics.removeBody( ball )
                                  ball.phy = false;
                          transition.to(ball, {time = 375, alpha = 0.0})
                          print('WIN 741 GOAL + 50')
                          pachinko = pachinko + 50;

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
goalOne = timer.performWithDelay(2, goalone, 0)

local function goaltwo()
   --fgroup = balls
   --g = bg
   for _, ball in ipairs(bt) do

          if ball.y > 791 - 1 then 
            if ball.y < 791 + 1 then
                          
               if ball.x > 393 - 6 then -- goal 1
                              if ball.x < 393 + 6 then
                            if ball.phy == true then
                                  physics.removeBody( ball )
                                  ball.phy = false;
                          transition.to(ball, {time = 375, alpha = 0.0})
                          print('WIN 791 GOAL + 50')
                          pachinko = pachinko + 50;

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
               if ball.x > 243 - 6 then -- goal 4
                              if ball.x < 243 + 6 then
                            if ball.phy == true then
                                  physics.removeBody( ball )
                                  ball.phy = false;
                          transition.to(ball, {time = 375, alpha = 0.0})
                          print('WIN 791 GOAL + 50')
                          pachinko = pachinko + 50;

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
goalTwo = timer.performWithDelay(2, goaltwo, 0)











end -- Func create
 
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
       physics.stop()
       timer.cancel( updateXY)
       timer.cancel( spinning)
       timer.cancel( updating )
       timer.cancel( midgoal)
       timer.cancel( goalOne)
       timer.cancel( goalTwo)
   composer.removeScene( "sceneClassic")


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