-- This convention involves creating a table of functions which we then return at the end of the module

-- Define a local table.
local Lib = {}

-- These two functions are in the table
function Lib.bang()
   return "bang"
end

function Lib.pow()
   return "pow"
end

-- Return the table
return Lib