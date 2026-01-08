--[[
    TEAM MISTERIOSO V13 - SECURITY HUB
    - 10 KEYS TEMPORALES + 1 KEY MAESTRA
]]

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

-- CONFIGURACIÓN DE LLAVES
local MASTER_KEY = "TM-MASTER-V13-VIP"
local EXPIRATION_TIME = 86400 -- 24 horas en segundos

local TEMP_KEYS = {
    ["TM24-R9B1-X0"] = os.time() + EXPIRATION_TIME,
    ["TM24-L5K2-Z1"] = os.time() + EXPIRATION_TIME,
    ["TM24-P8M3-A2"] = os.time() + EXPIRATION_TIME,
    ["TM24-J2W4-Q3"] = os.time() + EXPIRATION_TIME,
    ["TM24-H7T5-G4"] = os.time() + EXPIRATION_TIME,
    ["TM24-Y1V6-B5"] = os.time() + EXPIRATION_TIME,
    ["TM24-S3C7-N6"] = os.time() + EXPIRATION_TIME,
    ["TM24-D9F8-U7"] = os.time() + EXPIRATION_TIME,
    ["TM24-G5X9-I8"] = os.time() + EXPIRATION_TIME,
    ["TM24-K2Z0-L9"] = os.time() + EXPIRATION_TIME
}

-- INTERFAZ DE LOGIN
local Screen = Instance.new("ScreenGui", CoreGui)
local LoginFrame = Instance.new("Frame", Screen)
LoginFrame.Size = UDim2.new(0, 320, 0, 260)
LoginFrame.Position = UDim2.new(0.5, -160, 0.4, -130)
LoginFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Instance.new("UICorner", LoginFrame)

local Title = Instance.new("TextLabel", LoginFrame)
Title.Size = UDim2.new(1, 0, 0, 50); Title.Text = "SECURITY SYSTEM V13"; Title.TextColor3 = Color3.fromRGB(200, 0, 0); Title.Font = "GothamBold"; Title.BackgroundTransparency = 1; Title.TextSize = 18

local KeyInput = Instance.new("TextBox", LoginFrame)
KeyInput.Size = UDim2.new(0.85, 0, 0, 45); KeyInput.Position = UDim2.new(0.075, 0, 0.35, 0); KeyInput.PlaceholderText = "Pega tu Key de 24h..."; KeyInput.Text = ""; KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25); KeyInput.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", KeyInput)

local VerifyBtn = Instance.new("TextButton", LoginFrame)
VerifyBtn.Size = UDim2.new(0.85, 0, 0, 45); VerifyBtn.Position = UDim2.new(0.075, 0, 0.65, 0); VerifyBtn.BackgroundColor3 = Color3.fromRGB(120, 40, 180); VerifyBtn.Text = "VERIFICAR ACCESO"; VerifyBtn.TextColor3 = Color3.new(1,1,1); VerifyBtn.Font = "GothamBold"; Instance.new("UICorner", VerifyBtn)

-- LOGICA DE ACCESO
VerifyBtn.MouseButton1Click:Connect(function()
    local key = KeyInput.Text
    local now = os.time()

    if key == MASTER_KEY then
        VerifyBtn.Text = "ADMIN: ACCESO TOTAL"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        task.wait(1)
        -- AQUÍ CARGA TU MENÚ CALIBRADO AL NIVEL 32
        LoginFrame:Destroy()
    elseif TEMP_KEYS[key] then
        if now < TEMP_KEYS[key] then
            VerifyBtn.Text = "KEY VÁLIDA (24H)"
            VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
            task.wait(1)
            -- AQUÍ CARGA TU MENÚ CALIBRADO AL NIVEL 32
            LoginFrame:Destroy()
        else
            VerifyBtn.Text = "KEY EXPIRADA"
            VerifyBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
        end
    else
        VerifyBtn.Text = "KEY INCORRECTA"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        task.wait(1.5)
        VerifyBtn.Text = "VERIFICAR ACCESO"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(120, 40, 180)
    end
end)
