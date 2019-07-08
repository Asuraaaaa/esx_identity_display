identity = {}
ESX      = nil

Citizen.CreateThread(function()
	local name = GetPlayerName(PlayerId())
	local serverId = GetPlayerServerId(PlayerId())
	
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(100)
	
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

RegisterNetEvent("displaymenu:callBackShowHisCard")
AddEventHandler("displaymenu:callBackShowHisCard", function(data)	
	SendNUIMessage({
		action = "showIDCard",
		sex = data.sex,
		firstname = data.firstname,
		lastname = data.lastname,
		dateofbirth = data.dateofbirth,
		height = data.height
	})
	Wait(100)
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

AddEventHandler("displaymenu:showHisCardToPlayer", function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			
	if closestPlayer == -1 or closestDistance > 3.0 then
		ESX.ShowNotification(Locales[Config.Locale].no_players)
		return
	end
	
	TriggerServerEvent("displaymenu:showHisCard", serverId, identity, GetPlayerServerId(closestPlayer))
	Wait(100)
end)

RegisterNUICallback('stopShowingCard', function(data)
    if data.show == "false" then
		SetNuiFocus(false, false);
	end
end)