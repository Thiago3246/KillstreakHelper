local cloneref = cloneref or function(o) return o end

local Players = cloneref(game:GetService("Players"))
local StarterGui = cloneref(game:GetService("StarterGui"))
local CoreGui = cloneref(game:GetService("CoreGui"))
local Workspace = cloneref(game:GetService("Workspace"))
local LocalPlayer = Players.LocalPlayer

local guiParent = (gethui and gethui()) or CoreGui

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KillstreakHelper"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = guiParent

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 180)
Frame.Position = UDim2.new(0.5, -125, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", Frame).Color = Color3.fromRGB(60, 60, 60)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, -30, 0, 30)
Title.Position = UDim2.new(0, 25, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Killstreak Helper"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

local MinimizeButton = Instance.new("TextButton", Frame)
MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
MinimizeButton.Position = UDim2.new(1, -60, 0, 2)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 18
Instance.new("UICorner", MinimizeButton).CornerRadius = UDim.new(0, 6)

local CloseButton = Instance.new("TextButton", Frame)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(1, -30, 0, 2)
CloseButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 14
Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(0, 6)

local TextBox = Instance.new("TextBox", Frame)
TextBox.Position = UDim2.new(0.5, -100, 0, 40)
TextBox.Size = UDim2.new(0, 200, 0, 30)
TextBox.Text = ""
TextBox.PlaceholderText = "Player's name"
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 14

local StartButton = Instance.new("TextButton", Frame)
StartButton.Position = UDim2.new(0.5, -100, 0, 80)
StartButton.Size = UDim2.new(0, 90, 0, 30)
StartButton.Text = "Start"
StartButton.BackgroundColor3 = Color3.fromRGB(40, 120, 40)
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.Font = Enum.Font.GothamBold
StartButton.TextSize = 14

local StopButton = Instance.new("TextButton", Frame)
StopButton.Position = UDim2.new(0.5, 10, 0, 80)
StopButton.Size = UDim2.new(0, 90, 0, 30)
StopButton.Text = "Stop"
StopButton.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.Font = Enum.Font.GothamBold
StopButton.TextSize = 14

local TipLabel = Instance.new("TextLabel", Frame)
TipLabel.Position = UDim2.new(0.5, -100, 0, 115)
TipLabel.Size = UDim2.new(0, 200, 0, 20)
TipLabel.BackgroundTransparency = 1
TipLabel.Text = 'TIP: Use "view" cmd on IY to spectate!'
TipLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TipLabel.Font = Enum.Font.Gotham
TipLabel.TextSize = 12
TipLabel.TextWrapped = true

local IYButton = Instance.new("TextButton", Frame)
IYButton.Position = UDim2.new(0.5, -100, 0, 140)
IYButton.Size = UDim2.new(0, 200, 0, 25)
IYButton.Text = "Execute IY"
IYButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
IYButton.TextColor3 = Color3.fromRGB(255, 255, 255)
IYButton.Font = Enum.Font.GothamBold
IYButton.TextSize = 14
Instance.new("UICorner", IYButton).CornerRadius = UDim.new(0, 6)

IYButton.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
end)

local running = false
local targetPlayer
local hasResetThisRagdoll = false

local function findPlayer(nickname)
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name:lower():find(nickname:lower()) or player.DisplayName:lower():find(nickname:lower()) then
            return player
        end
    end
    return nil
end

local function showNotification(message)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Killstreak Helper",
            Text = message,
            Duration = 3
        })
    end)
end

local function startFollowing()
    while running and targetPlayer do
        local character = LocalPlayer.Character
        if not character then task.wait(0.2) continue end

        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid or humanoid.Health <= 0 then task.wait(0.2) continue end

        local isInArena = character:FindFirstChild("isInArena")
        if not isInArena or not isInArena.Value then task.wait(0.2) continue end

        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local ragdolled = character:FindFirstChild("Ragdolled")
        local resetEvent = LocalPlayer:FindFirstChild("Reset")

        local targetCharacter = targetPlayer.Character
        if not targetCharacter then task.wait(0.2) continue end

        local targetArena = targetCharacter:FindFirstChild("isInArena")
        local targetHumanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
        local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")

        if not targetArena or not targetArena.Value or not targetRoot or not targetHumanoid or targetHumanoid.Health <= 0 then
            task.wait(0.2)
            continue
        end

        if ragdolled and ragdolled.Value then
            if not hasResetThisRagdoll and resetEvent then
                resetEvent:FireServer()
                hasResetThisRagdoll = true
            end
        else
            hasResetThisRagdoll = false
            if rootPart then
                rootPart.CFrame = targetRoot.CFrame * CFrame.new(0, 0, -4)
            end
        end
        task.wait()
    end
end

local function waitForArenaJoin()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local isInArena = character:WaitForChild("isInArena", 5)

    if not isInArena then return end

    if not isInArena.Value then
        local portal = Workspace:FindFirstChild("Lobby") and Workspace.Lobby:FindFirstChild("Teleport1")
        if portal and portal:IsA("BasePart") then
            rootPart.CFrame = portal.CFrame
        end
        repeat
            task.wait(0.2)
            character = LocalPlayer.Character
            isInArena = character and character:FindFirstChild("isInArena")
        until isInArena and isInArena.Value
    end

    if running then
        startFollowing()
    end
end

local function startHelper()
    local nameInput = TextBox.Text
    if nameInput == "" then
        showNotification("Enter a player's name!")
        return
    end

    local player = findPlayer(nameInput)
    if not player then
        showNotification("Player not found!")
        return
    end

    targetPlayer = player
    running = true
    task.spawn(waitForArenaJoin)
end

local function stopHelper()
    running = false
end

CloseButton.MouseButton1Click:Connect(function()
    stopHelper()
    if ScreenGui then
        ScreenGui:Destroy()
    end
end)

MinimizeButton.MouseButton1Click:Connect(function()
    local minimized = TextBox.Visible == false
    for _, child in ipairs(Frame:GetChildren()) do
        if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
            if child ~= Title and child ~= CloseButton and child ~= MinimizeButton then
                child.Visible = minimized
            end
        end
    end
    Frame.Size = minimized and UDim2.new(0, 250, 0, 180) or UDim2.new(0, 250, 0, 30)
end)

LocalPlayer.CharacterAdded:Connect(function()
    if running and targetPlayer then
        hasResetThisRagdoll = false
        waitForArenaJoin()
    end
end)

StartButton.MouseButton1Click:Connect(startHelper)
StopButton.MouseButton1Click:Connect(stopHelper)
