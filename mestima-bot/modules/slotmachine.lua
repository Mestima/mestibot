--[[
	I hope it will work fine.
	This class is an additional class to economy class.
	I'll rewrite this class in future, because it's full of shit.
]]

local eco = require("./economy.lua")

local slot = {}

slot.vars = {
	":banana:",
	":tangerine:",
	":flag_lv:",
	":pear:",
	":watermelon:",
	":grapes:",
	":melon:",
	":strawberry:",
	":heart:",
}

slot.win = [[```Markdown
# [ENG] You won %s bits!
# [RUS] Вы выиграли %s битс!
```]]
slot.loose = [[```Markdown
# [ENG] You loose %s bits!
# [RUS] Вы проиграли %s битс!
```]]
slot.cannotafford = [[```Markdown
# [ENG] You can not afford this game!
# [RUS] Вы не можете позволить себе эту игру!
```]]

function slot:GoA(msg)
	local game = {}
	game.ply = msg.author
	game.money = 10
	if eco:CanAfford(game.ply.id,game.money) == false then msg:reply(slot.cannotafford) return end
	game.res = {}
	for i=1,9 do
		game.res[i] = self.vars[math.random(1,9)]
	end
	
	local text = [[
[  :slot_machine: | SLOTS ]
------------------
%s  : %s :  %s
%s  : %s :  %s   <
%s  : %s :  %s
------------------
| :  :  : : : : : : :  :  : |
]]

	msg:reply(string.format(text,game.res[1],game.res[2],game.res[3],game.res[4],game.res[5],game.res[6],game.res[7],game.res[8],game.res[9]))
	
	if game.res[4] == game.res[5] and game.res[5] == game.res[6] then game.won = game.money*10 msg:reply(string.format(slot.win,tostring(game.money*10),tostring(game.money*10)))
	elseif game.res[4] == game.res[5] or game.res[5] == game.res[6] or game.res[4] == game.res[6] then game.won = game.money*10/2 msg:reply(string.format(slot.win,tostring(game.money*10/2),tostring(game.money*10/2)))
	else game.won = -game.money msg:reply(string.format(slot.loose,game.money,game.money)) end
	
	eco:AddMoneySilent(game.ply.id,game.won)
end

function slot:GoB(msg)
	local game = {}
	game.ply = msg.author
	game.money = 100
	if eco:CanAfford(game.ply.id,game.money) == false then msg:reply(slot.cannotafford) return end
	game.res = {}
	for i=1,9 do
		game.res[i] = self.vars[math.random(1,9)]
	end
	
	local text = [[
[  :slot_machine: | SLOTS ]
------------------
%s  : %s :  %s
%s  : %s :  %s   <
%s  : %s :  %s
------------------
| :  :  : : : : : : :  :  : |
]]

	msg:reply(string.format(text,game.res[1],game.res[2],game.res[3],game.res[4],game.res[5],game.res[6],game.res[7],game.res[8],game.res[9]))
	
	if game.res[4] == game.res[5] and game.res[5] == game.res[6] then game.won = game.money*10 msg:reply(string.format(slot.win,tostring(game.money*10),tostring(game.money*10)))
	elseif game.res[4] == game.res[5] or game.res[5] == game.res[6] or game.res[4] == game.res[6] then game.won = game.money*10/2 msg:reply(string.format(slot.win,tostring(game.money*10/2),tostring(game.money*10/2)))
	else game.won = -game.money msg:reply(string.format(slot.loose,game.money,game.money)) end
	
	eco:AddMoneySilent(game.ply.id,game.won)
end

function slot:GoC(msg)
	local game = {}
	game.ply = msg.author
	game.money = 1000
	if eco:CanAfford(game.ply.id,game.money) == false then msg:reply(slot.cannotafford) return end
	game.res = {}
	for i=1,9 do
		game.res[i] = self.vars[math.random(1,9)]
	end
	
	local text = [[
[  :slot_machine: | SLOTS ]
------------------
%s  : %s :  %s
%s  : %s :  %s   <
%s  : %s :  %s
------------------
| :  :  : : : : : : :  :  : |
]]

	msg:reply(string.format(text,game.res[1],game.res[2],game.res[3],game.res[4],game.res[5],game.res[6],game.res[7],game.res[8],game.res[9]))
	
	if game.res[4] == game.res[5] and game.res[5] == game.res[6] then game.won = game.money*10 msg:reply(string.format(slot.win,tostring(game.money*10),tostring(game.money*10)))
	elseif game.res[4] == game.res[5] or game.res[5] == game.res[6] or game.res[4] == game.res[6] then game.won = game.money*10/2 msg:reply(string.format(slot.win,tostring(game.money*10/2),tostring(game.money*10/2)))
	else game.won = -game.money msg:reply(string.format(slot.loose,game.money,game.money)) end
	
	eco:AddMoneySilent(game.ply.id,game.won)
end

return slot