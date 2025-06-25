local webhookURL = 'YOUR_WEBHOOK_HERE'

RegisterServerEvent('weatherlog:log')
AddEventHandler('weatherlog:log', function(title, description)
    local src = source
    local identifiers = GetPlayerIdentifiers(src)
    local steam, fivem = "Unknown", "Unknown"

    for _, id in ipairs(identifiers) do
        if id:match("steam:") then
            steam = id
        elseif id:match("license:") then
            fivem = id
        end
    end

    local playerName = GetPlayerName(src) or "Unknown"

    local fullDescription = string.format(
        "%s\n\n**Player:** %s\n**Steam:** %s\n**FiveM:** %s",
        description, playerName, steam, fivem
    )

    local embed = {
        {
            ["title"] = title,
            ["description"] = fullDescription,
            ["color"] = 16753920, -- Oranje
            ["thumbnail"] = {
                ["url"] = "YOUR_OWN_THUMBNAIL"
            },
            ["footer"] = {
                ["text"] = "Personal weather / time by 55 Development",
                ["icon_url"] = "YOUR_OWN_FOOTER"
            },
            ["timestamp"] = os.date('!%Y-%m-%dT%H:%M:%SZ')
        }
    }

    local payload = {
        username = "55 Development",
        embeds = embed,
        avatar_url = "YOUR_OWN_THUMBNAIL"
    }

    PerformHttpRequest(webhookURL, function(err, text, headers)
        if err ~= 204 then
            print('[WeatherLog] Error sending: ' .. tostring(text))
        end
    end, 'POST', json.encode(payload), { ['Content-Type'] = 'application/json' })
end)
