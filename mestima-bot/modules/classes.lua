--[[
	Loading of all classes.
]]

local class = {}

class.memes 	= require("./memes/memes.lua")
class.admin 	= require("./admin.lua")
class.file 		= require("./file.lua")
class.json		= require("./JSON.lua")
class.mlib		= require("./mlib.lua")
class.sp		= require("./self_programming.lua")
class.roll		= require("./roll.lua")
class.RunString = require("./RunString.lua")
class.derpi		= require("./derpi.lua")
class.emb		= require("./embed.lua")
class.telegraph	= require("./telegraph.lua")
class.google	= require("./google.lua")
class.luarun	= require("./luarun.lua")
class.animals	= require("./random_animals.lua")
class.e621		= require("./e621.lua")
class.stats		= require("./stats.lua")
class.log		= require("./log.lua")
class.party		= require("./party.lua")
class.mafia		= require("./mafia.lua")
class.eco		= require("./economy.lua")
class.slot		= require("./slotmachine.lua")
class.hook		= require("./hooks.lua")

return class
