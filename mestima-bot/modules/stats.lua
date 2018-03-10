--[[
	If you want to use this class, change api urls and tokens.
]]

local http = require("coro-http")
local json = require("./JSON.lua")

local stats = {}
stats.data = [[```Markdown
# [bots.discord.pw] %s
# [discordbots.org] %s
```]]

function stats:SendGuilds(msg)
	local guilds = #msg.client.guilds
	local data = {server_count = guilds}
	local jdata = json:encode(data)
	
	local headers = {
		{"Content-Type", "application/json"},
		{"Authorization", "token"}, -- token here
	}
	local headers2 = {
		{"Content-Type", "application/json"},
		{"Authorization", "token"}, -- token here
	}	
	local url = "https://bots.discord.pw/api/bots/398584082872926219/stats"
	local url2 = "https://discordbots.org/api/bots/398584082872926219/stats"
	local res, data_get = http.request("POST", url, headers, jdata)
	local res2, data_get2 = http.request("POST", url2, headers2, jdata)
	local game = {name = "for updated info...", type = 3}
	msg.client:setGame(game)	
	local game = {name = "for "..guilds.." guilds | !help", type = 3}
	msg.client:setGame(game)
end

function stats:GetMyData(msg)
		local headers = {
			{"Content-Type", "application/json"},
			{"Authorization", "token"}, -- token here
		}
		local url = "https://bots.discord.pw/api/bots/398584082872926219/stats"
		local res, data_get = http.request("GET", url, headers)
		
		local headers = {
			{"Content-Type", "application/json"},
			{"Authorization", "token"}, -- token here
		}
		url = "https://discordbots.org/api/bots/398584082872926219/stats"
		local res2, data_get2 = http.request("GET", url, headers2)
		
		self.data = string.format(self.data,data_get,data_get2)
		msg:reply(self.data)
end

return stats