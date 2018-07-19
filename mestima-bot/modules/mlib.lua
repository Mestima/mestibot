--[[
	My small lua library.
	I will make it bigger, stronger and more and more powerful.
]]

local mlib = {}
mlib.table = {}

function mlib.table.insert(table,value)
	table[#table+1] = value
end

function mlib.table.sort(tbl) -- only number tables
	local tbl2 = tbl
	for k,v in pairs(tbl2) do
		for i=2,#tbl2 do
			if tonumber(tbl2[i]) < tonumber(tbl2[i-1]) then
				local buffer = tbl2[i-1]
				tbl2[i-1] = tbl2[i]
				tbl2[i] = buffer
			end
		end
	end
	return tbl2
end

function mlib.table.sortByIndex(tbl,j) -- j - number values in table
	local tbl2 = tbl
	for k,v in pairs(tbl2) do
		for i=2,#tbl2 do
			if tbl2[i] and tbl2[i-1] then
				if tbl2[i][j] and tbl2[i-1][j] then
					if (tonumber(tbl2[i][j]) < tonumber(tbl2[i-1][j])) then
						local buffer = tbl2[i-1]
						tbl2[i-1] = tbl2[i]
						tbl2[i] = buffer
					end
				end
			end
		end
	end
	return tbl2
end

return mlib