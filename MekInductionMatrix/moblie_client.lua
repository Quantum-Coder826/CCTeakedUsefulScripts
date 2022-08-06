-- local vars
local wantedProtocol = "battery" -- sets the protocol

-- local fuctions
local function newline()
    local x, y = term.getCursorPos()
    term.setCursorPos(1, y + 1)
end

-- the code
rednet.open("back")

while true do
    local event, sender, message, protocol = os.pullEvent("redent_message") -- set the rednet_message event
    if protocol == wantedProtocol then

        local data = textutils.unserialise(message)
        term.clear();term.setCursorPos(1,1) -- reset screen

        term.write("InducionMatrix:") -- write all te data
        newline()
        term.write(data["CurrentPower"] .. "/" .. data["MaxPower"] .. " " .. data["Percent"] .. "%")
        newline()
        term.write("In: " .. data["Input"] .. "/t")
        newline()
        term.write("Out: " .. data["Output"] .. "/t")
    end
end