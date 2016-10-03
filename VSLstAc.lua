--[[
Project: Check turtle inventory
Thank you for using this script!
]]--

local size =16
local amount =0
local prosents =0
for i=1,size do
	turtle.select(i)
	amount = amount + turtle.getItemCount(i)
end
turtle.select(1)
prosents = amount / (size * 64) *100
print(prosents ,"% Full")