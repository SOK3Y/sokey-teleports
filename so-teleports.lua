RegisterNetEvent("SO:teleport", function(data)
    if data and data.coords then
        SetEntityCoords(PlayerPedId(), data.coords.x, data.coords.y, data.coords.z)
    end
end)
Citizen.CreateThread(function()
    for i=1, #(Config.Teleports or {}), 1 do
        local teleport = Config.Teleports[i]
        local zone = teleport.zone
        exports.qtarget:AddBoxZone(zone.name, zone.center, zone.length, zone.width, {
            name = zone.name,
            heading = zone.heading,
            debugPoly = false,
            minZ = zone.minZ,
            maxZ = zone.maxZ
        }, {
            options = {
                {
                    event = "SO:teleport",
                    icon = teleport.icon,
                    label = teleport.label,
                    coords = teleport.coords
                },
            },
            distance = 2
        })
    end
end)
