-- periferals config
cell = "peripheralProxy:inductionMatrix_0"
monitor = peripheral.wrap("right")
modem = peripheral.wrap("back")

-- start code
monitor.clear();monitor.setCursorPos(1,1)

function convert(n) -- Corrects for RF Counter
if n >= 10^12 then
        return string.format("%.2f TFE", n / 10^12)
    elseif n >= 10^9 then
        return string.format("%.2f GFE", n / 10^9)
    elseif n >= 10^6 then
        return string.format("%.2f MFE", n / 10^6)
    elseif n >= 10^3 then
        return string.format("%.2f kFE", n / 10^3)
    else
        return tostring(n)
    end
end

while true do
    -- current and maximum power in cell
    CurrentPower = convert(modem.callRemote(cell,"getEnergy"))
    MaxPower = convert(modem.callRemote(cell,"getMaxEnergy"))
    monitor.clear();monitor.setCursorPos(1,1)
    monitor.write(CurrentPower.."/"..MaxPower)
    
    -- percentage filled
    monitor.setCursorPos(monitor.getCursorPos()+1,1)
    monitor.write(math.floor(modem.callRemote(cell,"getEnergyFilledPercentage") * 100) .. "%")

    -- RF per second input and output
    Input = convert(modem.callRemote(cell,"getLastInput"))
    Output = convert(modem.callRemote(cell,"getLastOutput"))
    monitor.setCursorPos(1,2)
    monitor.write("In:"..Input.."/t")
    monitor.setCursorPos(1,3)
    monitor.write("Out:"..Output.."/t")
    sleep(0,8) -- Wait a bit to not overload periferals
end