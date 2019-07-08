identity = {}

Citizen.CreateThread(function()
	local name = GetPlayerName(PlayerId())
	local serverId = GetPlayerServerId(PlayerId())
	TriggerServerEvent("displaymenu:askMyIdentity", serverId)
end)

RegisterNetEvent("displaymenu:callBackMyIdentity")
AddEventHandler("displaymenu:callBackMyIdentity", function(data)	
	identity = {
		sex			= Locales[Config.Locale].sex .. data.sex,
		firstname 	= Locales[Config.Locale].firstname .. data.firstname,
		lastname 	= Locales[Config.Locale].lastname .. data.lastname,
		dateofbirth	= Locales[Config.Locale].dateofbirth .. data.dateofbirth,
		height	 	= Locales[Config.Locale].height .. data.height
	}
end)

AddEventHandler("displaymenu:displayIdCard", function()
	SetNuiFocus(true, true);
	-- Préviens l'UI qu'il faut afficher la carte d'Identité
	SendNUIMessage({
		action = "showIDCard",
		sex = identity.sex,
		firstname = identity.firstname,
		lastname = identity.lastname,
		dateofbirth = identity.dateofbirth,
		height = identity.height
	})
	Wait(100)
end)

RegisterNUICallback('stopShowingCard', function(data)
    if data.show == "false" then
		SetNuiFocus(false, false);
	end
end)