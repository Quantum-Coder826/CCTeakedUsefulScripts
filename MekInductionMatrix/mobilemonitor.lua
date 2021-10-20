-- vars
chunks = {}

-- start code
rednet.open("back")
host = rednet.lookup("matrix", "Host")

while true do
    local event, message, sender = os.pullEvent("rednet_message")
    if sender == host then
        
        for word in string.gmatch(message, '([^,]+)') do
            print(word)
        end
    end
end