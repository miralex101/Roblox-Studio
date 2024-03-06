local eatmodule = require(game.ReplicatedStorage.Eats)
game.Players.PlayerAdded:Connect(function (player)
	local PlayerData = Instance.new("Folder")
	PlayerData.Name = "PlayerData"
	PlayerData.Parent = player
	
	for i, data in eatmodule do
		local NewData = Instance.new("IntValue")
		NewData.Name = data.Name
		NewData.Value = 0
		NewData.Parent = PlayerData
	end
	
	local Leaderboard = Instance.new("Folder")
	Leaderboard.Name = "leaderstats"
	Leaderboard.Parent = player
	
	local PlayerMoney = Instance.new("IntValue")
	PlayerMoney.Name = "Money"
	PlayerMoney.Value = 100
	PlayerMoney.Parent = Leaderboard
end)

local ShopRemoteFunction = game.ReplicatedStorage.ShopRemoteFunction
ShopRemoteFunction.OnServerInvoke = function (player, index:number)
	if not eatmodule[index] then return end
	local NameItem = eatmodule[index].Name
	local CostItem = eatmodule[index].Cost
	local PlayerData : Folder = player.PlayerData
	local PlayerMoney : IntValue = player.leaderstats.Money
	if PlayerMoney.Value >= CostItem then
		PlayerMoney.Value -= CostItem
		local BuyedItem = PlayerData:FindFirstChild(NameItem)
		BuyedItem.Value += 1
		print(player, "has successfully purchased", NameItem .. "!")
		local success = tostring(player) .. " has successfully purchased " .. NameItem .. "!"
		return success
	else
		return "Not enough money for this purchase!"
	end
end
