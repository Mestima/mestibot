
--[[
	Easy file managment lua library.
	Author: Mestima
	https://github.com/Mestima
	
	Special thanks to Garry Newman for his Garry's Mod lua libraries
	https://github.com/garrynewman
]]

local file = {}

function file.Read(path)
	local f = io.open(path, "r")
	io.input(f)
	local content = io.read()
	io.close(f)
	return content
end

function file.Write(path,content)
	local f = io.open(path, "w")
	io.output(f)
	io.write(content)
	io.close(f)
end

return file