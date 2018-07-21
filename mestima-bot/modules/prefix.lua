local file = require("./file.lua")
local json = require("./JSON.lua")
local mlib = require("./mlib.lua")
local admin = require("./admin.lua")

local pr = {}

pr.message = {}
pr.message.shortstring = [[```Markdown
# [ENG] The string is too short. Try to make the string longer.
# [RUS] Слишком короткая строка. Попробуйте сделать строку длиннее.
```]]
pr.message.changed = [[```Markdown
# [ENG] Prefix was successfully updated to your guild!
# [RUS] Префикс успешно установлен для Вашего сервера!
```]]

pr.message.needtobeanadmin = [[```Markdown
# [ENG] You need to be a guild owner to change a prefix!
# [RUS] Вы должны быть создателем сервера, что бы изменить префикс!
```]]

function pr:setPrefix(msg, prefixes)
	if (msg.author.id ~= msg.guild.ownerId) and (admin.isAuthorMestima(msg.author.id) == false) then msg:reply(self.message.needtobeanadmin) return end
    if string.len(msg.content) < 9 then msg:reply(self.message.shortstring) return end
    local data = {}
	local flag = false
    local text = msg.content
    data.prefix = string.sub(text,9,string.len(text))
    data.guild = msg.guild.id
    for k,v in pairs(prefixes) do
		if v.guild == data.guild then
			v.prefix = data.prefix
			flag = true
		end
	end
	if flag == false then
		mlib.table.insert(prefixes, data)
	end
    file.Write("./mestima-bot/db/prefixes.txt", json:encode(prefixes))
	msg:reply(self.message.changed)
end

function pr:getPrefix(msg, prefixes)
    local prefix = ""
    for k,v in pairs(prefixes) do
        if v.guild == msg.guild.id then prefix = v.prefix end
    end
    return prefix
end

return pr