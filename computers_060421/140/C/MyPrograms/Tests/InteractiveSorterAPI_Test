-- CREATE A LUA TUTORIAL FOR Interactive Sorter / InteractiveSorterAPI handling OUT OF THIS!
-- CREATE InteractiveSorter_Software that allows easier handling => UI´s
-- Make installable setups 
--> SETUP storageExpander: central pc, turtle
--  1. turtle/s to manage storage
--  2. turtle/s to expand storage on demand (dig, place, craft?, setup interactive sorters?)
--  3. central pc commands turtles (equips turtles, starts program (store/observe/expand))
--  4. central pc keeps track of last chest position in order to tell turtle where to go
--  5. central pc stores data to disk
--> SETUP storageInput gate
--  1. no clear concept yet...
-- maybe classify item ids => archive=>storageExpander, deliver=>direct users/demands, process=>recipes/autocrafting, discard=>itemDestroyer  
--> SETUP automatic quarry?!!
--  1. turtles rebuild everything at next location, make setup, deliver stuff to base!

--os.loadAPI("C/MyPrograms/APIs/monitorEssentials")
local monEss = apiManager.load("monitorEssentials")
monEss.init(0.5)

--****************************************************************************************

print("")
print("*********************************")
print("Running InteractiveSorterAPI_Test")
print("*********************************")
print("")

--os.loadAPI("C/MyPrograms/APIs/interactiveSorterAPI") 
--os.loadAPI("C/MyPrograms/APIs/itemTable/itemTableAPI") 
local interactiveSorterAPI = apiManager.load("interactiveSorterAPI")
local itemTableAPI = apiManager.load("itemTableAPI")

-- # interactiveSorterAPI.getUUID()
local id = 351
local meta = 4
local uuid = interactiveSorterAPI.getUUID(id, meta)
print("interactiveSorterAPI.getUUID()")
print("id: "..id.." meta: "..meta.." => uuid: "..uuid)

print("")

local sorter = peripheral.wrap("top")

-- # interactiveSorter.list()
--   List displays the contents of the inventory in the specified direction in a table.
--   The table contains the UUID and amount of items for each stack (of any amount). 
--   The UUID can be decoded into ID and metadata using bitwise operations in v2.3 
--   however the official forum post states that v3.1 will do away with that and
--   provide the real ID.
--   List is useful for when one wishes to know what is in an inventory in order to 
--   extract from it.
--   Usage: 
--      list(direction) 
--   where direction can be the following integer values:
--   ------------------------------------------------------------------------------
--   Integer	Direction
--   0	        Down
--   1	        Up
--   2	        North   (-Z)
--   3	        South   (+Z)
--   4	        West    (-X)
--   5	        East    (+X)
--   ------------------------------------------------------------------------------

print("Integer |	Direction")
print("0	      | Down")
print("1	      | Up")
print("2	      | North   (-Z)")
print("3	      | South   (+Z)")
print("4	      | West    (-X)")
print("5	      | East    (+X)")
term.write("Enter chest index: ")

local chestIndex = tonumber(read())
local chest = sorter.list(chestIndex)

-- # interactiveSorterAPI.getStacks()
print("")
print("interactiveSorterAPI.getStacks()")
local stacks = interactiveSorterAPI.getStacks(chest)
for i = 1, #stacks do
    local stack = stacks[i]
    local outTxt = "-id: "..(stack.id).." amt: "..(stack.amount).." mta: "..(stack.meta).." uuid: "..(stack.uuid).." name: "..(stack.name)
	print(outTxt)
end

-- # interactiveSorterAPI.getStackAtIndex()
print("")
print("interactiveSorterAPI.getStackAtIndex()")
local index = 1
local stack = interactiveSorterAPI.getStackAtIndex(chest, index)
print("stackAtIndex "..index.." id: "..tostring(stack.id).." uuid: "..stack.uuid.." name: "..stack.name.." amt: "..stack.amount)

