ESX = nil
local playersProcessingCannabis = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_oranges:sellOrange')
AddEventHandler('esx_oranges:sellOrange', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.Allrounditems[itemName]
	local xItem = xPlayer.getInventoryItem(itemName)

	if not price then
		print(('esx_drugs: %s hat versucht ein Item zu verkaufen was er nicht hat'):format(xPlayer.identifier)) --Edit this. Thats show you a Notification in your console when someone try to sell  a item that he doenst have
		return
	end

	if xItem.count < amount then
		TriggerClientEvent('esx:showNotification', source, _U('allrounddealer_notenough'))
		return
	end

	price = ESX.Math.Round(price * amount)

	if Config.BlackMoney then
		xPlayer.addAccountMoney('black_money', price)
	else
		xPlayer.addMoney(price)
	end

	xPlayer.removeInventoryItem(xItem.name, amount)

	TriggerClientEvent('esx:showNotification', source, _U('allrounddeal_sold', amount, xItem.label, ESX.Math.GroupDigits(price)))
end)













