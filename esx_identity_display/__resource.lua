resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description "esx_identity_display"

version "1.0.0"

client_scripts {
	"client.lua",
	'config.lua',
	"locales/fr.lua"
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	'@es_extended/locale.lua',
	"server.lua"
}

ui_page "html/ui.html"

files {
	"html/ui.html",
	"html/css/ui_style.css",
	"html/js/jquery-3.4.1.min.js",
	"html/img/id_card.png"
}