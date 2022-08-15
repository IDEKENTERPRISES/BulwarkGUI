if not _G.preventReRunning then
    _G.preventReRunning = true
    _G.duels = false
    _G.teams = false
    _G.inGame = 0
    _G.god = false
    _G.sound = false
    _G.energy = false

    
    _G.currentPlayers = {}
    
    mainGui = Instance.new("ScreenGui")
    mainFrame = Instance.new("Frame")
    
    mainGui.Parent = game.Players.LocalPlayer.PlayerGui
    mainGui.ResetOnSpawn = false
    
    mainFrame.Parent = mainGui    
    mainFrame.Size = UDim2.new(0,450,0,150)
    mainFrame.Position = UDim2.new(0,10,1,-150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(23, 22, 20)
    mainFrame.BorderColor3 = Color3.fromRGB(64, 66, 41)
    
    
    soloButton = Instance.new("TextButton")
    soloButton.Parent = mainFrame
    soloButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
    soloButton.BorderColor3 = Color3.fromRGB(64, 66, 41)
    soloButton.Font = "Garamond"
    soloButton.Size = UDim2.new(0,150,0,50)
    soloButton.Text = "Automatic Solos"
    soloButton.TextColor3 = Color3.fromRGB(116, 119, 74)
    soloButton.TextScaled = true
    
    local function soloPressed() 
        _G.duels = not _G.duels
        if _G.duels then
            soloButton.BackgroundColor3 = Color3.fromRGB(23, 52, 20)
        else
            soloButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
            for i,v in ipairs(game:GetService("Workspace").gameComponents.DuelQueueBoard.SurfaceGui.ScrollingFrame:GetChildren()) do
                if v.Name == game.Players.LocalPlayer.Name then
                    fireclickdetector(game:GetService("Workspace").gameComponents.DuelQueueBoard.ClickDetector)
                end
            end
        end
    end
    soloButton.MouseButton1Click:Connect(soloPressed)
    
    teamButton = Instance.new("TextButton")
    teamButton.Parent = mainFrame
    teamButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
    teamButton.BorderColor3 = Color3.fromRGB(64, 66, 41)
    teamButton.Font = "Garamond"
    teamButton.Size = UDim2.new(0,150,0,50)
    teamButton.Position = UDim2.new(0,0,0,50)
    teamButton.Text = "Automatic Teams"
    teamButton.TextColor3 = Color3.fromRGB(116, 119, 74)
    teamButton.TextScaled = true
    
    local function teamPressed() 
        _G.teams = not _G.teams
        if _G.teams then
            teamButton.BackgroundColor3 = Color3.fromRGB(23, 52, 20)
        else
            teamButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
            for i,v in ipairs(game:GetService("Workspace").gameComponents.TeamFightQueueBoard.SurfaceGui.ScrollingFrame:GetChildren()) do
                if v.Name == game.Players.LocalPlayer.Name then
                    fireclickdetector(game:GetService("Workspace").gameComponents.TeamFightQueueBoard.ClickDetector)
                end
            end
        end
    end
    teamButton.MouseButton1Click:Connect(teamPressed)
    
    goodButton = Instance.new("TextButton")
    goodButton.Parent = mainFrame
    goodButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
    goodButton.BorderColor3 = Color3.fromRGB(64, 66, 41)
    goodButton.Font = "Garamond"
    goodButton.Size = UDim2.new(0,150,0,50)
    goodButton.Position = UDim2.new(0,0,0,100)
    goodButton.Text = "Automatic GG"
    goodButton.TextColor3 = Color3.fromRGB(116, 119, 74)
    goodButton.TextScaled = true
    
    local function goodPressed() 
        _G.goodgame = not _G.goodgame
        if _G.goodgame then
            goodButton.BackgroundColor3 = Color3.fromRGB(23, 52, 20)
        else
            goodButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
        end
        
    end
    goodButton.MouseButton1Click:Connect(goodPressed)
    
    cleanButton = Instance.new("TextButton")
    cleanButton.Parent = mainFrame
    cleanButton.BackgroundColor3 = Color3.fromRGB(23, 22, 20)
    cleanButton.BorderColor3 = Color3.fromRGB(64, 66, 41)
    cleanButton.Font = "Garamond"
    cleanButton.Size = UDim2.new(0,150,0,50)
    cleanButton.Position = UDim2.new(0,150,0,50)
    cleanButton.Text = "TP to Clean"
    cleanButton.TextColor3 = Color3.fromRGB(116, 119, 74)
    cleanButton.TextScaled = true
    
    local function cleanPressed()
        if _G.inGame == 0 then 
            _G.duels = false
            _G.teams = false
            teamButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
            for i,v in ipairs(game:GetService("Workspace").gameComponents.TeamFightQueueBoard.SurfaceGui.ScrollingFrame:GetChildren()) do
                if v.Name == game.Players.LocalPlayer.Name then
                    fireclickdetector(game:GetService("Workspace").gameComponents.TeamFightQueueBoard.ClickDetector)
                end
            end
            soloButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
            for i,v in ipairs(game:GetService("Workspace").gameComponents.DuelQueueBoard.SurfaceGui.ScrollingFrame:GetChildren()) do
                if v.Name == game.Players.LocalPlayer.Name then
                    fireclickdetector(game:GetService("Workspace").gameComponents.DuelQueueBoard.ClickDetector)
                end
            end
    
    
            hum = game.Players.LocalPlayer.Character.HumanoidRootPart
            hum.CFrame = CFrame.new(-279, -29, -196)
        end
    end

    cleanButton.MouseButton1Click:Connect(cleanPressed)
    
    armoryButton = Instance.new("TextButton")
    armoryButton.Parent = mainFrame
    armoryButton.BackgroundColor3 = Color3.fromRGB(23, 22, 20)
    armoryButton.BorderColor3 = Color3.fromRGB(64, 66, 41)
    armoryButton.Font = "Garamond"
    armoryButton.Size = UDim2.new(0,150,0,50)
    armoryButton.Position = UDim2.new(0,150,0,0)
    armoryButton.Text = "TP to Armory"
    armoryButton.TextColor3 = Color3.fromRGB(116, 119, 74)
    armoryButton.TextScaled = true
    
    local function armoryPressed()
        if _G.inGame == 0 then 
            _G.duels = false
            _G.teams = false
            teamButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
            for i,v in ipairs(game:GetService("Workspace").gameComponents.TeamFightQueueBoard.SurfaceGui.ScrollingFrame:GetChildren()) do
                if v.Name == game.Players.LocalPlayer.Name then
                    fireclickdetector(game:GetService("Workspace").gameComponents.TeamFightQueueBoard.ClickDetector)
                end
            end
            soloButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
            for i,v in ipairs(game:GetService("Workspace").gameComponents.DuelQueueBoard.SurfaceGui.ScrollingFrame:GetChildren()) do
                if v.Name == game.Players.LocalPlayer.Name then
                    fireclickdetector(game:GetService("Workspace").gameComponents.DuelQueueBoard.ClickDetector)
                end
            end
    
    
            hum = game.Players.LocalPlayer.Character.HumanoidRootPart
            hum.CFrame = CFrame.new(-18.5, 16, -65.5)
        end
    end

    armoryButton.MouseButton1Click:Connect(armoryPressed)
    
    -- godButton = Instance.new("TextButton")
    -- godButton.Parent = mainFrame
    -- godButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
    -- godButton.BorderColor3 = Color3.fromRGB(64, 66, 41)
    -- godButton.Font = "Garamond"
    -- godButton.Size = UDim2.new(0,150,0,50)
    -- godButton.Position = UDim2.new(0,300,0,0)
    -- godButton.Text = "Disable Opponent [H]"
    -- godButton.TextColor3 = Color3.fromRGB(116, 119, 74)
    -- godButton.TextScaled = true
    
    
    -- local function godPressed()
    --     _G.god = not _G.god
    --     if _G.god then
    --         godButton.BackgroundColor3 = Color3.fromRGB(23, 52, 20)
    --     else
    --         godButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
    --     end
    -- end
    
    -- godButton.MouseButton1Click:Connect(godPressed)
    
    energyButton = Instance.new("TextButton")
    energyButton.Parent = mainFrame
    energyButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
    energyButton.BorderColor3 = Color3.fromRGB(64, 66, 41)
    energyButton.Font = "Garamond"
    energyButton.Size = UDim2.new(0,150,0,50)
    energyButton.Position = UDim2.new(0,150,0,100)
    energyButton.Text = "Auto Full Stamina [V]"
    energyButton.TextColor3 = Color3.fromRGB(116, 119, 74)
    energyButton.TextScaled = true
    
    
    local function energyPressed()
        _G.energy = not _G.energy
        if _G.energy then
            energyButton.BackgroundColor3 = Color3.fromRGB(23, 52, 20)
        else
            energyButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
        end
    end

    energyButton.MouseButton1Click:Connect(energyPressed)

    -- staminaButton = Instance.new("TextButton")
    -- staminaButton.Parent = mainFrame
    -- staminaButton.BackgroundColor3 = Color3.fromRGB(23, 22, 20)
    -- staminaButton.BorderColor3 = Color3.fromRGB(64, 66, 41)
    -- staminaButton.Font = "Garamond"
    -- staminaButton.Size = UDim2.new(0,150,0,50)
    -- staminaButton.Position = UDim2.new(0,300,0,50)
    -- staminaButton.Text = "Drain Enemy Stamina [Y]"
    -- staminaButton.TextColor3 = Color3.fromRGB(116, 119, 74)
    -- staminaButton.TextScaled = true
    
    
    -- local function staminaPressed()
    --     for i,v in pairs(_G.currentPlayers) do
    --         if v then 
    --             local args = {
    --                             [1] = game:GetService("Players")[i].Character.Humanoid.Stamina,
    --                             [2] = 0
    --                          }
                            
    --                         game:GetService("ReplicatedStorage").RemoteEvents.ToServer.ChangeVal:FireServer(unpack(args))
    --         end
    --     end
    -- end
    
    -- staminaButton.MouseButton1Click:Connect(staminaPressed)
    
    soundButton = Instance.new("TextButton")
    soundButton.Parent = mainFrame
    soundButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
    soundButton.BorderColor3 = Color3.fromRGB(64, 66, 41)
    soundButton.Font = "Garamond"
    soundButton.Size = UDim2.new(0,150,0,50)
    soundButton.Position = UDim2.new(0,300,0,100)
    soundButton.Text = "Spam Noises Globally [T]"
    soundButton.TextColor3 = Color3.fromRGB(116, 119, 74)
    soundButton.TextScaled = true
    
    
    local function soundPressed()
        _G.sound = not _G.sound
        if _G.sound then
            soundButton.BackgroundColor3 = Color3.fromRGB(23, 52, 20)
        else
            soundButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
        end
    end
    
    soundButton.MouseButton1Click:Connect(soundPressed)
    
    function gameEnded()
        if _G.goodgame then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("gg", "All")
        end
        _G.inGame = _G.inGame - 1
        if _G.inGame == 0 then
            cleanButton.BackgroundColor3 = Color3.fromRGB(23, 22, 20)
            armoryButton.BackgroundColor3 = Color3.fromRGB(23, 22, 20)
        end
        
        countEnabled = 0
        for i,v in pairs(_G.currentPlayers) do
            if v then
                countEnabled = countEnabled + 1
            end
        end
        
        if countEnabled > 1 then
            for i,v in pairs(_G.currentPlayers) do
                if i ~= _G.latestAdded then
                    _G.currentPlayers[i] = false
                end
            end
        else
            for i,v in pairs(_G.currentPlayers) do
                _G.currentPlayers[i] = false
            end
        end
    end
    
    function gameStarted(first, second)
        _G.inGame = _G.inGame + 1
        if _G.inGame >= 1 then 
            cleanButton.BackgroundColor3 = Color3.fromRGB(53, 52, 50)
            armoryButton.BackgroundColor3 = Color3.fromRGB(53, 52, 50)
        end
        
        for i,v in pairs(first["Players"]) do
            print(tostring(v))
            if tostring(v) ~= game:GetService("Players").LocalPlayer.Name then 
                _G.currentPlayers[tostring(v)] = true
                _G.latestAdded = tostring(v)
            end
        end
        for i,v in pairs(second["Players"]) do
            print(tostring(v))
            if tostring(v) ~= game:GetService("Players").LocalPlayer.Name then 
                _G.currentPlayers[tostring(v)] = true
                _G.latestAdded = tostring(v)
            end
        end
    end
    
    local UserInputService = game:GetService("UserInputService")
     
    local function onInputBegan(input, gameProcessed)
    	if input.UserInputType == Enum.UserInputType.Keyboard then
    	    if input.KeyCode == Enum.KeyCode.P then
	                theFrame = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui").ScreenGui.Frame
	                theFrame.Visible = not theFrame.Visible
	        end
	        -- if input.KeyCode == Enum.KeyCode.Y then
	        --     staminaPressed()
	        -- end
            if input.KeyCode == Enum.KeyCode.T then
                soundPressed()
            end
            -- if input.KeyCode == Enum.KeyCode.H then
            --     godPressed()
            -- end
            if input.KeyCode == Enum.KeyCode.V then
                energyPressed()
            end
    	end
    end
    
    UserInputService.InputBegan:Connect(onInputBegan)
    
    game:GetService("ReplicatedStorage").RemoteEvents.ToClient.displayTourneyEnd.OnClientEvent:Connect(gameEnded)
    game:GetService("ReplicatedStorage").RemoteEvents.ToClient.displayTourneyStart.OnClientEvent:Connect(gameStarted)
    
    while true do
        if _G.duels then
            reclick = true
            for i,v in ipairs(game:GetService("Workspace").gameComponents.DuelQueueBoard.SurfaceGui.ScrollingFrame:GetChildren()) do
                if v.Name == game.Players.LocalPlayer.Name then
                    reclick = false
                end
            end
            if reclick then
                fireclickdetector(game:GetService("Workspace").gameComponents.DuelQueueBoard.ClickDetector)
            end
        end
        if _G.teams then
            reclick = true
            for i,v in ipairs(game:GetService("Workspace").gameComponents.TeamFightQueueBoard.SurfaceGui.ScrollingFrame:GetChildren()) do
                if v.Name == game.Players.LocalPlayer.Name then
                    reclick = false
                end
            end
            if reclick then
                fireclickdetector(game:GetService("Workspace").gameComponents.TeamFightQueueBoard.ClickDetector)
            end
        end
        -- if _G.god then 
        --     for i,v in ipairs(game.Workspace:GetChildren()) do
        --         if v.ClassName == "Model" and v:FindFirstChild("Humanoid") and _G.currentPlayers[v.Name] == true then 
        --             weapon = v:FindFirstChildWhichIsA("Tool")
        --             if weapon then
        --                 local args = {
        --                     [1] = weapon.Stance,
        --                     [2] = "UnParry"
        --                 }
                        
        --                 game:GetService("ReplicatedStorage").RemoteEvents.ToServer.ChangeVal:FireServer(unpack(args))
        --             end
        --         end
        --     end
        -- end
        if _G.energy then            
            local args = {
                [1] = game:GetService("Players").LocalPlayer.Character.Humanoid.Stamina,
                [2] = 100
                }
            
            game:GetService("ReplicatedStorage").RemoteEvents.ToServer.ChangeVal:FireServer(unpack(args))
        end
        if _G.sound then
            for i,v in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v.ClassName == "Tool" then
                    weapon = v
                    local args = {
                        [1] = weapon.BodyAttach.Marked
                    }
                    game:GetService("ReplicatedStorage").RemoteEvents.ToServer.Sound:FireServer(unpack(args))
                end
            end
        end
        wait(0.5)
    end
end