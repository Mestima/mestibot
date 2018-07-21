--[[
	Main MestiBot Storage
]]

local file = require("./file.lua")
local json = require("./JSON.lua")
local mlib = require("./mlib.lua")

local storage = {}

storage.prefixes = json:decode(file.Read("./mestima-bot/db/prefixes.txt"))

storage.admins = {
	{"Doktan","249553803945312257"},
	{"Moriarty","302482207921012748"},
	{"IO","368502257236312084"},
}

storage.mestima = [[```Markdown
# COPYRIGHT:
- [ENG] This bot created by Mestima.
- [RUS] Этого бота создал Mestima.

	> Steam:	http://steamcommunity.com/id/mestima
	> GitHub:	https://github.com/Mestima
	
	2018 © Mestima
```]]

storage.short_string = [[```Markdown
# [ENG] Error! Your message is too short!
# [RUS] Ошибка! Ваше сообщение слишком короткое!
```]]

storage.false_request = [[```Markdown
# [ENG] Error! Bad request!
# [RUS] Ошибка! Запрос сформирован неверно!
```]]
storage.noreason = [[```Markdown
# [ENG] The reason is too short or was not entered!
# [RUS] Причина слишком короткая или не была указана!
```]]

storage.cantprivate = [[```Markdown
# [ENG] You can't use bot in private dialogue. Sorry.
# [RUS] Вы не можете использовать бота в приватном диалоге. Простите.
```]]

storage.news = {
	rus = {},
	eng = {},
}
storage.news.rus.messageoftheday = [[
Новость дня: Команда !top была переработана.
]]
storage.news.eng.messageoftheday = [[
Message of the day: !top command has been fixed.
]]

