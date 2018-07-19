--[[
	Cause if bot has economy system it is about 20% cooler!
]]

local json		= require("./JSON.lua")
local file 		= require("./file.lua")
local admin 	= require("./admin.lua")
local mlib		= require("./mlib.lua")
local emb		= require("./embed.lua")

local eco = {}
eco.error = [[```Markdown
# [ENG] Error! Command is too short!
# [RUS] Ошибка! Команда слишком короткая!
```]]
eco.set = [[```Markdown
# [ENG] Bits ammount of account %s was set to %s
# [RUS] Сумма Битсов на счету %s была установлена на %s
```]]

eco.add = [[```Markdown
# [ENG] %s bits was added to %s account
# [RUS] %s битс было добавлено на счет %s
```]]

eco.yourmoney = [[```Markdown
# [ENG] %s, your bits ammout is %s
# [RUS] %s, Ваше количество Битс равно %s
```]]

eco.errordude = [[```Markdown
# [ENG] Error! You can get free bits if you have less than 100 bits only!
# [RUS] Ошибка! Вы можете получить бесплатные битсы, только если у Вас менее 100 битс!
```]]

eco.yougotfree = [[```Markdown
# [ENG] You received 150 bits for free!
# [RUS] Вы получили 150 битс бесплатно!
```]]

function eco:AddMe(msg)
	local jdb = file.Read("./mestima-bot/db/economy.txt")
	local db = json:decode(jdb)
	local flag = false
	for k,v in pairs(db) do
		if msg.author.id == v[1] then flag = true end
	end
	if flag == false then
		mlib.table.insert(db,{msg.author.id,0})
		file.Write("./mestima-bot/db/economy.txt",json:encode(db))
	end
end

function eco:AddById(id)
	local jdb = file.Read("./mestima-bot/db/economy.txt")
	local db = json:decode(jdb)
	local flag = false
	for k,v in pairs(db) do
		if id == v[1] then flag = true end
	end
	if flag == false then
		mlib.table.insert(db,{id,0})
		file.Write("./mestima-bot/db/economy.txt",json:encode(db))
	end	
end

function eco:SetMoney(msg,admins)
	if string.len(msg.content) < 30 then msg:reply(self.error) return end
	if admin.isAuthorAdmin(msg.author.id,admins) == true or admin.isAuthorMestima(msg.author.id) == true then
		local ply = string.sub(msg.content,11,28)
		if string.len(ply) == 18 then self:AddById(ply) end
		local jmoney = file.Read("./mestima-bot/db/economy.txt")
		local money = json:decode(jmoney)
		local setmoney = string.sub(msg.content,30,string.len(msg.content))
		for k,v in pairs(money) do
			if v[1] == ply then
				v[2] = setmoney
				msg:reply(string.format(self.set,ply,setmoney,ply,setmoney))
				file.Write("./mestima-bot/db/economy.txt",json:encode(money))
				local channel = msg.client:getGuild("401864693704032256"):getChannel("401880754415468555")
				local user = msg.client:getUser(ply)
				local admin = msg.author
				emb:SendCurrent(channel,"MestiBot | Economy",0x00ffff,"",{{"User",user.mentionString.." ("..user.id..")",true},{"Admin",admin.fullname,true},{"Set money to:",setmoney,false}},"","",true)
			end
		end
	end
end

function eco:AddMoney(msg,admins)
	if string.len(msg.content) < 30 then msg:reply(self.error) return end
	if admin.isAuthorAdmin(msg.author.id,admins) == true or admin.isAuthorMestima(msg.author.id) == true then
		local ply = string.sub(msg.content,11,28)
		if string.len(ply) == 18 then self:AddById(ply) end
		local jmoney = file.Read("./mestima-bot/db/economy.txt")
		local money = json:decode(jmoney)
		local addmoney = string.sub(msg.content,30,string.len(msg.content))
		for k,v in pairs(money) do
			if v[1] == ply then
				v[2] = v[2] + addmoney
				msg:reply(string.format(self.add,addmoney,ply,addmoney,ply))
				file.Write("./mestima-bot/db/economy.txt",json:encode(money))
				local channel = msg.client:getGuild("401864693704032256"):getChannel("401880754415468555")
				local user = msg.client:getUser(ply)
				local admin = msg.author
				emb:SendCurrent(channel,"MestiBot | Economy",0x00ffff,"",{{"User",user.mentionString.." ("..user.id..")",true},{"Admin",admin.fullname,true},{"Added money:",addmoney,false}},"","",true)				
			end
		end
	end
end

function eco:AddMoneySilent(id,ammount)
	local ply = id
	if string.len(ply) == 18 then self:AddById(ply) end
	local jmoney = file.Read("./mestima-bot/db/economy.txt")
	local money = json:decode(jmoney)
	local addmoney = ammount
	for k,v in pairs(money) do
		if v[1] == ply then
			v[2] = v[2] + addmoney
			file.Write("./mestima-bot/db/economy.txt",json:encode(money))
		end
	end
end

function eco:CanAfford(id,ammount)
	local ply = id
	local jmoney = file.Read("./mestima-bot/db/economy.txt")
	local money = json:decode(jmoney)
	local checkmoney = ammount
	for k,v in pairs(money) do
		if v[1] == ply then
			if tonumber(v[2]) >= tonumber(checkmoney) then return true else return false end
		end
	end
end

function eco:AddMeFreeMoney(msg)
	if self:CanAfford(msg.author.id,100) == true then msg:reply(self.errordude) return end
	self:AddMoneySilent(msg.author.id,150)
	msg:reply(self.yougotfree)
end

function eco:TopTen(msg)
	self:AddMe(msg)
	local jmoney = file.Read("./mestima-bot/db/economy.txt")
	local money = json:decode(jmoney)
	local sorted_money = mlib.table.sortByIndex(money,2)
	i = 10
	local top = "```Markdown\n"
	while i > 4 do
		top = top.. "> " .. 11-i .. "." .. tostring(msg.client:getUser(tostring(sorted_money[i][1])).username) .." - "..sorted_money[i][2].."\n"
		i = i-1
	end
	top = top.."\n```"
	
	msg:reply(top)
end

function eco:ShowMyMoney(msg)
	self:AddMe(msg)
	local jmoney = file.Read("./mestima-bot/db/economy.txt")
	local money = json:decode(jmoney)
	for k,v in pairs(money) do
		if v[1] == msg.author.id then msg:reply(string.format(self.yourmoney,msg.author.username,v[2],msg.author.username,v[2])) end
	end
end

return eco