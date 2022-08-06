-- local vars
local wantedProtocol = "battery" -- sets the protocol

-- local fuctions
local function newline()
    local x, y = term.getCursorPos()
    term.setCursorPos(1, y + 1)
end

-- the code
rednet.open("back")

