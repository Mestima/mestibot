--[[
	The bot need not this class more.
	Feel free to delete this file.
]]

local emb  = require("./embed.lua")

local log = {}

function log:Send(msg)
	if string.sub(msg.content,1,1) ~= prefix then return end -- we need to log bot commands only!
	local channel = msg.client:getGuild("401864693704032256"):getChannel("412291174250840075")
	local user = msg.author
	local id = user.id
	emb:SendCurrent(channel,"MestiBot | Log",0xff0000,"",{{"User",user.mentionString.." ("..id..")",false},{"Message: ",msg.content,false}},"","",true)
end

return log