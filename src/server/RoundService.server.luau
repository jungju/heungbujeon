local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local GameConfig = require(Shared:WaitForChild("GameConfig"))
local GameState = require(Shared:WaitForChild("GameState"))

local currentState = GameState.WAITING

local function playerCount()
	return #Players:GetPlayers()
end

local function setState(state)
	currentState = state
	print("[RoundService] state =>", state)
end

local function waitForEnoughPlayers()
	setState(GameState.WAITING)
	while playerCount() < GameConfig.MinimumPlayers do
		task.wait(1)
	end
end

local function runIntermission()
	setState(GameState.INTERMISSION)
	for i = GameConfig.IntermissionSeconds, 1, -1 do
		print("[RoundService] intermission", i)
		task.wait(1)
	end
end

local function runRound()
	setState(GameState.ROUND)
	for i = GameConfig.RoundSeconds, 1, -1 do
		if i % 10 == 0 or i <= 5 then
			print("[RoundService] round time left", i)
		end
		task.wait(1)
	end
end

Players.PlayerAdded:Connect(function(player)
	print("[RoundService] player joined:", player.Name)
end)

Players.PlayerRemoving:Connect(function(player)
	print("[RoundService] player left:", player.Name)
end)

task.spawn(function()
	while true do
		waitForEnoughPlayers()
		runIntermission()
		runRound()
	end
end)
