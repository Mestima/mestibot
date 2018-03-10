--[[
	This class was made special for The Elements of Rainbow discord server
]]

local mlib = require("./mlib.lua")

local mafia = {}

mafia.roles = {
	"Гитлер",
	"Капитан Америка",
	"Ольга Бузова",
	"Шерлок",
	"Лолита Милявская",
	"Спанч Боб", 
	"Гендальф", 
	"Чарли Чаплин", 
	"Карлсон",
	"Колобок",
	"Олимпийский Мишка 86 года",
	"Баста",
	"Басков",
	"Галкин",
	"LIl Peep",
	"FEDUK", 
	"Земфира",
	"FACE", 
	"Спортекус", 
	"Джек Воробей", 
	"Нэмо", 
	"Финес и Ферб", 
	"Микки Маус", 
	"Алексей Навальный",
	"Вовка Путин", 
	"Чубака", 
	"Розовая Пантера", 
	"Белоснежка", 
	"Гарри Потер",
	"Марио", 
	"Шрэк",
	"Гарфилд",
	"Лунтик",
	"Патрик",
	"Жириновский",
	"Катя Клэп", 
	"Тимати", 
	"Дима Билан",
	"Стас Михайлов",
	"Дарт Вейдер", 
	"Мэрлин Монро",
	"Леди ГаГа",
}

mafia.games = {
	{"id", "owner id", "player ids table", "status", "server id"} -- table header, do not touch// if status == true then game = open else game = closed
}

function mafia:HasOpenGames(id) -- owner id here
	local ply = id
	local flag = false
	for k,v in pairs(self.games) do
		if v[2] == ply then
			if v[4] == true then flag = true end
		end
	end
	
	return flag
end

mafia.youalreadyhaveagame = [[```Markdown
# У Вас уже есть одна открытая игра. Закройте её или начните.
```]]

mafia.wasclosed = [[```Markdown
# Ваша игра была закрыта.
```]]

mafia.wasnotclosed = [[```Markdown
# У Вас нет открытых игр.
```]]

mafia.tooshort = [[```Markdown
# Слишком короткий id игры! Попробуйте снова.
```]]

mafia.joined = [[```Markdown
# Вы успешно вступили в игру.
```]]

mafia.notjoined = [[```Markdown
# Игра с указанным id не была найдена.
```]]

mafia.gamestarted = [[```Markdown
# Игра началась!
```]]

mafia.gamecreated = [[```Markdown
# Ваша игра была создана.
# ID игры: %s
```]]

mafia.yourgame = [[```Markdown
# Вы не можете вступить с вою же игру. Вы и так находитесь в ней.
```]]

mafia.yourrole = "```Роли игроков в игре: "

function mafia:NewGame(msg)
	if self:HasOpenGames(msg.author.id) == true then msg:reply(self.youalreadyhaveagame) return end
	local game = {}
	game.owner = msg.author
	game.id = #self.games + 1
	mlib.table.insert(self.games,{game.id, game.owner.id, {}, true, msg.guild.id})
	msg:reply(string.format(self.gamecreated,game.id))
end

function mafia:CloseGame(msg)
	local wasdone = false
	for k,v in pairs(self.games) do
		if v[2] == msg.author.id then
			if v[4] == true then v[4] = false wasdone = true end
		end
	end
	
	if wasdone == true then msg:reply(self.wasclosed) else msg:reply(self.wasnotclosed) end
end

function mafia:JoinGame(msg)
	if string.len(msg.content) < 8 then msg:reply(self.tooshort) return end
	local ply = msg.author.id
	local guildid = msg.guild.id
	local gameid = tonumber(string.sub(msg.content, 8, string.len(msg.content)))
	local wasfound = false
	
	if not self.games[gameid] then msg:reply(self.notjoined) return end
	
	if (self.games[gameid][1] == gameid) and (self.games[gameid][4] == true) and (self.games[gameid][5] == guildid) then
		if self.games[gameid][2] == ply then msg:reply(self.yourgame) return end
		mlib.table.insert(self.games[gameid][3],ply)
		wasfound = true
	end
	
	if wasfound == true then msg:reply(self.joined) else msg:reply(self.notjoined) end
end

function mafia:StartGame(msg)
	local game = {}
	game.owner = msg.author.id
	game.players = {}
	game.flag = false
	game.id = 0
	game.roles = {}
	
	for k,v in pairs(self.games) do
		if v[2] == game.owner then
			if v[4] == true then
				v[4] = false
				game.flag = true
				game.id = k
				mlib.table.insert(v[3], game.owner)
			end
		end
	end
	
	if game.flag == true then
		for k,v in pairs(self.games[game.id][3]) do
			mlib.table.insert(game.players, msg.client:getUser(v))
		end
		
		for k,v in pairs(game.players) do
			mlib.table.insert(game.roles,{v,self.roles[math.random(1,#self.roles)],mafia.yourrole})
		end		
		
		for k,v in pairs(game.roles) do
			for i=1,#game.players do
				if v[1] ~= game.roles[i][1] then
					v[3] = v[3].."\n"..game.roles[i][1].username.." - "..game.roles[i][2]
				end
			end
			v[3] = v[3].."```"
			v[1]:getPrivateChannel():send(v[3])
		end		
		
--		for k,v in pairs(game.players) do
--			v:getPrivateChannel():send(mafia.yourrole..self.roles[math.random(1,#self.roles)].."```")
--		end
		
		msg:reply(self.gamestarted)
	else
		msg:reply(self.wasnotclosed)
	end
end

return mafia