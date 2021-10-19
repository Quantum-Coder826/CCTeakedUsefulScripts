-- vars
chunks = {}

-- start code
rednet.open("back")

while true do
    -- get data put it in string
    local event, message, protocol = os.pullEvent("rednet_message")
    if protocol == matrix then
        for substring in tostring(message):gmatch("%S+") do
            table.insert(chunks, substring)
        end
    end
    for k, v in pairs(chunks) do
        print(V[1])
    end
end