Citizen.CreateThread(function()
    local alreadyAlerted = false 

    while true do
        Citizen.Wait(1000)

        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

        if IsPedInAnyVehicle(PlayerPedId(), false) then

            for i = -1, GetVehicleMaxNumberOfPassengers(vehicle) do
                local ped = GetPedInVehicleSeat(vehicle, i)
                if ped ~= 0 and IsPedArmed(ped, 7) then
                    SetCurrentPedWeapon(ped, "WEAPON_UNARMED", true)
                    
                    if not alreadyAlerted then
                        TriggerEvent('mythic_notify:client:SendAlert', {
                            type = 'error',
                            text = 'Araç içindeyken ateş edemezsiniz!',
                            length = 5000,
                            style = {['background-color'] = '#ff0000', ['color'] = '#ffffff'}
                        })
                        alreadyAlerted = true 
                    end
                    break 
                end
            end
        else
            alreadyAlerted = false 
        end
    end
end)
