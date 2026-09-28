--[[

  _  ___ _ _    _                _     _  _     _               
 | |/ (_) | |__| |_ _ _ ___ __ _| |__ | || |___| |_ __  ___ _ _ 
 | ' <| | | (_-<  _| '_/ -_) _` | / / | __ / -_) | '_ \/ -_) '_|
 |_|\_\_|_|_/__/\__|_| \___\__,_|_\_\ |_||_\___|_| .__/\___|_|  
 | |__ _  _  |_   _| |_ (_)__ _ __ _ ___         |_|            
 | '_ \ || |   | | | ' \| / _` / _` / _ \                       
 |_.__/\_, |   |_| |_||_|_\__,_\__, \___/                       
       |__/                    |___/                            

 Credits: @DonjoSyntax on Youtube (Original Idea) & Infinite Yield & AI

]]--

local cloneref = cloneref or function(...) return ... end

local sbPlaceIds = {
    [6403373529] = true,
    [11520107397] = true,
    [124596094333302] = true,
    [9015014224] = true,
}

if not sbPlaceIds[game.PlaceId] then
    local MarketplaceService = cloneref(game:GetService("MarketplaceService"))
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    local gameName = (ok and info and info.Name) or "another game"
    print("This script is for Slap Battles, but you are in " .. gameName)
    return
end

if getgenv().KsHelper_Loaded then
    return
end

pcall(function() getgenv().KsHelper_Loaded = true end)

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local CoreGui = cloneref(game:GetService("CoreGui"))
local StarterGui = cloneref(game:GetService("StarterGui"))
local Players = cloneref(game:GetService("Players"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local VirtualUser = cloneref(game:GetService("VirtualUser"))
local LocalPlayer = cloneref(Players.LocalPlayer)

local guiParent = (gethui and gethui()) or CoreGui:FindFirstChild("RobloxGui") or CoreGui

local SAVE_FILE = "KillstreakHelper_target.txt"

local connections = {}

local function randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

local function loadSavedName()
    local ok, name = pcall(function()
        if isfile and readfile and isfile(SAVE_FILE) then
            return readfile(SAVE_FILE)
        end
        return ""
    end)
    return (ok and type(name) == "string") and name or ""
end

local function saveName(name)
    pcall(function()
        if writefile then
            writefile(SAVE_FILE, name)
        end
    end)
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
TextBox.Text = loadSavedName()
TextBox.PlaceholderText = "Player's name"
TextBox.ClearTextOnFocus = false
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 14
TextBox.Parent = Frame

local Toggle = Instance.new("TextButton")
Toggle.Name = randomString()
Toggle.Position = UDim2.new(0.5, -100, 0, 78)
Toggle.Size = UDim2.new(0, 200, 0, 30)
Toggle.Text = "Start"
Toggle.BackgroundColor3 = Color3.fromRGB(40, 120, 40)
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.Font = Enum.Font.GothamBold
Toggle.TextSize = 14
Toggle.Parent = Frame

local ToggleUICorner = Instance.new("UICorner")
ToggleUICorner.Name = randomString()
ToggleUICorner.CornerRadius = UDim.new(0, 6)
ToggleUICorner.Parent = Toggle

local Status = Instance.new("TextLabel")
Status.Name = randomString()
Status.Position = UDim2.new(0.5, -100, 0, 112)
Status.Size = UDim2.new(0, 200, 0, 22)
Status.BackgroundTransparency = 1
Status.Text = "Stopped | Deaths: 0"
Status.TextColor3 = Color3.fromRGB(180, 180, 180)
Status.Font = Enum.Font.Gotham
Status.TextSize = 13
Status.TextTruncate = Enum.TextTruncate.AtEnd
Status.Parent = Frame

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

local bodyElements = { TextBox, Toggle, Status, IY }

local function notify(title, message)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = message,
            Duration = 3
        })
    end)
end

-- Dragging (Frame.Draggable is deprecated)
do
    local dragging = false
    local dragStart, startPos

    table.insert(connections, Frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Frame.Position
        end
    end))

    table.insert(connections, UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end))

    table.insert(connections, UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end))
end

-- Built-in anti-AFK for this account
table.insert(connections, LocalPlayer.Idled:Connect(function()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end))

IY.MouseButton1Click:Connect(function()
    if getgenv().IY_LOADED then
        notify("Error", "Infinite Yield is already running!")
        return
    end

    local success = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)

    if not success then
        notify("Error", "Infinite Yield failed to load")
    end
end)

-- Runs in the background so a map change can't block the buttons from working
task.spawn(function()
    local lobby = workspace:WaitForChild("Lobby", 30)
    local brazil = lobby and lobby:WaitForChild("brazil", 30)
    if not brazil then return end

    for _, part in ipairs(brazil:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanTouch = false
        end
    end
end)

local helperRunning = false
local targetPlayer
local alreadyReset = false
local deaths = 0
local statusText = "Stopped"

-- Every start/stop/respawn bumps runId; a loop exits as soon as its id is outdated,
-- so only one teleport loop can ever be alive at a time.
local runId = 0

local function isActive(id)
    return helperRunning and targetPlayer ~= nil and id == runId
end

local function refreshStatus()
    Status.Text = statusText .. " | Deaths: " .. deaths
end

local function setStatus(text)
    if statusText ~= text then
        statusText = text
        refreshStatus()
    end
end

local function findPlayer(nickname)
    local query = nickname:lower()

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and (player.Name:lower() == query or player.DisplayName:lower() == query) then
            return player
        end
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and (player.Name:lower():find(query, 1, true) or player.DisplayName:lower():find(query, 1, true)) then
            return player
        end
    end

    return nil
end

local function followTarget(id)
    while isActive(id) do
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
        if not targetCharacter then
            setStatus("Waiting for " .. targetPlayer.Name)
            task.wait(0.1)
            continue
        end

        local isTargetInArena = targetCharacter:FindFirstChild("isInArena")
        local targetHumanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
        local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
        local isTargetInArenaV2 = targetCharacter:FindFirstChild("KillstreakLevel")

        if not isTargetInArena or not targetRoot or not targetHumanoid or targetHumanoid.Health <= 0 then
            setStatus("Waiting for " .. targetPlayer.Name)
            task.wait(0.1)
            continue
        end

        if not isTargetInArenaV2 and not isTargetInArena.Value then
            setStatus("Waiting for " .. targetPlayer.Name)
            task.wait(0.1)
            continue
        end

        setStatus("Following " .. targetPlayer.Name)

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

-- Like WaitForChild, but gives up as soon as this run is outdated or the character is gone
local function waitForChild(parent, name, id)
    local child = parent:FindFirstChild(name)
    while not child and isActive(id) and parent.Parent do
        task.wait(0.1)
        child = parent:FindFirstChild(name)
    end
    return child
end

local function enterArena(id)
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local rootPart = waitForChild(character, "HumanoidRootPart", id)
    local isInArena = waitForChild(character, "isInArena", id)
    if not rootPart or not isInArena then return end

    while isActive(id) do
        if isInArena.Value then
            break
        end

        local targetCharacter = targetPlayer.Character
        if targetCharacter then
            local isTargetInArena = targetCharacter:FindFirstChild("isInArena")
            local isTargetInArenaV2 = targetCharacter:FindFirstChild("KillstreakLevel")

            if (isTargetInArena and isTargetInArena.Value) or isTargetInArenaV2 then
                local portal = workspace:FindFirstChild("Lobby") and workspace.Lobby:FindFirstChild("Teleport1")
                if portal and portal:IsA("BasePart") then
                    rootPart.CFrame = portal.CFrame
                end
                break
            end
        end
        setStatus("Waiting for " .. targetPlayer.Name .. " to enter arena")
        task.wait(0.2)
    end

    if isActive(id) then
        followTarget(id)
    end
end

local function updateToggle()
    if helperRunning then
        Toggle.Text = "Stop"
        Toggle.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
    else
        Toggle.Text = "Start"
        Toggle.BackgroundColor3 = Color3.fromRGB(40, 120, 40)
    end
end

local function startHelper()
    if helperRunning then return end

    local nameInput = TextBox.Text:gsub("^%s+", ""):gsub("%s+$", "")
    if nameInput == "" then
        notify("Error", "Enter a player's name!")
        return
    end

    local player = findPlayer(nameInput)
    if not player then
        notify("Error", "Player not found!")
        return
    end

    TextBox.Text = player.Name
    saveName(player.Name)

    targetPlayer = player
    helperRunning = true
    alreadyReset = false
    runId += 1
    updateToggle()
    setStatus("Starting...")
    task.spawn(enterArena, runId)
end

local function stopHelper()
    helperRunning = false
    runId += 1
    updateToggle()
    setStatus("Stopped")
end

Toggle.MouseButton1Click:Connect(function()
    if helperRunning then
        stopHelper()
    else
        startHelper()
    end
end)

Minimize.MouseButton1Click:Connect(function()
    local minimized = TextBox.Visible == false
    for _, element in ipairs(bodyElements) do
        element.Visible = minimized
    end
    Frame.Size = minimized and UDim2.new(0, 250, 0, 180) or UDim2.new(0, 250, 0, 30)
end)

local function trackDeaths(character)
    local humanoid = character:WaitForChild("Humanoid", 10)
    if humanoid then
        humanoid.Died:Connect(function()
            if helperRunning then
                deaths += 1
                refreshStatus()
            end
        end)
    end
end

if LocalPlayer.Character then
    task.spawn(trackDeaths, LocalPlayer.Character)
end

table.insert(connections, LocalPlayer.CharacterAdded:Connect(function(character)
    if helperRunning and targetPlayer then
        alreadyReset = false
        runId += 1
        task.spawn(enterArena, runId)
    end
    trackDeaths(character)
end))

table.insert(connections, Players.PlayerRemoving:Connect(function(player)
    if player == targetPlayer then
        stopHelper()
        targetPlayer = nil
        notify("Killstreak Helper", player.Name .. " left the game, stopped.")
    end
end))

Close.MouseButton1Click:Connect(function()
    stopHelper()
    for _, connection in ipairs(connections) do
        connection:Disconnect()
    end
    if ScreenGui then
        ScreenGui:Destroy()
    end
    getgenv().KsHelper_Loaded = nil
end)
