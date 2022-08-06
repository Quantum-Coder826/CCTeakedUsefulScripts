-- local vars
local wantedProtocol = "batter" -- sets the protocol

-- local fuctions
local function newline()
    local x, y = term.getCursorPos()
    term.setCursorPos(1, y + 1)
end

-- the code
while true do
    local event, sender, message, protocol = os.pullEvent("redent_message") -- set the rednet_message event
    if protocol == wantedProtocol then
        -- put te data on screen
        local data = textutils.unserialise(message)
        term.clear();term.setCursorPos(1,1) -- reset screen
    end
end