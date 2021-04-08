--os.loadAPI("C/MyPrograms/APIs/itemTable/itemTableAPI") 
--os.loadAPI("C/MyPrograms/APIs/monitorEssentials") 

local itemTable = apiManager.load("itemTableAPI")
local monEss = apiManager.load("monitorEssentials")

monEss.init(0.5)

--[[
local monitor = nil
if (peripheral.getType("right") == "monitor") then
    monitor = peripheral.wrap("right")
elseif (peripheral.getType("left") == "monitor") then
    monitor = peripheral.wrap("left")
end

term.clear()
term.setCursorPos(1,1)

if monitor then
    monitor.setTextScale(0.5)
end
--]]

--**************************************************************

print("")
print("Start ItemTableTest")

--sleep(1)

--[[ -- FUNCTION WAS OUTSOURCED INTO FileSysAPI, NOT A PART OF ITEMTABLE ANYMORE!
-- getRawLines()
local rawLines = itemTable.getRawLines()
for i = 1, #rawLines do
    print(i.." -> "..rawLines[i])
    sleep(0.0001)
end
sleep(1)
--]]

-- getItemsDump() --> returns array of all in-game items
local items = itemTable.getItemsDump()
for i = 1, #items do
    local item = items[i]
    print(i.." id: "..item.id.." meta: "..item.meta.." name: "..item.name) --tag: "..tag)
    sleep(0.0001) --> "Too long without yielding" error if no sleep
end

print("Done")

print("")
sleep(1)

-- getItemFromID()
local itemFromID = itemTable.getItemFromID(items[1].id, items[1].meta).name

sleep(2)

-- getItemFromName()
local itemFromName = itemTable.getItemFromName(items[1].name, items[1].meta).id
print(" itemFromID() => name: "..tostring(itemFromID).." itemFromName() => id: "..tostring(itemFromName))

