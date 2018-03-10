
local emb = {}

function emb:Send(msg,title,color,str)
	msg.channel:send({
		embed = {
			title = title,
			description = str,
			color = color
		}
	})
end

function emb:Send3Fields(msg,title,color,str,name1,name2,name3,content1,content2,content3,inline1,inline2,inline3,text,icon)
	msg.channel:send({
		embed = {
			title = title,
			description = str,
			color = color,
			fields = {
				{
					name = name1,
					value = content1,
					inline = inline1
				},
				{
					name = name2,
					value = content2,
					inline = inline2
				},
				{
					name = name3,
					value = content3,
					inline = inline3				
				}
			},
			footer = {
				text = text.." | "..tostring(os.date()),
				icon_url = icon
			}
		}
	})
end

function emb:SendCustom(msg,title,color,content,fiel,footertext,footericon,timestamp) -- fiel = {{name,content,inline},{name,content,inline},{name,content,inline}}
	local f = fiel
	local fie = {}
	local ts = ""
	local icon = footericon or ""
	local ftext = footertext or ""
	for k,v in pairs(f) do
		fie[k] = {name = v[1], value = v[2], inline = v[3]}
	end
	if timestamp == true then ts = " | "..tostring(os.date()) end
	
	msg.channel:send({
		embed = {
			title = title,
			description = content,
			color = color,
			fields = fie,
			footer = {
				text = ftext..ts,
				icon_url = icon
			}
		}
	})
	
end

function emb:SendCurrent(channel,title,color,content,fiel,footertext,footericon,timestamp) -- fiel = {{name,content,inline},{name,content,inline},{name,content,inline}}
	local f = fiel
	local fie = {}
	local ts = ""
	local icon = footericon or ""
	local ftext = footertext or ""
	for k,v in pairs(f) do
		fie[k] = {name = v[1], value = v[2], inline = v[3]}
	end
	if timestamp == true then ts = " | "..tostring(os.date()) end
	
	channel:send({
		embed = {
			title = title,
			description = content,
			color = color,
			fields = fie,
			footer = {
				text = ftext..ts,
				icon_url = icon
			}
		}
	})
	
end

return emb