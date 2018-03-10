--[[
	You know that e621.net is banned in Russia?
	That's the reason I'm using e926.net (it is not NSFW)
]]

local http = require("coro-http")
local json = require("./JSON.lua")

local e621 = {}

e621.httperror = [[```Markdown
# [ENG] Error! Can't connect to derpibooru.org
# [RUS] Ошибка! Невозможно подключиться к derpibooru.org
```]]

e621.nothingfound = [[```Markdown
# [ENG] No results were found by your request!
# [RUS] По Вашему запросу ничего не найдено!
```]]

e621.notnsfw = [[```Markdown
# [ENG] This command is available in the NSFW channel only!
# [RUS] Эта команда доступна только в NSFW канале!
```]]

e621.badrequest = [[```Markdown
# [ENG] Error! Bad request!
# [RUS] Ошибка! Неверный запрос!
```]]

function e621:Get(msg)
	if not msg.channel.nsfw then msg:reply(self.notnsfw) return end -- stop the function if it is not nsfw channel
	if string.len(msg.content) < 8 then msg:reply(self.badrequest) return end
	local api = "https://e926.net/post/index.json?tags="
	local tags = string.gsub(msg.content,"!e621 ","")
	tags = string.gsub(tags,"%s","+")
	api = api..tags
	local res, data = http.request('GET', api)
	if not data then msg.channel:send(self.httperror) return end
	data = json:decode(data)
	if not data[1] then msg.channel:send(self.nothingfound) return end
	if not data[1].id then msg.channel:send(self.nothingfound) return end
	local image = data[math.random(1,#data)].file_url
	msg.channel:send(image)
end

return e621