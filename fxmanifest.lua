fx_version "cerulean"
game 'gta5'

ui_page 'html/index.html'

files {
  'html/index.html',
  'html/assets/*.js',
  'html/assets/*.css',
  'html/imgcars/*.webp'
}

author 'Pedro'
description 'Script de Garagem para Teste DEV Metropole'
version '1.0.0'

client_script 'client.lua'
server_script 'server.lua'

server_script '@oxmysql/lib/MySQL.lua'