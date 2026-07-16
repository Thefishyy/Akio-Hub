debugX = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Akio Hub",
   Icon = 0,
   LoadingTitle = "Welcome to the Akio Script Hub",
   LoadingSubtitle = "by Haunt & Robner",
   Theme = "Default",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "AkioHub"
   },
   Discord = {
      Enabled = false,
      Invite = "Z3CeCphmCn",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Akio Hub",
      Subtitle = "Key System",
      Note = "Key: akiohub",
      FileName = "AkioHubKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Akkio Hub"}
   }
})

local placeId = game.PlaceId

-- ================== GAME DETECTION ==================

if placeId == 82236511306295 then
    -- +1 Ladder Game
    Rayfield:Notify({Title = "Game Detected", Content = "+1 Ladder Per Click", Duration = 4})

    local FeaturesTab = Window:CreateTab("Main Features", 4483362458)
    local Section = FeaturesTab:CreateSection("Main Features")

    -- Auto Clicker
    local AutoClickEnabled = false
    FeaturesTab:CreateToggle({
        Name = "Auto Clicker",
        CurrentValue = false,
        Flag = "AutoClickToggle",
        Callback = function(Value)
            AutoClickEnabled = Value
            if Value then
                task.spawn(function()
                    while AutoClickEnabled do
                        task.wait(0.05)
                        pcall(function()
                            local Event = game:GetService("ReplicatedStorage").Remotes.ClickEvent
                            if Event then Event:FireServer() end
                        end)
                    end
                end)
            end
        end,
    })

    -- Auto Finish
    local FinishEnabled = false
    FeaturesTab:CreateToggle({
        Name = "Teleport To Finish",
        CurrentValue = false,
        Flag = "TeleportToFinishToggle",
        Callback = function(Value)
            FinishEnabled = Value
            if Value then
                task.spawn(function()
                    while FinishEnabled do
                        task.wait(0.3)
                        pcall(function()
                            local player = game.Players.LocalPlayer
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                local root = character.HumanoidRootPart
                                local finishCFrame = CFrame.new(-573.6665649414062, 4237.42529296875, -22.736053466796875)
                                root.CFrame = finishCFrame * CFrame.new(0, 5, 0)
                            end
                        end)
                    end
                end)
            end
        end,
    })

    -- Auto Rebirth
    local AutoRebirthEnabled = false
    FeaturesTab:CreateToggle({
        Name = "Auto Rebirth",
        CurrentValue = false,
        Flag = "AutoRebirthToggle",
        Callback = function(Value)
            AutoRebirthEnabled = Value
            if Value then
                task.spawn(function()
                    while AutoRebirthEnabled do
                        pcall(function()
                            local Event = game:GetService("ReplicatedStorage").Remotes.RequestRebirth
                            if Event then Event:FireServer() end
                        end)
                        task.wait(1)
                    end
                end)
            end
        end,
    })

    -- Auto Train (Fully Restored)
    local AutoTrainEnabled = false
    local lastPosition = nil
    FeaturesTab:CreateToggle({
        Name = "Auto Train",
        CurrentValue = false,
        Flag = "AutoTrainToggle",
        Callback = function(Value)
            AutoTrainEnabled = Value
            lastPosition = nil
            if Value then
                task.spawn(function()
                    while AutoTrainEnabled do
                        task.wait(0.2)
                        pcall(function()
                            local player = game.Players.LocalPlayer
                            local character = player.Character
                            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
                           
                            local root = character.HumanoidRootPart
                            local currentPos = root.Position
                           
                            local rebirths = 0
                            local dataFolder = player:FindFirstChild("data")
                            if dataFolder and dataFolder:FindFirstChild("Rebirth") then
                                rebirths = dataFolder.Rebirth.Value
                            end
                           
                            local targetCFrame
                            if rebirths >= 12 then
                                targetCFrame = CFrame.new(575.72467, -391.935547, 44.4581108, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
                            elseif rebirths >= 9 then
                                targetCFrame = CFrame.new(575.495361, -392.165039, -44.266758, 0.819155693, 0, 0.573571265, 0, 1, 0, -0.573571265, 0, 0.819155693)
                            elseif rebirths >= 7 then
                                targetCFrame = CFrame.new(582.243286, -392.209106, 27.031662, 0.980163753, -0.00362463109, -0.198156133, 0.00376215577, 0.999992847, 0.000317545171, 0.19815357, -0.00105674053, 0.980170369)
                            elseif rebirths >= 5 then
                                targetCFrame = CFrame.new(581.566223, -391.992676, -26.9669056, 0.984812498, 0, 0.173621148, 0, 1, 0, -0.173621148, 0, 0.984812498)
                            elseif rebirths >= 3 then
                                targetCFrame = CFrame.new(584.125427, -392.256348, 13.10112, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
                            elseif rebirths >= 1 then
                                targetCFrame = CFrame.new(583.882141, -392.123291, -12.9481659, 0.996191859, 0, 0.0871884301, 0, 1, 0, -0.0871884301, 0, 0.996191859)
                            else
                                targetCFrame = CFrame.new(584.42572, -392.980225, 0.175410926, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                            end
                           
                            local finalCFrame = targetCFrame * CFrame.new(0, 4, 0)
                           
                            if not lastPosition or (currentPos - finalCFrame.Position).Magnitude > 8 then
                                root.CFrame = finalCFrame
                                lastPosition = finalCFrame.Position
                            end
                        end)
                    end
                end)
            end
        end,
    })

elseif placeId == 16981421605 then
    -- Reborn As Swordsman (unchanged)
    Rayfield:Notify({Title = "Game Detected", Content = "Reborn As Swordsman", Duration = 4})

    local FeaturesTab = Window:CreateTab("Main Features", 4483362458)
    local Section = FeaturesTab:CreateSection("Reborn As Swordsman Features")

    -- Auto Clicker + Auto Fight (same as before)
    local RAS_AutoClickEnabled = false
    FeaturesTab:CreateToggle({
        Name = "Auto Clicker",
        CurrentValue = false,
        Flag = "RAS_AutoClickToggle",
        Callback = function(Value)
            RAS_AutoClickEnabled = Value
            if Value then
                task.spawn(function()
                    while RAS_AutoClickEnabled do
                        task.wait(0.05)
                        pcall(function()
                            local Event = game:GetService("ReplicatedStorage").Events.Game.Re_TrainPower
                            if Event then Event:FireServer() end
                        end)
                    end
                end)
            end
        end,
    })

    local RAS_AutoFightEnabled = false
    FeaturesTab:CreateToggle({
        Name = "Auto Fight",
        CurrentValue = false,
        Flag = "RAS_AutoFightToggle",
        Callback = function(Value)
            RAS_AutoFightEnabled = Value
            if Value then
                task.spawn(function()
                    while RAS_AutoFightEnabled do
                        pcall(function()
                            local startEvent = game:GetService("ReplicatedStorage").Events.Fight.Re_ChallengeStart
                            if startEvent then startEvent:FireServer(1) end

                            task.wait(1)

                            local damageEvent = game:GetService("ReplicatedStorage").Events.Fight.Re_TakeDamage
                            if damageEvent then
                                firesignal(damageEvent.OnClientEvent, "Npc001", 100, 2, nil, 25, nil)
                                firesignal(damageEvent.OnClientEvent, "Npc002", 500, 3, nil, 50, nil)
                                -- Add more NPCs here if needed
                            end
                        end)
                        task.wait(0.7)
                    end
                end)
            end
        end,
    })

else
    Rayfield:Notify({Title = "Unknown Game", Content = "Place ID: " .. placeId, Duration = 5})
end

-- Discord Tab
local DiscordTab = Window:CreateTab("Discord", 4483362458)
local DiscordSection = DiscordTab:CreateSection("Join Discord")

DiscordTab:CreateButton({
    Name = "Copy Discord Invite",
    Callback = function()
        setclipboard("https://discord.gg/tmYH8yHcCw")
        Rayfield:Notify({Title = "✅ Copied!", Content = "Discord link copied!", Duration = 4})
    end,
})

Rayfield:LoadConfiguration()