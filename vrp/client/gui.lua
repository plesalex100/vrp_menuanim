RegisterNetEvent("createPhone")
AddEventHandler("createPhone", function()
    playerPed = GetPlayerPed(-1)
    coords = GetEntityCoords(playerPed)
    bone = GetPedBoneIndex(playerPed, 28422)
    phoneModel = GetHashKey("prop_npc_phone_02")
    Citizen.CreateThread(function()
        RequestModel(phoneModel)
	if not myPhone then
		myPhone = CreateObject(phoneModel, coords.x, coords.y, coords.z, true, true, false)
		AttachEntityToEntity(myPhone, playerPed, bone, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
	end
    end)
end)
RegisterNetEvent("deletePhone")
AddEventHandler("deletePhone", function()
	DeleteObject(myPhone)
	myPhone = nil
end)
