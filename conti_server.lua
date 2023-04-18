local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface('vRP')

conti = {}
Tunnel.bindInterface("conti_arsenal", conti)


RegisterServerEvent("conti_arsenal:equipar")
AddEventHandler("conti_arsenal:equipar",function(arma)
    local source = source
    local user_id = vRP.getUserId(source)
    for k, v in pairs(Config.armas) do
        if arma == v.index then
            if vRP.hasPermission(user_id, v.permissao) then
                vRPclient.giveWeapons(source, {[v.arma] = { ammo = v.municao }})
                TriggerClientEvent("Notify",source,"sucesso","Você pegou uma "..v.nome,9000)
                return
            end
        end
    end
end)

RegisterServerEvent("conti_arsenal:kit")
AddEventHandler("conti_arsenal:kit",function()
    for k, v in pairs(Config.kit) do
        vRPclient.giveWeapons(source, {[v.arma] = { ammo = v.quantidade }})
    end
    TriggerClientEvent("Notify",source,"sucesso","Você pegou o kit básico")
end)

RegisterServerEvent("conti_arsenal:remover")
AddEventHandler("conti_arsenal:remover",function()
    local source = source
    vRPclient.setArmour(source,0)
	vRPclient._replaceWeapons(source,{["WEAPON_UNARMED"] = { ammo = 0 }})
    TriggerClientEvent("Notify",source,"sucesso","Você removeu todos os equipamentos")
end)

RegisterServerEvent("conti_arsenal:colete")
AddEventHandler("conti_arsenal:colete",function()
    local source = source
    vRPclient.setArmour(source,100)
	vRPclient._replaceWeapons(source,{["WEAPON_UNARMED"] = { ammo = 0 }})
    TriggerClientEvent("Notify",source,"sucesso","Você equipou o colete")
end)

function conti.permissao(p)
    local source = source
	local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, p) then
        return true
    else
        TriggerClientEvent("Notify",source,"Negado","Você não tem permissão")
        return false
    end
end