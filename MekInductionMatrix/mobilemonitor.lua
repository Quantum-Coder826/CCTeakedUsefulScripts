-- vars
data = {}

-- start code
rednet.open("back")
host = rednet.lookup("test")

function convert(n) -- Corrects for RF Counter
if n >= 10^15 then
        return string.format("%.2f PFE", n / 10^15)
    elseif n >= 10^12 then
        return string.format("%.2f TFE", n / 10^12)
    elseif n >= 10^9 then
        return string.format("%.2f GFE", n / 10^9)
    elseif n >= 10^6 then
        return string.format("%.2f MFE", n / 10^6)
    elseif n >= 10^3 then
        return string.format("%.2f kFE", n / 10^3)
    else
        return tostring(n)
    end
end

while true do
    -- receve monitor data and format
    local event, sender, message = os.pullEvent("rednet_message")
    if sender == host then
        for word in string.gmatch(message, '([^,]+)') do
            table.insert(data, tonumber(word))
        end
    end
-- now we can write stuff to te screen
term.clear()
term.setCursorPos(1,1)
term.write("InductionMatrix:")

term.setCursorPos(1,2)
term.write(convert(tonumber(data[1])).."/"..convert(tonumber(data[2])))
end