storage.help = {
	main	= {},
	rus		= {},
	eng		= {},
}
storage.help.main.rus = [[
!help eng - английский
!help rus - русский
]]
storage.help.main.eng = [[
!help eng - english
!help rus - russian
]]
storage.help.rus.main = [[
!help -- Список всех команд Бота
!invitebot -- Получить ссылку для приглашения бота на Ваш сервер
!discord -- Получить приглашение на сервер MestiBot Discord
!copyright -- Показывает авторский копирайт
!id -- Показывает Ваш discord id
]]
storage.help.rus.eco = [[
!money -- Посмотреть количество битс (денег) на Вашем счету
!slot A -- Играть в игровой автомат (ставка 10 bits)
!slot B -- Играть в игровой автомат (ставка 100 bits)
!slot C -- Играть в игровой автомат (ставка 1000 bits)
!freemoney -- Получить 150 битс бесплатно (это будет работать, только если у Вас менее 100 битс)
!top -- Топ 6 богачей
]]
storage.help.rus.rp = [[
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
storage.help.rus.memes = [[
!fry текст -- Скинуть мем "Фрай" (Мне кажется или...)
!takemymoney текст -- Скинуть мем "возьми мои деньги" (Shut up and take my money!)
!youcant текст -- Скинуть мем "Мордор" (Нельзя просто так взять и...)
!tellme текст -- Скинуть мем "Вонка" (Давай, расскажи мне как...)
]]
storage.help.rus.fun = [[
!derpi random -- Скинуть случайный пост с derpibooru.org (Без NSFW)
!derpi текст -- Найти пост на derpibooru.org по заданному тексту (Без NSFW)
!spacelight -- Скидывает случайную фотографию, сделанную Spacelight'ом (Не берите это в голову)
!google текст -- Найти текст в Google (функция доступна только на русском языке)
!cat -- Получить случайное фото котика
!dog -- Получить случайное фото собачки
!party имя -- Поздравить пользователя с Днем Рождения! (функция доступна только на русском языке)
]]
storage.help.rus.programming = [[
!prefix -- Изменить префикс бота
!if -- Создать свою команду для Бота. Команды создаются по шаблону ниже:
		> !if ваша команда без ! then ответ, который должен выдать Бот
	Пример: !if hello then world
!delif -- Удалить созданную Вами команду
!cmds -- Посмотреть список всех команд, созданных пользователями при помощи !if
]]
storage.help.rus.mafia = [[
!mnew -- Создать игру
!mclose -- Закрыть созданную Вами игру
!mjoin id -- Вступить в игру с определенным id
!mstart -- Начать созданную Вами игру (Бот раздаст игрокам роли)
]]
storage.help.rus.useless = [[
!hello -- Поздороваться с Ботом
!ping --  Получить в ответ "pong"
!test -- Проверить, работает ли Бот. Если Бот активен, будет выдана надпись "test is done"
]]
storage.help.rus.admin = [[
!ban UserID причина -- забанить пользователя по id (Бот будет игнорировать сообщения пользователя)
!unban UserID причина -- разбанить юзера по id (Бот больше не будет игнорировать сообщения пользователя)
!addmoney UserID количество -- добавить битс (денег) на счет пользователя
!setmoney UserID количество -- установить битсы (деньги) на счету пользователя на определенную сумму
!lua -- заранить луа код
	Пример: !lua print("Hello World")
]]
storage.help.eng.main = [[
!help -- Shows a list of commands
!invitebot -- Get a link to invite bot on your server
!discord -- Get invite link to MestiBot Discord server
!copytight -- Shows author's copyright
!id -- Shows your discord id
]]
storage.help.eng.eco = [[
!money -- show your bits (money) ammount
!slot A -- play slot machine (bet: 10 bits)
!slot B -- play slot machine (bet: 100 bits)
!slot C -- play slot machine (bet: 1000 bits)
!freemoney -- get 150 bits for free (it works if you have less than 100 bits only)
!top -- Top 6 of rich mans
]]
storage.help.eng.rp = [[
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
storage.help.eng.memes = [[
!fry text -- Make a meme "Fry" (It seems to me that...)
!takemymoney text -- Make a meme "take my money" (Shut up and take my money!)
!youcant text -- Make a meme "Mordor" (One does not simply...)
!tellme text -- Make a meme "Wonka" (Condescending Wonka)
]]
storage.help.eng.fun = [[
!derpi random -- find a random post from: derpibooru.org (No NSFW content!)
!derpi text -- find post at derpibooru.org by text (No NSFW content!)
!spacelight -- Get random photo made by Spacelight (Nevermind, that's a joke)
!cat -- Get a random cat photo
!dog -- Get a random dog photo
]]
storage.help.eng.programming = [[
!prefix -- Change bot prefix
!if -- Allows you to create your own command for bot. You can create your command by using this template:
		> !if your command without ! then bot's answer
	Example: !if hello then world
!delif -- Removes your created command
!cmds -- List of commands, which were created by users !if
]]
storage.help.eng.useless = [[
!hello -- Say Hello to bot
!ping -- get an answer "pong"
!test -- Checks the bot activity. If bot is active, then you will get an answer "test is done"
]]
storage.help.eng.admin = [[
!ban UserID reason -- ban user by id (the bot will ignore the user)
!unban UserID reason -- unban user by id (the bot will not ingnore the user more)
!addmoney UserID ammount -- add bits (money) to user account
!setmoney UserID ammount -- set bits (money) of user account
!lua -- run lua code
	Example: !lua print("Hello World")
]]
storage.help.ru = {
	{"Основные команды:",storage.help.rus.main},
	{"Экономика:",storage.help.rus.eco},
	{"Команды ролевой отыгровки:",storage.help.rus.rp},
	{"Мемы:",storage.help.rus.memes},
	{"Фан-команды:",storage.help.rus.fun},
	{"Программирование бота:",storage.help.rus.programming},
	{"Игра 'Угадайка':",storage.help.rus.mafia},
	{"Прочее:",storage.help.rus.useless},
	{"Команды Администраторов бота:",storage.help.rus.admin},
}
storage.help.en = {
	{"Main commands:",storage.help.eng.main},
	{"Economy commands:",storage.help.eng.eco},
	{"RolePlay commands:",storage.help.eng.rp},
	{"Memes:",storage.help.eng.memes},
	{"Fun commands:",storage.help.eng.fun},
	{"Bot programming:",storage.help.eng.programming},
	{"Other:",storage.help.eng.useless},
	{"Bot Admin commands:",storage.help.eng.admin},
}
storage.help.lang = {
	{"Please, select your language:",storage.help.main.eng},
	{"Пожалуйста, выберите Ваш язык:",storage.help.main.rus},
}

return storage