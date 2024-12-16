--This is Made by Ciel, my discord user is 0xciel
--This is only for practice purpose
--Pls don't resell it else I will bomb your house

--THIS IS FOR DEEPWOKEN LAYER 2 FLOOR 2

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Layer 2 Floor 2 Farm By Ciel',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Main = Window:AddTab('Main'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local MainStuff = Tabs.Main:AddLeftGroupbox('Main')
local NPCStuff = Tabs.Main:AddRightGroupbox('NPC Teleport')
local plr = game.Players.LocalPlayer
local bworkspace = game.workspace
local TweenService = game:GetService("TweenService")
local chestFolder = workspace:WaitForChild("Thrown")
local obelisks = workspace:WaitForChild("Layer2Floor2")
local NPC = workspace:WaitForChild("NPCs")

local function ObeliskCollision(value)
    local character = plr.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end
    local hrp = character.HumanoidRootPart

    for _, child in ipairs(obelisks:GetChildren()) do
        if child:IsA("Model") and child.Name == "Obelisk" then
            for _, part in ipairs(child:GetChildren()) do
                if part:IsA("Model") and part.Name == "Pillar" then
                    for _, bModel in ipairs(part:GetChildren()) do
                        if bModel:IsA("Model") then
                            for _, Bobelisk in ipairs(bModel:GetChildren()) do
                                if Bobelisk:IsA("MeshPart") then
                                    Bobelisk.CanCollide = value -- Set collision based on the value parameter
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

local function ChestCollision(value)
    local character = plr.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end
    local hrp = character.HumanoidRootPart

    for _, child in ipairs(chestFolder:GetChildren()) do
    if child:IsA("Model") and child.PrimaryPart then
        -- Iterate through the parts in the model
        for _, part in ipairs(child:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = value
            end
        end
    end
end
end

local function LighthookTeleport()
    local character = plr.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local hrp = character.HumanoidRootPart
    local targetCFrame = game.workspace.InGameLightHook.CFrame

    local platform = Instance.new("Part")
    platform.Size = Vector3.new(5, 1, 5)
    platform.Anchored = true
    platform.BrickColor = BrickColor.new("Bright yellow")
    platform.Material = Enum.Material.Neon
    platform.Parent = workspace
    platform.CFrame = hrp.CFrame * CFrame.new(0, -3, 0)
	platform.Transparency = 1

            local function UpdatePlatform()
                platform.CFrame = hrp.CFrame * CFrame.new(0, -3, 0)
            end

            local connection = hrp:GetPropertyChangedSignal("CFrame"):Connect(UpdatePlatform)
            local duration = (hrp.Position - targetCFrame.Position).Magnitude / 100
            local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
            local teleportTween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})

            teleportTween:Play()
            teleportTween.Completed:Wait()
            platform:Destroy()
            connection:Disconnect()
end

local function ObeliskTeleport()
    local character = plr.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local hrp = character.HumanoidRootPart

    for _, child in ipairs(obelisks:GetChildren()) do
        if child:IsA("Model") and child.Name == "Obelisk" then
            local targetCFrame = child.WorldPivot

            local platform = Instance.new("Part")
            platform.Size = Vector3.new(5, 1, 5)
            platform.Anchored = true
            platform.BrickColor = BrickColor.new("Bright yellow")
            platform.Material = Enum.Material.Neon
            platform.Parent = workspace
            platform.CFrame = hrp.CFrame * CFrame.new(0, -3, 0)
			platform.Transparency = 1

            local function UpdatePlatform()
                platform.CFrame = hrp.CFrame * CFrame.new(0, -3, 0)
            end

            local connection = hrp:GetPropertyChangedSignal("CFrame"):Connect(UpdatePlatform)
            local duration = (hrp.Position - targetCFrame.Position).Magnitude / 140
            local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
            local teleportTween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})

            teleportTween:Play()
            teleportTween.Completed:Wait()
            platform:Destroy()
            connection:Disconnect()

            task.wait(7)
        end
    end
end

local function ChestTeleport()
    local character = plr.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local hrp = character.HumanoidRootPart

    for _, child in ipairs(chestFolder:GetChildren()) do
        if child:IsA("Model") and child.PrimaryPart then
            local targetCFrame = child.PrimaryPart.CFrame

            local platform = Instance.new("Part")
            platform.Size = Vector3.new(5, 1, 5)
            platform.Anchored = true
            platform.BrickColor = BrickColor.new("Bright yellow")
            platform.Material = Enum.Material.Neon
            platform.Parent = workspace
            platform.CFrame = hrp.CFrame * CFrame.new(0, -3, 0)
			platform.Transparency = 1

            local function UpdatePlatform()
                platform.CFrame = hrp.CFrame * CFrame.new(0, -3, 0)
            end

            local connection = hrp:GetPropertyChangedSignal("CFrame"):Connect(UpdatePlatform)
            local duration = (hrp.Position - targetCFrame.Position).Magnitude / 140
            local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
            local teleportTween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})

            teleportTween:Play()
            teleportTween.Completed:Wait()
            platform:Destroy()
            connection:Disconnect()

            task.wait(7)
        end
    end
end

local function NPCTeleport(Tnpc)
    local character = plr.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local hrp = character.HumanoidRootPart
    local targetCFrame = Tnpc

    local platform = Instance.new("Part")
    platform.Size = Vector3.new(5, 1, 5)
    platform.Anchored = true
    platform.BrickColor = BrickColor.new("Bright yellow")
    platform.Material = Enum.Material.Neon
    platform.Parent = workspace
    platform.CFrame = hrp.CFrame * CFrame.new(0, -3, 0)
	platform.Transparency = 1
	local function UpdatePlatform()
        platform.CFrame = hrp.CFrame * CFrame.new(0, -3, 0)
    end
    local connection = hrp:GetPropertyChangedSignal("CFrame"):Connect(UpdatePlatform)
    local duration = (hrp.Position - targetCFrame.Position).Magnitude / 100
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    local teleportTween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
    teleportTween:Play()
    teleportTween.Completed:Wait()
    platform:Destroy()
    connection:Disconnect()
end
MainStuff:AddButton({
    Text = 'Auto Chest',  
    Func = function()   
		ChestTeleport()
		ChestCollision(false)
    end,
    Tooltip = 'Tps to chest, Does not auto loot them' 
})
MainStuff:AddButton({
    Text = 'Auto Obelisk', 
    Func = function()
		ObeliskTeleport()
		ObeliskCollision(false)
    end,
    Tooltip = 'Tps to obelisk, Does not auto enable them' 
})
MainStuff:AddButton({
    Text = 'Teleport to Lighthook',  
    Func = function()  
		LighthookTeleport()
    end,
    Tooltip = 'tps you to lighthook after beating ethiron' 
})

for _, bnpc in ipairs(NPC:GetChildren()) do
    if bnpc:IsA("Model") then 
        NPCStuff:AddButton({
            Text = bnpc.Name,  
            Func = function() 
                NPCTeleport(bnpc.PrimaryPart.CFrame)
            end,
            Tooltip = 'Teleport to ' .. bnpc.Name 
        })
    end
end

Library:SetWatermarkVisibility(true)
local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;
    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;
    Library:SetWatermark(('Test | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

Library.KeybindFrame.Visible = true; 

Library:OnUnload(function()
    WatermarkConnection:Disconnect()
    print('Unloaded!')
    Library.Unloaded = true
end)

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
