-- periferals config
cell = "inductionMatrix_0"
monitor = "monitor_0"
modem = peripheral.wrap("back")

protocol = "null"

-- start code
print("Mekanism InductionMatrix PowerTracker \n \nBy QByte")

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
    -- Get all data format it and store in strings
    local CurrentPower = convert(modem.callRemote(cell,"getEnergy"))
    local MaxPower = convert(modem.callRemote(cell,"getMaxEnergy"))
    local Input = convert(modem.callRemote(cell,"getLastInput"))
    local Output = convert(modem.callRemote(cell,"getLastOutput"))
    local Percantage = math.floor(modem.callRemote(cell,"getEnergyFilledPercentage") * 100)

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
    sleep(0,8) -- Wait a bit to not overload periferals
end