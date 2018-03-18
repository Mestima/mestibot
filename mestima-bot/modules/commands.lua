--[[
	All the commands are here.
]]

local storage	= require("./storage.lua")
local class		= require("./classes.lua")

local commands = {}

commands.main = {
	{"help", function(msg) if string.len(msg.content) > 5 then return end class.emb:SendCustom(msg,"> MestiBot help",0xFF0000,"--------------------------------------------------",storage.help.lang,"2018 © Mestima","http://nilored.ru/mestibot/icons/mes_ico1.png",true) end,5},
	{"help rus", function(msg) class.emb:SendCustom(msg,"> MestiBot help",0xFF0000,storage.news.rus.messageoftheday,storage.help.ru,"2018 © Mestima","http://nilored.ru/mestibot/icons/mes_ico1.png",true) end,9},
	{"help eng", function(msg) class.emb:SendCustom(msg,"> MestiBot help",0xFF0000,storage.news.eng.messageoftheday,storage.help.en,"2018 © Mestima","http://nilored.ru/mestibot/icons/mes_ico1.png",true) end,9},
	{"say", function(msg) local text = msg.content text = string.sub(text,6,string.len(text)) msg.channel:send(text) end,4},
	{"test", function(msg) class.emb:Send(msg,"TEST MESSAGE",0xFF00F0,"Just an answer to check out bot activity!") end,5},
	{"hello", function(msg) if class.admin.isAuthorMestima(msg.author.id) then msg.channel:send("Greetings, Creator!") elseif class.admin.isAuthorAdmin(msg.author.id,storage.admins) then msg.channel:send("Hello, Admin "..msg.author.name.."!") else msg.channel:send("Hello, "..msg.author.name.."!") end end,6},
	{"derpi random", function(msg) class.derpi:GetRandom(msg) end,13},
	{"derpi", function(msg) if string.len(msg.content) > 12 then if string.sub(msg.content,8,13) == "random" then return end end if string.len(msg.content) > 8 then class.derpi:Get(msg) else msg:reply(storage.false_request) end end,6},
	{"ban", function(msg) if string.len(msg.content) < 30 then msg:reply(storage.noreason) return end if class.admin.isAuthorAdmin(msg.author.id,storage.admins) or class.admin.isAuthorMestima(msg.author.id) then local pos = string.find(msg.content," ",6) local id = string.sub(msg.content,6,pos-1) class.admin.banId(id,msg) msg.channel:send("```ID: "..id.." banned.```") end end,4},
	{"unban", function(msg) if string.len(msg.content) < 30 then msg:reply(storage.noreason) return end if class.admin.isAuthorAdmin(msg.author.id,storage.admins) or class.admin.isAuthorMestima(msg.author.id) then local pos = string.find(msg.content," ",8) local id = string.sub(msg.content,8,pos-1) class.admin.unbanId(id,msg) msg.channel:send("```ID: "..id.." unbanned.```") end end,6},
	{"if", function(msg) class.sp:createAnswer(msg) class.sp:init(msg) end,3},
	{"delif", function(msg) class.sp:deleteAnswer(msg) class.sp:init(msg) end,6},
	{"cmds", function(msg) local str = class.sp:showAll() msg.channel:send("```Markdown\n# [ENG] List of commands created by users with using !if\n# [RUS] Список всех команд, созданных пользователями при помощи !if\n"..str.."\n```") end,13},
	{"me", function(msg) if string.sub(msg.content,4,4) == " " then msg.channel:send(msg.author.name.." "..string.sub(msg.content,4,string.len(msg.content))) end end,3},
	{"fry", function(msg) if string.len(msg.content) < 15 then msg:reply(storage.short_string) return end class.memes.fry(msg) end,4},
	{"spacelight", function(msg) local v = math.random(1,60) v = v*v v = v+3 msg.channel:send("http://nilored.ru/spacelight/"..v.."-.jpg") end,11},
	{"takemymoney", function(msg) if string.len(msg.content) < 25 then msg:reply(storage.short_string) return end class.memes.takemymoney(msg) end,12},
	{"youcant", function(msg) if string.len(msg.content) < 20 then msg:reply(storage.short_string) return end class.memes.youcant(msg) end,8},
	{"tellme", function(msg) if string.len(msg.content) < 20 then msg:reply(storage.short_string) return end class.memes.tellme(msg) end,7},
	{"google", function(msg) class.google(msg) end,7},
	{"roll", function(msg) if string.len(msg.content) < 8 or string.len(msg.content) > 9 then msg.channel:send("Запрос сформирован неверно!") return end local text = msg.content if string.len(text) == 8 then text = string.sub(text,7,8) else text = string.sub(text,7,9) end class.roll:roll(text,msg) end,5},
	{"lua", function(msg) if class.admin.isAuthorMestima(msg.author.id) or class.admin.isAuthorAdmin(msg.author.id,storage.admins) then local lua = msg.content if string.len(lua) > 8 then lua = string.sub(lua,6,string.len(lua)) class.luarun(msg, lua) end end end,4},
	{"telegraph create", function(msg) class.telegraph:CreateAccount(msg) end,17},
	{"cat", function(msg) class.animals:cat(msg) end,4},
	{"dog", function(msg) class.animals:dog(msg) end,4},
	{"data update", function(msg) if class.admin.isAuthorMestima(msg.author.id) then class.stats:SendGuilds(msg) msg:reply("```Bot data was successfully updated!```") end end,12},
	{"data get", function(msg) if class.admin.isAuthorMestima(msg.author.id) then class.stats:GetMyData(msg) end end,9},
	{"humble", function(msg) if class.admin.isAuthorMestima(msg.author.id) or class.admin.isAuthorAdmin(msg.author.id,storage.admins) then class.emb:SendCurrent(msg.client:getGuild("249556277796012032"):getChannel("382265707733450752"),"Раздача игры на HumbleBundle!",0xFF0000,"",{{string.gsub(msg.content,"!humble ",""),"Перейдите по ссылке для получения игры"}},"","",true) end end,7},
	{"e621", function(msg) class.e621:Get(msg) end,5},
	{"party", function(msg) class.party:Send(msg) end,6},
	{"mstart", function(msg) class.mafia:StartGame(msg) end,7},
	{"mjoin", function(msg) class.mafia:JoinGame(msg) end,6},
	{"mclose", function(msg) class.mafia:CloseGame(msg) end,7},
	{"mnew", function(msg) class.mafia:NewGame(msg) end,5},
	{"setmoney", function(msg) class.eco:SetMoney(msg,storage.admins) end,9},
	{"addmoney", function(msg) class.eco:AddMoney(msg,storage.admins) end,9},
	{"money", function(msg) class.eco:ShowMyMoney(msg) end,6},
	{"slot a", function(msg) class.slot:GoA(msg) end,7},
	{"slot b", function(msg) class.slot:GoB(msg) end,7},
	{"slot c", function(msg) class.slot:GoC(msg) end,7},
	{"freemoney", function(msg) class.eco:AddMeFreeMoney(msg) end,10},
	{"top", function(msg) class.eco:TopTen(msg) end,4}
}

commands.lite = {
	{"ip","IP адрес сервера: 195.2.252.94:27015"},
	{"ping","pong"},
	{"copyright",storage.mestima},
	{"invitebot", "https://discordapp.com/oauth2/authorize?client_id=398584082872926219&scope=bot&permissions=8"},
	{"discord", "https://discord.gg/HAtFcZH"},
}

return commands
