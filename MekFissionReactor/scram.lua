-- vars
local reactor = peripheral.find("fissionReactorLogicAdapter")
local i = 1

term.clear();term.setCursorPos(1,1)
term.write("Scram Monitoring system: ")
term.blit("RUNNING ", "dddddddd", "ffffffff")
term.setCursorBlink(true)

while true do -- monitoring loop
    if reactor.getDamagePercent() * 100 >= 1 then -- break when reactor is getting damaged
        break
    end

    if reactor.getWaste() >= 50 then -- break whan wast is backfilling
        break
    end
    sleep(0,7)
end

-- scram code
redstone.setOutput("right")
reactor.setBurnRate(0.1)
