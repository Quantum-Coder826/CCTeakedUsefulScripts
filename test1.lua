-- periferals Config
cell = peripheral.wrap("Back")
monitor = peripheral.wrap("Right")
 
-- Code Begin
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

while(true)
do
    -- current and maximum power in cell
    CurrentPower = convert(cell.getEnergy())
    MaxPower = convert(cell.getMaxEnergy())
    monitor.clear();monitor.setCursorPos(1,1)
    monitor.write(CurrentPower .. "/" .. MaxPower)

    -- percentage filled
    monitor.setCursorPos(20 ,1)
    monitor.write(math.floor(cell.getEnergyFilledPercentage() * 100) .. "%")
    sleep(0,8) -- sleep a bit othwerwise will overlode the periferals
end
 