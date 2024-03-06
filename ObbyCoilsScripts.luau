--Cкрипты на пружинки для игр типа Obby.

--SpeedCoil:
local SpeedCoil = script.Parent
local BASE_CHARACTER_SPEED = game.StarterPlayer.CharacterWalkSpeed
local lastPlayer

SpeedCoil.Equipped:Connect(function ()
	lastPlayer = game.Players:GetPlayerFromCharacter(tool.Parent)
	local Humanoid = lastPlayer.Character:FindFirstChildWhichIsA("Humanoid")
	Humanoid.WalkSpeed *= 2
end)

SpeedCoil.Unequipped:Connect(function ()
	local Humanoid = lastPlayer.Character:FindFirstChildWhichIsA("Humanoid")
	Humanoid.WalkSpeed *= BASE_CHARACTER_SPEED
end)

--JumpCoil:
local JumpCoil = script.Parent
local BASE_CHARACTER_JUMP = game.StarterPlayer.CharacterJumpHeight
local lastPlayer

JumpCoil.Equipped:Connect(function ()
	lastPlayer = game.Players:GetPlayerFromCharacter(tool.Parent)
	local Humanoid = lastPlayer.Character:FindFirstChildWhichIsA("Humanoid")
	Humanoid.JumpHeight *= 2
end)

JumpCoil.Unequipped:Connect(function ()
	local Humanoid = lastPlayer.Character:FindFirstChildWhichIsA("Humanoid")
	Humanoid.JumpHeight *= BASE_CHARACTER_JUMP
end)

--GoldCoil:
local GoldCoil = script.Parent
local BASE_CHARACTER_SPEED = game.StarterPlayer.CharacterWalkSpeed
local BASE_CHARACTER_JUMP = game.StarterPlayer.CharacterJumpHeight
local lastPlayer

GoldCoil.Equipped:Connect(function ()
	lastPlayer = game.Players:GetPlayerFromCharacter(tool.Parent)
	local Humanoid = lastPlayer.Character:FindFirstChildWhichIsA("Humanoid")
	Humanoid.JumpHeight *= 2
	Humanoid.WalkSpeed *= 2
end)

GoldCoil.Unequipped:Connect(function ()
	local Humanoid = lastPlayer.Character:FindFirstChildWhichIsA("Humanoid")
	Humanoid.JumpHeight *= BASE_CHARACTER_JUMP
	Humanoid.WalkSpeed *= BASE_CHARACTER_JUMP
end)
