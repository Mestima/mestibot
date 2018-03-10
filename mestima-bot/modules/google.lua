--[[
	I don't want to translate my google script in english.
	That's the reason it works in russian language only.
]]

local emb = require("./embed.lua")

local function google(msg)
local err = [[```Markdown
# [RUS] Не введен требуемый запрос!
```]]

	if string.len(msg.content) < 8 then msg.channel:send(err) return end
	local link = string.gsub(msg.content,"!google%s","")
	link = string.gsub(link," ","%%20")
	link = "http://nilored.ru/google/?q="..link
	local fields = {
		{"Google","[ОТКРЫТЬ РЕЗУЛЬТАТЫ ПОИСКА]("..link..")"}
	}
	emb:SendCustom(msg,"",0xC0C0C0,"",fields,"","",false)
end

return google