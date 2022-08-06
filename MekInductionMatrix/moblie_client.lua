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
        -- todo: write to the monitor
        print(textutils.unserialise(message))
    
    end
  end