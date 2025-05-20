RegisterCommand("garagem", function()
    SetNuiFocus(true, true)
    SendNUIMessage({action = "abrir"})
    TriggerServerEvent("metro-garage:queryCarrosP")
end)

RegisterNUICallback("fechar", function(_, cb)
    SetNuiFocus(false, false)
    cb({})
end)

RegisterNUICallback("spawnCar", function(data, cb)
    SetNuiFocus(false, false)
    print(json.encode(data))
    local hash = GetHashKey(data.model)
    RequestModel(hash)
    -- Correção para carregar o veículo na primeira tentativa.
    while not HasModelLoaded(hash) do
        Wait(0)
    end

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local car = CreateVehicle(hash, coords.x, coords.y, coords.z + 1.0, heading, true, false)
    -- Define Plate
    SetVehicleNumberPlateText(car, data.placa)
    
    TaskWarpPedIntoVehicle(ped, car, -1)

    -- Reset Mod Kit
    SetVehicleModKit(car, 0)
    -- Engine
    SetVehicleMod(car, 11, data.tuning.motor)
    -- Wheels
    SetVehicleMod(car, 23, data.tuning.aro, false)
    -- Suspension
    SetVehicleMod(car, 15, data.tuning.suspensao)
    -- Brakes
    SetVehicleMod(car, 12, data.tuning.freio)
    -- Color
    SetVehicleCustomPrimaryColour(car, data.cor.r, data.cor.g, data.cor.b)

    cb({})
end)

RegisterNetEvent('metro-garage:dadosCarrosP')
AddEventHandler('metro-garage:dadosCarrosP', function(c)
    SendNUIMessage({
        action = 'dadosCarrosP',
        carros = c
    })
end)

RegisterNetEvent('metro-garage:spawnAdminCar')
AddEventHandler('metro-garage:spawnAdminCar', function(data)
    local hash = GetHashKey(data.model)
    RequestModel(hash)
    -- Correção para carregar o veículo na primeira tentativa.
    while not HasModelLoaded(hash) do
        Wait(0)
    end

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local car = CreateVehicle(hash, coords.x, coords.y, coords.z + 1.0, heading, true, false)
    SetVehicleNumberPlateText(car, data.placa)
    TaskWarpPedIntoVehicle(ped, car, -1)

    SetVehicleModKit(car, 0)
    SetVehicleMod(car, 11, data.tuning.motor)
    SetVehicleMod(car, 23, data.tuning.aro, false)
    SetVehicleMod(car, 15, data.tuning.suspensao)
    SetVehicleMod(car, 12, data.tuning.freio)
    SetVehicleCustomPrimaryColour(car, data.cor.r, data.cor.g, data.cor.b)
end)

RegisterNetEvent('metro-garage:log')
AddEventHandler('metro-garage:log', function(msg, steamHex)
    print(msg, steamHex)
end)