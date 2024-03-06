local CheckpointsFolder = script.LinkToFolder.Value --ObjectValue со ссылкой на папку с чекпоинтами.

--[[Код на загрузку игрока и на событие создания его персонажа.
	Когда персонаж будет создан, скрипт узнает текущее значение стадии игрока и если оно больше 0,
то игрока переместит на последний чекпоинт. Иначе игрок появится на SpawnLocation.
]]
game.Players.PlayerAdded:Connect(function (player)
	player.CharacterAdded:Connect(function (character)
		repeat task.wait() until character:WaitForChild("HumanoidRootPart")
		local PlayerCurrentPoint:IntValue = player:FindFirstChild("leaderstats"):FindFirstChild("Points")
		if PlayerCurrentPoint.Value > 0 then
			local LastCheckpoint:Part = CheckpointsFolder:FindFirstChild(PlayerCurrentPoint.Value)
			character:PivotTo(LastCheckpoint.CFrame)
			character:MoveTo(LastCheckpoint.Position + Vector3.new(0, 1, 0))
		end
	end)
end)

--[[Код на сохранение последнего чекпоинта.
	Он будет сохранять номер чекпоинта при касании игроком. Если игрок касается него и номер чекпоинта
больше чем был сохранён игроком, то номер чекпоинта будет сохранён за игроком.
]]
for _, checkpoint in CheckpointsFolder:GetChildren() do
	if not checkpoint:IsA("Part") then continue end
	checkpoint.Touched:Connect(function (hit)
		local TouchedPlayer = game.Players:GetPlayerFromCharacter(hit.Parent)
		if not TouchedPlayer then return end
		local PlayerCurrentPoint:IntValue = TouchedPlayer:FindFirstChild("leaderstats"):FindFirstChild("Points")
		local CheckpointNum = tonumber(checkpoint.Name)
		if CheckpointNum > PlayerCurrentPoint.Value then
			PlayerCurrentPoint.Value = CheckpointNum
		end
	end)
end

--[[Также можно использовать этот скрипт с системой DataStore для сохранения информации игрока.]]
