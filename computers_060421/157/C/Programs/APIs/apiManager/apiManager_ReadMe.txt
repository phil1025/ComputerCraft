-- apiManager provides easy and dynamic access to apis located in the same directory as the apiManager itself

-- apiManager SETUP:
-- 1. create/open file "boot.sys" in "C/"
--      Content:**********************************
--      os.loadAPI(".../apiManager")
--      api = apiManager
--      if apiManager ~= nil then
--          print("using apiManager")
--      else
--          print("apiManager not found")
--      end
--      ******************************************
-- 2. create/open file "startup" in root directory
--      Content:**********************************
--      shell.run("C/boot.sys")
--      ******************************************

-- apiManager is a global variable, so it can be accessed from every script
-- to load an api write: apiManager.load("myAPI")