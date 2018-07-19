local mlib = require("./mlib.lua")
local timer = require("timer")

local hook = {}
hook.hooks = {}

--[[ Think ]]
timer.setInterval(1000, function()
	local name = "Think"
	for k,v in pairs(hook.hooks) do
		if v[1] == name then
			local f = v[3]
			local a = v[4]
			f(a)
		end
	end
end)

function hook.Add(hookName, uniqueName, func, ...)
	mlib.table.insert(hook.hooks, {hookName, uniqueName, func, ...})
end

return hook
