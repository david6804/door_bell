ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local doorBell = { x = -203.23, y = -1309.01, z = 31.29, h = 180.44 }

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        local plyCoords = GetEntityCoords(PlayerPedId(), 0)
        local distance = #(vector3(doorBell.x, doorBell.y, doorBell.z) - plyCoords)
        if not IsPedInAnyVehicle(PlayerPedId(), true) then
            if distance < 1 then
                ESX.Game.Utils.DrawText3D(vector3(doorBell.x, doorBell.y, doorBell.z + 0.5), '[G] 服務鈴', 0.4)
                if IsControlJustReleased(0, 47) then
                    TriggerServerEvent('esx_phone:send', 'mechanic', '有客人按下服務鈴請回公司支援')
                    ESX.ShowNotification('~g~您按下了服務鈴,~n~請稍後人員前來為您服務!')
                end
            end
        end
    end
end)
