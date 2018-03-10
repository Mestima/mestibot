--[[
	This class is under construction.
	I will not finish this maybe.
]]

local json = require("./JSON.lua")
local file = require("./file.lua")
local mlib = require("./mlib.lua")
local http = require("coro-http")

local telegraph = {}
telegraph.badrequest = [[```Markdown
# [ENG] Error! Bad request!
# [RUS] Ошибка! Неверный запрос!
```]]
telegraph.badlink = [[```Markdown
# [ENG] Error! The link must be correct!
# [RUS] Ошибка! Ссылка должна быть правильной!
```]]
telegraph.badname = [[```Markdown
# [ENG] Error! The name can not content more then 1 space!
# [RUS] Ошибка! Имя не может иметь более 1 пробела!
```]]
telegraph.httperror = [[```Markdown
# [ENG] Error! Can not connect to telegra.ph server!
# [RUS] Ошибка! Невозможно подключиться к серверу telegra.ph!
```]]
telegraph.created = [[```Markdown
# [ENG] Your telegra.ph account was created!
# [RUS] Ваш telegra.ph аккаунт успешно создан!
```]]
telegraph.already = [[```Markdown
# [ENG] You already have a telegra.ph account!
# [RUS] У Вас уже есть аккаунт telegra.ph!
```]]
telegraph.tooshort = [[```Markdown
# [ENG] Your post content is too short!
# [RUS] Контент, который Вы хотите опубликовать, слишком мал!
```]]
telegraph.accountnotfount = [[```Markdown
# [ENG] Your telegra.ph account was not found!
# [RUS] Ваш аккаунт telegra.ph не найден!
```]]
telegraph.badtitle = [[```Markdown
# [ENG] Your post must have a title and content!
# [RUS] Ваш пост должен иметь название и контент!
```]]

function telegraph:CreateAccount(msg)
	if string.len(msg.content) < 40 then msg.channel:send(self.badrequest) return end
	if string.sub(msg.content,19,19) == " " then msg.channel:send(self.badrequest) return end
	if string.sub(msg.content,18,18) ~= " " then msg.channel:send(self.badrequest) return end
	local account = {}
	local text = msg.content
	local author = msg.author.id
	local pos = string.find(text," ",19)
	account.name = string.sub(text,19,pos-1)
	account.url = string.sub(text,pos+1,string.len(text))
	account.discordid = author
	if not (string.find(account.url,"http://") or string.find(account.url,"https://")) then msg.channel:send(self.badlink) return end
	if string.find(account.name,"  ") then msg.channel:send(self.badname) return end
	
	local res, data = http.request("GET", "https://api.telegra.ph/createAccount?short_name="..account.name.."&author_name="..account.name.."&author_url="..account.url)
	if not res then msg.channel:send(self.httperror) return end
	local new_data = json:decode(data)
	account.token = new_data.result.access_token
	account.auth_url = new_data.result.auth_url
	
	local accounts = file.Read("/home/mestima/luvit/mestima-bot/db/telegraph.txt")
	local tbl = json:decode(accounts)
	for k,v in pairs(tbl) do
		if v.discordid == author then msg.channel:send(self.already) return end
	end
	mlib.table.insert(tbl,account)
	accounts = json:encode(tbl)
	file.Write("/home/mestima/luvit/mestima-bot/db/telegraph.txt",accounts)
	msg.channel:send(self.created)
end
--[[
function telegraph:Post(msg) -- !telegraph post -- 16 с пробелом
	if string.len(msg.content) < 35 then msg.channel:send(self.tooshort) return end
	if not string.find(msg.content," | ") then msg.channel:send(self.badtitle) return end
	local flag = false
	local post = {}
	post.content = string.sub(msg.content,17,string.len(msg.content))
	local startpos, endpos = string.find(post.content," | ")
	post.title = string.sub(post.content,1,startpos-1)
	post.content = string.sub(post.content,endpos+1,string.len(post.content))
	post.authorid = msg.author.id
	post.re = "false"
	post.title = string.gsub(post.title,"%s","+")
	local jsondata = file.Read("/home/mestima/luvit/mestima-bot/db/telegraph.txt")
	local data = json:decode(jsondata)
	for k,v in pairs(data) do
		if v.discordid == post.authorid then
			flag = true
			post.author = v.name
			post.author_url = v.url
			post.token = v.token
		end
	end
	if flag == false then msg.channel:send(self.accountnotfount) return end
	-- post.content = convertToDom(post.content) 
	-- post.content = string.gsub(post.content,"%s","+")
	post.content = json:encode(post.content)
	local http.request("GET","https://api.telegra.ph/createPage?access_token="..post.token.."&title="..post.title.."&author_name="..post.author.."&content="..post.content.."&return_content="..post.re)
end
]]--
return telegraph