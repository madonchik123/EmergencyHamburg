local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local lplr = game:GetService("Players").LocalPlayer

local settings = {
    godcar = false,
    inffual = false,
    accelerate = 1,
    maxspeed = 1,
    reversemaxspeed = 1,
    alwayson = false,
}

local Window = Rayfield:CreateWindow({
    Name = "Emergency Hamburg",
    LoadingTitle = "Axii",
    LoadingSubtitle = "axii777",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "YvwEyH2W6t",
       RememberJoins = true
    },
	KeySystem = false,
	KeySettings = {
		Title = "Axii menu",
		Subtitle = "Key System",
		Note = "Key link copied in clipboard!",
		FileName = "SiriusKey",
		SaveKey = false,
		GrabKeyFromSite = true,
		Key = ""
	}
})

task.defer(function()
    while task.wait() do
        if settings.godcar then
            workspace.Vehicles[lplr.Name]:SetAttribute("CurrentHealth", 1)
        end
    end
end)

task.defer(function()
    while task.wait() do
        if settings.inffual then
            workspace.Vehicles[lplr.Name]:SetAttribute("CurrentFuel", 100)
        end
    end
end)

task.defer(function()
    while task.wait() do
        if settings.alwayson then
            workspace.Vehicles[lplr.Name]:SetAttribute("IsOn", true)
        end
    end
end)

local Tab = Window:CreateTab("Hileler Axii - Perime", 4483362458)

local Toggle = Tab:CreateToggle({
    Name = "Araba hasarı yok",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        settings.godcar = Value
    end,
})

local Toggle = Tab:CreateToggle({
    Name = "Unlimited Fuel",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        settings.inffual = Value
    end,
})


local Slider = Tab:CreateSlider({
    Name = "Car Acceleration Value",
    Range = {0, 10000},
    Increment = 1,
    Suffix = "Hızlanma değeri",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = function(Value)
        settings.accelerate = Value
        while task.wait() do
            workspace.Vehicles[lplr.Name]:SetAttribute("MaxAccelerateForce", settings.accelerate)
        end
    end,
})

local Slider = Tab:CreateSlider({
    Name = "Maximum speed",
    Range = {0, 10000},
    Increment = 1,
    Suffix = "Hız",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = function(Value)
        settings.maxspeed = Value
        while task.wait() do
            workspace.Vehicles[lplr.Name]:SetAttribute("MaxSpeed", settings.maxspeed)
        end
    end,
})

local Slider = Tab:CreateSlider({
    Name = "Backwards speed",
    Range = {0, 10000},
    Increment = 1,
    Suffix = "Hız",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = function(Value)
        settings.reversemaxspeed = Value
        while task.wait() do
            workspace.Vehicles[lplr.Name]:SetAttribute("ReverseMaxSpeed", settings.reversemaxspeed)
        end
    end,
})

local Toggle = Tab:CreateToggle({
    Name = "always on (can get in when the car breaks down)",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        settings.alwayson = Value
    end,
})
