function getMyIdentity(name)
    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE name=@playerName  ORDER BY `identifier` DESC ;", {
        ['@playerName'] = name
    })
    if result[1] ~= nil then
		data = {
			sex			= result[1].sex,
			firstname 	= result[1].firstname,
			lastname 	= result[1].lastname,
			dateofbirth	= result[1].dateofbirth,
			height	 	= result[1].height
		}
        return data
    end
    return nil
end

RegisterServerEvent("displaymenu:askMyIdentity")
AddEventHandler("displaymenu:askMyIdentity", function(id)
	local source = source
	local name = GetPlayerName(id)
	
	TriggerClientEvent("displaymenu:callBackMyIdentity", source, getMyIdentity(name))
end)

RegisterServerEvent("displaymenu:showHisCard")
AddEventHandler("displaymenu:showHisCard", function(id, identity, target)
	TriggerClientEvent("displaymenu:callBackShowHisCard", target, identity)
end)