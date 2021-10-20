-- vars
chunks = {}

-- start code
rednet.open("back")
host = rednet.lookup("matrix", "Host")

while true do
    local event, sender, message = os.pullEvent("rednet_message")
    if sender == host then
        print(message .. tostring(message))
    end
end