-- variables
protocol = "test"

-- get host
    host = rednet.lookup(protocol)

while true do
    term.clear();term.setCursorPos(1,1)
    term.write("InductionMatrix:")
    term.setCursorPos(1,2)
    
    local id, message = rednet.receive(protocol)
    if id == host then
        term.write(message)
    end
end