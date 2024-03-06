local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")

function NewMovingPlatform (model:Model)
	local EndPosition = model.EndPosition
	EndPosition.Transparency = 1
	local MovingPlatform = model.MovingPart
	local AlignPosition = MovingPlatform.AlignPosition
	AlignPosition.Position = MovingPlatform.Position
	local AlignOrientation:AlignOrientation = MovingPlatform.AlignOrientation
	AlignOrientation.CFrame = MovingPlatform.CFrame
	local Time = (MovingPlatform.Position - EndPosition.Position).Magnitude/10
	local AnimInfo = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
	TweenService:Create(AlignPosition, AnimInfo, {Position = EndPosition.Position}):Play()
end

for _, model in CollectionService:GetTagged("MovingPlatformModel") do
	if not model:IsA("Model") then continue end
	NewMovingPlatform(model)
end
