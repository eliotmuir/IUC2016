-- This channel shows three conventions we use with require in the code

-- 1) A module which returns a single function.
local AFunctionWeRequired = require 'require_function'

function UseTheSingleFunction()
   trace(AFunctionWeRequired)
   AFunctionWeRequired("Life")
end

-- 2) A module which returns a library of functions
local fireworks = require 'require_table'

local function UseTableOfFunctions()
   trace(fireworks)
   fireworks.bang()
   fireworks.pow()
end

require 'log.annotate'

local function UseModuleWhichOverridesApi()
   print("Augmented logging")
end


function main(Data)
   UseTheSingleFunction()
   UseTableOfFunctions()
   UseModuleWhichOverridesApi()
   
   net.http.respond{body=[[
This shows three require examples.  
Edit the channel for details]]}
end