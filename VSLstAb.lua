--[[
Project: Tree Vaporizer
Thank you for using this script!
]]--

turtle.dig()
turtle.forward()
local check = turtle.detectUp()
while check == true do
	turtle.digUp()
	turtle.up()
	check = turtle.detectUp()
end
check = turtle.detectDown()
while check == false do
	turtle.down()
	check = turtle.detectDown()
end
print("done")