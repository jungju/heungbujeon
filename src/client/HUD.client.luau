local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MainHUD"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local label = Instance.new("TextLabel")
label.Name = "StatusLabel"
label.Size = UDim2.new(0, 320, 0, 50)
label.Position = UDim2.new(0.5, -160, 0, 20)
label.BackgroundTransparency = 0.35
label.TextScaled = true
label.Text = "흥부전 준비 중"
label.Parent = screenGui
