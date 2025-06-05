--[[

  _  ___ _ _    _                _     _  _     _               
 | |/ (_) | |__| |_ _ _ ___ __ _| |__ | || |___| |_ __  ___ _ _ 
 | ' <| | | (_-<  _| '_/ -_) _` | / / | __ / -_) | '_ \/ -_) '_|
 |_|\_\_|_|_/__/\__|_| \___\__,_|_\_\ |_||_\___|_| .__/\___|_|  
 | |__ _  _  |_   _| |_ (_)__ _ __ _ ___         |_|            
 | '_ \ || |   | | | ' \| / _` / _` / _ \                       
 |_.__/\_, |   |_| |_||_|_\__,_\__, \___/                       
       |__/                    |___/                            

 Credits: @DonjoSyntax on Youtube (Original Idea)

]]--

if getgenv().KsHelper_Loaded then
    return
end

pcall(function() getgenv().KsHelper_Loaded = true end)

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local cloneref = cloneref or function(...) return ... end

local CoreGui = cloneref(game:GetService("CoreGui"))
local StarterGui = cloneref(game:GetService("StarterGui"))
local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer

local guiParent = (gethui and gethui()) or CoreGui:FindFirstChild("RobloxGui") or CoreGui

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KillstreakHelper"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = guiParent

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 180)
Frame.Position = UDim2.new(0.5, -125, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(60, 60, 60)
UIStroke.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -30, 0, 30)
Title.Position = UDim2.new(0, 25, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Killstreak Helper"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Frame

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
MinimizeButton.Position = UDim2.new(1, -60, 0, 2)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 18
MinimizeButton.Parent = Frame

local MinimizeButtonUICorner = Instance.new("UICorner")
MinimizeButtonUICorner.CornerRadius = UDim.new(0, 6)
MinimizeButtonUICorner.Parent = MinimizeButton

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(1, -30, 0, 2)
CloseButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 14
CloseButton.Parent = Frame

local CloseButtonUICorner = Instance.new("UICorner")
CloseButtonUICorner.CornerRadius = UDim.new(0, 6)
CloseButtonUICorner.Parent = CloseButton

local TextBox = Instance.new("TextBox")
TextBox.Position = UDim2.new(0.5, -100, 0, 40)
TextBox.Size = UDim2.new(0, 200, 0, 30)
TextBox.Text = ""
TextBox.PlaceholderText = "Player's name"
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 14
TextBox.Parent = Frame

local StartButton = Instance.new("TextButton")
StartButton.Position = UDim2.new(0.5, -100, 0, 80)
StartButton.Size = UDim2.new(0, 90, 0, 30)
StartButton.Text = "Start"
StartButton.BackgroundColor3 = Color3.fromRGB(40, 120, 40)
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.Font = Enum.Font.GothamBold
StartButton.TextSize = 14
StartButton.Parent = Frame

local StopButton = Instance.new("TextButton")
StopButton.Position = UDim2.new(0.5, 10, 0, 80)
StopButton.Size = UDim2.new(0, 90, 0, 30)
StopButton.Text = "Stop"
StopButton.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.Font = Enum.Font.GothamBold
StopButton.TextSize = 14
StopButton.Parent = Frame

local Tip = Instance.new("TextLabel")
Tip.Position = UDim2.new(0.5, -100, 0, 115)
Tip.Size = UDim2.new(0, 200, 0, 20)
Tip.BackgroundTransparency = 1
Tip.Text = 'TIP: Use "view" cmd on IY to spectate!'
Tip.TextColor3 = Color3.fromRGB(255, 255, 255)
Tip.Font = Enum.Font.Gotham
Tip.TextSize = 12
Tip.TextWrapped = true
Tip.Parent = Frame

local IYButton = Instance.new("TextButton")
IYButton.Position = UDim2.new(0.5, -100, 0, 140)
IYButton.Size = UDim2.new(0, 200, 0, 25)
IYButton.Text = "Execute Infinite Yield"
IYButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
IYButton.TextColor3 = Color3.fromRGB(255, 255, 255)
IYButton.Font = Enum.Font.GothamBold
IYButton.TextSize = 14
IYButton.Parent = Frame

local IYButtonUICorner = Instance.new("UICorner")
IYButtonUICorner.CornerRadius = UDim.new(0, 6)
IYButtonUICorner.Parent = IYButton

local function showNotification(message)
        StarterGui:SetCore("SendNotification", {
            Title = "Error",
            Text = message,
            Duration = 3
        })
end

IYButton.MouseButton1Click:Connect(function()
    if getgenv().IY_LOADED then
        showNotification("Infinite Yield is already running!")
        return
    end

    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)

    if not success then
        showNotification("Infinite Yield failed to load")
    end
end)

for _, part in ipairs(workspace:WaitForChild("Lobby"):WaitForChild("brazil"):GetDescendants()) do
    if part:IsA("BasePart") then
        part.CanTouch = false
    end
end

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

local function startFollowing()
    while running and targetPlayer do
        local found = false
        for _, player in ipairs(Players:GetPlayers()) do
            if player == targetPlayer then
                found = true
                break
            end
        end

        if not found then
            showNotification(targetPlayer.DisplayName .. " left")
            stopHelper()
            break
        end

        local character = LocalPlayer.Character
        if not character then task.wait(0.1) continue end

        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid or humanoid.Health <= 0 then task.wait(0.1) continue end

        local isInArena = character:FindFirstChild("isInArena")
        if not isInArena or not isInArena.Value then task.wait(0.1) continue end

        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local ragdolled = character:FindFirstChild("Ragdolled")
        local resetEvent = LocalPlayer:FindFirstChild("Reset")

        local targetCharacter = targetPlayer.Character
        if not targetCharacter then task.wait(0.1) continue end

        local isTargetInArena = targetCharacter:FindFirstChild("isInArena")
        local targetHumanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
        local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
        local isTargetInArenaV2 = targetCharacter:FindFirstChild("KillstreakLevel")

        if(not isTargetInArena or not targetRoot or not targetHumanoid or targetHumanoid.Health <= 0) then
            task.wait(0.1)
            continue
        end

        if(not isTargetInArenaV2) and (not isTargetInArena.Value) then
            task.wait(0.1)
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

local function enterArena()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local isInArena = character:WaitForChild("isInArena")

    while running and targetPlayer do
        local targetCharacter = targetPlayer.Character
        if targetCharacter then
            local isTargetInArena = targetCharacter:FindFirstChild("isInArena")
            local isTargetInArenaV2 = targetCharacter:FindFirstChild("KillstreakLevel")

            if(isTargetInArena and isTargetInArena.Value) or isTargetInArenaV2 then
                local portal = workspace:FindFirstChild("Lobby") and workspace.Lobby:FindFirstChild("Teleport1")
                if portal and portal:IsA("BasePart") then
                    rootPart.CFrame = portal.CFrame
                end
                break
            end
        end
        task.wait(0.2)
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

    StarterGui:SetCore("SendNotification", {
        Title = "Killstreak Helper",
        Text = "Started helping " .. targetPlayer.DisplayName,
        Duration = 3
    })

    task.spawn(enterArena)
end

local function stopHelper()
    if running and targetPlayer then
        showNotification("Stopped helping " .. targetPlayer.DisplayName)
    end
    running = false
end

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

CloseButton.MouseButton1Click:Connect(function()
    stopHelper()
    if ScreenGui then
        ScreenGui:Destroy()
    end
    getgenv().KsHelper_Loaded = nil
end)

LocalPlayer.CharacterAdded:Connect(function()
    if running and targetPlayer then
        hasResetThisRagdoll = false
        enterArena()
    end
end)

StartButton.MouseButton1Click:Connect(startHelper)
StopButton.MouseButton1Click:Connect(stopHelper)
