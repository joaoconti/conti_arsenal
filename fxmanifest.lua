fx_version 'adamant'
game 'gta5'

author 'Conti#0345'
description 'Empregos'
version '1.0.0'

client_scripts {
    '@vrp/lib/utils.lua',
    'cfg/conti_config.lua',
    'conti_client.lua'
}

server_script {
    '@vrp/lib/utils.lua',
    'cfg/conti_config.lua',
    'conti_server.lua'
}

ui_page 'nui/index.html'

files {
    'nui/*',
    'nui/img/*',
    'stream/*'
}