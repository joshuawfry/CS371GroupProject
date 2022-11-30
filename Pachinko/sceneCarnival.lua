local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
--physics.setDrawMode( "debug" ) 
 
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------
 
-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
    physics.start()

    timers = {}

    local function back (event)
        composer.gotoScene("MenuScene", {
           effect = "slideDown",
           time = 200
        });
     end
 
    local nextRect = display.newRect(sceneGroup, display.contentWidth/2, 100, 125, 75)
    nextRect:setFillColor(0.5, 0.5, 0.5)

    local nextButton = widget.newButton(
    {
        x = display.contentWidth/2,
        y = 100,
        id = "NextButton",
        label = "Go to Scene 1",
        labelColor = { default = {0.5, 0.5, 0.5}, over = {0.2, 0.2, 0.2} },
        onPress = back
    })

    sceneGroup:insert(nextButton)

    local background = display.newImage("carnivalImage.jpeg")
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    background.xScale = 1.5
    background.yScale = 1.5
    background.alpha = 0.8

    sceneGroup:insert(background)
    local backgroundA = audio.loadStream( "Benny-hill-theme.mp3" )   -- Yakety Sax
    --audio.setVolume( 0.8, { channel=4 } )
    local myAudio = audio.play( backgroundA, { loops=-1 } )
    --sceneGroup:insert(backgroundA)

    balls = display.newGroup()
    local bt = {}
    local physics = require( "physics" )
    local phy;
    pachinko = 100;
    local hud = display.newText(pachinko, 60, 60, system.nativeFont, 50)
    sceneGroup:insert(hud)

    physics.start()
    local red = display.newRect(0,1110,display.contentWidth*2,25)
    red:setFillColor(1,0,0)
    sceneGroup:insert(red)

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

    sceneGroup:insert(left)
    sceneGroup:insert(right)
    sceneGroup:insert(bottom)

    ------------------   color balls    ---------------------------------------------------------------------
    for i = 0, 4, 1 do -- ROLL 1 RED
        local b = display.newCircle(100 + 110*i, 575, 10)
        b:setFillColor(1,0,0)
        b:setStrokeColor(0)
        b.strokeWidth = 5
        physics.addBody (b, "static",{bounce=0.3, radius=5});
        sceneGroup:insert(b)
    end
    for i = 0, 5, 1 do -- ROLL 2 ORANGE
        local b = display.newCircle(45 + 110*i, 625, 10)
        b:setFillColor(1,0.5,0)
        b:setStrokeColor(0)
        b.strokeWidth = 5
        physics.addBody (b, "static",{bounce=0.3, radius=5});
        sceneGroup:insert(b)
    end
    for i = 0, 4, 1 do -- ROLL 3 YELLOW
        local b = display.newCircle(100 + 110*i, 675, 10)
        b:setFillColor(1,1,0)
        b:setStrokeColor(0)
        b.strokeWidth = 5
        physics.addBody (b, "static",{bounce=0.3, radius=5});
        sceneGroup:insert(b)
    end
    for i = 0, 5, 1 do -- ROLL 4 GREEN
        local b = display.newCircle(45 + 110*i, 725, 10)
        b:setFillColor(0,1,0.5)
        b:setStrokeColor(0)
        b.strokeWidth = 5
        physics.addBody (b, "static",{bounce=0.3, radius=5});
        sceneGroup:insert(b)
    end
    for i = 0, 4, 1 do -- ROLL 5 CYAN
        local b = display.newCircle(100 + 110*i, 775, 10)
        b:setFillColor(0,1,1)
        b:setStrokeColor(0)
        b.strokeWidth = 5
        physics.addBody (b, "static",{bounce=0.3, radius=5});
        sceneGroup:insert(b)
    end
    for i = 0, 5, 1 do -- ROLL 6 LIGHT BLUE
        local b = display.newCircle(45 + 110*i, 825, 10)
        b:setFillColor(0,0.5,1)
        b:setStrokeColor(0)
        b.strokeWidth = 5
        physics.addBody (b, "static",{bounce=0.3, radius=5});
        sceneGroup:insert(b)
    end
    for i = 0, 4, 1 do -- ROLL 7 BLUE
        local b = display.newCircle(100 + 110*i, 875, 10)
        b:setFillColor(0,0,1)
        b:setStrokeColor(0)
        b.strokeWidth = 5
        physics.addBody (b, "static",{bounce=0.3, radius=5});
        sceneGroup:insert(b)
    end
    for i = 0, 5, 1 do -- ROLL 8 purple
        local b = display.newCircle(45 + 110*i, 925, 10)
        b:setFillColor(0.5,0,1)
        b:setStrokeColor(0)
        b.strokeWidth = 5
        physics.addBody (b, "static",{bounce=0.3, radius=5});
        sceneGroup:insert(b)
    end


    --------------------  GOAL GATE   ----------------------------------------------------------------------------
    local tt = 12
    local r1 = display.newRect(155-tt, 1015+tt, 20*2,4)
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
    local cen = 175
    local r7 = display.newRect(cen+155-tt, 1015+tt, 20*2,4)
    local r8 = display.newRect(cen+134-tt, 999+tt+3, 3,13*2)
    local r9 = display.newRect(cen+175-tt, 999+tt+3, 3,13*2)
    physics.addBody (r7, "static",{bounce=0.1})
    physics.addBody (r8, "static",{bounce=0.1})
    physics.addBody (r9, "static",{bounce=0.1})

    sceneGroup:insert(r1)
    sceneGroup:insert(r2)
    sceneGroup:insert(r3)
    sceneGroup:insert(r4)
    sceneGroup:insert(r5)
    sceneGroup:insert(r6)
    sceneGroup:insert(r7)
    sceneGroup:insert(r8)
    sceneGroup:insert(r9)

    ----------------------------------------------------------------

    local w = display.newGroup()
    local g1 = display.newRect(200, 420, 100,5)
    local g2 = display.newRect(200, 420, 5, 100)

    g1:setFillColor(1,1,0)
    g2:setFillColor(1,1,0)

    local g3 = display.newRect(440, 420, 100, 5)
    local g4 = display.newRect(440, 420, 5, 100)

    g3:setFillColor(0,0,1)
    g4:setFillColor(0,0,1)

    local g5 = display.newRect(display.contentCenterX, 400, 100, 5)
    local g6 = display.newRect(display.contentCenterX, 400, 5, 100)

    g5:setFillColor(0,0.8,0)
    g6:setFillColor(0,0.8,0)

    local g7 = display.newRect(80, 400, 100, 5)
    local g8 = display.newRect(80, 400, 5, 100)

    g7:setFillColor(1,0.5,0)
    g8:setFillColor(1,0.5,0)

    local g9 = display.newRect(560, 400, 100, 5)
    local g10 = display.newRect(560, 400, 5, 100)

    g9:setFillColor(0.5,0,1)
    g10:setFillColor(0.5,0,1)

    --[[w:insert(g1)
    g1.anchorX = 0.5;
    g1.anchorY = 0.5;
    w:insert(g2)
    g2.anchorX = 0.5;
    g2.anchorY = 0.5;]]

    physics.addBody (g1, "static",{bounce=0.5})
    physics.addBody (g2, "static",{bounce=0.5})
    physics.addBody (g3, "static",{bounce=0.5})
    physics.addBody (g4, "static",{bounce=0.5})
    physics.addBody (g5, "static",{bounce=0.5})
    physics.addBody (g6, "static",{bounce=0.5})
    physics.addBody (g7, "static",{bounce=0.5})
    physics.addBody (g8, "static",{bounce=0.5})
    physics.addBody (g9, "static",{bounce=0.5})
    physics.addBody (g10, "static",{bounce=0.5})

    sceneGroup:insert(g1)
    sceneGroup:insert(g2)
    sceneGroup:insert(g3)
    sceneGroup:insert(g4)
    sceneGroup:insert(g5)
    sceneGroup:insert(g6)
    sceneGroup:insert(g7)
    sceneGroup:insert(g8)
    sceneGroup:insert(g9)
    sceneGroup:insert(g10)


    local function spin()
        g1.rotation = g1.rotation + 1.5;
        g2.rotation = g2.rotation + 1.5;

        --w.rotation = w.rotation + 1.5
        g3.rotation = g3.rotation + 1.5;
        g4.rotation = g4.rotation + 1.5;

        g5.rotation = g5.rotation - 1.5;
        g6.rotation = g6.rotation - 1.5;

        g7.rotation = g7.rotation - 1.5;
        g8.rotation = g8.rotation - 1.5;

        g9.rotation = g9.rotation - 1.5;
        g10.rotation = g10.rotation - 1.5;
    end

    t1 = timer.performWithDelay(0.5,spin,0)
    table.insert(timers, t1)

    local function removeBlock(event)
        local params = event.source.params

        display.remove(params.block1)
        display.remove(params.block2)
        display.remove(params.block3)
        display.remove(params.block4)
        display.remove(params.block5)

        params.block1:removeSelf()
        params.block2:removeSelf()
        params.block3:removeSelf()
        params.block4:removeSelf()
        params.block5:removeSelf()
    end

    local function block()
        local b = display.newRect(715, 550, 150, 5)
        physics.addBody (b, "static",{bounce=0.5})
        transition.to(b,{time = 1500, x = -75} )
        sceneGroup:insert(b)

        local b2 = display.newRect(-75, 650, 150, 5)
        physics.addBody (b2, "static",{bounce=0.5})
        transition.to(b2,{time = 1500, x = 715} )
        sceneGroup:insert(b2)

        local b3 = display.newRect(715, 750, 150, 5)
        physics.addBody (b3, "static",{bounce=0.5})
        transition.to(b3,{time = 1500, x = -75} )
        sceneGroup:insert(b3)

        local b4 = display.newRect(-75, 850, 150, 5)
        physics.addBody (b4, "static",{bounce=0.5})
        transition.to(b4,{time = 1500, x = 715} )
        sceneGroup:insert(b4)

        local b5 = display.newRect(715, 950, 150, 5)
        physics.addBody (b5, "static",{bounce=0.5})
        transition.to(b5,{time = 1500, x = -75} )
        sceneGroup:insert(b5)

        t2 = timer.performWithDelay(1500,removeBlock)
        t2.params = {block1 = b, block2 = b2, block3 = b3, block4 = b4, block5 = b5}
    end

    t3 = timer.performWithDelay(600,block,0)
    table.insert(timers, t3)

    local car = display.newRect(50, 200, 60, 40)
    car:setFillColor(0.7, 0, 0)
    car:setStrokeColor(0)
    car.strokeWidth = 5
    physics.addBody (car, "static",{bounce=0.6})
    sceneGroup:insert(car)

    function carNW()
        car.rotation = 40
        transition.to(car,{time = 300, x = 50, y = 200, onComplete = carSE} )
    end

    function carW()
        car.rotation = 0
        transition.to(car,{time = 200, x = 210, y = 300, onComplete = carNW} )
    end

    function carSW()
        transition.to(car,{time = 300, x = 430, y = 300, onComplete = carW} )
    end

    function carNE()
        car.rotation = -40
        transition.to(car,{time = 300, x = 590, y = 200, onComplete = carSW} )
    end

    function carE()
        car.rotation = 0
        transition.to(car,{time = 200, x = 430, onComplete = carNE} )
    end

    function carSE()
        car.rotation = 40
        transition.to(car,{time = 300, x = 210, y = 300, onComplete = carE} )
    end

    carSE()

    --------------------------------------------------------------------------------------------------------------
    function makeball(event)
        if pachinko > 0 then
            bg  = display.newGroup()
            local ball = display.newCircle(event.x, 0, 12);
            ball:setFillColor(math.random(),math.random(), math.random())
            ball.y = 100;
            bg:insert(ball)
            table.insert(bt, ball)
            physics.addBody (ball, "dynamic", {bounce=0, radius=12} );
            ball.phy = true;
            local t = math.random(1,15)/100
            local n = math.random(1,2)
            if n%2 == 0 then
                t = t *-1
            end
            physics.setGravity(0, 9.8);
            ball:applyForce(t, 0,5, ball.x, ball.y)

            balls:insert(bg)
            sceneGroup:insert(ball)
            pachinko = pachinko - 1;

        end

    end

    --Runtime:addEventListener("tap", makeball)
    --tapper:addEventListener("tap", makeball)
    --[[local tapper = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
    tapper:setFillColor(0, 0, 0, 0)
    tapper:addEventListener("tap", makeball)]]


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

    t4 = timer.performWithDelay(10, update, 0)
    table.insert(timers, t4)

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

    t5 = timer.performWithDelay(5000, updatexy, 0)
    table.insert(timers, t5)

    local function hudup()
        display.remove(hud)
        hud = display.newText(pachinko, 60, 60, system.nativeFont, 50)
        sceneGroup:insert(hud)
    end

    t6 = timer.performWithDelay(1, hudup, 0)
    table.insert(timers, t6)
    ----------------------------------------------- GOAL ----------------
    -- Left 142, 1012
    -- right 486, 1012

    local function goal()
        --fgroup = balls
        --g = bg
        for _, ball in ipairs(bt) do

            if ball.y > 1012 - 1 then
                if ball.y < 1012 + 1 then
                    if ball.x > 122 then
                        if ball.x < 163 then
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

                    if ball.x > 472 then
                        if ball.x < 513 then
                            if ball.phy == true then
                                physics.removeBody( ball )
                                ball.phy = false;
                                transition.to(ball, {time = 375, alpha = 0.0})
                                print('WIN RIGHT GOAL + 15')
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
                    end

                    if ball.x > 297 then
                        if ball.x < 338 then
                            if ball.phy == true then
                                physics.removeBody( ball )
                                ball.phy = false;
                                transition.to(ball, {time = 375, alpha = 0.0})
                                print('WIN CENTER GOAL + 30')
                                pachinko = pachinko + 30;
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

    t7 = timer.performWithDelay(2, goal, 0)
    table.insert(timers, t7)
    
    -- Initialize the scene here.
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
      physics.start()
      Runtime:addEventListener("tap", makeball)

        for _,t in ipairs(timers) do
            timer.resume(t)
        end
        audio.resume(myAudio)
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
        Runtime:removeEventListener("tap", makeball)

        physics.pause()
        audio.pause()
           composer.removeScene( "sceneCarnival")
        for _,t in ipairs(timers) do
            timer.pause(t)
        end
    elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
    end
end
 
-- "scene:destroy()"
function scene:destroy( event )
    
    local sceneGroup = self.view

    sceneGroup:removeSelf()
    sceneGroup = nil
 
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