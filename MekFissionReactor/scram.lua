--Peripherals/variables
reactor = peripheral.wrap("back")

print("Reactor Scram System")

while true do
    if reactor.getDamagePercent() * 100 >= 1 then 
    reactor.scram();redstone.setAnalogOutput("left", 1)
    reactor.setBurnRate(0.1)
    print("\nSCRAM!!")
    end
    sleep(0,8)
end
