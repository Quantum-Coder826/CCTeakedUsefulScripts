--Peripherals/variables
reactor = peripheral.wrap("back")

while (reactor.getDamagePercentage() * 100) => 1 do
    reactor.scram() and redstone.setAnalogOutput(1, "left")
end

