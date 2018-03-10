local http = require("coro-http")

local function tellme(msg)
	local err = [[```Markdown
# [ENG] Error! Your text must contain two or more words!
# [RUS] Ошибка! Ваш запрос должен состоять из 2х или более слов!
```]]
	if not string.find(msg.content," ",10) then msg:reply(err) return end
	local text = string.sub(msg.content,9,string.len(msg.content))
	local pos = string.find(text," ")
	text = string.gsub(text,"%s","_")
	local first_line = string.sub(text,1,pos-1)
	local second_line = string.sub(text,pos+1,string.len(text))
	local link = "https://memegen.link/wonka/"..first_line.."/"..second_line..".jpg?font=tahoma-bold"
	local res, data = http.request("GET",link)
	msg.channel:send(link)
end

return tellme