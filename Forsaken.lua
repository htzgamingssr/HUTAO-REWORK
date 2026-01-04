local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalizationService = game:GetService("LocalizationService")

local LocalPlayer = Players.LocalPlayer
local UPDATE_LINK = "https://youtu.be/V3LDbEjPKJ4?si=1SP9s0gp4jYDI62Q"

local isVietnam = false
pcall(function()
    local region = LocalizationService:GetCountryRegionForPlayerAsync(LocalPlayer)
    if region == "VN" then
        isVietnam = true
    end
end)

local titleText = "HUTAO HUB"
local messageText = isVietnam
    and "Đã có bản update no key mới.\nHãy sử dụng bản no key để có trải nghiệm tốt hơn!"
    or "A new no key update is available.\nPlease use the no-key version for a better experience."

local copyText = isVietnam and "SAO CHÉP LINK" or "COPY LINK"
local copiedText = isVietnam and "ĐÃ SAO CHÉP!" or "COPIED!"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HutaoUpdateNotice"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 420, 0, 240)
Frame.Position = UDim2.new(0.5, -210, 0.5, -120)
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
Frame.BorderColor3 = Color3.fromRGB(255, 215, 0)
Frame.BorderSizePixel = 4
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

local Glow = Instance.new("ImageLabel")
Glow.Parent = Frame
Glow.BackgroundTransparency = 1
Glow.Image = "rbxassetid://5028857084"
Glow.ImageColor3 = Color3.fromRGB(255, 200, 50)
Glow.ScaleType = Enum.ScaleType.Slice
Glow.SliceCenter = Rect.new(24,24,276,276)
Glow.Size = UDim2.new(1, 30, 1, 30)
Glow.Position = UDim2.new(0, -15, 0, -15)
Glow.ZIndex = -1

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0.05, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 26
Title.TextColor3 = Color3.fromRGB(255,215,0)
Title.Text = titleText

local Message = Instance.new("TextLabel")
Message.Parent = Frame
Message.Size = UDim2.new(0.9, 0, 0, 80)
Message.Position = UDim2.new(0.05, 0, 0.3, 0)
Message.BackgroundTransparency = 1
Message.TextWrapped = true
Message.Font = Enum.Font.Gotham
Message.TextSize = 16
Message.TextColor3 = Color3.fromRGB(230,230,230)
Message.Text = messageText

local CopyButton = Instance.new("TextButton")
CopyButton.Parent = Frame
CopyButton.Size = UDim2.new(0.6, 0, 0, 40)
CopyButton.Position = UDim2.new(0.2, 0, 0.7, 0)
CopyButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
CopyButton.Font = Enum.Font.GothamBold
CopyButton.TextSize = 16
CopyButton.TextColor3 = Color3.fromRGB(20,20,20)
CopyButton.Text = copyText
Instance.new("UICorner", CopyButton).CornerRadius = UDim.new(0, 8)

CopyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(UPDATE_LINK)
        CopyButton.Text = copiedText
        task.delay(1.2, function()
            CopyButton.Text = copyText
        end)
    else
        CopyButton.Text = "EXECUTOR UNSUPPORTED"
    end
end)

task.spawn(function()
    while ScreenGui.Parent do
        Glow.ImageTransparency = 0.15 + math.sin(tick() * 3) * 0.05
        task.wait(0.05)
    end
end)
