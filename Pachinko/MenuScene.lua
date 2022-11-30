
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
local widget = require( "widget" )
local cx = display.contentCenterX;
local cy = display.contentCenterY;

-- Selection
local theme0 = 'Classic'
local theme1 = '1'
local theme2 = '2'
local theme3 = '3'
local theme4 = '4'
local selection = 0;

-- Display 
local menuDisplay = display.newGroup()
	-- Play button
	local playBox = display.newRect(menuDisplay, cx, cy + 100, 200, 100)
	playBox:setFillColor(1,0.3,0.3)
	local play = display.newText(menuDisplay,"PLAY", cx, cy + 100, system.defalutFont, 64)

	-- Next/Prev
	local nxBox = display.newRect(menuDisplay, cx + 175, cy + 100, 100, 100)
	nxBox:setFillColor(0.7,0.7,0.7)
	local pvBox = display.newRect(menuDisplay, cx - 175, cy + 100, 100, 100)
	pvBox:setFillColor(0.7,0.7,0.7)

	local nxText = display.newText(menuDisplay, "⇨", cx + 175, cy + 100, system.defalutFont, 64)
	local pvText = display.newText(menuDisplay, "⇦", cx - 175, cy + 100, system.defalutFont, 64)

	-- Mode
	local Mode = display.newText(menuDisplay, " ", cx, cy - 50, system.defalutFont, 100)

	-- Credit
	local ctBox = display.newRect(menuDisplay, cx - (cx/2), cy + 475, 225, 75)
	ctBox:setFillColor(0.2,0.2,1)
	local ctText = display.newText(menuDisplay,"Credits", cx - (cx/2), cy + 475, system.defalutFont, 64)
sceneGroup:insert(menuDisplay)

-- Function
local function Next()
	selection = selection + 1;
end -- Func next

local function Prev()
	selection = selection - 1;
end -- func prev

local function modeUpdate()
	display.remove(Mode)
	local sel = math.abs(selection + 5)
	if sel%5 == 0 then
		 Mode = display.newText(menuDisplay, "Classic", cx, cy - 50, system.defalutFont, 100)
	end
	if sel%5 == 1 then
		 Mode = display.newText(menuDisplay, "Bamboo", cx, cy - 50, system.defalutFont, 100)
	end
	if sel%5 == 2 then
		 Mode = display.newText(menuDisplay, "Basketball", cx, cy - 50, system.defalutFont, 100)
	end
	if sel%5 == 3 then
		 Mode = display.newText(menuDisplay, "Bleach", cx, cy - 50, system.defalutFont, 100)
	end
	if sel%5 == 4 then
		 Mode = display.newText(menuDisplay, "Carnival", cx, cy - 50, system.defalutFont, 100)
	end
end -- func modeUP

local function playScene()
local sel = math.abs(selection + 5)
	if sel%5 == 0 then
		print("Go to "..sel)
		 composer.gotoScene("sceneClassic")
	end
	if sel%5 == 1 then
		composer.gotoScene("sceneBamboo")
	end
	if sel%5 == 2 then
		composer.gotoScene("sceneBasket")
	end
	if sel%5 == 3 then
		composer.gotoScene("sceneBleach")
	end
	if sel%5 == 4 then
		composer.gotoScene("sceneCarnival")
	end
end -- play

local function Credits()
composer.gotoScene("sceneCredits")
end -- credits



-- Events
nxBox:addEventListener("tap", Next)
pvBox:addEventListener("tap", Prev)
timer.performWithDelay(1, modeUpdate,0)
playBox:addEventListener("tap", playScene)
ctBox:addEventListener("tap", Credits)


end -- Func Scene
 
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