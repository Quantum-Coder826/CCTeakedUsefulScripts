-- vars
local i = 0

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
            if i == 0 then CurrentPower = convert(tonumber(word))
            elseif i == 1 then MaxPower = convert(tonumber(word))
            elseif i == 2 then Input = convert(tonumber(word))
            elseif i == 3 then Output = convert(tonumber(word))
            elseif i == 4 then Percantage = convert(tonumber(word))
            end
        end
    end
-- now we can write stuff to te screen
term.clear()
term.setCursorPos(1,1)
term.write("InductionMatrix:")

-- write current and maxpower
term.setCursorPos(1,2)
term.write(CurrentPower.."/"..MaxPower)

-- write percantage filled
term.setCursorPos(term.getCursorPos + 1,2)
term.write(Percantage.."%")
end