--// Don't edit the settings! otherwise it will break.

local maps = {
	["Brandon Works"] = CFrame.new(-369.4569091796875, 162.9825210571289, -1364.804443359375),
	["c00lcarnival(bluuversionthesame)"] = CFrame.new(2302.125, 545.88653564453125, -116.4000015258789),
	["Glass Houses"] = CFrame.new(416.0000305175781, 3364.75, -641),
	["Horror Hotel"] = CFrame.new(-451.9540100097656, 5563.06591796875, -231.4400177001953),
	["Pirate Bay"] = CFrame.new(-367.08935546875, 258, -134.94009399414062),
	["Planet Voss"] = CFrame.new(1075.135009765625, 3197.375, -31.01966094970703),
	["The Tempest"] = CFrame.new(96.73905944824219, 4079.81591796875, 163.37112426757812),
	["Ultimate Assasin Grounds"] = CFrame.new(-36.013519287109375, 210.37525177001953, 376.5317687988281),
	["Pizza Place"] = CFrame.new(-165.7585906982422, 1344.257080078125, 210.87908935546875),
	["Yoricksplace"] = CFrame.new(-301.19097900390625, 600.296875, -1014.4859619140625),
	["test Works"] = CFrame.new(-369.4569091796875, 162.9825210571289, -1364.804443359375),
}

--// CREATE GUI
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ForsakenMapSelector"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 450)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 50)
title.Position = UDim2.new(0, 20, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Forsaken Map Selector"
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainFrame

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -45, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeBtn

-- Close behavior
closeBtn.MouseButton1Click:Connect(function()
	mainFrame:TweenPosition(UDim2.new(0.5, -175, 1.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
	wait(0.5)
	screenGui:Destroy()
end)

-- Scroll frame for buttons
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -20, 1, -70)
scrollFrame.Position = UDim2.new(0, 10, 0, 60)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 6
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollFrame.Parent = mainFrame

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 8)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = scrollFrame

-- Function to make a nice button
local function createButton(name, cframe)
	local button = Instance.new("TextButton")
	button.Name = name
	button.Size = UDim2.new(0.9, 0, 0, 40)
	button.BackgroundColor3 = Color3.fromRGB(70, 120, 255)
	button.Text = name
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Font = Enum.Font.GothamMedium
	button.TextSize = 20
	button.AutoButtonColor = false

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = button

	-- Hover effect
	button.MouseEnter:Connect(function()
		button.BackgroundColor3 = Color3.fromRGB(90, 140, 255)
	end)

	button.MouseLeave:Connect(function()
		button.BackgroundColor3 = Color3.fromRGB(70, 120, 255)
	end)

	-- Teleport on click
	button.MouseButton1Click:Connect(function()
		local char = player.Character or player.CharacterAdded:Wait()
		local hrp = char:WaitForChild("HumanoidRootPart")
		hrp.CFrame = cframe
	end)

	button.Parent = scrollFrame
end

-- Create each map button
for mapName, teleportCFrame in pairs(maps) do
	createButton(mapName, teleportCFrame)
end
