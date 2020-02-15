-- LotAtc callbacks
net.log('[LOTATC] GameGUI loading...')


-- LotAtc
do
  local atc_loader_path = lfs.writedir() .. 'Mods\\tech\\LotAtc\\'
  local f = io.open( atc_loader_path .. 'lua\\lotatc_server.lua', 'r')
  if f then
    net.log("[LOTATC] LotAtc User Mod")
    f:close()
  else
    net.log("[LOTATC] LotAtc DCS Mod")
    atc_loader_path = '.\\Mods\\tech\\LotAtc\\'
  end
  dofile(atc_loader_path .. 'lua\\lotatc_config.lua')
  lotatc_inst.loader_path = atc_loader_path
  dofile(atc_loader_path .. 'lua\\lotatc_server.lua')
end
