--------------------------------------
------Created By Whit3Xlightning------
--https://github.com/Whit3XLightning--
--------------------------------------

local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

ESX.RegisterServerCallback('tutohacks:welcheRolle', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(xPlayer.getGroup())
end)

function sendToDiscord(title, message, footer)
	local embed = {
		  {
			  ["color"] = "#f50014",
			  ["title"] = "**".. title .."**",
			  ["description"] = message,
			  ["footer"] = {
			  ["text"] = footer,
			  },
		  }
	  }  
	PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = "Discord Logs", embeds = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("wld:sendtoDiscord")
AddEventHandler("wld:sendtoDiscord", function(titleembed, messagembed, footerembed)
    sendToDiscord(titleembed, messagembed, footerembed)
end)

--------------------------------------
-------Customized by TutoHacks--------
-----https://github.com/TutoHacks-----
--------------------------------------