-- # Event: isort_item
--   --> https://ftbwiki.org/Interactive_Sorter
--   A Computer can wait until an item enters the Interactive Sorter's 
--   inventory and return the UUID and amount to the computer. 
--   This is especially useful for item routing as the os.pullEvent(event) 
--   function waits until the specified event and returns information to 
--   variables when the event occurs. The computer can then execute other 
--   functions using the new data.
--   Usage:
--      event, param, amount = os.pullEvent("isort_item") 
--   where param is the UUID and amount is the stack size.
--   ---------------------------------------------------------------------------------
--   Gets called when a stack enters the Interactive Sorter slot.
--   It does not trigger on stacks leaving the sorter and also not 
--   if more items are added onto the stack inside the sorter.
print("")
print("Put a stack into the interactive sorter!")
local event, uuid, amount = os.pullEvent("isort_item")
local eventItem = nil
local itemName = "";
if (tostring(event) == "isort_item") then
    eventItem = itemTableAPI.getItemFromUUID(uuid)
    if eventItem then
        itemName = eventItem.name
    else
        itemName = "Unknown Item"
    end
    print("event: "..tostring(event).." uuid: "..tostring(uuid).." name: "..itemName.." amount: "..tostring(amount))
end

-- # interactiveSorter.sort() => useful when inserting stack into Interactive Sorte with pipes!
--   Sort ejects a stack from the Interactive Sorter's single slot inventory to a 
--   given direction.
--   Usage:
--      sort(direction) 
--   where direction can be the same integer values as above.
--   Example:
--      event, param, amount = os.pullEvent("isort_item")
--      itemName = itemNameTable[param]
--      if itemName == "stone" then
--          sorter.sort(3)
--      else
--          sorter.sort(1)
--      end
print("")
print("interactiveSorter.sort() => pulls "..amount.." "..itemName.." from Interactive Sorter slot!") 
sorter.sort(1) --> direction up

-- # interactiveSorter.extract() ==> pull from a chest and route!
--   Extract pulls a stack from an inventory in a specified direction and ejects to
--   a specified direction. The ID and amount (up to a stack) of the item must be
--   specified as well as each direction (which can be identical).
--   Usage: 
--      sorter.extract(from,uuid,to,amount)
--   where from and to can be the same integer values as above, 
--   uuid must refer to an item that exists in the inventory and amount can be any
--   value up to 64 (due to only having one inventory slot) but only as many as the 
--   stack size will be pulled.
--   ---------------------------------------------------------------------------------
--   Example (v3.0+):
--      os.loadAPI("sorterAPI")
--      tArgs = { ... }
--      itemID, meta, amount, direction = tArgs[1], tArgs[2], tArgs[3], tArgs[4]
--      uuid = sorterAPI.getUUID(itemID, meta)
--      sorter.extract(0,uuid,direction,amount)
--   ---------------------------------------------------------------------------------
--   Example (v2.3): => 
--      os.loadAPI("sorterAPI")
--      tArgs = { ... }
--      itemID, meta, amount, direction = tArgs[1], tArgs[2], tArgs[3], tArgs[4]
--      uuid = sorterAPI.getID(itemID, meta)
--      sorter.extract(0,uuid,direction,amount)
--   ---------------------------------------------------------------------------------

print("")
print("interactiveSorter.extract() => "..stack.name)
print(" - id: "..stack.id.." uuid: "..stack.uuid.." meta: "..stack.meta.." amt: "..stack.amount)
-- # sorter.extract(from,uuid,to,amount)
sorter.extract(chestIndex, stack.uuid, 1, stack.amount)

print("Look into upper chest!")

-- NOTE: Use events to trigger sort/extract!

-- # Known Bugs
--   When injecting into an adjacent inventory, if the item stack being injected to the 
--   inventory is the same item as a stack within the inventory the old stack will be 
--   overwritten rather than added to (v2.3). This can be worked around by placing a pipe
--   between the sorter and the inventory. Any Transport Pipe (BuildCraft) will do.
