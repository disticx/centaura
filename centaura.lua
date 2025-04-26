-- Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create Window
local Window = Rayfield:CreateWindow({
   Name = "DisticHUB - Centaura v1.0",
   Icon = 0,
   LoadingTitle = "DisticHUB",
   LoadingSubtitle = "by Distic",
   Theme = "Default",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "DisticHUB",
      Subtitle = "Key System",
      Note = "The key is {DCHUB-123456789}",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"DCHUB-123456789"}
   }
})

-- Initial Notification
Rayfield:Notify({
   Title = "Distic",
   Content = "Welcome to my world!!!",
   Duration = 6.5,
   Image = 4483362458,
})

-- Create Tabs
local Tab = Window:CreateTab("Centaura", 4483362458)
local TabThe = Window:CreateTab("Theme", 4483362458)
local TabCre = Window:CreateTab("Credits", 4483362458)

-- Create Labels in Credit Tab
local Label = TabCre:CreateLabel("Made by Distic")
local Label2 = TabCre:CreateLabel("Follow me on Instagram @disticx_")

-- Create Theme Buttons
local Button10 = TabThe:CreateButton({
   Name = "Default",
   Callback = function()
      Window.ModifyTheme("Default")
   end,
})

local Button11 = TabThe:CreateButton({
   Name = "AmberGlow",
   Callback = function()
      Window.ModifyTheme("AmberGlow")
   end,
})

local Button11 = TabThe:CreateButton({
   Name = "Amethyst",
   Callback = function()
      Window.ModifyTheme("Amethyst")
   end,
})

local Button11 = TabThe:CreateButton({
   Name = "Bloom",
   Callback = function()
      Window.ModifyTheme("Bloom")
   end,
})

local Button11 = TabThe:CreateButton({
   Name = "DarkBlue",
   Callback = function()
      Window.ModifyTheme("DarkBlue")
   end,
})

local Button11 = TabThe:CreateButton({
   Name = "Green",
   Callback = function()
      Window.ModifyTheme("Green")
   end,
})

local Button11 = TabThe:CreateButton({
   Name = "Light",
   Callback = function()
      Window.ModifyTheme("Light")
   end,
})

local Button11 = TabThe:CreateButton({
   Name = "Ocean",
   Callback = function()
      Window.ModifyTheme("Ocean")
   end,
})

local Button11 = TabThe:CreateButton({
   Name = "Serenity",
   Callback = function()
      Window.ModifyTheme("Serenity")
   end,
})

-- Create Section
local Section = Tab:CreateSection("Main Menu")

-- ==== PRANK ENEMY SCRIPT ====

-- Service references
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Remote event
local BulletRemote = ReplicatedStorage:WaitForChild("TREKRemotes"):WaitForChild("BulletRemote")

-- Global flag
getgenv().AutoShakeEnabled = false

-- Function to shoot players
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
    print(">> Pranked enemy:", target.Name)
end

-- Loop to keep pranking
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

-- Create Toggle to enable/disable prank
local Toggle = Tab:CreateToggle({
   Name = "Prank Enemy (FE)",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      getgenv().AutoShakeEnabled = Value
      
      if Value then
          Rayfield:Notify({
             Title = "Prank Enemy",
             Content = "Prank on!",
             Duration = 4
          })
      else
          Rayfield:Notify({
             Title = "Prank Enemy",
             Content = "Prank off!",
             Duration = 4
          })
      end
   end,
})

-- ==== ESP SCRIPT (BELOW) ====

-- ESP color settings
_G.FriendColor = Color3.fromRGB(0, 0, 255)
_G.EnemyColor = Color3.fromRGB(255, 0, 0)
_G.UseTeamColor = true

