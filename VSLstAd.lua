--[[
Project: Hidingcube
Thank you for using this script!
]]--

-- DIRECTION: 0=DOWN 1=UP 
local vdir =1
-- VARIABLES
local range=0
print("How big square? 3,5,7")
local input = read()
local check = tonumber(input)
local height =3
local path =3
local turningchecka =0
-- RULE CHECK
if check > 2 then
	range = check
	if vdir == 1 then
		-- PATH
		for i=0,path do
			turtle.dig()
			turtle.forward()
			turtle.digUp()
		end
	else
		turtle.digDown()
		turtle.down()
		turtle.digDown()
		turtle.down()
	end
	-- AREA
	for i=1,height do
		for a=1,range do
			-- LINE
			for b=2,range do
				turtle.dig()
				turtle.forward()
			end
			-- TURNING CHECK
			if a < range then
				if turningchecka == 1 then
					-- RIGHT
					turningchecka =0
					turtle.turnRight()
					turtle.dig()
					turtle.forward()
					turtle.turnRight()
				else
					-- LEFT
					turningchecka =1
					turtle.turnLeft()
					turtle.dig()
					turtle.forward()
					turtle.turnLeft()
				end
			end
		end
		-- NEW LAYER
		if i < height then
			if vdir == 1 then
				turtle.digUp()
				turtle.up()
			else
				turtle.digDown()
				turtle.down()
			end
			turtle.turnLeft()
			turtle.turnLeft()
			turningchecka =0
		end
	end
	-- DOWN
	if vdir == 1 then
		check = turtle.detectDown()
		while check == false do
			turtle.down()
			check = turtle.detectDown()
		end
	end
	-- READY
	print("Done")
else
	print("Nope")
end
