if not _G.preventReRunning then
    _G.preventReRunning = true
    _G.duels = false
    _G.teams = false
    _G.inGame = 0
    
    mainGui = Instance.new("ScreenGui")
    mainFrame = Instance.new("Frame")
    
    mainGui.Parent = game.Players.LocalPlayer.PlayerGui
    mainGui.ResetOnSpawn = false
    
    mainFrame.Parent = mainGui    
    mainFrame.Size = UDim2.new(0,300,0,100)
    mainFrame.Position = UDim2.new(0,10,1,-100)
    mainFrame.BackgroundColor3 = Color3.fromRGB(23, 22, 20)
    mainFrame.BorderColor3 = Color3.fromRGB(64, 66, 41)
    
    
    soloButton = Instance.new("TextButton")
    soloButton.Parent = mainFrame
    soloButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
    soloButton.BorderColor3 = Color3.fromRGB(64, 66, 41)
    soloButton.Font = "Garamond"
    soloButton.Size = UDim2.new(0.5,0,0.5,0)
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
    teamButton.Size = UDim2.new(0.5,0,0.5,0)
    teamButton.Position = UDim2.new(0,0,0.5,0)
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
    goodButton.Size = UDim2.new(0.5,0,0.5,0)
    goodButton.Position = UDim2.new(0.5,0,0,0)
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
    
    local UserInputService = game:GetService("UserInputService")
     
    local function onInputBegan(input, gameProcessed)
    	if input.UserInputType == Enum.UserInputType.Keyboard then
    	    if input.KeyCode == Enum.KeyCode.P then
	                theFrame = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui").ScreenGui.Frame
	                theFrame.Visible = not theFrame.Visible
	        end
    	end
    end
    
    UserInputService.InputBegan:Connect(onInputBegan)
    
    cleanButton = Instance.new("TextButton")
    cleanButton.Parent = mainFrame
    cleanButton.BackgroundColor3 = Color3.fromRGB(53, 22, 20)
    cleanButton.BorderColor3 = Color3.fromRGB(64, 66, 41)
    cleanButton.Font = "Garamond"
    cleanButton.Size = UDim2.new(0.5,0,0.5,0)
    cleanButton.Position = UDim2.new(0.5,0,0.5,0)
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
    
    local function gameEnded()
        if _G.goodgame then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("gg", "All")
        end
        _G.inGame = _G.inGame - 1
        if _G.inGame == 0 then
            cleanButton.BackgroundColor3 = Color3.fromRGB(23, 22, 20)
        end
    end
    
    local function gameStarted()
        _G.inGame = _G.inGame + 1
        if _G.inGame >= 1 then 
            cleanButton.BackgroundColor3 = Color3.fromRGB(53, 52, 50)
        end
    end
    
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
        wait(0.5)
    end
end