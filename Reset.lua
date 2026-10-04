local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ResetMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 200, 0, 130)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -65)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(50, 120, 200)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "🔄 Reset Menu"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.BorderSizePixel = 0
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

local ResetBtn = Instance.new("TextButton")
ResetBtn.Size = UDim2.new(0.85, 0, 0, 40)
ResetBtn.Position = UDim2.new(0.075, 0, 0, 45)
ResetBtn.BackgroundColor3 = Color3.fromRGB(30, 130, 220)
ResetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetBtn.Text = "🔄 Reiniciar"
ResetBtn.Font = Enum.Font.GothamBold
ResetBtn.TextSize = 15
ResetBtn.BorderSizePixel = 0
ResetBtn.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = ResetBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0.85, 0, 0, 30)
CloseBtn.Position = UDim2.new(0.075, 0, 0, 92)
CloseBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Text = "✖ Salir"
CloseBtn.Font = Enum.Font.Gotham
CloseBtn.TextSize = 13
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- Función de reset mejorada
local function resetCharacter()
    local character = LocalPlayer.Character
    if not character then return end

    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        -- Desactivar estado que bloquea el reset (ej: siendo agarrado)
        humanoid:ChangeState(Enum.HumanoidStateType.Dead)
        humanoid.Health = 0
    end

    -- Método alternativo por si el Humanoid está bloqueado
    task.delay(0.3, function()
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                -- Forzar respawn directo
                LocalPlayer:LoadCharacter()
            end
        end
    end)
end

ResetBtn.MouseButton1Click:Connect(resetCharacter)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

ResetBtn.MouseEnter:Connect(function()
    ResetBtn.BackgroundColor3 = Color3.fromRGB(50, 160, 255)
end)
ResetBtn.MouseLeave:Connect(function()
    ResetBtn.BackgroundColor3 = Color3.fromRGB(30, 130, 220)
end)

CloseBtn.MouseEnter:Connect(function()
    CloseBtn.BackgroundColor3 = Color3.fromRGB(110, 110, 110)
end)
CloseBtn.MouseLeave:Connect(function()
    CloseBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
end)