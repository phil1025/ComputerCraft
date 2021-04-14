--os.loadAPI("C/MyPrograms/APIs/monitorEssentials") 
local monEss = apiManager.load("monitorEssentials")

monEss.init(0.5)

--**********************************************************************

-- THIS HAS BECOME itemTableAPI!!!
-- getLines
-- getItems
-- getCount

path = "C/Resources/FTB_Lite1_ItemDump.txt"

h = fs.open(path, "r")
print("f: "..tostring(h))

text = "no text"
--text = h.readAll()

-- Iterate with readline!
-- http://www.computercraft.info/forums2/index.php?/topic/25583-fsreadline/

local lines = {} --#create a blank table

--# file.readLine is a function which acts similar to pairs or ipairs,
--  and therefor can be used like this:

count = 0
for line in h.readLine do 
  --#set lines[ the number of items in lines + 1 ] equal to the current line
  --print("line "..count..": "..line)
  count = count + 1
  lines[#lines + 1] = line 
end

print("lines len: "..table.getn(lines))
print(lines[1]) --#prints the first line of the file

--if (stringUtilsAPI == nil) then
    --os.loadAPI("C/MyPrograms/APIs/stringUtilsAPI")
--end
local stringUtils = apiManager.load("stringUtilsAPI")

items = {}

for i = 1, #lines do
    item = {}
    
    elements = stringUtils.split(lines[i], " = ")
    elementsLen = table.getn(elements)
    
    info_0 = stringUtils.split(elements[1], ":")
    item["id"] = tonumber(info_0[1])
    item["meta"] = tonumber(info_0[2])
    --item["name"] = elements[2]
    name = stringUtils.split(elements[3], "%(")[1] -- holds a more accurate name for some items!
    if string.len(name) <= 1 then
        name = elements[2]
    else
        name = string.gsub(name, "% ", "")
    end
    item["name"] = name
    
    --tag = stringUtils.removeVowels(name)
    
    print(i.." id: "..item.id.." meta: "..item.meta.." name: "..item.name) --tag: "..tag)
    items[i] = item
    item = items[i]
    
end

h.close()
