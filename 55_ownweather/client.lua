local function openWeatherTimeMenu()
    lib.registerContext({
        id = 'weather_time_menu',
        title = 'Personal Weather & Time',
        options = {
            {
                title = 'Set Time',
                description = 'Choose the time of day',
                menu = 'time_menu'
            },
            {
                title = 'Set Weather',
                description = 'Choose the weather type',
                menu = 'weather_menu'
            }
        }
    })

    lib.registerContext({
        id = 'time_menu',
        title = 'Set Time',
        menu = 'weather_time_menu',
        options = {
            {
                title = 'Morning (06:00)',
                onSelect = function()
                    NetworkOverrideClockTime(6, 0, 0)
                    lib.notify({ title = 'Time Changed', description = 'It is now morning', type = 'success' })
                    TriggerServerEvent('weatherlog:log', '⏰ Time Changed', 'Player: '..GetPlayerName(PlayerId())..'\nTime: 06:00')
                end
            },
            {
                title = 'Noon (12:00)',
                onSelect = function()
                    NetworkOverrideClockTime(12, 0, 0)
                    lib.notify({ title = 'Time Changed', description = 'It is now noon', type = 'success' })
                    TriggerServerEvent('weatherlog:log', '⏰ Time Changed', 'Player: '..GetPlayerName(PlayerId())..'\nTime: 12:00')
                end
            },
            {
                title = 'Afternoon (16:00)',
                onSelect = function()
                    NetworkOverrideClockTime(16, 0, 0)
                    lib.notify({ title = 'Time Changed', description = 'It is now afternoon', type = 'success' })
                    TriggerServerEvent('weatherlog:log', '⏰ Time Changed', 'Player: '..GetPlayerName(PlayerId())..'\nTime: 16:00')
                end
            },
            {
                title = 'Evening (21:00)',
                onSelect = function()
                    NetworkOverrideClockTime(21, 0, 0)
                    lib.notify({ title = 'Time Changed', description = 'It is now evening', type = 'success' })
                    TriggerServerEvent('weatherlog:log', '⏰ Time Changed', 'Player: '..GetPlayerName(PlayerId())..'\nTime: 21:00')
                end
            },
        }
    })

    lib.registerContext({
        id = 'weather_menu',
        title = 'Set Weather',
        menu = 'weather_time_menu',
        options = {
            {
                title = 'Clear',
                onSelect = function()
                    SetWeatherTypeNowPersist('CLEAR')
                    lib.notify({ title = 'Weather Changed', description = 'It is now sunny', type = 'success' })
                    TriggerServerEvent('weatherlog:log', '☀️ Weather Changed', 'Player: '..GetPlayerName(PlayerId())..'\nWeather: Clear (CLEAR)')
                end
            },
            {
                title = 'Snow',
                onSelect = function()
                    SetWeatherTypeNowPersist('XMAS')
                    lib.notify({ title = 'Weather Changed', description = 'It is now snowing', type = 'success' })
                    TriggerServerEvent('weatherlog:log', '❄️ Weather Changed', 'Player: '..GetPlayerName(PlayerId())..'\nWeather: Snow (XMAS)')
                end
            },
            {
                title = 'Rain',
                onSelect = function()
                    SetWeatherTypeNowPersist('RAIN')
                    lib.notify({ title = 'Weather Changed', description = 'It is now raining', type = 'success' })
                    TriggerServerEvent('weatherlog:log', '🌧️ Weather Changed', 'Player: '..GetPlayerName(PlayerId())..'\nWeather: Rain (RAIN)')
                end
            },
            {
                title = 'Thunder',
                onSelect = function()
                    SetWeatherTypeNowPersist('THUNDER')
                    lib.notify({ title = 'Weather Changed', description = 'It is now thundering', type = 'success' })
                    TriggerServerEvent('weatherlog:log', '⛈️ Weather Changed', 'Player: '..GetPlayerName(PlayerId())..'\nWeather: Thunder (THUNDER)')
                end
            },
        }
    })

    lib.showContext('weather_time_menu')
end

RegisterCommand('ownweather', function()
    openWeatherTimeMenu()
end)
