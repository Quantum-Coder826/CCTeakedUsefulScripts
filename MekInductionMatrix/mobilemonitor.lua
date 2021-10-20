-- vars
i = 0

-- start code
rednet.open("back")
host = rednet.lookup("test")

while true do
    local event, sender, message = os.pullEvent("rednet_message")
    if sender == host then
        for word in string.gmatch(message..tostring(message), '([^,]+)') do
            print(word)
        end
    end
end