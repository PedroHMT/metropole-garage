function getSteamHex(source)
    local steamHexID = ''
    local identificadores = GetPlayerIdentifiers(source)
    for i = 1, #identificadores do
        local a = identificadores[i]
        if string.sub(a, 1, 6) == "steam:" then
            steamHexID = a
        end
    end
    return steamHexID
end

RegisterNetEvent('metro-garage:queryCarrosP')
AddEventHandler('metro-garage:queryCarrosP', function()
    local src = source
    local steamHexID = getSteamHex(source)
    exports.oxmysql:execute([[
    select v.id, m.model_name as 'modelname', m.model_spawn as 'model', v.cor, v.tuning, v.onGarage, v.placa from vehicles v 
    inner join models m on m.id = v.model_id
    inner join players p on p.id = v.player_id
    where p.steamHex = ?   
    ]], {steamHexID}, function(result)
    for i = 1, #result do
        result[i].cor = json.decode(result[i].cor)
        result[i].tuning = json.decode(result[i].tuning)
    end
    TriggerClientEvent('metro-garage:dadosCarrosP', src, result or {})
    end)
end)

RegisterCommand("car", function(source, p)
    if not IsPlayerAceAllowed(source, "metro-garage.perm") then
        print('[ERRO] Falta de permissão para execução.')
        return
    end

    local placa = p[1]
    if not placa then
        print("[ERRO] Tentativa de spawn sem informar placa.")
        return
    end

    exports.oxmysql:execute([[
        select v.id, m.model_name as 'modelname', m.model_spawn as 'model', v.cor, v.tuning, v.onGarage, v.placa from vehicles v 
        inner join models m on m.id = v.model_id
        inner join players p on p.id = v.player_id
        where v.placa = ?
    ]], {placa}, function(result)
        if #result == 0 then
            print("[ERRO] Tentativa de spawn com placa inválida.")
            return
        end

        for i = 1, #result do
            result[i].cor = json.decode(result[i].cor)
            result[i].tuning = json.decode(result[i].tuning)
        end

        TriggerClientEvent('metro-garage:spawnAdminCar', source, result[1])
    end)
end)