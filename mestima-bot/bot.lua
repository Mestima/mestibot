local ds = require("discordia")
local class = require("./modules/classes.lua")
local cl = ds.Client({
--	cacheAllMembers = true,
})
ds.extensions()
---------------------------------------------[[ CONFIG ZONE ]]-----------------------------------------------
local admins = {
--	{"Doktan","249553803945312257"}, -- admin ids here
--	{"Moriarty","302482207921012748"},
--	{"IO","368502257236312084"},
}
prefix = "!"
token = "token" -- token here
-------------------------------------------------------------------------------------------------------------

function reload()
	-- i will realize it
end

cl:on("ready", function()
	print("Logged in as "..cl.user.username)
	local game = {name = "for "..#cl.guilds.." guilds | !help", type = 3}
	cl:setGame(game)
end)

mestima = [[```Markdown
# COPYRIGHT:
- [ENG] This bot created by Mestima.
- [RUS] Этого бота создал Mestima.

	> Steam:	http://steamcommunity.com/id/mestima
	> GitHub:	https://github.com/Mestima
	
	2018 © Mestima
```]]

short_string = [[```Markdown
# [ENG] Error! Your message is too short!
# [RUS] Ошибка! Ваше сообщение слишком короткое!
```]]

false_request = [[```Markdown
# [ENG] Error! Bad request!
# [RUS] Ошибка! Запрос сформирован неверно!
```]]
noreason = [[```Markdown
# [ENG] The reason is too short or was not entered!
# [RUS] Причина слишком короткая или не была указана!
```]]

cantprivate = [[```Markdown
# [ENG] You can't use bot in private dialogue. Sorry.
# [RUS] Вы не можете использовать бота в приватном диалоге. Простите.
```]]

commands = { -- simple commands
	{"ping","pong"},
	{"copyright",mestima},
	{"invitebot", "https://discordapp.com/oauth2/authorize?client_id=398584082872926219&scope=bot&permissions=8"},
	{"discord", "https://discord.gg/HAtFcZH"},
}

news = {
	rus = {},
	eng = {},
}
news.rus.messageoftheday = [[
Новость дня: Удалена команда !e621 из-за запрета e621.net на территории физической локации хостинга.
]]
news.eng.messageoftheday = [[
Message of the day: !e621 command was deleted cause e621.net was blocked in the physical hosting location.
]]

help = {
	main	= {},
	rus		= {},
	eng		= {},
}
help.main.rus = [[
!help eng - английский
!help rus - русский
]]
help.main.eng = [[
!help eng - english
!help rus - russian
]]
help.rus.main = [[
!help -- Список всех команд Бота
!invitebot -- Получить ссылку для приглашения бота на Ваш сервер
!discord -- Получить приглашение на сервер MestiBot Discord
!copyright -- Показывает авторский копирайт
]]
help.rus.eco = [[
!money -- Посмотреть количество битс (денег) на Вашем счету
!slot A -- Играть в игровой автомат (ставка 10 bits)
!slot B -- Играть в игровой автомат (ставка 100 bits)
!slot C -- Играть в игровой автомат (ставка 1000 bits)
!freemoney -- Получить 150 битс бесплатно (это будет работать, только если у Вас менее 100 битс)
!top -- Топ 10 богачей
]]
help.rus.rp = [[
!say текст -- Попросить Бота сказать какое-то слово или фразу
!me текст -- Ролевое действие от 3го лица
!roll dice -- Кинуть кубик с определенным количеством граней. Название кубика должно стоять на месте "dice":
		> d1	-- Одногранный кубик (и кому это будет нужно?)
		> d2	-- Двухгранный кубик
		> d3	-- Трёхгранный кубик
		> d4	-- Четырёхгранный кубик
		> d6	-- Шестигранный кубик
		> d8	-- Восьмигранный кубик
		> d10	-- Десятигранный кубик
		> d20	-- Двадцатигранный кубик
Пример: !roll d6
]]
help.rus.memes = [[
!fry текст -- Скинуть мем "Фрай" (Мне кажется или...)
!takemymoney текст -- Скинуть мем "возьми мои деньги" (Shut up and take my money!)
!youcant текст -- Скинуть мем "Мордор" (Нельзя просто так взять и...)
!tellme текст -- Скинуть мем "Вонка" (Давай, расскажи мне как...)
]]
help.rus.fun = [[
!derpi random -- Скинуть случайный пост с derpibooru.org (Без NSFW)
!derpi текст -- Найти пост на derpibooru.org по заданному тексту (Без NSFW)
!spacelight -- Скидывает случайную фотографию, сделанную Spacelight'ом (Не берите это в голову)
!google текст -- Найти текст в Google (функция доступна только на русском языке)
!cat -- Получить случайное фото котика
!dog -- Получить случайное фото собачки
!party имя -- Поздравить пользователя с Днем Рождения! (функция доступна только на русском языке)
]]
help.rus.programming = [[
!if -- Создать свою команду для Бота. Команды создаются по шаблону ниже:
		> !if ваша команда без ! then ответ, который должен выдать Бот
	Пример: !if hello then world
!delif -- Удалить созданную Вами команду
!cmds -- Посмотреть список всех команд, созданных пользователями при помощи !if
]]
help.rus.mafia = [[
!mnew -- Создать игру
!mclose -- Закрыть созданную Вами игру
!mjoin id -- Вступить в игру с определенным id
!mstart -- Начать созданную Вами игру (Бот раздаст игрокам роли)
]]
help.rus.useless = [[
!hello -- Поздороваться с Ботом
!ping --  Получить в ответ "pong"
!test -- Проверить, работает ли Бот. Если Бот активен, будет выдана надпись "test is done"
]]
help.rus.admin = [[
!ban UserID причина -- забанить пользователя по id (Бот будет игнорировать сообщения пользователя)
!unban UserID причина -- разбанить юзера по id (Бот больше не будет игнорировать сообщения пользователя)
!addmoney UserID количество -- добавить битс (денег) на счет пользователя
!setmoney UserID количество -- установить битсы (деньги) на счету пользователя на определенную сумму
!lua -- заранить луа код
	Пример: !lua print("Hello World")
]]
help.eng.main = [[
!help -- Shows a list of commands
!invitebot -- Get a link to invite bot on your server
!discord -- Get invite link to MestiBot Discord server
!copytight -- Shows author's copyright
]]
help.eng.eco = [[
!money -- show your bits (money) ammount
!slot A -- play slot machine (bet: 10 bits)
!slot B -- play slot machine (bet: 100 bits)
!slot C -- play slot machine (bet: 1000 bits)
!freemoney -- get 150 bits for free (it works if you have less than 100 bits only)
!top -- Top 10 of rich mans
]]
help.eng.rp = [[
!say text -- Bot will say text
!me text -- Bot will do an RP action in form of third person
!roll dice -- Roll the dice:
		> d1	-- One-sided dice (Do you really need this?)
		> d2	-- Dihedral dice
		> d3	-- Trihedral dice
		> d4	-- Tetrahedral dice
		> d6	-- Hexagonal dice
		> d8	-- Octahedral dice
		> d10	-- Decagonal dice
		> d20	-- D20 dice
Example: !roll d6
]]
help.eng.memes = [[
!fry text -- Make a meme "Fry" (It seems to me that...)
!takemymoney text -- Make a meme "take my money" (Shut up and take my money!)
!youcant text -- Make a meme "Mordor" (One does not simply...)
!tellme text -- Make a meme "Wonka" (Condescending Wonka)
]]
help.eng.fun = [[
!derpi random -- find a random post from: derpibooru.org (No NSFW content!)
!derpi text -- find post at derpibooru.org by text (No NSFW content!)
!spacelight -- Get random photo made by Spacelight (Nevermind, that's a joke)
!cat -- Get a random cat photo
!dog -- Get a random dog photo
]]
help.eng.programming = [[
!if -- Allows you to create your own command for bot. You can create your command by using this template:
		> !if your command without ! then bot's answer
	Example: !if hello then world
!delif -- Removes your created command
!cmds -- List of commands, which were created by users !if
]]
help.eng.useless = [[
!hello -- Say Hello to bot
!ping -- get an answer "pong"
!test -- Checks the bot activity. If bot is active, then you will get an answer "test is done"
]]
help.eng.admin = [[
!ban UserID reason -- ban user by id (the bot will ignore the user)
!unban UserID reason -- unban user by id (the bot will not ingnore the user more)
!addmoney UserID ammount -- add bits (money) to user account
!setmoney UserID ammount -- set bits (money) of user account
!lua -- run lua code
	Example: !lua print("Hello World")
]]
help.ru = {
	{"Основные команды:",help.rus.main},
	{"Экономика:",help.rus.eco},
	{"Команды ролевой отыгровки:",help.rus.rp},
	{"Мемы:",help.rus.memes},
	{"Фан-команды:",help.rus.fun},
	{"Программирование бота:",help.rus.programming},
	{"Игра 'Угадайка':",help.rus.mafia},
	{"Прочее:",help.rus.useless},
	{"Команды Администраторов бота:",help.rus.admin},
}
help.en = {
	{"Main commands:",help.eng.main},
	{"Economy commands:",help.eng.eco},
	{"RolePlay commands:",help.eng.rp},
	{"Memes:",help.eng.memes},
	{"Fun commands:",help.eng.fun},
	{"Bot programming:",help.eng.programming},
	{"Other:",help.eng.useless},
	{"Bot Admin commands:",help.eng.admin},
}
help.lang = {
	{"Please, select your language:",help.main.eng},
	{"Пожалуйста, выберите Ваш язык:",help.main.rus},
}

cmds = {
	{"help", function(msg) if string.len(msg.content) > 5 then return end class.emb:SendCustom(msg,"> MestiBot help",0xFF0000,"--------------------------------------------------",help.lang,"2018 © Mestima","http://nilored.ru/mestibot/icons/mes_ico1.png",true) end,5},
	{"help rus", function(msg) class.emb:SendCustom(msg,"> MestiBot help",0xFF0000,news.rus.messageoftheday,help.ru,"2018 © Mestima","http://nilored.ru/mestibot/icons/mes_ico1.png",true) end,9},
	{"help eng", function(msg) class.emb:SendCustom(msg,"> MestiBot help",0xFF0000,news.eng.messageoftheday,help.en,"2018 © Mestima","http://nilored.ru/mestibot/icons/mes_ico1.png",true) end,9},
	{"say", function(msg) local text = msg.content text = string.sub(text,6,string.len(text)) msg.channel:send(text) end,4},
	{"test", function(msg) class.emb:Send(msg,"TEST MESSAGE",0xFF00F0,"Just an answer to check out bot activity!") end,5},
	{"hello", function(msg) if class.admin.isAuthorMestima(msg.author.id) then msg.channel:send("Greetings, Creator!") elseif class.admin.isAuthorAdmin(msg.author.id,admins) then msg.channel:send("Hello, Admin "..msg.author.name.."!") else msg.channel:send("Hello, "..msg.author.name.."!") end end,6},
	{"derpi random", function(msg) class.derpi:GetRandom(msg) end,13},
	{"derpi", function(msg) if string.len(msg.content) > 12 then if string.sub(msg.content,8,13) == "random" then return end end if string.len(msg.content) > 8 then class.derpi:Get(msg) else msg:reply(false_request) end end,6},
	{"ban", function(msg) if string.len(msg.content) < 30 then msg:reply(noreason) return end if class.admin.isAuthorAdmin(msg.author.id,admins) or class.admin.isAuthorMestima(msg.author.id) then local pos = string.find(msg.content," ",6) local id = string.sub(msg.content,6,pos-1) class.admin.banId(id,msg) msg.channel:send("```ID: "..id.." banned.```") end end,4},
	{"unban", function(msg) if string.len(msg.content) < 30 then msg:reply(noreason) return end if class.admin.isAuthorAdmin(msg.author.id,admins) or class.admin.isAuthorMestima(msg.author.id) then local pos = string.find(msg.content," ",8) local id = string.sub(msg.content,8,pos-1) class.admin.unbanId(id,msg) msg.channel:send("```ID: "..id.." unbanned.```") end end,6},
	{"if", function(msg) class.sp:createAnswer(msg) class.sp:init(msg) end,3},
	{"delif", function(msg) class.sp:deleteAnswer(msg) class.sp:init(msg) end,6},
	{"cmds", function(msg) local str = class.sp:showAll() msg.channel:send("```Markdown\n# [ENG] List of commands created by users with using !if\n# [RUS] Список всех команд, созданных пользователями при помощи !if\n"..str.."\n```") end,13},
	{"me", function(msg) if string.sub(msg.content,4,4) == " " then msg.channel:send(msg.author.name.." "..string.sub(msg.content,4,string.len(msg.content))) end end,3},
	{"fry", function(msg) if string.len(msg.content) < 15 then msg:reply(short_string) return end class.memes.fry(msg) end,4},
	{"spacelight", function(msg) local v = math.random(1,60) v = v*v v = v+3 msg.channel:send("http://nilored.ru/spacelight/"..v.."-.jpg") end,11},
	{"takemymoney", function(msg) if string.len(msg.content) < 25 then msg:reply(short_string) return end class.memes.takemymoney(msg) end,12},
	{"youcant", function(msg) if string.len(msg.content) < 20 then msg:reply(short_string) return end class.memes.youcant(msg) end,8},
	{"tellme", function(msg) if string.len(msg.content) < 20 then msg:reply(short_string) return end class.memes.tellme(msg) end,7},
	{"google", function(msg) class.google(msg) end,7},
	{"roll", function(msg) if string.len(msg.content) < 8 or string.len(msg.content) > 9 then msg.channel:send("Запрос сформирован неверно!") return end local text = msg.content if string.len(text) == 8 then text = string.sub(text,7,8) else text = string.sub(text,7,9) end class.roll:roll(text,msg) end,5},
	{"lua", function(msg) if class.admin.isAuthorMestima(msg.author.id) or class.admin.isAuthorAdmin(msg.author.id,admins) then local lua = msg.content if string.len(lua) > 8 then lua = string.sub(lua,6,string.len(lua)) class.luarun(msg, lua) end end end,4},
	{"telegraph create", function(msg) class.telegraph:CreateAccount(msg) end,17},
	{"cat", function(msg) class.animals:cat(msg) end,4},
	{"dog", function(msg) class.animals:dog(msg) end,4},
	{"data update", function(msg) if class.admin.isAuthorMestima(msg.author.id) then class.stats:SendGuilds(msg) msg:reply("```Bot data was successfully updated!```") end end,12},
	{"data get", function(msg) if class.admin.isAuthorMestima(msg.author.id) then class.stats:GetMyData(msg) end end,9},
	{"humble", function(msg) if class.admin.isAuthorMestima(msg.author.id) or class.admin.isAuthorAdmin(msg.author.id,admins) then class.emb:SendCurrent(msg.client:getGuild("249556277796012032"):getChannel("382265707733450752"),"Раздача игры на HumbleBundle!",0xFF0000,"",{{string.gsub(msg.content,"!humble ",""),"Перейдите по ссылке для получения игры"}},"","",true) end end,7},
	{"e621", function(msg) class.e621:Get(msg) end,5},
	{"party", function(msg) class.party:Send(msg) end,6},
	{"mstart", function(msg) class.mafia:StartGame(msg) end,7},
	{"mjoin", function(msg) class.mafia:JoinGame(msg) end,6},
	{"mclose", function(msg) class.mafia:CloseGame(msg) end,7},
	{"mnew", function(msg) class.mafia:NewGame(msg) end,5},
	{"setmoney", function(msg) class.eco:SetMoney(msg,admins) end,9},
	{"addmoney", function(msg) class.eco:AddMoney(msg,admins) end,9},
	{"money", function(msg) class.eco:ShowMyMoney(msg) end,6},
	{"slot a", function(msg) class.slot:GoA(msg) end,7},
	{"slot b", function(msg) class.slot:GoB(msg) end,7},
	{"slot c", function(msg) class.slot:GoC(msg) end,7},
	{"freemoney", function(msg) class.eco:AddMeFreeMoney(msg) end,10},
	{"top", function(msg) class.eco:TopTen(msg) end,4}
}

for k,v in pairs(commands) do class.sp:banCommand(v[1]) end
for k,v in pairs(cmds) do class.sp:banCommand(v[1]) end

cl:on("messageCreate", function(msg)
	if msg.author == msg.client.user then return end -- Disable shitty posting
	if not msg.guild then msg:reply(cantprivate) return end -- block private bot dialogue
	if msg.guild.id == "383843756547375104" then return end -- idk this guild, but some kids trying to crash bot
	if class.admin.isBanned(msg.author.id) then return end -- Is user banned?
	if msg.content == "!mestima" then return end -- Ban my lovely nickname as a command
--	if string.sub(msg.content,1,1) == prefix then class.log:Send(msg) end -- command log, I need it cause some kids was trying to crash bot
	
	for k,v in pairs(commands) do
		if string.lower(msg.content) == prefix..v[1] then
			msg.channel:send(v[2])
		end
	end
	
	for k,v in pairs(cmds) do
		if string.lower(string.sub(msg.content,1,v[3])) == prefix..v[1] then
			local func = v[2]
			func(msg)
		end
	end
	
	class.sp:init(msg)
	class.sp:initBanCommands()
end)

cl:run("Bot "..token)
