--------------------------------------
------Created By Whit3Xlightning------
--https://github.com/Whit3XLightning--
--------------------------------------

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- register client event: delete all cars

RegisterNetEvent("wld:delallveh")
AddEventHandler("wld:delallveh", function ()
    local totalvehc = 0
    local notdelvehc = 0

    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then SetVehicleHasBeenOwnedByPlayer(vehicle, false) SetEntityAsMissionEntity(vehicle, false, false) DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then DeleteVehicle(vehicle) end
            if (DoesEntityExist(vehicle)) then notdelvehc = notdelvehc + 1 end
        end
        totalvehc = totalvehc + 1 
    end
    local vehfrac = totalvehc - notdelvehc .. " / " .. totalvehc
end)

-- register the command

RegisterCommand(Config.commandName, function(source, args, rawCommand) 
    ESX.TriggerServerCallback('tutohacks:welcheRolle', function(group) -- get the player group
        if group == "superadmin" then
            TriggerEvent("wld:delallveh", -1) -- trigger the client event
            TriggerEvent(Config.announceevent, "All Vehicles got deleted!")
            TriggerEvent('notifications', "#f50014", "Delete Vehicles", "You deleted all Vehicles!")
            TriggerServerEvent("wld:sendtoDiscord", "Delete all Vehicles successfully", "**Admin:** "..GetPlayerName(source).." ["..source"]", "wld_clearveh by Whit3Xlightning & TutoHacks")
        else
            TriggerEvent('notifications', "#f50014", "No Permissions", "You don't have the perms to delete all vehicles!")
        end
    end)
end, false)

--------------------------------------
-------Customized by TutoHacks--------
-----https://github.com/TutoHacks-----
--------------------------------------
