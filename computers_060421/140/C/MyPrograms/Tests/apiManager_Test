-- NOTE: Assumes that a boot.sys file is present and executed by shell via startup file
--       - path to apiManager must only be set in boot.sys, then its accessable with "apiManager" for all scripts
--       - provides easy access to apis located in the same directory as the apiManager
--       - for more info check apiManager itself

local fSys = apiManager.load("fileSys")
local dirs = fSys.getDirectoriesAll("C")
for i = 1, #dirs do
    print(" dir "..tostring(i)..": "..tostring(dirs[i]))
end
