
Config = {}

Config.imagensHospedagem = 'http://localhost/imagens/itens' -- Imagens do xamp

Config.blips = {
    [1] = {
        blip = {x= 487.03, y= -996.99, z= 30.69}, -- Coordenada do blip
        permissao = 'policia.permissao', -- Permissão do blip
    } 
}

Config.armas = { -- Armas do arsenal | nome = Nome da arma | Arma = Spawn da arma | Muncao = Munição da arma | Permissao = Permissão de quem pode pegar a arma | Index = Nome da Imagem da arma
    {nome= 'Combat Pistol', arma= 'WEAPON_COMBATPISTOL', municao= 250, permissao='policia.permissao', index='Combat-pistol'},
    {nome= 'Smg', arma= 'WEAPON_SMG', municao= 250, permissao='policia.permissao', index='smg'},
    {nome= 'Combat PDW', arma= 'WEAPON_COMBATPDW', municao= 250, permissao='policia.permissao', index='combat-pdw'},
    {nome= 'Assault smg', arma= 'WEAPON_ASSAULTSMG', municao= 250, permissao='policia.permissao', index='assault-smg'},
    {nome= 'Shotgun', arma= 'WEAPON_ASSAULTSMG', municao= 250, permissao='policia.permissao', index='shotgun'},
    {nome= 'Carabine', arma= 'WEAPON_CARBINERIFLE_MK2', municao= 250, permissao='policia.permissao', index='carabine'},
    {nome= 'Carabine 2', arma= 'WEAPON_SPECIALCARBINE_MK2', municao= 250, permissao='policia.permissao', index='especial-carabine'},
}

Config.kit = { -- Kit básico | arna = Spawn da arma  | Quantidade = quantidade que vai receber
    {arma= 'WEAPON_FLASHLIGHT', quantidade = 1},
    {arma= 'WEAPON_NIGHTSTICK', quantidade = 1},
    {arma= 'WEAPON_STUNGUN', quantidade = 1},
}
















