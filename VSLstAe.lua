--[[
Project: Simple tower
Thank you for using this script!
]]--

-- LIMITS
local bwallheight =8
local bwallwidth =3
local checkcom =false
local checkfrontp =0
local checkupp =0
local checkdownp =0
local inventorysize =16
local mitemcount =0
local citemcount =0
local citemslot =1
-- CALL EVENTS
local calleventcheck =1
local calleventbwall =2
-- REQUEST CALL
local function callEvent(cid)
	-- CHECK
	if cid == calleventcheck then
		-- INVENTORY
		turtle.select(citemslot)
		citemcount = turtle.getItemCount(citemslot)
		-- print("Items on slot ", citemslot, " is: ", citemcount)
		if citemcount < 1 then
			while citemcount < 1 do
				if citemslot >= inventorysize then
					break
				end
				citemslot = citemslot +1
				citemcount = turtle.getItemCount(citemslot)
				turtle.select(citemslot)
			end
		end
		-- FRONT
		checkcom = turtle.detect()
		if checkcom == false then
			checkfrontp =0
		else
			checkfrontp =1
		end
		-- DOWN
		checkcom = turtle.detectDown()
		if checkdownp == false then
			checkdownp =0
		else
			checkdownp =1
		end
	end
	-- TOWER BODY WALL
	if cid == calleventbwall then
		if citemcount > 0 then
			for c =2, bwallwidth, 1 do
				-- CHECK
				callEvent(calleventcheck)
				if checkfrontp == 1 then
					turtle.dig()
				end
				if checkdownp == 1 then
					turtle.digDown()
				end
				turtle.placeDown()
				turtle.forward()
			end
		end
	end
end
-- TOWER BODY
turtle.up()
turtle.select(citemslot)
for a = 1, bwallheight, 1 do
	callEvent(calleventcheck)
	if citemcount > 0 then
		for b = 1, 4, 1 do
			callEvent(calleventbwall)
			turtle.turnLeft()
		end
		if a < bwallheight then
			turtle.up()
		end
	else
		break
	end
end
-- TAKAS ALAS
turtle.turnRight()
turtle.forward()
turtle.forward()
while checkcom == false do
	turtle.down()
	checkcom = turtle.detectDown()
end