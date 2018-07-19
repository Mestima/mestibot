local http = require("coro-http")
local json = require("./JSON.lua")

local animals = {}

animals.httperror = [[```Markdown
# ENG HTTP ERROR. Try again.
# RUS Ошибка протокола HTTP. Повторите запрос.
```]]

animals.down = [[```Markdown
# [ENG] The cat API is currently down. Please try again later (or not).
# [RUS] Кошачий API не отвечает. Попробуйте позднее (или нет).
```]]

function animals:cat(msg)
--[[
	local api = "http://random.cat/meow"
	local res, data = http.request("GET",api)
	if not data then msg:reply(self.httperror) return end
	local cat = json:decode(data)
	msg:reply(cat.file)
]]
	msg:reply(self.down)
end

function animals:dog(msg)
	local api = "https://dog.ceo/api/breeds/image/random"
	local res, data = http.request("GET",api)
	if not data then msg:reply(self.httperror) return end
	local cat = json:decode(data)
	msg:reply(cat.message)
end

return animals