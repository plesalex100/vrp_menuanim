-- EN: Before "function vRP.openMainMenu"
-- RO: Înainte de "function vRP.openMainMenu"
local seq_in = {
  {"cellphone@","cellphone_text_in",1},
  {"cellphone@","cellphone_text_read_base",1}
}
local seq_out = {
  {"cellphone@","cellphone_text_out",1}
}

-- EN: At the end of the "vRP.openMainMenu"
-- RO: La sfârșitul funcției "vRP.openMainMenu"
  TriggerClientEvent("createPhone", source)
  vRPclient.playAnim(source,{true,seq_in,true})
  
-- EN: At the end of the function "tvRP.closeMenu"
-- RO: La sfârșitul funcției "tvRP.closeMenu"
  if menu.def.name == "Main menu" then
	  TriggerClientEvent("deletePhone", source)
	  vRPclient.playAnim(source,{true,seq_out,false})
  end
