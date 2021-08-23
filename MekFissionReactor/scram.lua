--Peripherals/variables
reactor = peripheral.wrap("back")

print("Reactor Scram System")

while true do
    if reactor.getDamagePercent() * 100 >= 1 then  -- scram reactor when getting damage
    reactor.scram();redstone.setAnalogOutput("left", 1)
    reactor.setBurnRate(0.1)
    print("\nSCRAM!!")
    end

    if reactor.getWaste() >= 50 then -- scram reactor when wastetank start filling
    reactor.scram();redstone.setAnalogOutput("left", 1)
    reactor.setBurnRate(0.1)
    end
    sleep(0,8)
end
