-- Service references
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

-- Remote event
local BulletRemote = ReplicatedStorage:WaitForChild("TREKRemotes"):WaitForChild("BulletRemote")

-- Global flag
getgenv().AutoShakeEnabled = false

-- Fungsi untuk shake musuh
local function shootPlayer(target)
    if not target or target == LocalPlayer then return end
    local char = target.Character
    local myChar = LocalPlayer.Character
    if not char or not myChar then return end

    local targetHead = char:FindFirstChild("Head")
    local myHead = myChar:FindFirstChild("Head")
    if not targetHead or not myHead then return end

    local args = {
        [1] = myHead.Position,
        [2] = targetHead.Position,
        [3] = Color3.new(0.996, 0.741, 0.2),
        [4] = targetHead,
        [5] = 1000
    }

    BulletRemote:FireServer(unpack(args))
    print(">> Pranked enemies:", target.Name)
end

-- Fungsi loop auto shake screen
task.spawn(function()
    while task.wait(0.3) do
        if getgenv().AutoShakeEnabled then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Team ~= LocalPlayer.Team then
                    shootPlayer(player)
                end
            end
        end
    end
end)

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "Prank Screen Enemy"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 140, 0, 60)
Frame.Position = UDim2.new(0, 20, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Active = true
Frame.Draggable = true
Frame.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0.5, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "by DistiC"
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18

local ToggleButton = Instance.new("TextButton", Frame)
ToggleButton.Size = UDim2.new(1, 0, 0.5, 0)
ToggleButton.Position = UDim2.new(0, 0, 0.5, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Text = "Prank [OFF]"
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 16
ToggleButton.BorderSizePixel = 0
ToggleButton.BackgroundTransparency = 0.2

ToggleButton.MouseButton1Click:Connect(function()
    getgenv().AutoShakeEnabled = not getgenv().AutoShakeEnabled
    ToggleButton.Text = "Prank [" .. (getgenv().AutoShakeEnabled and "ON" or "OFF") .. "]"
    ToggleButton.BackgroundColor3 = getgenv().AutoShakeEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(20, 20, 20)
end)
