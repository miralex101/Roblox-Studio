local EatsList = require(game.ReplicatedStorage.Eats)
local ShopFrame = script.Parent
local Body = ShopFrame.Body
local ShopItemTemplate = game.ReplicatedStorage.ShopItemTemplate
local ErrorFrame = ShopFrame.Parent.ErrorFrame
local ErrorFrameText = ErrorFrame.TextLabel

function ShopItemCreator (Name, CostItem, Image)
	local NewShopItem = ShopItemTemplate:Clone()
	NewShopItem.Parent = Body
	local NewShopItemTextLabel = NewShopItem.TextLabel
	local NewShopItemCost = NewShopItem.Frame.Cost
	NewShopItemTextLabel.Text = Name
	NewShopItemCost.Text = CostItem
	NewShopItem.Image = Image
	return NewShopItem
end

-----Анимация появления фрейма с ошибкой-----
local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local NewTweenStart1 = TweenService:Create(ErrorFrame, tweenInfo, {BackgroundTransparency = 0})
local NewTweenStart2 = TweenService:Create(ErrorFrameText, tweenInfo, {TextTransparency = 0})
local NewTweenEnd1 = TweenService:Create(ErrorFrame, tweenInfo, {BackgroundTransparency = 1})
local NewTweenEnd2 = TweenService:Create(ErrorFrameText, tweenInfo, {TextTransparency = 1})
---------------------------------------------

local ShopRemoteFunction = game.ReplicatedStorage.ShopRemoteFunction
local Active = true
for index, data in EatsList do
	local NewShopItem = ShopItemCreator(data.Name, data.Cost, data.Image)
	NewShopItem.Activated:Connect(function ()
		if not Active then return end
		local NewItemRemoteFunction = ShopRemoteFunction:InvokeServer(index)
		local message = tostring(NewItemRemoteFunction)
		if message == "Not enough money for this purchase!" then --Если приходит сообщение от сервера, значит не хватило денег!
			ErrorFrameText.Text = NewItemRemoteFunction
			NewTweenStart1:Play()
			NewTweenStart2:Play()
			Active = false
			task.wait(2)
			NewTweenEnd1:Play()
			NewTweenEnd2:Play()
			task.wait(1)
			Active = true
		end
	end)
end
