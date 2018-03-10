--[[
	Useless class.
	Feel free to delete this file.
]]

function RunString(str)
	return loadstring("return "..str)()
end



return RunString