--os.loadAPI("C/MyPrograms/APIs/fileSys") 
--os.loadAPI("C/MyPrograms/APIs/monitorEssentials") 

local fileSys = apiManager.load("fileSys")
local monEss = apiManager.load("monitorEssentials")

monEss.init(0.5)

local waitTime = 1

write("Enter a directory string! ")
local path = read()
print("path: "..path)

local freeSpace = fileSys.getFreeDiskSpace(path)
print(" freeDiskSpace: "..freeSpace)

print("")

--  # fileSys.getDirectories()
print(".getDirectories()")
local dirs = fileSys.getDirectories(path)
for i = 1, #dirs do
    print(tostring(i).." dir: "..tostring(dirs[i]))
end

print("")

--  # fileSys.getFiles()
print(".getFiles()")
sleep(waitTime)
local files = fileSys.getFiles(path)
for i = 1, #files do
    print(tostring(i).." file: "..tostring(files[i]))
end

print("")

--  # fileSys.getDirectoriesAll()
print(".getDirectoriesAll()")
sleep(waitTime)
local dirsAll = fileSys.getDirectoriesAll(path)
for i = 1, #dirsAll do
    print(tostring(i).." dir: "..tostring(dirsAll[i]))
end

print("")

--  # fileSys.getFilesAll()
print(".getFilesAll()")
sleep(waitTime)
local filesAll = fileSys.getFilesAll(path)
for i = 1, #filesAll do
    print(tostring(i).." file: "..tostring(filesAll[i]))
end

print("")

--  # fileSys.findFiles()
print(".findFiles()")
print("")
term.write("Enter a searchKey: ")
local key = tostring(read())
sleep(waitTime)
local foundFiles = fileSys.findFiles(path, key)
for i = 1, #foundFiles do
    print(tostring(i).." foundFile: "..tostring(foundFiles[i]))
end