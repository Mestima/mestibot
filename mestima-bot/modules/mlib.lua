--[[
	My small lua library.
	I will make it bigger, stronger and more and more powerful.
]]

local mlib = {}
mlib.table = {}

function mlib.table.insert(table,value)
	table[#table+1] = value
end

return mlib