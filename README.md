# esx_identity_display #

Developing a server, I needed a script that allowed me to display a real ID card using the identity data managed by esx_identity. So I realized this little script.

version 1.1.0<br />

## Requirement: ##

* mysql-async
* esx_identity

## Installation: ##

1. add esx_identity_display to your resources directory.<br />
1. Add `start esx_identity_display` to your server.cfg.

## Feature: ##

* Display of an identity card. <br />
  * The display can be called in any menu script through the event: `TriggerEvent('displaymenu:displayIdCard')`
* Possibility to show his identity card to other players
  * The display can be called in any menu script through the event: `TriggerEvent('displaymenu:showHisCardToPlayer')`


<details>
  <summary>A nb_menu_perso usage exemple</summary>
  
1) Ajouter cela a la fin de nb menu perso
  
```
function displayCard()
 TriggerEvent('NB:closeAllSubMenu')
 TriggerEvent('NB:closeAllMenu')
 TriggerEvent('NB:closeMenuKey')

 TriggerEvent('displaymenu:displayIdCard')
end

function showHisCard()
	TriggerEvent('NB:closeAllSubMenu')
	TriggerEvent('NB:closeAllMenu')
	TriggerEvent('NB:closeMenuKey')
	
	TriggerEvent('displaymenu:showHisCardToPlayer')
end
```

2) ligne 257, ajouter cela:

` table.insert(elements, {label = 'Identité', value = 'menuperso_moi_identity'}) `

cela ressemble a ceci:

```
table.insert(elements, {label = 'Téléphone', value = 'menuperso_moi_telephone'})
table.insert(elements, {label = 'Identité', value = 'menuperso_moi_identity'})
table.insert(elements, {label = 'Inventaire', value = 'menuperso_moi_inventaire'})
table.insert(elements, {label = 'Mes factures', value = 'menuperso_moi_factures'})
```

3) ligne 271 ajouter cela:

```
if data2.current.value == 'menuperso_moi_identity' then
	displayCard()
end

cela ressemble a ceci:

if data2.current.value == 'menuperso_moi_telephone' then
	openTelephone()
end

if data2.current.value == 'menuperso_moi_identity' then
	displayCard()
end
						
if data2.current.value == 'menuperso_moi_inventaire' then
	openInventaire()
end

if data2.current.value == 'menuperso_moi_factures' then
	openFacture()
end
```

4) ligne 303 ajouter cela:

` {label = 'Montrer sa carte',  value = 'menuperso_montrer__carte'}, `

cela ressemble a cela:

```
{label = 'Montrer sa carte',  value = 'menuperso_montrer__carte'},
{label = 'Annuler l\'animation',  value = 'menuperso_actions__annuler'},
{label = 'Faire ses besoins',     value = 'menuperso_actions_pipi'},
{label = 'Animations de salutations',  value = 'menuperso_actions_Salute'},
{label = 'Animations  d\'humeurs',  value = 'menuperso_actions_Humor'},
{label = 'Animations de travail',  value = 'menuperso_actions_Travail'},
{label = 'Animations festives',  value = 'menuperso_actions_Festives'},
{label = 'Animations diverses',  value = 'menuperso_actions_Others'},
```

5) ligne 322, ajouter cela:

```
if data2.current.value == 'menuperso_montrer__carte' then
	showHisCard()
end
```

cela ressemble a cela: 

```
if data2.current.value == 'menuperso_actions__annuler' then
	local ped = GetPlayerPed(-1);
	if ped then
		ClearPedTasks(ped);
	end
end

if data2.current.value == 'menuperso_montrer__carte' then
	showHisCard()
end
							
if data2.current.value == 'menuperso_actions_pipi' then
	ESX.UI.Menu.CloseAll()
end
```

</details>
