## ☀️ Personal Weather & Time Menu


### 🔧 Command
Command ingame: /ownweather

---
### 📦 Requirements
-  [ox_lib](https://github.com/overextended/ox_lib)
-  ESX only
---


### 🌦️ Options
**Time:**
- Morning (06:00)
- Noon (12:00)
- Afternoon (16:00)
- Evening (21:00)

**Weather:**
- Clear
- Rain
- Thunder
- Snow


### 📬 Discord Logging


Automatically sends a log to your webhook with:
- Player name
- Steam hex
- FiveM license
- Selected weather/time
- Thumbnail

> Edit the webhook in `server.lua`

local webhookURL =  'YOUR_WEBHOOK_HERE'
avatar_url =  "YOUR_OWN_THUMBNAIL"
