-- vars for periferals and data
local data = {}
local battery = "inductionPort_0"
local monitor = "monitor_0"
local modem = peripheral.find("modem")

local protocol = "battery" -- sets the rednet protocol
local useterm = false -- set to true when not using a monitor

-- configure rednet
rednet.host(protocol, "battery_monitor")
rednet.open("right")

-- funcions
local function  correctquantity(n) -- correct int to str and apends proper quantity
    n = math.floor(n / 2.5) -- divide the value by 2.5 to convert from joules to FE
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
        return string.format("%.2f FE", n)
    end
end

local function NewLine()
    if useterm then
        local x, y = modem.callRemote(monitor, "getCursorPos")
        modem.callRemote(monitor, "setCursorPos", 1, y + 1)
    else
        local x, y = term.getCursorPos()
        term.setCursorPos(1, y + 1)
    end
end

while true do
    -- collect all the data
    data["CurrentPower"] =  correctquantity(modem.callRemote(battery, "getEnergy"))
    data["MaxPower"] = correctquantity(modem.callRemote(battery, "getMaxEnergy"))
    data["Input"] = correctquantity(modem.callRemote(battery, "getLastInput"))
    data["Output"] = correctquantity(modem.callRemote(battery, "getLastOutput"))
    data["Percent"] = math.floor(modem.callRemote(battery, "getEnergyFilledPercentage") * 100)
    
    -- send the data over rednet to receiving devices
    rednet.broadcast(textutils.serialise(data), protocol)
    
    if useterm then
        -- print data to termianl using term
        term.clear();term.setCursorPos(1,1) -- reset the terminal
        term.write("Inducionmatrix:")
        NewLine()
        term.write(data["CurrentPower"] .. "/" .. data["MaxPower"] .. " " .. data["Percent"] .. "%")
        NewLine()
        term.write("In:" .. data["Input"] .. "/t")
        NewLine()
        term.write("Out:" .. data["Output"] .. "/t")
    else
        -- print data to external monitor
        modem.callRemote(monitor, "clear");modem.callRemote(monitor, "setCursorPos",1,1) -- reset monitor
        modem.callRemote(monitor, "write", "InducionMatrix:")
        NewLine()
        modem.callRemote(monitor, "write", (data["CurrentPower"] .. "/" .. data["MaxPower"] .. " " .. data["Percent"] .. "%"))
        NewLine()
        modem.callRemote(monitor, "write", ("In:" .. data["Input"] .. "/t"))
        NewLine()
        modem.callRemote(monitor, "write", ("Out:" .. data["Output"] .. "/t"))
    end
end
