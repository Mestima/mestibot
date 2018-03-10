--[[
	Works fine.
]]

local http = require("coro-http")
local json = require("./JSON.lua")

local derpi = {}
derpi.httperror = [[```Markdown
# [ENG] Error! Can't connect to derpibooru.org
# [RUS] Ошибка! Невозможно подключиться к derpibooru.org
```]]

derpi.nothingfound = [[```Markdown
# [ENG] No results were found by your request!
# [RUS] По Вашему запросу ничего не найдено!
```]]

function derpi:GetRandom(msg)
	local https = "https:"
	local res, data = http.request('GET', 'https://derpibooru.org/images.json')
	if not data then msg.channel:send(self.httperror) return end
	data = json:decode(data)
	if #data.images == 0 then msg.channel:send(self.nothingfound) return end
	local image = data.images[math.random(1,#data.images)].image
	image = https..image
	msg.channel:send(image)
end

function derpi:Get(msg)
	local content = string.sub(msg.content,8,string.len(msg.content))
	content = string.gsub(content,"%s","+")
	local https = "https:"
	local link = 'https://derpibooru.org/search.json?q='..content
	local res, data = http.request('GET', link)
	if not data then msg.channel:send(self.httperror) return end
	data = json:decode(data)
	if #data.search == 0 then msg.channel:send(self.nothingfound) return end
	local image = data.search[math.random(1,#data.search)].image
	image = https..image
	msg.channel:send(image)
end


return derpi