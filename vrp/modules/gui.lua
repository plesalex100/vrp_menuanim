--- Method 1
-- EN: Before "function vRP.openMainMenu"
-- RO: Înainte de "function vRP.openMainMenu"
local seq_in = {
  {"cellphone@","cellphone_text_in",1},
  {"cellphone@","cellphone_text_read_base",1}
}
local seq_out = {
  {"cellphone@","cellphone_text_out",1}
}
local phoneAnim = {}

-- EN: At the end of the "vRP.openMainMenu"
-- RO: La sfârșitul funcției "vRP.openMainMenu"
  if not phoneAnim[source] then
    TriggerClientEvent("createPhone", source)
    vRPclient.playAnim(source,{true,seq_in,true})
  end
  phoneAnim[source] = true
  
-- EN: In first "if" from function "tvRP.closeMenu"
-- RO: La primul "if" al funcției "tvRP.closeMenu"
    if phoneAnim[source] then
      TriggerClientEvent("deletePhone", source)
      vRPclient.playAnim(source,{true,seq_out,false})
      phoneAnim[source] = false
    end


--- Method 2
-- EN: Replace functions "vRP.openMainMen" and "vRP.openMainMenu"
-- RO: Înlocuiește funcțiile "vRP.openMainMen" și "vRP.openMainMenu"

-- MAIN MENU

local seq_in = {
  {"cellphone@","cellphone_text_in",1},
  {"cellphone@","cellphone_text_read_base",1}
}
local seq_out = {
  {"cellphone@","cellphone_text_out",1}
}
local phoneAnim = {}

-- open the player main menu
function vRP.openMainMenu(source)
  vRP.buildMenu("main", {player = source}, function(menudata)
    menudata.name = "Main menu"
    menudata.css = {top="75px",header_color="rgba(0,125,255,0.75)"}
    vRP.openMenu(source,menudata) -- open the generated menu
  end)
  if not phoneAnim[source] then
    TriggerClientEvent("createPhone", source)
    vRPclient.playAnim(source,{true,seq_in,true})
  end
  phoneAnim[source] = true
end

-- SERVER TUNNEL API

function tvRP.closeMenu(id)
  local menu = client_menus[id]
  if menu and menu.source == source then
    if phoneAnim[source] then
      TriggerClientEvent("deletePhone", source)
      vRPclient.playAnim(source,{true,seq_out,false})
      phoneAnim[source] = false
    end
    -- call callback
    if menu.def.onclose then
      menu.def.onclose(source)
    end

    menu_ids:free(id)
    client_menus[id] = nil
    rclient_menus[source] = nil
  end
end
