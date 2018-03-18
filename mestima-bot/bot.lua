local ds = require("discordia")
local class = require("./modules/classes.lua")
local storage = require("./modules/storage.lua")
local commands = require("./modules/commands.lua")
local cl = ds.Client({
--	cacheAllMembers = true,
})
ds.extensions()
---------------------------------------------[[ CONFIG ZONE ]]-----------------------------------------------
prefix = "!"
token = "token here"
-------------------------------------------------------------------------------------------------------------

function reload()
	-- i will realize it
end

cl:on("ready", function()
	print("Logged in as "..cl.user.username)
	local game = {name = "for "..#cl.guilds.." guilds | !help", type = 3}
	cl:setGame(game)
end)

for k,v in pairs(commands.lite) do class.sp:banCommand(v[1]) end -- the part of self_programming class
for k,v in pairs(commands.main) do class.sp:banCommand(v[1]) end

cl:on("messageCreate", function(msg)
	if msg.author == msg.client.user then return end -- Disable shitty posting
	if not msg.guild then msg:reply(storage.cantprivate) return end -- block private bot dialogue
	if msg.guild.id == "383843756547375104" then return end -- idk this guild, but some kids trying to crash bot
	if class.admin.isBanned(msg.author.id) then return end -- Is user banned?
--	if string.sub(msg.content,1,1) == prefix then class.log:Send(msg) end -- command log, I need it cause some kids was trying to crash bot
	
	for k,v in pairs(commands.lite) do
		if string.lower(msg.content) == prefix..v[1] then
			msg.channel:send(v[2])
		end
	end
	
	for k,v in pairs(commands.main) do
		if string.lower(string.sub(msg.content,1,v[3])) == prefix..v[1] then
			local func = v[2]
			func(msg)
		end
	end
	
	class.sp:init(msg)
	class.sp:initBanCommands()
end)

cl:run("Bot "..token)
