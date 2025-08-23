-- bin2c.lua
local inname = arg[1] or "Main.lua"
local outname = arg[2] or "Main_lua.c"

local f = assert(io.open(inname, "rb"))
local data = f:read("*a")
f:close()

local out = assert(io.open(outname, "w"))
out:write("/* Auto-generated from ", inname, " */\n")
out:write("const char Main_lua[] = {\n")
for i = 1, #data do
  out:write(string.format("0x%02X,", string.byte(data, i)))
  if i % 16 == 0 then out:write("\n") end
end
out:write("\n};\n")
out:write("const unsigned int Main_lua_len = ", #data, ";\n")
out:close()
print("Wrote "..outname)