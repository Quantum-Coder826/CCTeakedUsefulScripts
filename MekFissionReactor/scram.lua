--Peripherals/variables
reactor = peripheral.wrap("back")
scram = false

while true do
    if reactor.getDamagePercent() * 100 >= 1 then 
    reactor.scram(); redstone.setAnalogOutput("left", 1); reactor.setBurnRate(0.1)
    scram = true
    end
    
    term.clear();term.setCursorPos(1,1)
    term.write("Reactor Scram System")
    term.setCursorPos(3,1);term.write("Status:")
    if scram = true then
        term.setCursorPos(3,(term.getCursorPos() + 1))
        term.setTextColor(16384);term.write("SCRAM!!")
    end
    else
        term.setCursorPos(3,(term.getCursorPos() + 1))
        term.setTextColor(8192);term.write("Online") 
    end
    sleep(0,8)
end
