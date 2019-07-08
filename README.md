# esx_identity_display #

Developing a server, I needed a script that allowed me to display a real ID card using the identity data managed by esx_identity. So I realized this little script.

version 1.0.0<br />

## Installation: ##

1. add esx_identity_display to your resources directory.<br />
1. Add `start esx_identity_display` to your server.cfg.

## Feature: ##

* Display of an identity card. <br />
  * The display can be called via any menu script through the event: `TriggerEvent('displaymenu:displayIdCard')`

## Feature to come: ##
* Possibility to show his identity card to other players
