-- vars
i = 0

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
        for word in string.gmatch(message..tostring(message), '([^,]+)') do
            if i = 0 then CurrentPower = convert(word)
            elseif i = 1 then MaxPower = convert(word)
            elseif i = 2 then Input = convert(word)
            elseif i = 3 then Output = convert(word)
            elseif i = 4 then Percantage = convert(word)
            end
        end
    end

    
end