-- local vars
local wantedProtocol = "battery" -- sets the protocol to look for
local monitor = peripheral.find("monitor_0") -- the name for the connected monitor


-- local fuctions
local function termNewline()
    local x, y = term.getCursorPos()
    term.setCursorPos(1, y + 1)
end

local function monitorNewline()
    local x, y = monitor.getCursorPos()
    monitor.setCursorPos(1, y + 1)
end

-- the code
rednet.open("back")

while true do
    local event, sender, message, protocol = os.pullEvent("rednet_message")
    if protocol == wantedProtocol then
        local data = textutils.unserialise(message)
    
        if pocket then
            -- print data to the terminal
            term.clear();term.setCursorPos(1,1) -- reset the terminal
            term.write("Inducionmatrix:")
            termNewline()
            term.write(data["CurrentPower"] .. "/" .. data["MaxPower"] .. " " .. data["Percent"] .. "%")
            termNewline()
            term.write("In:" .. data["Input"] .. "/t")
            termNewline()
            term.write("Out:" .. data["Output"] .. "/t")
        else
            -- print data to connecter monitor
            monitor.clear();monitor.setCursorPos(1,1)
            monitor.write("Inductionmatrix:")
            monitorNewline()
            monitor.write(data["CurrentPower"] .. "/" .. data["MaxPower"] .. " " .. data["Percent"] .. "%")
            monitorNewline()
            monitor.write("In:" .. data["Input"] .. "/t")
            monitorNewline()
            monitor.write("Out:" .. data["Output"] .. "/t")
        end
    end
  end