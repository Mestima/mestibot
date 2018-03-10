--[[
	Will rewrite it in future, cause that was a fast-coding.
]]

local roll = {}
roll.rolled = {}
roll.rolled.one_on_one = [[```Markdown
# [ENG][D1] %s rolled 1 (How amazing it is for one-sided dice! Congratulations!)
# [RUS][D1] %s выкинул 1 (Как же это удивительно для одногранного кубика! Поздравления!)
```]]
roll.rolled.one_on_two = [[```Markdown
# [ENG][D2] %s rolled 1
# [RUS][D2] %s выкинул 1
```]]
roll.rolled.two_on_two = [[```Markdown
# [ENG][D2] %s rolled 2
# [RUS][D2] %s выкинул 2
```]]
roll.rolled.d3 = [[```Markdown
# [ENG][D%u] %s rolled %u
# [RUS][D%u] %s выкинул %u
```]]

function roll:d1(msg)
	local text = msg.content
	local author = msg.author.name
	msg.channel:send(string.format(roll.rolled.one_on_one,author,author))
end

function roll:d2(msg)
	local text = msg.content
	local author = msg.author.name
	local value = math.random(1,1000)
	if value > 500 then
		msg.channel:send(string.format(roll.rolled.two_on_two,author,author))
	else
		msg.channel:send(string.format(roll.rolled.one_on_two,author,author))
	end
end

function roll:d3(msg)
	local text = msg.content
	local dice = 3
	local author = msg.author.name
	local value = math.random(1,3)
	msg.channel:send(string.format(roll.rolled.d3,dice,author,value,dice,author,value))
end

function roll:d4(msg)
	local text = msg.content
	local dice = 4	
	local author = msg.author.name
	local value = math.random(1,4)
	msg.channel:send(string.format(roll.rolled.d3,dice,author,value,dice,author,value))
end

function roll:d6(msg)
	local text = msg.content
	local dice = 6	
	local author = msg.author.name
	local value = math.random(1,6)
	msg.channel:send(string.format(roll.rolled.d3,dice,author,value,dice,author,value))
end

function roll:d8(msg)
	local text = msg.content
	local dice = 8	
	local author = msg.author.name
	local value = math.random(1,8)
	msg.channel:send(string.format(roll.rolled.d3,dice,author,value,dice,author,value))
end

function roll:d10(msg)
	local text = msg.content
	local dice = 10	
	local author = msg.author.name
	local value = math.random(1,10)
	msg.channel:send(string.format(roll.rolled.d3,dice,author,value,dice,author,value))
end

function roll:d20(msg)
	local text = msg.content
	local dice = 20	
	local author = msg.author.name
	local value = math.random(1,20)
	msg.channel:send(string.format(roll.rolled.d3,dice,author,value,dice,author,value))
end

function roll:roll(dice,msg)
	if dice == "d1" then self:d1(msg)
	elseif dice == "d2" then self:d2(msg)
	elseif dice == "d3" then self:d3(msg)
	elseif dice == "d4" then self:d4(msg)
	elseif dice == "d6" then self:d6(msg)
	elseif dice == "d8" then self:d8(msg)
	elseif dice == "d10" then self:d10(msg)
	else self:d20(msg) end
end

return roll