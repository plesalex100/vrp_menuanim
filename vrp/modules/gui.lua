-- EN: Before "function vRP.openMainMenu"
-- RO: Înainte de "function vRP.openMainMenu"
local seq_in = {
  {"cellphone@","cellphone_text_in",1},
  {"cellphone@","cellphone_text_read_base",1}
}
local seq_out = {
  {"cellphone@","cellphone_text_out",1}
}

-- EN: In function "vRP.openMainMenu"
-- RO: În funcția "vRP.openMainMenu"
  TriggerClientEvent("createPhone", source)
  vRPclient.playAnim(source,{true,seq_in,true})
  
-- EN: In function "tvRP.closeMenu"
-- RO: În funcția "tvRP.closeMenu"
  TriggerClientEvent("deletePhone", source)
  vRPclient.playAnim(source,{true,seq_out,false})
