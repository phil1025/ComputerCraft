--[[
local m = peripheral.wrap("right")

print("type: "..tostring(type(m)))

if m ~= nil then
	m.clear()
	m.setCursorPos(1,1)
	m.setTextScale(0.5)
end
--]]

term.clear()
term.setCursorPos(1, 1)

os.loadAPI("/C/cOS/_apis/git.api")
local gitAPI = _G["git.api"]

print("gitAPI: "..tostring(gitAPI))

--gitAPI.get("ComputerCraft_Notes.txt", "ComputerCraftNotesTest.txt")

-- # FETCH REPO
-- Usage: gitAPI.fetch(<path_key>, <type("tree"/"blob")>)
local data = gitAPI.fetch("SourceCode/emu_computers/0", "blob")

-- **************************** DATA DEBUG ****************************
--> Look up structure: https://docs.github.com/en/rest/reference/git#trees
print("GIT DATA: "..tostring(data))
print("sha: "..tostring(data.sha))
print("url: "..tostring(data.url))
print("tree: "..tostring(data.tree).." len: "..table.getn(data.tree))

read()

for i = 1, #data.tree do
    print("")
    local item = data.tree[i]
    print(" - item "..i..": "..tostring(item))
    print("     path: "..tostring(item.path))
    print("     mode: "..tostring(item.mode))
    print("     type: "..tostring(item.type))
    print("     size: "..tostring(item.size))
    print("     sha: "..tostring(item.sha))
    print("     url: "..tostring(item.url))
    --read()
end
print("truncated: "..tostring(data.truncated))
-- ********************************************************************

-- # DOWNLOAD FILE
print("")
term.write("Download File Test. Enter index: ")
local index = tonumber(read())

local itemPath = data.tree[index].path
print("itemPath: "..itemPath)
gitAPI.download(itemPath, "gitTestDwnldFile")