--Peripherals/variables
reactor = peripheral.wrap("back")

while true do
    (reactor.getDamagePercent() * 100) = t
    if t => 1 do reactor.scram();redstone.setAnalogOutput("left", 1)
end
