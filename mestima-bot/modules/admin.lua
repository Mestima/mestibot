--[[
	Yeah.. I should make it better. But not now.
]]

local json = require("./JSON.lua")
local file = require("./file.lua")
local emb  = require("./embed.lua")

local admin = {}

admin.admonly = [[```Markdown
# [ENG] You must be a bot admin to use this command!
# [RUS] Вы должны быть администратором бота, что бы использовать эту команду!
```]]

admin.noreason = [[```Markdown
# [ENG] The reason is too short or was not entered!
# [RUS] Причина слишком короткая или не была указана!
```]]

function admin.isAuthorMestima(id)
	if id == "245907028940292096" then return true else return false end
end

function admin.isAuthorAdmin(id,admins)
	for k,v in pairs(admins) do
		if id == v[2] then return true end
	end
	return false
end

function admin.isBanned(id)
	local f = file.Read("./mestima-bot/db/bans.txt")
	local bans = json:decode(f)
	for k,v in pairs(bans) do
		if v == id then return true end
	end
	return false
end

function admin.banId(id,msg)
	if string.len(msg.content) < 30 then msg:reply(admin.noreason) return end
	local f = file.Read("./mestima-bot/db/bans.txt")
	local pos = string.find(msg.content," ",6)
	local reason = string.sub(msg.content,pos,string.len(msg.content))
	local bans = json:decode(f)
	bans[#bans+1] = id
	local jtable = json:encode(bans)
	file.Write("./mestima-bot/db/bans.txt",jtable)
	local channel = msg.client:getGuild("401864693704032256"):getChannel("401880754415468555")
	local user = msg.client:getUser(id)
	local admin = msg.author
	emb:SendCurrent(channel,"MestiBot | Ban",0xff0000,"",{{"User",user.mentionString.." ("..id..")",true},{"Admin",admin.fullname,true},{"Reason",reason,false}},"","",true)
end

function admin.unbanId(id,msg)
	if string.len(msg.content) < 30 then msg:reply(admin.noreason) return end
	local f = file.Read("./mestima-bot/db/bans.txt")
	local bans = json:decode(f)
	for k,v in pairs(bans) do
		if v == id then table.remove(bans,k) end
	end
	local jtable = json:encode(bans)
	file.Write("./mestima-bot/db/bans.txt",jtable)
	local channel = msg.client:getGuild("401864693704032256"):getChannel("401880754415468555")
	local user = msg.client:getUser(id)
	local admin = msg.author
	local pos = string.find(msg.content," ",8)
	local reason = string.sub(msg.content,pos,string.len(msg.content))
	emb:SendCurrent(channel,"MestiBot | Unban",0x00ff00,"",{{"User",user.mentionString.." ("..id..")",true},{"Admin",admin.fullname,true},{"Reason",reason,false}},"","",true)
end

return admin
