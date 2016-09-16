
local function JoinString(T)
   T.param2 = T.param2 or "#no second param#"
   local A = T.param1.." "..T.param2
   return A, #A
end
   
--[[ EXAMPLE 1
This first example is for a function which takes a Lua table with parameters.  The form
the help takes is slightly different from the second example which is for a function that
takes multiple parameters.
]]
local HelpDataWithParameters = {
   Title="JoinString",
   Usage=[[local BigString = JoinString{parameter_name_1="Let's add", parameter_name_2="these together"}]],
   Desc="Relatively useless function which concatenates the parameters together with a space.", 
   SeeAlso={{Title="iNTERFACEWARE Help", Link="http://help.interfaceware.com"}},
   Returns={
      {Desc="Concatenated value from the two input parameters 'string'"},
      {Desc="Length of the concatenated value 'number'"},
   },
   ParameterTable=true,  -- This is true because the function takes just one parameter - a table.
   Parameters={
      { param1={Desc="The first parameter to be concatenated"}},
      { param2={Desc="The second parameter to be concatenated", Opt=true}},
   },
   Examples={
      [[local Result = JoinString{param1="Let's add", param2="these together"}]]
   },  
}

-- Set the help for the JoinString function
help.set{input_function=JoinString, help_data=HelpDataWithParameters}

local function Add(Number1, Number2)
   local Total = Number1 + Number2
   return Total
end
   
--[[ EXAMPLE 2
This second example is for a function which takes in multiple parameters. 
]]
local HelpDataWithoutParameters = {
   Title="Add",
   Usage=[[local Total = Add(10,20)]],
   Desc="Relatively useless function which adds two numbers together.", 
   SeeAlso={{Title="iNTERFACEWARE Help", Link="http://help.interfaceware.com"}},
   Returns={
      {Desc="The total of the two input parameters 'number'"},
   },
   ParameterTable=false,  -- This example has multiple parameters, not one table so we set this value to false
   Parameters={
      { Number1={Desc="The first parameter to be added"}},
      { Number2={Desc="The second parameter to be added"}},
   },
   Examples={
      [[local Total = Add(10,1000)]]
   },  
}
-- Set the help for the Add function
help.set{input_function=Add, help_data=HelpDataWithoutParameters}


function main(Data)
   local Body = JoinString{param1="1 plus", param2="1 equals "}
   local Total = Add(1,1)
   Body = Body..Total
   trace(Body)
   net.http.respond{body=Body}
end
