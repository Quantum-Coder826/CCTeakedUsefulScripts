-- periferals config
modem = peripheral.wrap("back")
monitor = "monitor_3"

-- start code
modem.callRemote(monitor,"clear");modem.callRemote(monitor,"setCursorPos",1,1)
print("Mekanism FissionReactor ScramIndicator \n \nBy QByte")

while true do
  os.pullEvent("redstone")
  term.redirect(monitor)
end