local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

conti = Tunnel.getInterface("conti_arsenal")

CreateThread(function()
    while true do
        Wait(idle)
        if not HasStreamedTextureDictLoaded("marker") then
			RequestStreamedTextureDict("marker", true)
			while not HasStreamedTextureDictLoaded("marker") do
				Wait(1)
			end
		else
            for k, v in pairs(Config.blips) do
                if #(GetEntityCoords(PlayerPedId()) - vec3(v.blip.x,v.blip.y,v.blip.z)) < 3 then
                    idle = 5
                    DrawMarker(9, v.blip.x,v.blip.y,v.blip.z, 0.0, 0.0, 0.0, 0.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "marker", "marker", false)
                    if IsControlJustPressed(0, 38) then
                        if conti.permissao(v.permissao) then
                            armas = json.encode(Config.armas)
                            SetNuiFocus(true, true)
                            SendNUIMessage({
                                action = "show",
                                arma = armas,
                                imagem = Config.imagensHospedagem
                            })
                        end
                    end
                end
            end
		end
    end
end)

RegisterNUICallback("focusFalse", function(data, cb)
    SetNuiFocus(false, false)
end)

RegisterNUICallback("botao-armas", function(data,cb)
    TriggerServerEvent("conti_arsenal:equipar", data.arma)
end)

RegisterNUICallback("botao-kit", function()
    TriggerServerEvent("conti_arsenal:kit")
end)

RegisterNUICallback("botao-remover", function()
    TriggerServerEvent("conti_arsenal:remover")
end)

RegisterNUICallback("botao-colete", function()
    TriggerServerEvent("conti_arsenal:colete")
end)
