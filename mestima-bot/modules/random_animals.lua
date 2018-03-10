local http = require("coro-http")
local json = require("./JSON.lua")

local animals = {}

animals.httperror = [[```Markdown
# ENG HTTP ERROR. Try again.
# RUS Ошибка протокола HTTP. Повторите запрос.
```]]

function animals:cat(msg)
	local api = "http://random.cat/meow"
	local res, data = http.request("GET",api)
	if not data then msg:reply(self.httperror) return end
	local cat = json:decode(data)
	msg:reply(cat.file)
end

function animals:dog(msg)
	local api = "https://dog.ceo/api/breeds/image/random"
	local res, data = http.request("GET",api)
	if not data then msg:reply(self.httperror) return end
	local cat = json:decode(data)
	msg:reply(cat.message)
end

return animals