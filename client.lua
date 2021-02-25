ESX = nil
local PlayerData = {}
local isMale = false
local isFemale = false
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)



RegisterCommand('polizia', function(source)


    TriggerEvent('skinchanger:getSkin', function(skin)
  
  
      local helmet = skin.helmet_1
      local gender = nil
      if skin.sex == 0 then
        isMale = true
      else
        isMale = false
      end
      if isMale then
        gender = 0
      else
        gender = 1
      end

  
      if helmet == -1 or ~ -1 then
        TriggerEvent('skinchanger:loadSkin', {
          sex = gender,
          tshirt_1 = 122,
          torso_1 = 139,
          torso_2 = 3,
          decals_1 = 0,
          arms = 4,
          pants_1 = 31,
          pants_2 = 0,
          shoes_1 = 24,
          shoes_2 = 0,
          ears_1 = 2,
          chain_1 = 0,
          mask_1 = 126,
	        mask_2 = 10,
          helmet_1 = 39,
	        helmet_2 = 0,
	        bags_1 = 0
        })
        end 
        exports['mythic_notify']:SendAlert('inform', 'Vestito Modificato!', 2500, { ['background-color'] = '#00453e', ['color'] = '#ffffff' })

    
    end)
  
  
  
  
  
  end)


function notify(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(text)
  DrawNotification(true, true)
end