-- Create ESP Button
local ESPButton = Tab:CreateButton({
   Name = "ESP Enemy",
   Callback = function()
      getgenv().ESPEnabled = true
      
      Rayfield:Notify({
         Title = "ESP Enemy",
         Content = "ESP on!",
         Duration = 4
      })
      
      -- Start ESP Script
      local Holder = Instance.new("Folder", game.CoreGui)
      Holder.Name = "ESP"

      local Box = Instance.new("BoxHandleAdornment")
      Box.Name = "nilBox"
      Box.Size = Vector3.new(1, 2, 1)
      Box.Color3 = Color3.new(100/255, 100/255, 100/255)
      Box.Transparency = 0.7
      Box.ZIndex = 0
      Box.AlwaysOnTop = false
      Box.Visible = false

      local NameTag = Instance.new("BillboardGui")
      NameTag.Name = "nilNameTag"
      NameTag.Enabled = false
      NameTag.Size = UDim2.new(0, 200, 0, 50)
      NameTag.AlwaysOnTop = true
      NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
      local Tag = Instance.new("TextLabel", NameTag)
      Tag.Name = "Tag"
      Tag.BackgroundTransparency = 1
      Tag.Position = UDim2.new(0, -50, 0, 0)
      Tag.Size = UDim2.new(0, 300, 0, 20)
      Tag.TextSize = 15
      Tag.TextColor3 = Color3.new(100/255, 100/255, 100/255)
      Tag.TextStrokeColor3 = Color3.new(0/255, 0/255, 0/255)
      Tag.TextStrokeTransparency = 0.4
      Tag.Text = "nil"
      Tag.Font = Enum.Font.SourceSansBold
      Tag.TextScaled = false

      local function LoadCharacter(v)
         repeat wait() until v.Character ~= nil
         v.Character:WaitForChild("Humanoid")
         local vHolder = Holder:FindFirstChild(v.Name)
         vHolder:ClearAllChildren()
         local b = Box:Clone()
         b.Name = v.Name.."Box"
         b.Adornee = v.Character
         b.Parent = vHolder
         local t = NameTag:Clone()
         t.Name = v.Name.."NameTag"
         t.Enabled = true
         t.Parent = vHolder
         t.Adornee = v.Character:WaitForChild("Head", 5)
         if not t.Adornee then
            return UnloadCharacter(v)
         end
         t.Tag.Text = v.Name
         b.Color3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
         t.Tag.TextColor3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
         local Update
         local function UpdateNameTag()
            if not pcall(function()
               v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            end) then
               Update:Disconnect()
            end
         end
         UpdateNameTag()
         Update = v.Character.Humanoid.Changed:Connect(UpdateNameTag)
      end

      local function UnloadCharacter(v)
         local vHolder = Holder:FindFirstChild(v.Name)
         if vHolder and (vHolder:FindFirstChild(v.Name.."Box") or vHolder:FindFirstChild(v.Name.."NameTag")) then
            vHolder:ClearAllChildren()
         end
      end

      local function LoadPlayer(v)
         local vHolder = Instance.new("Folder", Holder)
         vHolder.Name = v.Name
         v.CharacterAdded:Connect(function()
            pcall(LoadCharacter, v)
         end)
         v.CharacterRemoving:Connect(function()
            pcall(UnloadCharacter, v)
         end)
         v.Changed:Connect(function(prop)
            if prop == "TeamColor" then
               UnloadCharacter(v)
               wait()
               LoadCharacter(v)
            end
         end)
         LoadCharacter(v)
      end

      local function UnloadPlayer(v)
         UnloadCharacter(v)
         local vHolder = Holder:FindFirstChild(v.Name)
         if vHolder then
            vHolder:Destroy()
         end
      end

      for i, v in pairs(game:GetService("Players"):GetPlayers()) do
         spawn(function() pcall(LoadPlayer, v) end)
      end

      game:GetService("Players").PlayerAdded:Connect(function(v)
         pcall(LoadPlayer, v)
      end)

      game:GetService("Players").PlayerRemoving:Connect(function(v)
         pcall(UnloadPlayer, v)
      end)

      game:GetService("Players").LocalPlayer.NameDisplayDistance = 0

      if _G.Reantheajfdfjdgs then
         return
      end

      _G.Reantheajfdfjdgs = ":suifayhgvsdghfsfkajewfrhk321rk213kjrgkhj432rj34f67df"

      local players = game:GetService("Players")
      local plr = players.LocalPlayer

      function esp(target, color)
         if target.Character then
            if not target.Character:FindFirstChild("GetReal") then
               local highlight = Instance.new("Highlight")
               highlight.RobloxLocked = true
               highlight.Name = "GetReal"
               highlight.Adornee = target.Character
               highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
               highlight.FillColor = color
               highlight.Parent = target.Character
            else
               target.Character.GetReal.FillColor = color
            end
         end
      end

      while task.wait() do
         for i, v in pairs(players:GetPlayers()) do
            if v ~= plr then
               esp(v, _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor))
            end
         end
      end
   end,
})
