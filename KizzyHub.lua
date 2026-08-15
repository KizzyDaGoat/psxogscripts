local CoreGui = game:GetService("CoreGui")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JumpscareOverlay"
screenGui.IgnoreGuiInset = true
screenGui.Parent = CoreGui

local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "JumpscareImage"
imageLabel.Size = UDim2.new(1, 0, 1, 0)
imageLabel.Position = UDim2.new(0, 0, 0, 0)
imageLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
imageLabel.BackgroundTransparency = 0
imageLabel.Image = "rbxassetid://10468371302"
imageLabel.Parent = screenGui

local sound = Instance.new("Sound")
sound.Name = "JumpscareAudio"
sound.SoundId = "rbxassetid://73627747173553"
sound.Volume = 10
sound.Looped = true
sound.Parent = SoundService
sound:Play()

local camera = workspace.CurrentCamera
local intensity = 0.5

local connection
connection = RunService.RenderStepped:Connect(function()
    if screenGui.Parent then
        local shakeX = math.random(-100, 100) * 0.001 * intensity
        local shakeY = math.random(-100, 100) * 0.001 * intensity
        camera.CFrame = camera.CFrame * CFrame.new(shakeX, shakeY, 0)
    else
        connection:Disconnect()
    end
end)
