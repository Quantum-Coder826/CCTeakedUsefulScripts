-- vars
chunks = {}

-- start code
rednet.open("back")

while true do
    local event, message, protocol = os.pullEvent("rednet_message")
    if protocol ~= matrix then
        for substring in message:gmatch("%S+") do
            table.insert(chunks, substring)
        end

    end
end