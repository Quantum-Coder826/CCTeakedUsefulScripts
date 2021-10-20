-- vars
chunks = {}

-- start code
rednet.open("back")

while true do
    local event, message, protocol = os.pullEvent("rednet_message")
    if protocol == "marix" then
        
        for word in string.gmatch(message, '([^,]+)') do
            print(word)
        end
    end
end