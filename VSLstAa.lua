--[[
Project: DoorLaser
Thank you for using this script!
]]--

local range=0
print("How much?")
local input = read()
local check = tonumber(input)
if check > 0 then
	range = check
	for i=1,range do
		turtle.dig()
		turtle.forward()
		turtle.digUp()
	end
	turtle.turnLeft()
	turtle.turnLeft()
	for i=1,range do
		turtle.forward()
	end
else
	print("Too little")
end