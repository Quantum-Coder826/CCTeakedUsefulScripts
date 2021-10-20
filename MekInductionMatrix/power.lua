-- periferals and vars
cell = "inductionMatrix_0"
monitor = "monitor_0"
modem = peripheral.wrap("back")
 
protocol = "test"
 
-- start code
print("Mekanism InductionMatrix PowerTracker \n \nBy QByte")

rednet.open("left")
rednet.host(protocol, "Host")

function convert(n) -- Corrects for RF Counter
if n >= 10^15 then
        return string.format("%.2f PFE", n / 10^15)
    elseif n >= 10^12 then
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
    -- Get all data
    local CurrentPower = modem.callRemote(cell,"getEnergy")
    local MaxPower = modem.callRemote(cell,"getMaxEnergy")
    local Input = modem.callRemote(cell,"getLastInput")
    local Output = modem.callRemote(cell,"getLastOutput")
    local Percantage = math.floor(modem.callRemote(cell,"getEnergyFilledPercentage") * 100)
 
    -- format data for remote monitor
    remote = CurrentPower .. "," .. MaxPower .. "," .. Input .. "," .. Output .. "," .. Percantage
    rednet.broadcast(remote, protocol)

    -- format data for local monitor
    local CurrentPower = convert(CurrentPower)
    local MaxPower = convert(MaxPower)
    local Input = convert(Input)
    local Output = convert(Output)
    
    -- setup monitor
    modem.callRemote(monitor,"clear");modem.callRemote(monitor,"setCursorPos",1,1)
    modem.callRemote(monitor,"write","InductionMatrix:")
 
    -- write curret power and maximum power
    modem.callRemote(monitor,"setCursorPos",1,2)
    modem.callRemote(monitor,"write",(CurrentPower.."/"..MaxPower))
 
    -- write percantage filled
    modem.callRemote(monitor,"setCursorPos",modem.callRemote(monitor,"getCursorPos")+1,2)
    modem.callRemote(monitor,"write",(Percantage.."%"))
 
    -- write current power input and output
    modem.callRemote(monitor,"setCursorPos",1,3)
    modem.callRemote(monitor,"write",("In:"..Input.."/t"))
    modem.callRemote(monitor,"setCursorPos",1,4)
    modem.callRemote(monitor,"write",("Out:"..Output.."/t"))
    
    
    -- Only Debug
    modem.callRemote(monitor,"setCursorPos",1,5)
    modem.callRemote(monitor,"write",(remote))


    sleep(0,8) -- Wait a bit to not overload periferals
end