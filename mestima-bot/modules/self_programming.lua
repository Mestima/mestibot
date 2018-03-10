local file = require("./file.lua")
local json = require("./JSON.lua")
local admin = require("./admin.lua")
local mlib = require("./mlib.lua")

local sp = {}
sp.prefix = "!"

sp.message = {}
sp.message.shortstring = [[```Markdown
# [ENG] The string is too short. Try to make the string longer.
# [RUS] Слишком короткая строка. Попробуйте сделать строку длиннее.
```]]
sp.message.alreadyhavecommand = [[```Markdown
# [ENG] You already have 1 command. Delete it before creating a new one!
# [RUS] У Вас уже есть 1 команда. Удалите её перед тем, как создать новую!
```]]
sp.message.bannedname = [[```Markdown
# [ENG] You can not create a command with that name! Change the name of the command!
# [RUS] Нельзя создать команду с таким названием! Смените название команды!
```]]
sp.message.created = [[```Markdown
# [ENG] Your command was successfully created!
# [RUS] Ваша команда успешно создана!
```]]
sp.message.deleted = [[```Markdown
# [ENG] Your command was successfully deleted!
# [RUS] Ваша команда была успешно удалена!
```]]

sp.blacklist = {
	"zero","mestima",
}

function sp:reload()
	local phrases_json = file.Read("./mestima-bot/db/userphrases.txt")
	local phrases = json:decode(phrases_json)
	self.phrases = phrases
end

function sp:showAll()
	self:reload()
	local str = ""
	for k,v in pairs(self.phrases) do str = str..v[2].."\n" end
	return str
end

function sp:initBanCommands()
	self:reload()
	for k,v in pairs(self.phrases) do
		mlib.table.insert(self.blacklist,string.sub(v[2],2,string.len(v[2])))
	end
end

function sp:banCommand(cmd)
	mlib.table.insert(self.blacklist,cmd)
end

function sp:createAnswer(msg)

	local phrases_json = file.Read("./mestima-bot/db/userphrases.txt")
	local phrases = json:decode(phrases_json)
	local creator = msg.author.id
	
	if string.len(msg.content) < 12 then msg.channel:send(self.message.shortstring) return end
	if not string.find(string.lower(msg.content)," then ") then msg.channel:send(self.message.shortstring) return end
	for k,v in pairs(phrases) do if v[1] == creator then msg.channel:send(self.message.alreadyhavecommand) return end end
	
	local str = msg.content
	local then_id_start, then_id_end = string.find(string.lower(str)," then ")
	local message = string.sub(str,5,then_id_start-1)
	for k,v in pairs(self.blacklist) do if message == v then msg.channel:send(self.message.bannedname) return end end
	self:banCommand(message)
	message = self.prefix..message
	local answer = string.sub(str,then_id_start+6,string.len(str))
	local content = {creator,message,answer}
	mlib.table.insert(phrases,content)
	file.Write("./mestima-bot/db/userphrases.txt", json:encode(phrases))
	self:reload()
	msg.channel:send(self.message.created)
end

function sp:deleteAnswer(msg)
	local phrases_json = file.Read("./mestima-bot/db/userphrases.txt")
	local phrases = json:decode(phrases_json)
	local creator = msg.author.id
	local key = 0
	for k,v in pairs(phrases) do if v[1] == creator then msg.channel:send(self.message.deleted) key = k end end
	table.remove(phrases,key)
	file.Write("./mestima-bot/db/userphrases.txt", json:encode(phrases))
	self:reload()
end

function sp:init(msg)
	self:reload()
	for k,v in pairs(self.phrases) do
		if msg.content == v[2] then msg.channel:send(v[3]) end
	end
end

return sp