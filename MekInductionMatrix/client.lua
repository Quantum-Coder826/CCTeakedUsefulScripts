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
    local event, sender, message, protocol = os.pullEvent("rednet_message")
    if protocol == wantedProtocol then
        local data = textutils.unserialise(message)
        
        -- data to the terminal
        term.clear();term.setCursorPos(1,1) -- reset the terminal
        term.write("Inducionmatrix:")
        newline()
        term.write(data["CurrentPower"] .. "/" .. data["MaxPower"] .. " " .. data["Percent"] .. "%")
        newline()
        term.write("In:" .. data["Input"] .. "/t")
        newline()
        term.write("Out:" .. data["Output"] .. "/t")
    
    end
  end