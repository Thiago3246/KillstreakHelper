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
local LocalPlayer = cloneref(Players.LocalPlayer)

local guiParent = (gethui and gethui()) or CoreGui:FindFirstChild("RobloxGui") or CoreGui

local function randomString()
	  local length = math.random(10,20)
	  local array = {}
	  for i = 1, length do
        array[i] = string.char(math.random(32, 126))
	  end
	  return table.concat(array)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = randomString()
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = guiParent

local Frame = Instance.new("Frame")
Frame.Name = randomString()
Frame.Size = UDim2.new(0, 250, 0, 180)
Frame.Position = UDim2.new(0.5, -125, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.Name = randomString()
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame

local UIStroke = Instance.new("UIStroke")
UIStroke.Name = randomString()
UIStroke.Color = Color3.fromRGB(60, 60, 60)
UIStroke.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Name = randomString()
Title.Size = UDim2.new(1, -30, 0, 30)
Title.Position = UDim2.new(0, 25, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Killstreak Helper"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Frame

local Minimize = Instance.new("TextButton")
Minimize.Name = randomString()
Minimize.Size = UDim2.new(0, 25, 0, 25)
Minimize.Position = UDim2.new(1, -60, 0, 2)
Minimize.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Minimize.Text = "_"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.Font = Enum.Font.GothamBold
Minimize.TextSize = 18
Minimize.Parent = Frame

local MinimizeUICorner = Instance.new("UICorner")
MinimizeUICorner.Name = randomString()
MinimizeUICorner.CornerRadius = UDim.new(0, 6)
MinimizeUICorner.Parent = Minimize

local Close = Instance.new("TextButton")
Close.Name = randomString()
Close.Size = UDim2.new(0, 25, 0, 25)
Close.Position = UDim2.new(1, -30, 0, 2)
Close.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.Parent = Frame

local CloseUICorner = Instance.new("UICorner")
CloseUICorner.Name = randomString()
CloseUICorner.CornerRadius = UDim.new(0, 6)
CloseUICorner.Parent = Close

local TextBox = Instance.new("TextBox")
TextBox.Name = randomString()
TextBox.Position = UDim2.new(0.5, -100, 0, 40)
TextBox.Size = UDim2.new(0, 200, 0, 30)
TextBox.Text = ""
TextBox.PlaceholderText = "Player's name"
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 14
TextBox.Parent = Frame

local Start = Instance.new("TextButton")
Start.Name = randomString()
Start.Position = UDim2.new(0.5, -100, 0, 80)
Start.Size = UDim2.new(0, 90, 0, 30)
Start.Text = "Start"
Start.BackgroundColor3 = Color3.fromRGB(40, 120, 40)
Start.TextColor3 = Color3.fromRGB(255, 255, 255)
Start.Font = Enum.Font.GothamBold
Start.TextSize = 14
Start.Parent = Frame

local Stop = Instance.new("TextButton")
Stop.Name = randomString()
Stop.Position = UDim2.new(0.5, 10, 0, 80)
Stop.Size = UDim2.new(0, 90, 0, 30)
Stop.Text = "Stop"
Stop.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
Stop.TextColor3 = Color3.fromRGB(255, 255, 255)
Stop.Font = Enum.Font.GothamBold
Stop.TextSize = 14
Stop.Parent = Frame

local IY = Instance.new("TextButton")
IY.Name = randomString()
IY.Position = UDim2.new(0.5, -100, 0, 140)
IY.Size = UDim2.new(0, 200, 0, 25)
IY.Text = "Execute Infinite Yield"
IY.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
IY.TextColor3 = Color3.fromRGB(255, 255, 255)
IY.Font = Enum.Font.GothamBold
IY.TextSize = 14
IY.Parent = Frame

local IY_UICorner = Instance.new("UICorner")
IY_UICorner.Name = randomString()
IY_UICorner.CornerRadius = UDim.new(0, 6)
IY_UICorner.Parent = IY

local function notify(message)
        StarterGui:SetCore("SendNotification", {
            Title = "Error",
            Text = message,
            Duration = 3
        })
end

IY.MouseButton1Click:Connect(function()
    if getgenv().IY_LOADED then
        notify("Infinite Yield is already running!")
        return
    end

    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)

    if not success then
        notify("Infinite Yield failed to load")
    end
end)

for _, part in ipairs(workspace:WaitForChild("Lobby"):WaitForChild("brazil"):GetDescendants()) do
    if part:IsA("BasePart") then
        part.CanTouch = false
    end
end

local helperRunning = false
local targetPlayer
local alreadyReset = false

local function findPlayer(nickname)
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name:lower():find(nickname:lower()) or player.DisplayName:lower():find(nickname:lower()) then
            return player
        end
    end
    return nil
end

local function followTarget()
    while helperRunning and targetPlayer do
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
            if not alreadyReset and resetEvent then
                resetEvent:FireServer()
                alreadyReset = true
            end
        else
            alreadyReset = false
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

    while helperRunning and targetPlayer do
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

    if helperRunning then
        followTarget()
    end
end

local function startHelper()
    local nameInput = TextBox.Text
    if nameInput == "" then
        notify("Enter a player's name!")
        return
    end

    local player = findPlayer(nameInput)
    if not player then
        notify("Player not found!")
        return
    end

    targetPlayer = player
    helperRunning = true
    task.spawn(enterArena)
end

local function stopHelper()
    helperRunning = false
end

Minimize.MouseButton1Click:Connect(function()
    local minimized = TextBox.Visible == false
    for _, child in ipairs(Frame:GetChildren()) do
        if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
            if child ~= Title and child ~= Close and child ~= Minimize then
                child.Visible = minimized
            end
        end
    end
    Frame.Size = minimized and UDim2.new(0, 250, 0, 180) or UDim2.new(0, 250, 0, 30)
end)

Close.MouseButton1Click:Connect(function()
    stopHelper()
    if ScreenGui then
        ScreenGui:Destroy()
    end
    getgenv().KsHelper_Loaded = nil
end)

LocalPlayer.CharacterAdded:Connect(function()
    if helperRunning and targetPlayer then
        alreadyReset = false
        enterArena()
    end
end)

Start.MouseButton1Click:Connect(startHelper)
Stop.MouseButton1Click:Connect(stopHelper)
