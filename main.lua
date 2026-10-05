local ThemeManager = {
    Themes = {},
    CurrentTheme = nil,
    ThemeListeners = {},
}


local BuiltInThemes = {
    Dark = {
        Name = "Dark",
        BGColor = Color3.fromRGB(9, 9, 11),
        Surface = Color3.fromRGB(18, 18, 20),
        SurfaceAlt = Color3.fromRGB(26, 26, 30),
        Border = Color3.fromRGB(40, 40, 46),
        TextPrimary = Color3.fromRGB(245, 245, 250),
        TextSecondary = Color3.fromRGB(140, 140, 160),
        Accent = Color3.fromRGB(59, 130, 246),
        TopBar = Color3.fromRGB(16, 16, 20),
        Sidebar = Color3.fromRGB(14, 14, 18),
        Danger = Color3.fromRGB(239, 68, 68),
        Success = Color3.fromRGB(34, 197, 94),
        Warning = Color3.fromRGB(245, 158, 11),
    },
    Light = {
        Name = "Light",
        BGColor = Color3.fromRGB(248, 250, 252),
        Surface = Color3.fromRGB(241, 245, 249),
        SurfaceAlt = Color3.fromRGB(226, 232, 240),
        Border = Color3.fromRGB(203, 213, 225),
        TextPrimary = Color3.fromRGB(15, 23, 42),
        TextSecondary = Color3.fromRGB(71, 85, 105),
        Accent = Color3.fromRGB(59, 130, 246),
        TopBar = Color3.fromRGB(255, 255, 255),
        Sidebar = Color3.fromRGB(248, 250, 252),
        Danger = Color3.fromRGB(220, 38, 38),
        Success = Color3.fromRGB(22, 163, 74),
        Warning = Color3.fromRGB(234, 179, 8),
    },
    Midnight = {
        Name = "Midnight",
        BGColor = Color3.fromRGB(10, 10, 15),
        Surface = Color3.fromRGB(20, 20, 28),
        SurfaceAlt = Color3.fromRGB(30, 30, 40),
        Border = Color3.fromRGB(45, 45, 55),
        TextPrimary = Color3.fromRGB(230, 230, 245),
        TextSecondary = Color3.fromRGB(130, 130, 155),
        Accent = Color3.fromRGB(139, 92, 246),
        TopBar = Color3.fromRGB(15, 15, 22),
        Sidebar = Color3.fromRGB(12, 12, 18),
        Danger = Color3.fromRGB(239, 68, 68),
        Success = Color3.fromRGB(16, 185, 129),
        Warning = Color3.fromRGB(245, 158, 11),
    },
    Ocean = {
        Name = "Ocean",
        BGColor = Color3.fromRGB(8, 28, 48),
        Surface = Color3.fromRGB(15, 42, 62),
        SurfaceAlt = Color3.fromRGB(25, 55, 78),
        Border = Color3.fromRGB(45, 75, 98),
        TextPrimary = Color3.fromRGB(220, 240, 255),
        TextSecondary = Color3.fromRGB(150, 185, 210),
        Accent = Color3.fromRGB(56, 189, 248),
        TopBar = Color3.fromRGB(10, 35, 55),
        Sidebar = Color3.fromRGB(12, 38, 58),
        Danger = Color3.fromRGB(248, 113, 113),
        Success = Color3.fromRGB(74, 222, 128),
        Warning = Color3.fromRGB(250, 204, 21),
    },
    Forest = {
        Name = "Forest",
        BGColor = Color3.fromRGB(15, 35, 20),
        Surface = Color3.fromRGB(25, 50, 30),
        SurfaceAlt = Color3.fromRGB(35, 65, 42),
        Border = Color3.fromRGB(50, 85, 58),
        TextPrimary = Color3.fromRGB(220, 245, 220),
        TextSecondary = Color3.fromRGB(140, 180, 140),
        Accent = Color3.fromRGB(74, 222, 128),
        TopBar = Color3.fromRGB(18, 42, 24),
        Sidebar = Color3.fromRGB(16, 38, 22),
        Danger = Color3.fromRGB(248, 113, 113),
        Success = Color3.fromRGB(74, 222, 128),
        Warning = Color3.fromRGB(250, 204, 21),
    },
    Sunset = {
        Name = "Sunset",
        BGColor = Color3.fromRGB(35, 15, 35),
        Surface = Color3.fromRGB(55, 25, 55),
        SurfaceAlt = Color3.fromRGB(75, 35, 75),
        Border = Color3.fromRGB(95, 55, 95),
        TextPrimary = Color3.fromRGB(255, 235, 245),
        TextSecondary = Color3.fromRGB(200, 160, 200),
        Accent = Color3.fromRGB(244, 114, 182),
        TopBar = Color3.fromRGB(45, 20, 45),
        Sidebar = Color3.fromRGB(40, 18, 40),
        Danger = Color3.fromRGB(248, 113, 113),
        Success = Color3.fromRGB(74, 222, 128),
        Warning = Color3.fromRGB(250, 204, 21),
    },
    Cyberpunk = {
        Name = "Cyberpunk",
        BGColor = Color3.fromRGB(10, 5, 20),
        Surface = Color3.fromRGB(20, 10, 35),
        SurfaceAlt = Color3.fromRGB(30, 18, 50),
        Border = Color3.fromRGB(255, 0, 150),
        TextPrimary = Color3.fromRGB(0, 255, 255),
        TextSecondary = Color3.fromRGB(200, 100, 255),
        Accent = Color3.fromRGB(255, 0, 255),
        TopBar = Color3.fromRGB(15, 8, 25),
        Sidebar = Color3.fromRGB(12, 6, 22),
        Danger = Color3.fromRGB(255, 50, 50),
        Success = Color3.fromRGB(0, 255, 150),
        Warning = Color3.fromRGB(255, 200, 0),
    },
    
    Lavender = {
        Name = "Lavender",
        BGColor = Color3.fromRGB(30, 20, 45),
        Surface = Color3.fromRGB(45, 30, 65),
        SurfaceAlt = Color3.fromRGB(60, 45, 85),
        Border = Color3.fromRGB(120, 80, 160),
        TextPrimary = Color3.fromRGB(240, 220, 255),
        TextSecondary = Color3.fromRGB(180, 150, 210),
        Accent = Color3.fromRGB(180, 120, 255),
        TopBar = Color3.fromRGB(35, 25, 55),
        Sidebar = Color3.fromRGB(28, 18, 48),
        Danger = Color3.fromRGB(255, 100, 100),
        Success = Color3.fromRGB(100, 255, 150),
        Warning = Color3.fromRGB(255, 200, 100),
    },
    
    Cherry = {
        Name = "Cherry",
        BGColor = Color3.fromRGB(40, 10, 20),
        Surface = Color3.fromRGB(60, 18, 30),
        SurfaceAlt = Color3.fromRGB(80, 28, 45),
        Border = Color3.fromRGB(200, 50, 100),
        TextPrimary = Color3.fromRGB(255, 220, 230),
        TextSecondary = Color3.fromRGB(200, 140, 160),
        Accent = Color3.fromRGB(255, 80, 120),
        TopBar = Color3.fromRGB(50, 14, 25),
        Sidebar = Color3.fromRGB(45, 12, 22),
        Danger = Color3.fromRGB(255, 60, 60),
        Success = Color3.fromRGB(80, 255, 120),
        Warning = Color3.fromRGB(255, 180, 60),
    },
    
    Mint = {
        Name = "Mint",
        BGColor = Color3.fromRGB(10, 30, 25),
        Surface = Color3.fromRGB(18, 50, 40),
        SurfaceAlt = Color3.fromRGB(28, 70, 58),
        Border = Color3.fromRGB(50, 120, 100),
        TextPrimary = Color3.fromRGB(200, 255, 240),
        TextSecondary = Color3.fromRGB(130, 200, 180),
        Accent = Color3.fromRGB(80, 255, 200),
        TopBar = Color3.fromRGB(14, 40, 32),
        Sidebar = Color3.fromRGB(12, 35, 28),
        Danger = Color3.fromRGB(255, 80, 80),
        Success = Color3.fromRGB(80, 255, 150),
        Warning = Color3.fromRGB(255, 220, 80),
    },
    
    Cinnamon = {
        Name = "Cinnamon",
        BGColor = Color3.fromRGB(35, 20, 15),
        Surface = Color3.fromRGB(55, 35, 25),
        SurfaceAlt = Color3.fromRGB(75, 50, 38),
        Border = Color3.fromRGB(160, 100, 60),
        TextPrimary = Color3.fromRGB(255, 235, 220),
        TextSecondary = Color3.fromRGB(200, 160, 140),
        Accent = Color3.fromRGB(255, 140, 80),
        TopBar = Color3.fromRGB(45, 28, 20),
        Sidebar = Color3.fromRGB(40, 24, 18),
        Danger = Color3.fromRGB(255, 100, 80),
        Success = Color3.fromRGB(150, 255, 100),
        Warning = Color3.fromRGB(255, 200, 80),
    },
    
    Galaxy = {
        Name = "Galaxy",
        BGColor = Color3.fromRGB(8, 5, 20),
        Surface = Color3.fromRGB(18, 12, 40),
        SurfaceAlt = Color3.fromRGB(28, 20, 60),
        Border = Color3.fromRGB(80, 60, 150),
        TextPrimary = Color3.fromRGB(200, 180, 255),
        TextSecondary = Color3.fromRGB(130, 110, 200),
        Accent = Color3.fromRGB(100, 80, 255),
        TopBar = Color3.fromRGB(12, 8, 30),
        Sidebar = Color3.fromRGB(10, 6, 25),
        Danger = Color3.fromRGB(255, 60, 100),
        Success = Color3.fromRGB(60, 255, 180),
        Warning = Color3.fromRGB(255, 180, 60),
    },
    
    Honey = {
        Name = "Honey",
        BGColor = Color3.fromRGB(40, 25, 8),
        Surface = Color3.fromRGB(60, 40, 15),
        SurfaceAlt = Color3.fromRGB(85, 58, 25),
        Border = Color3.fromRGB(200, 160, 60),
        TextPrimary = Color3.fromRGB(255, 240, 180),
        TextSecondary = Color3.fromRGB(200, 180, 120),
        Accent = Color3.fromRGB(255, 200, 50),
        TopBar = Color3.fromRGB(50, 32, 12),
        Sidebar = Color3.fromRGB(45, 28, 10),
        Danger = Color3.fromRGB(255, 100, 60),
        Success = Color3.fromRGB(180, 255, 80),
        Warning = Color3.fromRGB(255, 180, 40),
    },
    
    Ice = {
        Name = "Ice",
        BGColor = Color3.fromRGB(20, 35, 50),
        Surface = Color3.fromRGB(35, 55, 75),
        SurfaceAlt = Color3.fromRGB(50, 75, 100),
        Border = Color3.fromRGB(100, 150, 200),
        TextPrimary = Color3.fromRGB(220, 240, 255),
        TextSecondary = Color3.fromRGB(160, 190, 220),
        Accent = Color3.fromRGB(100, 200, 255),
        TopBar = Color3.fromRGB(25, 45, 62),
        Sidebar = Color3.fromRGB(22, 40, 55),
        Danger = Color3.fromRGB(255, 100, 120),
        Success = Color3.fromRGB(100, 255, 200),
        Warning = Color3.fromRGB(255, 220, 100),
    },
    
    Coffee = {
        Name = "Coffee",
        BGColor = Color3.fromRGB(30, 20, 12),
        Surface = Color3.fromRGB(45, 32, 20),
        SurfaceAlt = Color3.fromRGB(62, 45, 30),
        Border = Color3.fromRGB(100, 75, 50),
        TextPrimary = Color3.fromRGB(220, 200, 170),
        TextSecondary = Color3.fromRGB(160, 140, 110),
        Accent = Color3.fromRGB(200, 150, 80),
        TopBar = Color3.fromRGB(38, 26, 16),
        Sidebar = Color3.fromRGB(34, 23, 14),
        Danger = Color3.fromRGB(220, 100, 80),
        Success = Color3.fromRGB(150, 200, 100),
        Warning = Color3.fromRGB(220, 180, 80),
    },
    
    Neon = {
        Name = "Neon",
        BGColor = Color3.fromRGB(5, 5, 10),
        Surface = Color3.fromRGB(12, 12, 20),
        SurfaceAlt = Color3.fromRGB(20, 20, 35),
        Border = Color3.fromRGB(0, 255, 100),
        TextPrimary = Color3.fromRGB(0, 255, 150),
        TextSecondary = Color3.fromRGB(100, 200, 150),
        Accent = Color3.fromRGB(0, 255, 100),
        TopBar = Color3.fromRGB(8, 8, 15),
        Sidebar = Color3.fromRGB(6, 6, 12),
        Danger = Color3.fromRGB(255, 50, 50),
        Success = Color3.fromRGB(50, 255, 100),
        Warning = Color3.fromRGB(255, 255, 50),
    },
    
    Sakura = {
        Name = "Sakura",
        BGColor = Color3.fromRGB(45, 20, 35),
        Surface = Color3.fromRGB(65, 30, 50),
        SurfaceAlt = Color3.fromRGB(85, 45, 70),
        Border = Color3.fromRGB(255, 120, 160),
        TextPrimary = Color3.fromRGB(255, 220, 240),
        TextSecondary = Color3.fromRGB(220, 160, 190),
        Accent = Color3.fromRGB(255, 140, 180),
        TopBar = Color3.fromRGB(55, 25, 42),
        Sidebar = Color3.fromRGB(50, 22, 38),
        Danger = Color3.fromRGB(255, 80, 100),
        Success = Color3.fromRGB(180, 255, 150),
        Warning = Color3.fromRGB(255, 200, 100),
    },
    
    Monochrome = {
        Name = "Monochrome",
        BGColor = Color3.fromRGB(20, 20, 20),
        Surface = Color3.fromRGB(35, 35, 35),
        SurfaceAlt = Color3.fromRGB(50, 50, 50),
        Border = Color3.fromRGB(80, 80, 80),
        TextPrimary = Color3.fromRGB(240, 240, 240),
        TextSecondary = Color3.fromRGB(160, 160, 160),
        Accent = Color3.fromRGB(180, 180, 180),
        TopBar = Color3.fromRGB(28, 28, 28),
        Sidebar = Color3.fromRGB(24, 24, 24),
        Danger = Color3.fromRGB(200, 80, 80),
        Success = Color3.fromRGB(80, 200, 80),
        Warning = Color3.fromRGB(200, 200, 80),
    },
    
    Amethyst = {
        Name = "Amethyst",
        BGColor = Color3.fromRGB(25, 15, 40),
        Surface = Color3.fromRGB(40, 25, 60),
        SurfaceAlt = Color3.fromRGB(58, 38, 85),
        Border = Color3.fromRGB(130, 80, 200),
        TextPrimary = Color3.fromRGB(230, 210, 255),
        TextSecondary = Color3.fromRGB(170, 140, 210),
        Accent = Color3.fromRGB(160, 100, 255),
        TopBar = Color3.fromRGB(32, 20, 50),
        Sidebar = Color3.fromRGB(28, 18, 45),
        Danger = Color3.fromRGB(255, 80, 120),
        Success = Color3.fromRGB(100, 255, 180),
        Warning = Color3.fromRGB(255, 200, 80),
    },
    
    Emerald = {
        Name = "Emerald",
        BGColor = Color3.fromRGB(10, 30, 15),
        Surface = Color3.fromRGB(18, 50, 25),
        SurfaceAlt = Color3.fromRGB(28, 72, 38),
        Border = Color3.fromRGB(40, 150, 80),
        TextPrimary = Color3.fromRGB(200, 255, 210),
        TextSecondary = Color3.fromRGB(130, 200, 140),
        Accent = Color3.fromRGB(50, 255, 100),
        TopBar = Color3.fromRGB(14, 40, 20),
        Sidebar = Color3.fromRGB(12, 35, 18),
        Danger = Color3.fromRGB(255, 80, 80),
        Success = Color3.fromRGB(80, 255, 100),
        Warning = Color3.fromRGB(255, 220, 80),
    },
    
    Ruby = {
        Name = "Ruby",
        BGColor = Color3.fromRGB(45, 10, 15),
        Surface = Color3.fromRGB(65, 18, 25),
        SurfaceAlt = Color3.fromRGB(90, 28, 38),
        Border = Color3.fromRGB(200, 60, 80),
        TextPrimary = Color3.fromRGB(255, 210, 220),
        TextSecondary = Color3.fromRGB(200, 140, 150),
        Accent = Color3.fromRGB(255, 70, 100),
        TopBar = Color3.fromRGB(55, 14, 20),
        Sidebar = Color3.fromRGB(50, 12, 18),
        Danger = Color3.fromRGB(255, 50, 60),
        Success = Color3.fromRGB(100, 255, 150),
        Warning = Color3.fromRGB(255, 180, 60),
    },
    
    Cobalt = {
        Name = "Cobalt",
        BGColor = Color3.fromRGB(10, 15, 45),
        Surface = Color3.fromRGB(18, 25, 65),
        SurfaceAlt = Color3.fromRGB(28, 38, 90),
        Border = Color3.fromRGB(60, 80, 200),
        TextPrimary = Color3.fromRGB(200, 220, 255),
        TextSecondary = Color3.fromRGB(140, 160, 220),
        Accent = Color3.fromRGB(60, 100, 255),
        TopBar = Color3.fromRGB(14, 20, 55),
        Sidebar = Color3.fromRGB(12, 18, 50),
        Danger = Color3.fromRGB(255, 80, 100),
        Success = Color3.fromRGB(80, 255, 180),
        Warning = Color3.fromRGB(255, 200, 80),
    },
    
    Pumpkin = {
        Name = "Pumpkin",
        BGColor = Color3.fromRGB(45, 20, 8),
        Surface = Color3.fromRGB(65, 32, 15),
        SurfaceAlt = Color3.fromRGB(90, 48, 25),
        Border = Color3.fromRGB(220, 120, 40),
        TextPrimary = Color3.fromRGB(255, 230, 190),
        TextSecondary = Color3.fromRGB(210, 170, 130),
        Accent = Color3.fromRGB(255, 140, 40),
        TopBar = Color3.fromRGB(55, 26, 12),
        Sidebar = Color3.fromRGB(50, 23, 10),
        Danger = Color3.fromRGB(255, 80, 60),
        Success = Color3.fromRGB(150, 255, 100),
        Warning = Color3.fromRGB(255, 200, 60),
    },
    
    Arctic = {
        Name = "Arctic",
        BGColor = Color3.fromRGB(15, 25, 35),
        Surface = Color3.fromRGB(25, 40, 55),
        SurfaceAlt = Color3.fromRGB(40, 60, 80),
        Border = Color3.fromRGB(100, 150, 220),
        TextPrimary = Color3.fromRGB(220, 240, 255),
        TextSecondary = Color3.fromRGB(160, 190, 230),
        Accent = Color3.fromRGB(80, 180, 255),
        TopBar = Color3.fromRGB(20, 32, 45),
        Sidebar = Color3.fromRGB(18, 28, 40),
        Danger = Color3.fromRGB(255, 100, 100),
        Success = Color3.fromRGB(100, 255, 200),
        Warning = Color3.fromRGB(255, 220, 100),
    },
    
    Rose = {
        Name = "Rose",
        BGColor = Color3.fromRGB(40, 15, 25),
        Surface = Color3.fromRGB(60, 25, 40),
        SurfaceAlt = Color3.fromRGB(85, 40, 60),
        Border = Color3.fromRGB(220, 100, 140),
        TextPrimary = Color3.fromRGB(255, 220, 235),
        TextSecondary = Color3.fromRGB(210, 160, 180),
        Accent = Color3.fromRGB(255, 100, 150),
        TopBar = Color3.fromRGB(50, 20, 32),
        Sidebar = Color3.fromRGB(45, 18, 28),
        Danger = Color3.fromRGB(255, 70, 90),
        Success = Color3.fromRGB(150, 255, 150),
        Warning = Color3.fromRGB(255, 200, 100),
    },
}


for name, theme in pairs(BuiltInThemes) do
    ThemeManager.Themes[name] = theme
end

function ThemeManager:RegisterTheme(name, themeData)
    themeData.Name = name
    self.Themes[name] = themeData
    if not self.CurrentTheme then
        self:SetTheme(name)
    end
    self:_NotifyListeners()
end

function ThemeManager:SetTheme(themeName)
    local theme = self.Themes[themeName]
    if not theme then return false end
    
    self.CurrentTheme = themeName
    _G.BGColor = theme.BGColor
    _G.Surface = theme.Surface
    _G.SurfaceAlt = theme.SurfaceAlt
    _G.Border = theme.Border
    _G.TextPrimary = theme.TextPrimary
    _G.TextSecondary = theme.TextSecondary
    _G.Accent = theme.Accent
    _G.TopBar = theme.TopBar or theme.Surface
    _G.Sidebar = theme.Sidebar or theme.BGColor
    _G.Danger = theme.Danger or Color3.fromRGB(239, 68, 68)
    _G.Success = theme.Success or Color3.fromRGB(34, 197, 94)
    _G.Warning = theme.Warning or Color3.fromRGB(245, 158, 11)
    
    self:_NotifyListeners()
    return true
end

function ThemeManager:GetCurrentTheme()
    return self.CurrentTheme, self.Themes[self.CurrentTheme]
end

function ThemeManager:GetTheme(themeName)
    return self.Themes[themeName]
end

function ThemeManager:GetAllThemes()
    local themes = {}
    for name, _ in pairs(self.Themes) do
        table.insert(themes, name)
    end
    return themes
end

function ThemeManager:AddListener(callback)
    table.insert(self.ThemeListeners, callback)
end

function ThemeManager:_NotifyListeners()
    for _, callback in ipairs(self.ThemeListeners) do
        pcall(callback, self.Themes[self.CurrentTheme])
    end
end

function ThemeManager:CreateCustomTheme(name, baseTheme, modifications)
    local base = self.Themes[baseTheme] or self.Themes["Dark"]
    local newTheme = {}
    for k, v in pairs(base) do
        newTheme[k] = modifications[k] or v
    end
    newTheme.Name = name
    self:RegisterTheme(name, newTheme)
    return newTheme
end




local Icons = {
    ["accessibility"] = "rbxassetid://10709751939",
    ["activity"] = "rbxassetid://10709752035",
    ["air-vent"] = "rbxassetid://10709752131",
    ["airplay"] = "rbxassetid://10709752254",
    ["alarm-check"] = "rbxassetid://10709752405",
    ["alarm-clock"] = "rbxassetid://10709752630",
    ["alarm-clock-off"] = "rbxassetid://10709752508",
    ["alarm-minus"] = "rbxassetid://10709752732",
    ["alarm-plus"] = "rbxassetid://10709752825",
    ["album"] = "rbxassetid://10709752906",
    ["alert-circle"] = "rbxassetid://10709752996",
    ["alert-octagon"] = "rbxassetid://10709753064",
    ["alert-triangle"] = "rbxassetid://10709753149",
    ["align-center"] = "rbxassetid://10709753570",
    ["align-center-horizontal"] = "rbxassetid://10709753272",
    ["align-center-vertical"] = "rbxassetid://10709753421",
    ["align-end-horizontal"] = "rbxassetid://10709753692",
    ["align-end-vertical"] = "rbxassetid://10709753808",
    ["align-horizontal-distribute-center"] = "rbxassetid://10747779791",
    ["align-horizontal-distribute-end"] = "rbxassetid://10747784534",
    ["align-horizontal-distribute-start"] = "rbxassetid://10709754118",
    ["align-horizontal-justify-center"] = "rbxassetid://10709754204",
    ["align-horizontal-justify-end"] = "rbxassetid://10709754317",
    ["align-horizontal-justify-start"] = "rbxassetid://10709754436",
    ["align-horizontal-space-around"] = "rbxassetid://10709754590",
    ["align-horizontal-space-between"] = "rbxassetid://10709754749",
    ["align-justify"] = "rbxassetid://10709759610",
    ["align-left"] = "rbxassetid://10709759764",
    ["align-right"] = "rbxassetid://10709759895",
    ["align-start-horizontal"] = "rbxassetid://10709760051",
    ["align-start-vertical"] = "rbxassetid://10709760244",
    ["align-vertical-distribute-center"] = "rbxassetid://10709760351",
    ["align-vertical-distribute-end"] = "rbxassetid://10709760434",
    ["align-vertical-distribute-start"] = "rbxassetid://10709760612",
    ["align-vertical-justify-center"] = "rbxassetid://10709760814",
    ["align-vertical-justify-end"] = "rbxassetid://10709761003",
    ["align-vertical-justify-start"] = "rbxassetid://10709761176",
    ["align-vertical-space-around"] = "rbxassetid://10709761324",
    ["align-vertical-space-between"] = "rbxassetid://10709761434",
    ["anchor"] = "rbxassetid://10709761530",
    ["angry"] = "rbxassetid://10709761629",
    ["annoyed"] = "rbxassetid://10709761722",
    ["aperture"] = "rbxassetid://10709761813",
    ["apple"] = "rbxassetid://10709761889",
    ["archive"] = "rbxassetid://10709762233",
    ["archive-restore"] = "rbxassetid://10709762058",
    ["armchair"] = "rbxassetid://10709762327",
    ["anvil"] = "rbxassetid://77943964625400",
    ["arrow-big-down"] = "rbxassetid://10747796644",
    ["arrow-big-left"] = "rbxassetid://10709762574",
    ["arrow-big-right"] = "rbxassetid://10709762727",
    ["arrow-big-up"] = "rbxassetid://10709762879",
    ["arrow-down"] = "rbxassetid://10709767827",
    ["arrow-down-circle"] = "rbxassetid://10709763034",
    ["arrow-down-left"] = "rbxassetid://10709767656",
    ["arrow-down-right"] = "rbxassetid://10709767750",
    ["arrow-left"] = "rbxassetid://10709768114",
    ["arrow-left-circle"] = "rbxassetid://10709767936",
    ["arrow-left-right"] = "rbxassetid://10709768019",
    ["arrow-right"] = "rbxassetid://10709768347",
    ["arrow-right-circle"] = "rbxassetid://10709768226",
    ["arrow-up"] = "rbxassetid://10709768939",
    ["arrow-up-circle"] = "rbxassetid://10709768432",
    ["arrow-up-down"] = "rbxassetid://10709768538",
    ["arrow-up-left"] = "rbxassetid://10709768661",
    ["arrow-up-right"] = "rbxassetid://10709768787",
    ["asterisk"] = "rbxassetid://10709769095",
    ["at-sign"] = "rbxassetid://10709769286",
    ["award"] = "rbxassetid://10709769406",
    ["axe"] = "rbxassetid://10709769508",
    ["axis-3d"] = "rbxassetid://10709769598",
    ["baby"] = "rbxassetid://10709769732",
    ["backpack"] = "rbxassetid://10709769841",
    ["baggage-claim"] = "rbxassetid://10709769935",
    ["banana"] = "rbxassetid://10709770005",
    ["banknote"] = "rbxassetid://10709770178",
    ["bar-chart"] = "rbxassetid://10709773755",
    ["bar-chart-2"] = "rbxassetid://10709770317",
    ["bar-chart-3"] = "rbxassetid://10709770431",
    ["bar-chart-4"] = "rbxassetid://10709770560",
    ["bar-chart-horizontal"] = "rbxassetid://10709773669",
    ["barcode"] = "rbxassetid://10747360675",
    ["baseline"] = "rbxassetid://10709773863",
    ["bath"] = "rbxassetid://10709773963",
    ["battery"] = "rbxassetid://10709774640",
    ["battery-charging"] = "rbxassetid://10709774068",
    ["battery-full"] = "rbxassetid://10709774206",
    ["battery-low"] = "rbxassetid://10709774370",
    ["battery-medium"] = "rbxassetid://10709774513",
    ["beaker"] = "rbxassetid://10709774756",
    ["bed"] = "rbxassetid://10709775036",
    ["bed-double"] = "rbxassetid://10709774864",
    ["bed-single"] = "rbxassetid://10709774968",
    ["beer"] = "rbxassetid://10709775167",
    ["bell"] = "rbxassetid://10709775704",
    ["bell-minus"] = "rbxassetid://10709775241",
    ["bell-off"] = "rbxassetid://10709775320",
    ["bell-plus"] = "rbxassetid://10709775448",
    ["bell-ring"] = "rbxassetid://10709775560",
    ["bike"] = "rbxassetid://10709775894",
    ["binary"] = "rbxassetid://10709776050",
    ["bitcoin"] = "rbxassetid://10709776126",
    ["bluetooth"] = "rbxassetid://10709776655",
    ["bluetooth-connected"] = "rbxassetid://10709776240",
    ["bluetooth-off"] = "rbxassetid://10709776344",
    ["bluetooth-searching"] = "rbxassetid://10709776501",
    ["bold"] = "rbxassetid://10747813908",
    ["bomb"] = "rbxassetid://10709781460",
    ["bone"] = "rbxassetid://10709781605",
    ["book"] = "rbxassetid://10709781824",
    ["book-open"] = "rbxassetid://10709781717",
    ["bookmark"] = "rbxassetid://10709782154",
    ["bookmark-minus"] = "rbxassetid://10709781919",
    ["bookmark-plus"] = "rbxassetid://10709782044",
    ["bot"] = "rbxassetid://10709782230",
    ["box"] = "rbxassetid://10709782497",
    ["box-select"] = "rbxassetid://10709782342",
    ["boxes"] = "rbxassetid://10709782582",
    ["briefcase"] = "rbxassetid://10709782662",
    ["brush"] = "rbxassetid://10709782758",
    ["bug"] = "rbxassetid://10709782845",
    ["building"] = "rbxassetid://10709783051",
    ["building-2"] = "rbxassetid://10709782939",
    ["bus"] = "rbxassetid://10709783137",
    ["cake"] = "rbxassetid://10709783217",
    ["calculator"] = "rbxassetid://10709783311",
    ["calendar"] = "rbxassetid://10709789505",
    ["calendar-check"] = "rbxassetid://10709783474",
    ["calendar-check-2"] = "rbxassetid://10709783392",
    ["calendar-clock"] = "rbxassetid://10709783577",
    ["calendar-days"] = "rbxassetid://10709783673",
    ["calendar-heart"] = "rbxassetid://10709783835",
    ["calendar-minus"] = "rbxassetid://10709783959",
    ["calendar-off"] = "rbxassetid://10709788784",
    ["calendar-plus"] = "rbxassetid://10709788937",
    ["calendar-range"] = "rbxassetid://10709789053",
    ["calendar-search"] = "rbxassetid://10709789200",
    ["calendar-x"] = "rbxassetid://10709789407",
    ["calendar-x-2"] = "rbxassetid://10709789329",
    ["camera"] = "rbxassetid://10709789686",
    ["camera-off"] = "rbxassetid://10747822677",
    ["car"] = "rbxassetid://10709789810",
    ["carrot"] = "rbxassetid://10709789960",
    ["cast"] = "rbxassetid://10709790097",
    ["charge"] = "rbxassetid://10709790202",
    ["check"] = "rbxassetid://10709790644",
    ["check-circle"] = "rbxassetid://10709790387",
    ["check-circle-2"] = "rbxassetid://10709790298",
    ["check-square"] = "rbxassetid://10709790537",
    ["chef-hat"] = "rbxassetid://10709790757",
    ["cherry"] = "rbxassetid://10709790875",
    ["chevron-down"] = "rbxassetid://10709790948",
    ["chevron-first"] = "rbxassetid://10709791015",
    ["chevron-last"] = "rbxassetid://10709791130",
    ["chevron-left"] = "rbxassetid://10709791281",
    ["chevron-right"] = "rbxassetid://10709791437",
    ["chevron-up"] = "rbxassetid://10709791523",
    ["chevrons-down"] = "rbxassetid://10709796864",
    ["chevrons-down-up"] = "rbxassetid://10709791632",
    ["chevrons-left"] = "rbxassetid://10709797151",
    ["chevrons-left-right"] = "rbxassetid://10709797006",
    ["chevrons-right"] = "rbxassetid://10709797382",
    ["chevrons-right-left"] = "rbxassetid://10709797274",
    ["chevrons-up"] = "rbxassetid://10709797622",
    ["chevrons-up-down"] = "rbxassetid://10709797508",
    ["chrome"] = "rbxassetid://10709797725",
    ["circle"] = "rbxassetid://10709798174",
    ["circle-dot"] = "rbxassetid://10709797837",
    ["circle-ellipsis"] = "rbxassetid://10709797985",
    ["circle-slashed"] = "rbxassetid://10709798100",
    ["citrus"] = "rbxassetid://10709798276",
    ["clapperboard"] = "rbxassetid://10709798350",
    ["clipboard"] = "rbxassetid://10709799288",
    ["clipboard-check"] = "rbxassetid://10709798443",
    ["clipboard-copy"] = "rbxassetid://10709798574",
    ["clipboard-edit"] = "rbxassetid://10709798682",
    ["clipboard-list"] = "rbxassetid://10709798792",
    ["clipboard-signature"] = "rbxassetid://10709798890",
    ["clipboard-type"] = "rbxassetid://10709798999",
    ["clipboard-x"] = "rbxassetid://10709799124",
    ["clock"] = "rbxassetid://10709805144",
    ["clock-1"] = "rbxassetid://10709799535",
    ["clock-10"] = "rbxassetid://10709799718",
    ["clock-11"] = "rbxassetid://10709799818",
    ["clock-12"] = "rbxassetid://10709799962",
    ["clock-2"] = "rbxassetid://10709803876",
    ["clock-3"] = "rbxassetid://10709803989",
    ["clock-4"] = "rbxassetid://10709804164",
    ["clock-5"] = "rbxassetid://10709804291",
    ["clock-6"] = "rbxassetid://10709804435",
    ["clock-7"] = "rbxassetid://10709804599",
    ["clock-8"] = "rbxassetid://10709804784",
    ["clock-9"] = "rbxassetid://10709804996",
    ["cloud"] = "rbxassetid://10709806740",
    ["cloud-cog"] = "rbxassetid://10709805262",
    ["cloud-drizzle"] = "rbxassetid://10709805371",
    ["cloud-fog"] = "rbxassetid://10709805477",
    ["cloud-hail"] = "rbxassetid://10709805596",
    ["cloud-lightning"] = "rbxassetid://10709805727",
    ["cloud-moon"] = "rbxassetid://10709805942",
    ["cloud-moon-rain"] = "rbxassetid://10709805838",
    ["cloud-off"] = "rbxassetid://10709806060",
    ["cloud-rain"] = "rbxassetid://10709806277",
    ["cloud-rain-wind"] = "rbxassetid://10709806166",
    ["cloud-snow"] = "rbxassetid://10709806374",
    ["cloud-sun"] = "rbxassetid://10709806631",
    ["cloud-sun-rain"] = "rbxassetid://10709806475",
    ["cloudy"] = "rbxassetid://10709806859",
    ["clover"] = "rbxassetid://10709806995",
    ["code"] = "rbxassetid://10709810463",
    ["code-2"] = "rbxassetid://10709807111",
    ["codepen"] = "rbxassetid://10709810534",
    ["codesandbox"] = "rbxassetid://10709810676",
    ["coffee"] = "rbxassetid://10709810814",
    ["cog"] = "rbxassetid://10709810948",
    ["coins"] = "rbxassetid://10709811110",
    ["columns"] = "rbxassetid://10709811261",
    ["command"] = "rbxassetid://10709811365",
    ["compass"] = "rbxassetid://10709811445",
    ["component"] = "rbxassetid://10709811595",
    ["concierge-bell"] = "rbxassetid://10709811706",
    ["connection"] = "rbxassetid://10747361219",
    ["contact"] = "rbxassetid://10709811834",
    ["contrast"] = "rbxassetid://10709811939",
    ["cookie"] = "rbxassetid://10709812067",
    ["copy"] = "rbxassetid://10709812159",
    ["copyleft"] = "rbxassetid://10709812251",
    ["copyright"] = "rbxassetid://10709812311",
    ["corner-down-left"] = "rbxassetid://10709812396",
    ["corner-down-right"] = "rbxassetid://10709812485",
    ["corner-left-down"] = "rbxassetid://10709812632",
    ["corner-left-up"] = "rbxassetid://10709812784",
    ["corner-right-down"] = "rbxassetid://10709812939",
    ["corner-right-up"] = "rbxassetid://10709813094",
    ["corner-up-left"] = "rbxassetid://10709813185",
    ["corner-up-right"] = "rbxassetid://10709813281",
    ["cpu"] = "rbxassetid://10709813383",
    ["croissant"] = "rbxassetid://10709818125",
    ["crop"] = "rbxassetid://10709818245",
    ["cross"] = "rbxassetid://10709818399",
    ["crosshair"] = "rbxassetid://10709818534",
    ["crown"] = "rbxassetid://10709818626",
    ["cup-soda"] = "rbxassetid://10709818763",
    ["curly-braces"] = "rbxassetid://10709818847",
    ["currency"] = "rbxassetid://10709818931",
    ["container"] = "rbxassetid://17466205552",
    ["database"] = "rbxassetid://10709818996",
    ["delete"] = "rbxassetid://10709819059",
    ["diamond"] = "rbxassetid://10709819149",
    ["dice-1"] = "rbxassetid://10709819266",
    ["dice-2"] = "rbxassetid://10709819361",
    ["dice-3"] = "rbxassetid://10709819508",
    ["dice-4"] = "rbxassetid://10709819670",
    ["dice-5"] = "rbxassetid://10709819801",
    ["dice-6"] = "rbxassetid://10709819896",
    ["dices"] = "rbxassetid://10723343321",
    ["diff"] = "rbxassetid://10723343416",
    ["disc"] = "rbxassetid://10723343537",
    ["divide"] = "rbxassetid://10723343805",
    ["divide-circle"] = "rbxassetid://10723343636",
    ["divide-square"] = "rbxassetid://10723343737",
    ["dollar-sign"] = "rbxassetid://10723343958",
    ["download"] = "rbxassetid://10723344270",
    ["download-cloud"] = "rbxassetid://10723344088",
    ["door-open"] = "rbxassetid://124179241653522",
    ["droplet"] = "rbxassetid://10723344432",
    ["droplets"] = "rbxassetid://10734883356",
    ["drumstick"] = "rbxassetid://10723344737",
    ["edit"] = "rbxassetid://10734883598",
    ["edit-2"] = "rbxassetid://10723344885",
    ["edit-3"] = "rbxassetid://10723345088",
    ["egg"] = "rbxassetid://10723345518",
    ["egg-fried"] = "rbxassetid://10723345347",
    ["electricity"] = "rbxassetid://10723345749",
    ["electricity-off"] = "rbxassetid://10723345643",
    ["equal"] = "rbxassetid://10723345990",
    ["equal-not"] = "rbxassetid://10723345866",
    ["eraser"] = "rbxassetid://10723346158",
    ["euro"] = "rbxassetid://10723346372",
    ["expand"] = "rbxassetid://10723346553",
    ["external-link"] = "rbxassetid://10723346684",
    ["eye"] = "rbxassetid://10723346959",
    ["eye-off"] = "rbxassetid://10723346871",
    ["factory"] = "rbxassetid://10723347051",
    ["fan"] = "rbxassetid://10723354359",
    ["fast-forward"] = "rbxassetid://10723354521",
    ["feather"] = "rbxassetid://10723354671",
    ["figma"] = "rbxassetid://10723354801",
    ["file"] = "rbxassetid://10723374641",
    ["file-archive"] = "rbxassetid://10723354921",
    ["file-audio"] = "rbxassetid://10723355148",
    ["file-audio-2"] = "rbxassetid://10723355026",
    ["file-axis-3d"] = "rbxassetid://10723355272",
    ["file-badge"] = "rbxassetid://10723355622",
    ["file-badge-2"] = "rbxassetid://10723355451",
    ["file-bar-chart"] = "rbxassetid://10723355887",
    ["file-bar-chart-2"] = "rbxassetid://10723355746",
    ["file-box"] = "rbxassetid://10723355989",
    ["file-check"] = "rbxassetid://10723356210",
    ["file-check-2"] = "rbxassetid://10723356100",
    ["file-clock"] = "rbxassetid://10723356329",
    ["file-code"] = "rbxassetid://10723356507",
    ["file-cog"] = "rbxassetid://10723356830",
    ["file-cog-2"] = "rbxassetid://10723356676",
    ["file-diff"] = "rbxassetid://10723357039",
    ["file-digit"] = "rbxassetid://10723357151",
    ["file-down"] = "rbxassetid://10723357322",
    ["file-edit"] = "rbxassetid://10723357495",
    ["file-heart"] = "rbxassetid://10723357637",
    ["file-image"] = "rbxassetid://10723357790",
    ["file-input"] = "rbxassetid://10723357933",
    ["file-json"] = "rbxassetid://10723364435",
    ["file-json-2"] = "rbxassetid://10723364361",
    ["file-key"] = "rbxassetid://10723364605",
    ["file-key-2"] = "rbxassetid://10723364515",
    ["file-line-chart"] = "rbxassetid://10723364725",
    ["file-lock"] = "rbxassetid://10723364957",
    ["file-lock-2"] = "rbxassetid://10723364861",
    ["file-minus"] = "rbxassetid://10723365254",
    ["file-minus-2"] = "rbxassetid://10723365086",
    ["file-output"] = "rbxassetid://10723365457",
    ["file-pie-chart"] = "rbxassetid://10723365598",
    ["file-plus"] = "rbxassetid://10723365877",
    ["file-plus-2"] = "rbxassetid://10723365766",
    ["file-question"] = "rbxassetid://10723365987",
    ["file-scan"] = "rbxassetid://10723366167",
    ["file-search"] = "rbxassetid://10723366550",
    ["file-search-2"] = "rbxassetid://10723366340",
    ["file-signature"] = "rbxassetid://10723366741",
    ["file-spreadsheet"] = "rbxassetid://10723366962",
    ["file-symlink"] = "rbxassetid://10723367098",
    ["file-terminal"] = "rbxassetid://10723367244",
    ["file-text"] = "rbxassetid://10723367380",
    ["file-type"] = "rbxassetid://10723367606",
    ["file-type-2"] = "rbxassetid://10723367509",
    ["file-up"] = "rbxassetid://10723367734",
    ["file-video"] = "rbxassetid://10723373884",
    ["file-video-2"] = "rbxassetid://10723367834",
    ["file-volume"] = "rbxassetid://10723374172",
    ["file-volume-2"] = "rbxassetid://10723374030",
    ["file-warning"] = "rbxassetid://10723374276",
    ["file-x"] = "rbxassetid://10723374544",
    ["file-x-2"] = "rbxassetid://10723374378",
    ["files"] = "rbxassetid://10723374759",
    ["film"] = "rbxassetid://10723374981",
    ["filter"] = "rbxassetid://10723375128",
    ["fingerprint"] = "rbxassetid://10723375250",
    ["flag"] = "rbxassetid://10723375890",
    ["flag-off"] = "rbxassetid://10723375443",
    ["flag-triangle-left"] = "rbxassetid://10723375608",
    ["flag-triangle-right"] = "rbxassetid://10723375727",
    ["flame"] = "rbxassetid://10723376114",
    ["flashlight"] = "rbxassetid://10723376471",
    ["flashlight-off"] = "rbxassetid://10723376365",
    ["flask-conical"] = "rbxassetid://10734883986",
    ["flask-round"] = "rbxassetid://10723376614",
    ["flip-horizontal"] = "rbxassetid://10723376884",
    ["flip-horizontal-2"] = "rbxassetid://10723376745",
    ["flip-vertical"] = "rbxassetid://10723377138",
    ["flip-vertical-2"] = "rbxassetid://10723377026",
    ["flower"] = "rbxassetid://10747830374",
    ["flower-2"] = "rbxassetid://10723377305",
    ["focus"] = "rbxassetid://10723377537",
    ["folder"] = "rbxassetid://10723387563",
    ["folder-archive"] = "rbxassetid://10723384478",
    ["folder-check"] = "rbxassetid://10723384605",
    ["folder-clock"] = "rbxassetid://10723384731",
    ["folder-closed"] = "rbxassetid://10723384893",
    ["folder-cog"] = "rbxassetid://10723385213",
    ["folder-cog-2"] = "rbxassetid://10723385036",
    ["folder-down"] = "rbxassetid://10723385338",
    ["folder-edit"] = "rbxassetid://10723385445",
    ["folder-heart"] = "rbxassetid://10723385545",
    ["folder-input"] = "rbxassetid://10723385721",
    ["folder-key"] = "rbxassetid://10723385848",
    ["folder-lock"] = "rbxassetid://10723386005",
    ["folder-minus"] = "rbxassetid://10723386127",
    ["folder-open"] = "rbxassetid://10723386277",
    ["folder-output"] = "rbxassetid://10723386386",
    ["folder-plus"] = "rbxassetid://10723386531",
    ["folder-search"] = "rbxassetid://10723386787",
    ["folder-search-2"] = "rbxassetid://10723386674",
    ["folder-symlink"] = "rbxassetid://10723386930",
    ["folder-tree"] = "rbxassetid://10723387085",
    ["folder-up"] = "rbxassetid://10723387265",
    ["folder-x"] = "rbxassetid://10723387448",
    ["folders"] = "rbxassetid://10723387721",
    ["form-input"] = "rbxassetid://10723387841",
    ["forward"] = "rbxassetid://10723388016",
    ["frame"] = "rbxassetid://10723394389",
    ["framer"] = "rbxassetid://10723394565",
    ["frown"] = "rbxassetid://10723394681",
    ["fuel"] = "rbxassetid://10723394846",
    ["function-square"] = "rbxassetid://10723395041",
    ["gamepad"] = "rbxassetid://10723395457",
    ["gamepad-2"] = "rbxassetid://10723395215",
    ["gauge"] = "rbxassetid://10723395708",
    ["gavel"] = "rbxassetid://10723395896",
    ["gem"] = "rbxassetid://10723396000",
    ["ghost"] = "rbxassetid://10723396107",
    ["gift"] = "rbxassetid://10723396402",
    ["gift-card"] = "rbxassetid://10723396225",
    ["git-branch"] = "rbxassetid://10723396676",
    ["git-branch-plus"] = "rbxassetid://10723396542",
    ["git-commit"] = "rbxassetid://10723396812",
    ["git-compare"] = "rbxassetid://10723396954",
    ["git-fork"] = "rbxassetid://10723397049",
    ["git-merge"] = "rbxassetid://10723397165",
    ["git-pull-request"] = "rbxassetid://10723397431",
    ["git-pull-request-closed"] = "rbxassetid://10723397268",
    ["git-pull-request-draft"] = "rbxassetid://10734884302",
    ["glass"] = "rbxassetid://10723397788",
    ["glass-2"] = "rbxassetid://10723397529",
    ["glass-water"] = "rbxassetid://10723397678",
    ["glasses"] = "rbxassetid://10723397895",
    ["globe"] = "rbxassetid://10723404337",
    ["globe-2"] = "rbxassetid://10723398002",
    ["grab"] = "rbxassetid://10723404472",
    ["graduation-cap"] = "rbxassetid://10723404691",
    ["grape"] = "rbxassetid://10723404822",
    ["grid"] = "rbxassetid://10723404936",
    ["grip-horizontal"] = "rbxassetid://10723405089",
    ["grip-vertical"] = "rbxassetid://10723405236",
    ["hammer"] = "rbxassetid://10723405360",
    ["hand"] = "rbxassetid://10723405649",
    ["hand-metal"] = "rbxassetid://10723405508",
    ["hard-drive"] = "rbxassetid://10723405749",
    ["hard-hat"] = "rbxassetid://10723405859",
    ["hash"] = "rbxassetid://10723405975",
    ["haze"] = "rbxassetid://10723406078",
    ["headphones"] = "rbxassetid://10723406165",
    ["heart"] = "rbxassetid://10723406885",
    ["heart-crack"] = "rbxassetid://10723406299",
    ["heart-handshake"] = "rbxassetid://10723406480",
    ["heart-off"] = "rbxassetid://10723406662",
    ["heart-pulse"] = "rbxassetid://10723406795",
    ["help-circle"] = "rbxassetid://10723406988",
    ["hexagon"] = "rbxassetid://10723407092",
    ["highlighter"] = "rbxassetid://10723407192",
    ["history"] = "rbxassetid://10723407335",
    ["home"] = "rbxassetid://10723407389",
    ["hourglass"] = "rbxassetid://10723407498",
    ["ice-cream"] = "rbxassetid://10723414308",
    ["image"] = "rbxassetid://10723415040",
    ["image-minus"] = "rbxassetid://10723414487",
    ["image-off"] = "rbxassetid://10723414677",
    ["image-plus"] = "rbxassetid://10723414827",
    ["import"] = "rbxassetid://10723415205",
    ["inbox"] = "rbxassetid://10723415335",
    ["indent"] = "rbxassetid://10723415494",
    ["indian-rupee"] = "rbxassetid://10723415642",
    ["infinity"] = "rbxassetid://10723415766",
    ["info"] = "rbxassetid://10723415903",
    ["inspect"] = "rbxassetid://10723416057",
    ["italic"] = "rbxassetid://10723416195",
    ["japanese-yen"] = "rbxassetid://10723416363",
    ["joystick"] = "rbxassetid://10723416527",
    ["key"] = "rbxassetid://10723416652",
    ["keyboard"] = "rbxassetid://10723416765",
    ["lamp"] = "rbxassetid://10723417513",
    ["lamp-ceiling"] = "rbxassetid://10723416922",
    ["lamp-desk"] = "rbxassetid://10723417016",
    ["lamp-floor"] = "rbxassetid://10723417131",
    ["lamp-wall-down"] = "rbxassetid://10723417240",
    ["lamp-wall-up"] = "rbxassetid://10723417356",
    ["landmark"] = "rbxassetid://10723417608",
    ["languages"] = "rbxassetid://10723417703",
    ["laptop"] = "rbxassetid://10723423881",
    ["laptop-2"] = "rbxassetid://10723417797",
    ["lasso"] = "rbxassetid://10723424235",
    ["lasso-select"] = "rbxassetid://10723424058",
    ["laugh"] = "rbxassetid://10723424372",
    ["layers"] = "rbxassetid://10723424505",
    ["layout"] = "rbxassetid://10723425376",
    ["layout-dashboard"] = "rbxassetid://10723424646",
    ["layout-grid"] = "rbxassetid://10723424838",
    ["layout-list"] = "rbxassetid://10723424963",
    ["layout-template"] = "rbxassetid://10723425187",
    ["leaf"] = "rbxassetid://10723425539",
    ["library"] = "rbxassetid://10723425615",
    ["life-buoy"] = "rbxassetid://10723425685",
    ["lightbulb"] = "rbxassetid://10723425852",
    ["lightbulb-off"] = "rbxassetid://10723425762",
    ["line-chart"] = "rbxassetid://10723426393",
    ["link"] = "rbxassetid://10723426722",
    ["link-2"] = "rbxassetid://10723426595",
    ["link-2-off"] = "rbxassetid://10723426513",
    ["list"] = "rbxassetid://10723433811",
    ["list-checks"] = "rbxassetid://10734884548",
    ["list-end"] = "rbxassetid://10723426886",
    ["list-minus"] = "rbxassetid://10723426986",
    ["list-music"] = "rbxassetid://10723427081",
    ["list-ordered"] = "rbxassetid://10723427199",
    ["list-plus"] = "rbxassetid://10723427334",
    ["list-start"] = "rbxassetid://10723427494",
    ["list-video"] = "rbxassetid://10723427619",
    ["list-todo"] = "rbxassetid://17376008003",
    ["list-x"] = "rbxassetid://10723433655",
    ["loader"] = "rbxassetid://10723434070",
    ["loader-2"] = "rbxassetid://10723433935",
    ["locate"] = "rbxassetid://10723434557",
    ["locate-fixed"] = "rbxassetid://10723434236",
    ["locate-off"] = "rbxassetid://10723434379",
    ["lock"] = "rbxassetid://10723434711",
    ["log-in"] = "rbxassetid://10723434830",
    ["log-out"] = "rbxassetid://10723434906",
    ["luggage"] = "rbxassetid://10723434993",
    ["magnet"] = "rbxassetid://10723435069",
    ["mail"] = "rbxassetid://10734885430",
    ["mail-check"] = "rbxassetid://10723435182",
    ["mail-minus"] = "rbxassetid://10723435261",
    ["mail-open"] = "rbxassetid://10723435342",
    ["mail-plus"] = "rbxassetid://10723435443",
    ["mail-question"] = "rbxassetid://10723435515",
    ["mail-search"] = "rbxassetid://10734884739",
    ["mail-warning"] = "rbxassetid://10734885015",
    ["mail-x"] = "rbxassetid://10734885247",
    ["mails"] = "rbxassetid://10734885614",
    ["map"] = "rbxassetid://10734886202",
    ["map-pin"] = "rbxassetid://10734886004",
    ["map-pin-off"] = "rbxassetid://10734885803",
    ["maximize"] = "rbxassetid://10734886735",
    ["maximize-2"] = "rbxassetid://10734886496",
    ["medal"] = "rbxassetid://10734887072",
    ["megaphone"] = "rbxassetid://10734887454",
    ["megaphone-off"] = "rbxassetid://10734887311",
    ["meh"] = "rbxassetid://10734887603",
    ["menu"] = "rbxassetid://10734887784",
    ["message-circle"] = "rbxassetid://10734888000",
    ["message-square"] = "rbxassetid://10734888228",
    ["mic"] = "rbxassetid://10734888864",
    ["mic-2"] = "rbxassetid://10734888430",
    ["mic-off"] = "rbxassetid://10734888646",
    ["microscope"] = "rbxassetid://10734889106",
    ["microwave"] = "rbxassetid://10734895076",
    ["milestone"] = "rbxassetid://10734895310",
    ["minimize"] = "rbxassetid://10734895698",
    ["minimize-2"] = "rbxassetid://10734895530",
    ["minus"] = "rbxassetid://10734896206",
    ["minus-circle"] = "rbxassetid://10734895856",
    ["minus-square"] = "rbxassetid://10734896029",
    ["monitor"] = "rbxassetid://10734896881",
    ["monitor-off"] = "rbxassetid://10734896360",
    ["monitor-speaker"] = "rbxassetid://10734896512",
    ["moon"] = "rbxassetid://10734897102",
    ["more-horizontal"] = "rbxassetid://10734897250",
    ["more-vertical"] = "rbxassetid://10734897387",
    ["mountain"] = "rbxassetid://10734897956",
    ["mountain-snow"] = "rbxassetid://10734897665",
    ["mouse"] = "rbxassetid://10734898592",
    ["mouse-pointer"] = "rbxassetid://10734898476",
    ["mouse-pointer-2"] = "rbxassetid://10734898194",
    ["mouse-pointer-click"] = "rbxassetid://10734898355",
    ["move"] = "rbxassetid://10734900011",
    ["move-3d"] = "rbxassetid://10734898756",
    ["move-diagonal"] = "rbxassetid://10734899164",
    ["move-diagonal-2"] = "rbxassetid://10734898934",
    ["move-horizontal"] = "rbxassetid://10734899414",
    ["move-vertical"] = "rbxassetid://10734899821",
    ["music"] = "rbxassetid://10734905958",
    ["music-2"] = "rbxassetid://10734900215",
    ["music-3"] = "rbxassetid://10734905665",
    ["music-4"] = "rbxassetid://10734905823",
    ["navigation"] = "rbxassetid://10734906744",
    ["navigation-2"] = "rbxassetid://10734906332",
    ["navigation-2-off"] = "rbxassetid://10734906144",
    ["navigation-off"] = "rbxassetid://10734906580",
    ["network"] = "rbxassetid://10734906975",
    ["newspaper"] = "rbxassetid://10734907168",
    ["octagon"] = "rbxassetid://10734907361",
    ["option"] = "rbxassetid://10734907649",
    ["outdent"] = "rbxassetid://10734907933",
    ["package"] = "rbxassetid://10734909540",
    ["package-2"] = "rbxassetid://10734908151",
    ["package-check"] = "rbxassetid://10734908384",
    ["package-minus"] = "rbxassetid://10734908626",
    ["package-open"] = "rbxassetid://10734908793",
    ["package-plus"] = "rbxassetid://10734909016",
    ["package-search"] = "rbxassetid://10734909196",
    ["package-x"] = "rbxassetid://10734909375",
    ["paint-bucket"] = "rbxassetid://10734909847",
    ["paintbrush"] = "rbxassetid://10734910187",
    ["paintbrush-2"] = "rbxassetid://10734910030",
    ["palette"] = "rbxassetid://10734910430",
    ["palmtree"] = "rbxassetid://10734910680",
    ["paperclip"] = "rbxassetid://10734910927",
    ["party-popper"] = "rbxassetid://10734918735",
    ["pause"] = "rbxassetid://10734919336",
    ["pause-circle"] = "rbxassetid://10735024209",
    ["pause-octagon"] = "rbxassetid://10734919143",
    ["pen-tool"] = "rbxassetid://10734919503",
    ["pencil"] = "rbxassetid://10734919691",
    ["percent"] = "rbxassetid://10734919919",
    ["person-standing"] = "rbxassetid://10734920149",
    ["phone"] = "rbxassetid://10734921524",
    ["phone-call"] = "rbxassetid://10734920305",
    ["phone-forwarded"] = "rbxassetid://10734920508",
    ["phone-incoming"] = "rbxassetid://10734920694",
    ["phone-missed"] = "rbxassetid://10734920845",
    ["phone-off"] = "rbxassetid://10734921077",
    ["phone-outgoing"] = "rbxassetid://10734921288",
    ["pie-chart"] = "rbxassetid://10734921727",
    ["piggy-bank"] = "rbxassetid://10734921935",
    ["pin"] = "rbxassetid://10734922324",
    ["pin-off"] = "rbxassetid://10734922180",
    ["pipette"] = "rbxassetid://10734922497",
    ["pizza"] = "rbxassetid://10734922774",
    ["plane"] = "rbxassetid://10734922971",
    ["plane-landing"] = "rbxassetid://17376029914",
    ["play"] = "rbxassetid://10734923549",
    ["play-circle"] = "rbxassetid://10734923214",
    ["plus"] = "rbxassetid://10734924532",
    ["plus-circle"] = "rbxassetid://10734923868",
    ["plus-square"] = "rbxassetid://10734924219",
    ["podcast"] = "rbxassetid://10734929553",
    ["pointer"] = "rbxassetid://10734929723",
    ["pound-sterling"] = "rbxassetid://10734929981",
    ["power"] = "rbxassetid://10734930466",
    ["power-off"] = "rbxassetid://10734930257",
    ["printer"] = "rbxassetid://10734930632",
    ["puzzle"] = "rbxassetid://10734930886",
    ["quote"] = "rbxassetid://10734931234",
    ["radio"] = "rbxassetid://10734931596",
    ["radio-receiver"] = "rbxassetid://10734931402",
    ["rectangle-horizontal"] = "rbxassetid://10734931777",
    ["rectangle-vertical"] = "rbxassetid://10734932081",
    ["recycle"] = "rbxassetid://10734932295",
    ["redo"] = "rbxassetid://10734932822",
    ["redo-2"] = "rbxassetid://10734932586",
    ["refresh-ccw"] = "rbxassetid://10734933056",
    ["refresh-cw"] = "rbxassetid://10734933222",
    ["refrigerator"] = "rbxassetid://10734933465",
    ["regex"] = "rbxassetid://10734933655",
    ["repeat"] = "rbxassetid://10734933966",
    ["repeat-1"] = "rbxassetid://10734933826",
    ["reply"] = "rbxassetid://10734934252",
    ["reply-all"] = "rbxassetid://10734934132",
    ["rewind"] = "rbxassetid://10734934347",
    ["rocket"] = "rbxassetid://10734934585",
    ["rocking-chair"] = "rbxassetid://10734939942",
    ["rotate-3d"] = "rbxassetid://10734940107",
    ["rotate-ccw"] = "rbxassetid://10734940376",
    ["rotate-cw"] = "rbxassetid://10734940654",
    ["rss"] = "rbxassetid://10734940825",
    ["ruler"] = "rbxassetid://10734941018",
    ["russian-ruble"] = "rbxassetid://10734941199",
    ["sailboat"] = "rbxassetid://10734941354",
    ["save"] = "rbxassetid://10734941499",
    ["scale"] = "rbxassetid://10734941912",
    ["scale-3d"] = "rbxassetid://10734941739",
    ["scaling"] = "rbxassetid://10734942072",
    ["scan"] = "rbxassetid://10734942565",
    ["scan-face"] = "rbxassetid://10734942198",
    ["scan-line"] = "rbxassetid://10734942351",
    ["scissors"] = "rbxassetid://10734942778",
    ["screen-share"] = "rbxassetid://10734943193",
    ["screen-share-off"] = "rbxassetid://10734942967",
    ["scroll"] = "rbxassetid://10734943448",
    ["search"] = "rbxassetid://10734943674",
    ["send"] = "rbxassetid://10734943902",
    ["separator-horizontal"] = "rbxassetid://10734944115",
    ["separator-vertical"] = "rbxassetid://10734944326",
    ["server"] = "rbxassetid://10734949856",
    ["server-cog"] = "rbxassetid://10734944444",
    ["server-crash"] = "rbxassetid://10734944554",
    ["server-off"] = "rbxassetid://10734944668",
    ["settings"] = "rbxassetid://10734950309",
    ["settings-2"] = "rbxassetid://10734950020",
    ["share"] = "rbxassetid://10734950813",
    ["share-2"] = "rbxassetid://10734950553",
    ["sheet"] = "rbxassetid://10734951038",
    ["shield"] = "rbxassetid://10734951847",
    ["shield-alert"] = "rbxassetid://10734951173",
    ["shield-check"] = "rbxassetid://10734951367",
    ["shield-close"] = "rbxassetid://10734951535",
    ["shield-off"] = "rbxassetid://10734951684",
    ["shirt"] = "rbxassetid://10734952036",
    ["shopping-bag"] = "rbxassetid://10734952273",
    ["shopping-cart"] = "rbxassetid://10734952479",
    ["shovel"] = "rbxassetid://10734952773",
    ["shower-head"] = "rbxassetid://10734952942",
    ["shrink"] = "rbxassetid://10734953073",
    ["shrub"] = "rbxassetid://10734953241",
    ["shuffle"] = "rbxassetid://10734953451",
    ["sidebar"] = "rbxassetid://10734954301",
    ["sidebar-close"] = "rbxassetid://10734953715",
    ["sidebar-open"] = "rbxassetid://10734954000",
    ["sigma"] = "rbxassetid://10734954538",
    ["signal"] = "rbxassetid://10734961133",
    ["signal-high"] = "rbxassetid://10734954807",
    ["signal-low"] = "rbxassetid://10734955080",
    ["signal-medium"] = "rbxassetid://10734955336",
    ["signal-zero"] = "rbxassetid://10734960878",
    ["siren"] = "rbxassetid://10734961284",
    ["skip-back"] = "rbxassetid://10734961526",
    ["skip-forward"] = "rbxassetid://10734961809",
    ["skull"] = "rbxassetid://10734962068",
    ["slack"] = "rbxassetid://10734962339",
    ["slash"] = "rbxassetid://10734962600",
    ["slice"] = "rbxassetid://10734963024",
    ["sliders"] = "rbxassetid://10734963400",
    ["sliders-horizontal"] = "rbxassetid://10734963191",
    ["smartphone"] = "rbxassetid://10734963940",
    ["smartphone-charging"] = "rbxassetid://10734963671",
    ["smile"] = "rbxassetid://10734964441",
    ["smile-plus"] = "rbxassetid://10734964188",
    ["snowflake"] = "rbxassetid://10734964600",
    ["sofa"] = "rbxassetid://10734964852",
    ["sort-asc"] = "rbxassetid://10734965115",
    ["sort-desc"] = "rbxassetid://10734965287",
    ["speaker"] = "rbxassetid://10734965419",
    ["sprout"] = "rbxassetid://10734965572",
    ["square"] = "rbxassetid://10734965702",
    ["star"] = "rbxassetid://10734966248",
    ["star-half"] = "rbxassetid://10734965897",
    ["star-off"] = "rbxassetid://10734966097",
    ["stethoscope"] = "rbxassetid://10734966384",
    ["sticker"] = "rbxassetid://10734972234",
    ["sticky-note"] = "rbxassetid://10734972463",
    ["stop-circle"] = "rbxassetid://10734972621",
    ["stretch-horizontal"] = "rbxassetid://10734972862",
    ["stretch-vertical"] = "rbxassetid://10734973130",
    ["strikethrough"] = "rbxassetid://10734973290",
    ["subscript"] = "rbxassetid://10734973457",
    ["sun"] = "rbxassetid://10734974297",
    ["sun-dim"] = "rbxassetid://10734973645",
    ["sun-medium"] = "rbxassetid://10734973778",
    ["sun-moon"] = "rbxassetid://10734973999",
    ["sun-snow"] = "rbxassetid://10734974130",
    ["sunrise"] = "rbxassetid://10734974522",
    ["sunset"] = "rbxassetid://10734974689",
    ["superscript"] = "rbxassetid://10734974850",
    ["swiss-franc"] = "rbxassetid://10734975024",
    ["switch-camera"] = "rbxassetid://10734975214",
    ["sword"] = "rbxassetid://10734975486",
    ["swords"] = "rbxassetid://10734975692",
    ["syringe"] = "rbxassetid://10734975932",
    ["table"] = "rbxassetid://10734976230",
    ["table-2"] = "rbxassetid://10734976097",
    ["tablet"] = "rbxassetid://10734976394",
    ["tag"] = "rbxassetid://10734976528",
    ["tags"] = "rbxassetid://10734976739",
    ["target"] = "rbxassetid://10734977012",
    ["tent"] = "rbxassetid://10734981750",
    ["terminal"] = "rbxassetid://10734982144",
    ["terminal-square"] = "rbxassetid://10734981995",
    ["text-cursor"] = "rbxassetid://10734982395",
    ["text-cursor-input"] = "rbxassetid://10734982297",
    ["thermometer"] = "rbxassetid://10734983134",
    ["thermometer-snowflake"] = "rbxassetid://10734982571",
    ["thermometer-sun"] = "rbxassetid://10734982771",
    ["thumbs-down"] = "rbxassetid://10734983359",
    ["thumbs-up"] = "rbxassetid://10734983629",
    ["ticket"] = "rbxassetid://10734983868",
    ["timer"] = "rbxassetid://10734984606",
    ["timer-off"] = "rbxassetid://10734984138",
    ["timer-reset"] = "rbxassetid://10734984355",
    ["toggle-left"] = "rbxassetid://10734984834",
    ["toggle-right"] = "rbxassetid://10734985040",
    ["tornado"] = "rbxassetid://10734985247",
    ["toy-brick"] = "rbxassetid://10747361919",
    ["train"] = "rbxassetid://10747362105",
    ["trash"] = "rbxassetid://10747362393",
    ["trash-2"] = "rbxassetid://10747362241",
    ["tree-deciduous"] = "rbxassetid://10747362534",
    ["tree-pine"] = "rbxassetid://10747362748",
    ["trees"] = "rbxassetid://10747363016",
    ["trending-down"] = "rbxassetid://10747363205",
    ["trending-up"] = "rbxassetid://10747363465",
    ["triangle"] = "rbxassetid://10747363621",
    ["trophy"] = "rbxassetid://10747363809",
    ["truck"] = "rbxassetid://10747364031",
    ["tv"] = "rbxassetid://10747364593",
    ["tv-2"] = "rbxassetid://10747364302",
    ["type"] = "rbxassetid://10747364761",
    ["umbrella"] = "rbxassetid://10747364971",
    ["underline"] = "rbxassetid://10747365191",
    ["undo"] = "rbxassetid://10747365484",
    ["undo-2"] = "rbxassetid://10747365359",
    ["unlink"] = "rbxassetid://10747365771",
    ["unlink-2"] = "rbxassetid://10747397871",
    ["unlock"] = "rbxassetid://10747366027",
    ["upload"] = "rbxassetid://10747366434",
    ["upload-cloud"] = "rbxassetid://10747366266",
    ["usb"] = "rbxassetid://10747366606",
    ["user"] = "rbxassetid://10747373176",
    ["user-check"] = "rbxassetid://10747371901",
    ["user-cog"] = "rbxassetid://10747372167",
    ["user-minus"] = "rbxassetid://10747372346",
    ["user-plus"] = "rbxassetid://10747372702",
    ["user-x"] = "rbxassetid://10747372992",
    ["users"] = "rbxassetid://10747373426",
    ["utensils"] = "rbxassetid://10747373821",
    ["utensils-crossed"] = "rbxassetid://10747373629",
    ["venetian-mask"] = "rbxassetid://10747374003",
    ["verified"] = "rbxassetid://10747374131",
    ["vibrate"] = "rbxassetid://10747374489",
    ["vibrate-off"] = "rbxassetid://10747374269",
    ["video"] = "rbxassetid://10747374938",
    ["video-off"] = "rbxassetid://10747374721",
    ["view"] = "rbxassetid://10747375132",
    ["voicemail"] = "rbxassetid://10747375281",
    ["volume"] = "rbxassetid://10747376008",
    ["volume-1"] = "rbxassetid://10747375450",
    ["volume-2"] = "rbxassetid://10747375679",
    ["volume-x"] = "rbxassetid://10747375880",
    ["wheat"] = "rbxassetid://80877624162595",
    ["wallet"] = "rbxassetid://10747376205",
    ["wand"] = "rbxassetid://10747376565",
    ["wand-2"] = "rbxassetid://10747376349",
    ["watch"] = "rbxassetid://10747376722",
    ["waves"] = "rbxassetid://10747376931",
    ["webcam"] = "rbxassetid://10747381992",
    ["wifi"] = "rbxassetid://10747382504",
    ["wifi-off"] = "rbxassetid://10747382268",
    ["wind"] = "rbxassetid://10747382750",
    ["wrap-text"] = "rbxassetid://10747383065",
    ["wrench"] = "rbxassetid://10747383470",
    ["x"] = "rbxassetid://10747384394",
    ["x-circle"] = "rbxassetid://10747383819",
    ["x-octagon"] = "rbxassetid://10747384037",
    ["x-square"] = "rbxassetid://10747384217",
    ["zoom-in"] = "rbxassetid://10747384552",
    ["zoom-out"] = "rbxassetid://10747384679",
    ["cat"] = "rbxassetid://16935650691",
    ["message-circle-question"] = "rbxassetid://16970049192",
    ["webhook"] = "rbxassetid://17320556264",
    ["dumbbell"] = "rbxassetid://18273453053",
    ["a-arrow-down"] = "rbxassetid://131355695669854",
    ["a-arrow-left"] = "rbxassetid://102008521237896",
    ["a-arrow-right"] = "rbxassetid://98075674538519",
    ["a-arrow-up"] = "rbxassetid://129310432150752",
    ["ambulance"] = "rbxassetid://102982614261364",
    ["ampersand"] = "rbxassetid://135016000757606",
    ["ampersands"] = "rbxassetid://114692355330858",
    ["antenna"] = "rbxassetid://79774650906056",
    ["app-window"] = "rbxassetid://85654911450764",
    ["app-window-mac"] = "rbxassetid://87784289484637",
    ["archive-x"] = "rbxassetid://129232215038811",
    ["area-chart"] = "rbxassetid://136676435113534",
    ["arrow-down-0-1"] = "rbxassetid://121292142940765",
    ["arrow-down-1-0"] = "rbxassetid://77813956297392",
    ["arrow-down-a-z"] = "rbxassetid://129542345252395",
    ["arrow-down-from-line"] = "rbxassetid://86395496495250",
    ["arrow-down-narrow-wide"] = "rbxassetid://124879040703816",
    ["arrow-down-to-dot"] = "rbxassetid://119038669456584",
    ["arrow-down-to-line"] = "rbxassetid://96805791188646",
    ["arrow-down-up"] = "rbxassetid://110786508931766",
    ["arrow-down-wide-narrow"] = "rbxassetid://91038292553521",
    ["arrow-down-z-a"] = "rbxassetid://72554694535575",
    ["arrow-left-from-line"] = "rbxassetid://96066977185207",
    ["arrow-left-to-line"] = "rbxassetid://94751293147468",
    ["arrow-right-from-line"] = "rbxassetid://100022611146440",
    ["arrow-right-left"] = "rbxassetid://76320897795733",
    ["arrow-right-to-line"] = "rbxassetid://115288243637029",
    ["arrow-up-0-1"] = "rbxassetid://110870516435826",
    ["arrow-up-1-0"] = "rbxassetid://89149174107178",
    ["arrow-up-a-z"] = "rbxassetid://84450597162987",
    ["arrow-up-from-dot"] = "rbxassetid://71414411687035",
    ["arrow-up-from-line"] = "rbxassetid://90182112708248",
    ["arrow-up-narrow-wide"] = "rbxassetid://122085723836782",
    ["arrow-up-to-line"] = "rbxassetid://135294702314034",
    ["arrow-up-wide-narrow"] = "rbxassetid://115106772870077",
    ["arrow-up-z-a"] = "rbxassetid://89092890481295",
    ["atom"] = "rbxassetid://108124658322396",
    ["audio-lines"] = "rbxassetid://70761406273136",
    ["audio-waveform"] = "rbxassetid://103053561451957",
    ["bookmark-x"] = "rbxassetid://110785582034474",
    ["contact-2"] = "rbxassetid://138425036340339",
    ["copy-plus"] = "rbxassetid://83170638232456",
    ["creates"] = "rbxassetid://93759140100585",
    ["credit-card"] = "rbxassetid://122458943955997",
    ["default"] = "rbxassetid://74859026970268",
    ["dna"] = "rbxassetid://120144231182957",
    ["dna-off"] = "rbxassetid://83801729063138",
    ["dog"] = "rbxassetid://108965196956571",
    ["ear"] = "rbxassetid://122537182650584",
    ["eye-dropper"] = "rbxassetid://104794806183086",
    ["facebook"] = "rbxassetid://86394407228017",
    ["favorite"] = "rbxassetid://71587331836644",
    ["file-music"] = "rbxassetid://80982588074342",
    ["github"] = "rbxassetid://96996851870134",
    ["gitlab"] = "rbxassetid://78581833751465",
    ["hotel"] = "rbxassetid://73319824598176",
    ["ice-cream-2"] = "rbxassetid://109826591940777",
    ["icons-and-aliases"] = "rbxassetid://88106027185238",
    ["instagram"] = "rbxassetid://75845870545707",
    ["linkedin"] = "rbxassetid://103669270600294",
    ["lock-keyhole"] = "rbxassetid://138353185872128",
    ["martini"] = "rbxassetid://121738805538204",
    ["messages-square"] = "rbxassetid://137591171649179",
    ["milk"] = "rbxassetid://92506135817735",
    ["milk-off"] = "rbxassetid://117039997771760",
    ["paste"] = "rbxassetid://91172114729501",
    ["pilcrow"] = "rbxassetid://137926627803386",
    ["pilcrow-square"] = "rbxassetid://72109005991397",
    ["plug"] = "rbxassetid://100548265939151",
    ["plug-2"] = "rbxassetid://106335336464296",
    ["pocket"] = "rbxassetid://137108282824070",
    ["qr-code"] = "rbxassetid://99485598636657",
    ["question"] = "rbxassetid://71920097357922",
    ["radio-tower"] = "rbxassetid://109836885232796",
    ["rat"] = "rbxassetid://130787922504747",
    ["receipt"] = "rbxassetid://80213056679257",
    ["refresh"] = "rbxassetid://127286471455682",
    ["reload"] = "rbxassetid://112873379005566",
    ["remove-formatting"] = "rbxassetid://89163002626436",
    ["replace"] = "rbxassetid://83832274955462",
    ["replace-all"] = "rbxassetid://138705738236138",
    ["salad"] = "rbxassetid://127853613798455",
    ["sandwich"] = "rbxassetid://111037609402407",
    ["search-large"] = "rbxassetid://91870678451979",
    ["search-slash"] = "rbxassetid://131920120432916",
    ["soup"] = "rbxassetid://71367972911114",
    ["spline"] = "rbxassetid://101706857671829",
    ["split"] = "rbxassetid://94282375851350",
    ["split-square-horizontal"] = "rbxassetid://86002864284442",
}


local function GetIcon(iconName)
    if not iconName or iconName == false then return nil end
    if typeof(iconName) == "string" then
        if iconName:find("rbxassetid://") then return iconName end
        return Icons[iconName] or nil
    end
    return nil
end




local function randomString(length)
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    local str = ""
    for i = 1, length do
        local rand = math.random(1, #chars)
        str = str .. string.sub(chars, rand, rand)
    end
    return str
end

local randomUI = randomString(12)
_G.CurrentUIName = randomUI

local function SafeDestroyUI()
    pcall(function()
        local containers = {game:GetService("CoreGui")}
        if gethui then
            local altGui = gethui()
            if altGui and altGui ~= game:GetService("CoreGui") then
                table.insert(containers, altGui)
            end
        end
        for _, container in pairs(containers) do
            for _, gui in pairs(container:GetChildren()) do
                if gui:IsA("ScreenGui") and (gui.Name == "ProjectWD" or gui:GetAttribute("SecureUI")) then
                    gui:Destroy()
                end
            end
        end
    end)
end

SafeDestroyUI()
if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(1)




local function GetScreenInfo()
    local viewportSize = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
    local isMobile = (viewportSize.X <= 768) or (game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled)
    local responsiveWidth = math.clamp(viewportSize.X * 0.7, 300, 800)
    local responsiveHeight = math.clamp(viewportSize.Y * 0.8, 300, 600)
    if responsiveWidth > 620 then responsiveWidth = 620 end
    if responsiveHeight > 420 then responsiveHeight = 420 end
    return {
        ViewportSize = viewportSize,
        IsMobile = isMobile,
        UIWidth = responsiveWidth,
        UIHeight = responsiveHeight,
        Scale = math.min(responsiveWidth / 620, responsiveHeight / 420)
    }
end

local function GetProtectedGui()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = randomUI
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    if syn and syn.protect_gui then syn.protect_gui(ScreenGui) end
    local parentContainer = gethui and gethui() or game:GetService("CoreGui")
    ScreenGui.Parent = parentContainer
    ScreenGui:SetAttribute("SecureUI", true)
    return ScreenGui
end




ThemeManager:SetTheme("Dark")




local function gradient(text, colors)
    if not colors or #colors == 0 then return text end
    if #colors == 1 then
        local c = colors[1]
        return string.format('<font color="rgb(%d,%d,%d)">%s</font>', math.floor(c.R*255), math.floor(c.G*255), math.floor(c.B*255), text)
    end
    local result = ""
    local segments = #colors - 1
    for i = 1, #text do
        local position = (i - 1) / math.max(#text - 1, 1)
        local segment = math.min(math.floor(position * segments), segments - 1)
        local t = (position - segment/segments) / (1/segments)
        local s1, s2 = colors[segment+1], colors[segment+2]
        local r = math.floor((s1.R + (s2.R - s1.R) * t) * 255)
        local g = math.floor((s1.G + (s2.G - s1.G) * t) * 255)
        local b = math.floor((s1.B + (s2.B - s1.B) * t) * 255)
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, text:sub(i, i))
    end
    return result
end




local function MakeDraggable(handle, frame)
    local dragging, dragStart, startPos
    local UIS = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    handle.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
            local delta = input.Position - dragStart
            TweenService:Create(frame, TweenInfo.new(0.12, Enum.EasingStyle.Quad), {
                Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            }):Play()
        end
    end)
end




IKAI = true
if IKAI then
    do
        local ui = game:GetService("CoreGui"):FindFirstChild("ProjectWD")
        if ui then ui:Destroy() end
    end

    local UserInputService = game:GetService("UserInputService")
    local TweenService     = game:GetService("TweenService")
    local RunService       = game:GetService("RunService")
    local LocalPlayer      = game:GetService("Players").LocalPlayer

    library = {}

    
    
    
    function library:Window(text, logo, keybind, gradientText, accentColor)
        if accentColor then _G.Accent = accentColor end

        local abc         = false
        local activeTabButton = nil
        local currentpage = ""
        keybind           = keybind or Enum.KeyCode.RightControl
        local yoo         = string.gsub(tostring(keybind), "Enum.KeyCode.", "")
        local toggled     = false
        gradientText      = gradientText or {_G.TextPrimary}

        local screenInfo      = GetScreenInfo()
        local responsiveWidth = screenInfo.UIWidth
        local responsiveHeight= screenInfo.UIHeight
        local isMobileLayout  = screenInfo.IsMobile or screenInfo.ViewportSize.X <= 768

        local tabWidth    = isMobileLayout and 110 or 140
        local pageWidth   = responsiveWidth - tabWidth - (isMobileLayout and 14 or 18)
        local elementWidth= pageWidth - (isMobileLayout and 20 or 24)
        local topHeight   = isMobileLayout and 48 or 44

        local ShadcnUI = GetProtectedGui()
        ShadcnUI.Name = _G.CurrentUIName
        
        
        
        local Main1 = Instance.new("CanvasGroup")
        Main1.Name = "Main"
        Main1.Parent = ShadcnUI
        Main1.AnchorPoint = Vector2.new(0.5, 0.5)
        Main1.Position = UDim2.new(0.5, 0, 0.5, 0)
        Main1.Size = UDim2.new(0, responsiveWidth, 0, responsiveHeight)

        Main1.BackgroundTransparency = 1 
        Main1.BorderSizePixel = 0
        Main1.ClipsDescendants = true
        Main1.GroupTransparency = 0

        
        local MainCorner = Instance.new("UICorner")
        MainCorner.CornerRadius = UDim.new(0, 10)
        MainCorner.Parent = Main1

        
        
        
        local Main = Instance.new("Frame")
        Main.Name = "FixBG"
        Main.Parent = Main1
        Main.BackgroundColor3 = _G.BGColor
        Main.Size = UDim2.new(1, 0, 1, 0)
        Main.BorderSizePixel = 0
        Main.ZIndex = 0

        
        local BGCorner = Instance.new("UICorner")
        BGCorner.CornerRadius = UDim.new(0, 10)
        BGCorner.Parent = Main



        local MainStroke = Instance.new("UIStroke")
        MainStroke.Parent = Main
        MainStroke.Color = _G.Border
        MainStroke.Thickness = 1
        MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        local MainGrad = Instance.new("UIGradient")
        MainGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 22, 28)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(14, 14, 18)),
        })
        MainGrad.Rotation = 135
        MainGrad.Parent = Main

        
        local Top = Instance.new("Frame")
        Top.Name = "Top"
        Top.Parent = Main
        Top.BackgroundColor3 = _G.TopBar or Color3.fromRGB(16, 16, 20)
        Top.Size = UDim2.new(1, 0, 0, topHeight)
        Top.BorderSizePixel = 0
        Top.ZIndex = 5

        local TopCorner = Instance.new("UICorner")
        TopCorner.CornerRadius = UDim.new(0, 10)
        TopCorner.Parent = Top

        local TopFill = Instance.new("Frame")
        TopFill.BackgroundColor3 = Top.BackgroundColor3
        TopFill.BorderSizePixel = 0
        TopFill.Position = UDim2.new(0, 0, 1, -6)
        TopFill.Size = UDim2.new(1, 0, 0, 6)
        TopFill.Parent = Top
        TopFill.ZIndex = 4

        local TopBottomLine = Instance.new("Frame")
        TopBottomLine.BackgroundColor3 = _G.Border
        TopBottomLine.BorderSizePixel = 0
        TopBottomLine.Position = UDim2.new(0, 0, 1, -1)
        TopBottomLine.Size = UDim2.new(1, 0, 0, 1)
        TopBottomLine.Parent = Top
        TopBottomLine.ZIndex = 6

        local logoOffsetX = isMobileLayout and 10 or 14
        if logo then
            local LogoIcon = Instance.new("ImageLabel")
            LogoIcon.Parent = Top
            LogoIcon.BackgroundTransparency = 1
            LogoIcon.Position = UDim2.new(0, logoOffsetX, 0.5, -8)
            LogoIcon.Size = UDim2.new(0, 16, 0, 16)
            LogoIcon.Image = typeof(logo) == "number" and ("rbxassetid://"..logo) or (Icons[logo] or logo)
            LogoIcon.ImageColor3 = _G.Accent
            LogoIcon.ZIndex = 10
            logoOffsetX = logoOffsetX + 22
        end

        local TitleLabel = Instance.new("TextLabel")
        TitleLabel.Name = "Title"
        TitleLabel.Parent = Top
        TitleLabel.BackgroundTransparency = 1
        TitleLabel.Position = UDim2.new(0, logoOffsetX, 0, 0)
        TitleLabel.Size = UDim2.new(0, isMobileLayout and 160 or 220, 1, 0)
        TitleLabel.Font = Enum.Font.GothamBold
        TitleLabel.RichText = true
        TitleLabel.Text = gradient(text, gradientText)
        TitleLabel.TextColor3 = _G.TextPrimary
        TitleLabel.TextSize = isMobileLayout and 13 or 15
        TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
        TitleLabel.ZIndex = 10

        local BindButton = Instance.new("TextButton")
        BindButton.Name = "BindButton"
        BindButton.Parent = Top
        BindButton.BackgroundColor3 = _G.SurfaceAlt
        BindButton.BackgroundTransparency = 0
        BindButton.Position = UDim2.new(1, isMobileLayout and -120 or -178, 0.5, -11)
        BindButton.Size = UDim2.new(0, isMobileLayout and 90 or 130, 0, 22)
        BindButton.Font = Enum.Font.GothamMedium
        BindButton.Text = "[ " .. yoo .. " ]"
        BindButton.TextColor3 = _G.TextSecondary
        BindButton.TextSize = isMobileLayout and 9 or 11
        BindButton.AutoButtonColor = false
        BindButton.Visible = not isMobileLayout
        BindButton.ZIndex = 10

        local BindCorner = Instance.new("UICorner")
        BindCorner.CornerRadius = UDim.new(0, 5)
        BindCorner.Parent = BindButton

        local BindStroke = Instance.new("UIStroke")
        BindStroke.Parent = BindButton
        BindStroke.Color = _G.Border
        BindStroke.Thickness = 1

        local MinimizeBtn = Instance.new("TextButton")
        MinimizeBtn.Parent = Top
        MinimizeBtn.BackgroundColor3 = _G.SurfaceAlt
        MinimizeBtn.BackgroundTransparency = 0
        MinimizeBtn.Position = UDim2.new(1, isMobileLayout and -34 or -38, 0.5, -11)
        MinimizeBtn.Size = isMobileLayout and UDim2.new(0, 26, 0, 22) or UDim2.new(0, 28, 0, 22)
        MinimizeBtn.Text = "—"
        MinimizeBtn.Font = Enum.Font.GothamBold
        MinimizeBtn.TextSize = isMobileLayout and 11 or 12
        MinimizeBtn.TextColor3 = _G.TextSecondary
        MinimizeBtn.AutoButtonColor = false
        MinimizeBtn.ZIndex = 10

        local MinCorner = Instance.new("UICorner")
        MinCorner.CornerRadius = UDim.new(0, 5)
        MinCorner.Parent = MinimizeBtn

        local MinStroke = Instance.new("UIStroke")
        MinStroke.Parent = MinimizeBtn
        MinStroke.Color = _G.Border
        MinStroke.Thickness = 1

        local MiniFrame
        local function makeDraggableSimple(gui)
            local dragging, dragStart, startPos
            gui.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true; dragStart = input.Position; startPos = gui.Position
                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then dragging = false end
                    end)
                end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
                    local d = input.Position - dragStart
                    gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset+d.X, startPos.Y.Scale, startPos.Y.Offset+d.Y)
                end
            end)
        end

        local function createMiniFrame()
            if MiniFrame then return MiniFrame end
            MiniFrame = Instance.new("TextButton")
            MiniFrame.Parent = ShadcnUI
            MiniFrame.BackgroundColor3 = _G.Accent
            MiniFrame.Size = UDim2.new(0, 110, 0, 30)
            MiniFrame.Position = UDim2.new(0.5, -55, 0, 8)
            MiniFrame.Text = "▶  Open Hub"
            MiniFrame.TextColor3 = Color3.new(1,1,1)
            MiniFrame.Font = Enum.Font.GothamMedium
            MiniFrame.TextSize = 12
            MiniFrame.Visible = false
            MiniFrame.AutoButtonColor = false
            MiniFrame.ZIndex = 200
            local mc = Instance.new("UICorner"); mc.CornerRadius = UDim.new(0,6); mc.Parent = MiniFrame
            makeDraggableSimple(MiniFrame)
            local isDragging = false
            MiniFrame.MouseButton1Down:Connect(function() isDragging = false end)
            MiniFrame.MouseMoved:Connect(function() isDragging = true end)
            MiniFrame.MouseButton1Up:Connect(function()
                if not isDragging then Main.Visible = true; MiniFrame.Visible = false end
            end)
            return MiniFrame
        end

        MinimizeBtn.MouseButton1Click:Connect(function()
            Main.Visible = false
            createMiniFrame().Visible = true
        end)

        MinimizeBtn.MouseEnter:Connect(function()
            TweenService:Create(MinimizeBtn, TweenInfo.new(0.15), {TextColor3 = _G.Danger or Color3.fromRGB(239,68,68)}):Play()
        end)
        
        MinimizeBtn.MouseLeave:Connect(function()
            TweenService:Create(MinimizeBtn, TweenInfo.new(0.15), {TextColor3 = _G.TextSecondary}):Play()
        end)

        BindButton.MouseButton1Click:Connect(function()
            BindButton.Text = "[ ... ]"
            local inputwait = UserInputService.InputBegan:wait()
            local shiba = inputwait.KeyCode == Enum.KeyCode.Unknown and inputwait.UserInputType or inputwait.KeyCode
            if shiba.Name ~= "Focus" and shiba.Name ~= "MouseMovement" then
                BindButton.Text = "[ " .. shiba.Name .. " ]"
                yoo = shiba.Name
            end
        end)

        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode[yoo] then
                toggled = not toggled
                Main.Visible = not toggled
                if MiniFrame then MiniFrame.Visible = toggled end
            end
        end)

        MakeDraggable(Top, Main1)

        
        local TabFrame = Instance.new("Frame")
        TabFrame.Name = "TabFrame"
        TabFrame.Parent = Main
        TabFrame.BackgroundColor3 = _G.Sidebar or Color3.fromRGB(14, 14, 18)
        TabFrame.Position = UDim2.new(0, 0, 0, topHeight)
        TabFrame.Size = UDim2.new(0, tabWidth, 1, -topHeight)
        TabFrame.BorderSizePixel = 0
        TabFrame.ZIndex = 3

        
        local SidebarLine = Instance.new("Frame")
        SidebarLine.BackgroundColor3 = _G.Border
        SidebarLine.BorderSizePixel = 0
        SidebarLine.Position = UDim2.new(1, -1, 0, 0)
        SidebarLine.Size = UDim2.new(0, 1, 1, 0)
        SidebarLine.Parent = TabFrame
        SidebarLine.ZIndex = 4

        local ScrollTab = Instance.new("ScrollingFrame")
        ScrollTab.Name = "ScrollTab"
        ScrollTab.Parent = TabFrame
        ScrollTab.BackgroundTransparency = 1
        ScrollTab.Size = UDim2.new(1, 0, 1, 0)
        ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
        ScrollTab.ScrollBarThickness = 0
        ScrollTab.ScrollingDirection = Enum.ScrollingDirection.Y

        local TabListLayout = Instance.new("UIListLayout")
        TabListLayout.Parent = ScrollTab
        TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabListLayout.Padding = UDim.new(0, 3)
        TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

        local TabPadding = Instance.new("UIPadding")
        TabPadding.Parent = ScrollTab
        TabPadding.PaddingTop = UDim.new(0, 10)
        TabPadding.PaddingBottom = UDim.new(0, 10)

        
        local PageFrame = Instance.new("Frame")
        PageFrame.Name = "PageFrame"
        PageFrame.Parent = Main
        PageFrame.BackgroundColor3 = _G.BGColor
        PageFrame.Position = UDim2.new(0, tabWidth, 0, topHeight)
        PageFrame.Size = UDim2.new(1, -tabWidth, 1, -topHeight)
        PageFrame.BorderSizePixel = 0
        PageFrame.ClipsDescendants = true
        PageFrame.ZIndex = 2



        local PageGrad = Instance.new("UIGradient")
        PageGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(18,18,22)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(13,13,16)),
        })
        PageGrad.Rotation = 135
        PageGrad.Parent = PageFrame

        local PageList = Instance.new("Folder")
        PageList.Name = "PageList"
        PageList.Parent = PageFrame

        local UIPageLayout = Instance.new("UIPageLayout")
        UIPageLayout.Parent = PageList
        UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
        UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
        UIPageLayout.FillDirection = Enum.FillDirection.Vertical
        UIPageLayout.Padding = UDim.new(0, 0)
        UIPageLayout.TweenTime = 0.3
        UIPageLayout.GamepadInputEnabled = false
        UIPageLayout.ScrollWheelInputEnabled = false
        UIPageLayout.TouchInputEnabled = false

        
        local NotificationContainer = Instance.new("Frame")
        NotificationContainer.Name = "NotificationContainer"
        NotificationContainer.Parent = ShadcnUI
        NotificationContainer.BackgroundTransparency = 1
        NotificationContainer.Size = UDim2.new(0, 340, 1, 0)
        NotificationContainer.Position = UDim2.new(1, -20, 1, 30)
        NotificationContainer.AnchorPoint = Vector2.new(1, 1)
        NotificationContainer.ZIndex = 100

        local NotificationList = Instance.new("Frame")
        NotificationList.Name = "NotificationList"
        NotificationList.Parent = NotificationContainer
        NotificationList.BackgroundTransparency = 1
        NotificationList.Size = UDim2.new(1, 0, 1, 0)
        NotificationList.ClipsDescendants = true

        local activeNotifications = {}

        
        
        local allElements = {}
        local function UpdateAllThemeColors()
            Main.BackgroundColor3 = _G.BGColor
            MainStroke.Color = _G.Border
            MainGrad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, _G.Surface),
                ColorSequenceKeypoint.new(1, _G.BGColor),
            })
            Top.BackgroundColor3 = _G.TopBar or _G.Surface
            TopFill.BackgroundColor3 = Top.BackgroundColor3
            TopBottomLine.BackgroundColor3 = _G.Border
            TabFrame.BackgroundColor3 = _G.Sidebar or _G.BGColor
            SidebarLine.BackgroundColor3 = _G.Border
            PageFrame.BackgroundColor3 = _G.BGColor
            PageGrad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, _G.Surface),
                ColorSequenceKeypoint.new(1, _G.BGColor),
            })
            BindButton.BackgroundColor3 = _G.SurfaceAlt
            BindStroke.Color = _G.Border
            BindButton.TextColor3 = _G.TextSecondary
            MinimizeBtn.BackgroundColor3 = _G.SurfaceAlt
            MinStroke.Color = _G.Border
            MinimizeBtn.TextColor3 = _G.TextSecondary
            TitleLabel.TextColor3 = _G.TextPrimary

            -- Update tab buttons
            for _, tabBtn in pairs(ScrollTab:GetChildren()) do
                if tabBtn:IsA("TextButton") then
                    local isActive = (tabBtn == activeTabButton)
                    if isActive then
                        tabBtn.BackgroundColor3 = Color3.fromRGB(30,30,40)
                        tabBtn.BackgroundTransparency = 0
                        for _, child in pairs(tabBtn:GetChildren()) do
                            if child:IsA("TextLabel") then child.TextColor3 = _G.TextPrimary
                            elseif child:IsA("ImageLabel") then child.ImageColor3 = _G.Accent
                            elseif child:IsA("UIStroke") then child.Color = _G.Accent; child.Transparency = 0.4
                            elseif child:IsA("Frame") and child.Name == "ActiveBar" then
                                child.BackgroundTransparency = 0
                                child.BackgroundColor3 = _G.Accent
                            end
                        end
                    else
                        tabBtn.BackgroundTransparency = 1
                        for _, child in pairs(tabBtn:GetChildren()) do
                            if child:IsA("TextLabel") then child.TextColor3 = _G.TextSecondary
                            elseif child:IsA("ImageLabel") then child.ImageColor3 = _G.TextSecondary
                            elseif child:IsA("UIStroke") then child.Color = _G.Border; child.Transparency = 1
                            elseif child:IsA("Frame") and child.Name == "ActiveBar" then child.BackgroundTransparency = 1
                            end
                        end
                    end
                end
            end
            for _, updater in ipairs(allElements) do
                pcall(updater)
            end
        end

        
        ThemeManager:AddListener(function(theme)
            UpdateAllThemeColors()
        end)

        
        
        
        local NotificationService = {}

        function NotificationService:Notify(settings)
            spawn(function()
                local config = {
                    Title    = settings.Title    or "Notification",
                    Content  = settings.Content  or "",
                    Duration = settings.Duration or 5,
                    Type     = settings.Type     or "info",
                    Actions  = settings.Actions  or nil,
                    Image    = settings.Image    or nil,
                }

                local typeColorMap = {
                    info    = _G.Accent,
                    success = _G.Success or Color3.fromRGB(34, 197, 94),
                    warning = _G.Warning or Color3.fromRGB(245, 158, 11),
                    error   = _G.Danger or Color3.fromRGB(239, 68, 68),
                }
                local typeIconMap = {
                    info    = "rbxassetid://10723415903",
                    success = "rbxassetid://10709790644",
                    warning = "rbxassetid://10709753149",
                    error   = "rbxassetid://10747384394",
                }

                local typeColor = typeColorMap[config.Type] or _G.Accent
                local notifIcon = config.Image or typeIconMap[config.Type] or typeIconMap.info

                local Notification = Instance.new("Frame")
                Notification.Name = "Notif_" .. config.Title
                Notification.Parent = NotificationList
                Notification.BackgroundColor3 = _G.SurfaceAlt
                Notification.BackgroundTransparency = 1
                Notification.Size = UDim2.new(0, 310, 0, 0)
                Notification.ClipsDescendants = true
                Notification.ZIndex = 101

                local NC = Instance.new("UICorner"); NC.CornerRadius = UDim.new(0,8); NC.Parent = Notification

                local NS = Instance.new("UIStroke")
                NS.Color = _G.Border; NS.Thickness = 1; NS.Transparency = 1; NS.Parent = Notification

                local AccentBar = Instance.new("Frame")
                AccentBar.BackgroundColor3 = typeColor
                AccentBar.BorderSizePixel = 0
                AccentBar.Position = UDim2.new(0, 0, 0, 0)
                AccentBar.Size = UDim2.new(0, 3, 1, 0)
                AccentBar.Parent = Notification
                AccentBar.ZIndex = 102
                local ABC = Instance.new("UICorner"); ABC.CornerRadius = UDim.new(0,4); ABC.Parent = AccentBar

                local Content = Instance.new("Frame")
                Content.BackgroundTransparency = 1
                Content.Position = UDim2.new(0, 12, 0, 10)
                Content.Size = UDim2.new(1, -22, 1, -20)
                Content.Parent = Notification

                local Layout = Instance.new("UIListLayout")
                Layout.Parent = Content
                Layout.SortOrder = Enum.SortOrder.LayoutOrder
                Layout.Padding = UDim.new(0, 6)

                local Header = Instance.new("Frame")
                Header.BackgroundTransparency = 1
                Header.Size = UDim2.new(1, 0, 0, 20)
                Header.Parent = Content

                local HLayout = Instance.new("UIListLayout")
                HLayout.FillDirection = Enum.FillDirection.Horizontal
                HLayout.SortOrder = Enum.SortOrder.LayoutOrder
                HLayout.Padding = UDim.new(0, 8)
                HLayout.VerticalAlignment = Enum.VerticalAlignment.Center
                HLayout.Parent = Header

                local Icon = Instance.new("ImageLabel")
                Icon.BackgroundTransparency = 1
                Icon.Size = UDim2.new(0, 16, 0, 16)
                Icon.Image = notifIcon
                Icon.ImageColor3 = typeColor
                Icon.ImageTransparency = 1
                Icon.Parent = Header

                local Title = Instance.new("TextLabel")
                Title.BackgroundTransparency = 1
                Title.Size = UDim2.new(1, -44, 1, 0)
                Title.Font = Enum.Font.GothamSemibold
                Title.Text = config.Title
                Title.TextColor3 = _G.TextPrimary
                Title.TextTransparency = 1
                Title.TextSize = 13
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.Parent = Header

                local CloseBtn = Instance.new("ImageButton")
                CloseBtn.BackgroundTransparency = 1
                CloseBtn.Size = UDim2.new(0, 14, 0, 14)
                CloseBtn.Image = "rbxassetid://10747383819"
                CloseBtn.ImageColor3 = _G.TextSecondary
                CloseBtn.ImageTransparency = 1
                CloseBtn.ZIndex = 103
                CloseBtn.Parent = Header

                local Desc = Instance.new("TextLabel")
                Desc.BackgroundTransparency = 1
                Desc.Size = UDim2.new(1, 0, 0, 0)
                Desc.Font = Enum.Font.Gotham
                Desc.Text = config.Content
                Desc.TextColor3 = _G.TextSecondary
                Desc.TextTransparency = 1
                Desc.TextSize = 11
                Desc.TextXAlignment = Enum.TextXAlignment.Left
                Desc.TextWrapped = true
                Desc.AutomaticSize = Enum.AutomaticSize.Y
                Desc.Parent = Content

                local actionButtons = {}
                local ActionsFrame
                if config.Actions then
                    ActionsFrame = Instance.new("Frame")
                    ActionsFrame.BackgroundTransparency = 1
                    ActionsFrame.Size = UDim2.new(1, 0, 0, 28)
                    ActionsFrame.Parent = Content
                    local AL = Instance.new("UIListLayout")
                    AL.FillDirection = Enum.FillDirection.Horizontal
                    AL.SortOrder = Enum.SortOrder.LayoutOrder
                    AL.Padding = UDim.new(0, 6)
                    AL.HorizontalAlignment = Enum.HorizontalAlignment.Right
                    AL.Parent = ActionsFrame
                    for _, action in ipairs(config.Actions) do
                        local AB = Instance.new("TextButton")
                        AB.BackgroundColor3 = _G.Surface
                        AB.BackgroundTransparency = 0.9
                        AB.AutoButtonColor = false
                        AB.Font = Enum.Font.GothamMedium
                        AB.Text = action.Name
                        AB.TextColor3 = _G.TextPrimary
                        AB.TextSize = 11
                        AB.TextTransparency = 1
                        AB.Parent = ActionsFrame
                        local ts = game:GetService("TextService"):GetTextSize(action.Name, 11, Enum.Font.GothamMedium, Vector2.new(1000,28))
                        AB.Size = UDim2.new(0, ts.X + 18, 0, 26)
                        local ABc = Instance.new("UICorner"); ABc.CornerRadius = UDim.new(0,5); ABc.Parent = AB
                        local ABS = Instance.new("UIStroke"); ABS.Color = _G.Border; ABS.Thickness = 1; ABS.Parent = AB
                        AB.MouseButton1Click:Connect(function() pcall(action.Callback) end)
                        table.insert(actionButtons, AB)
                    end
                end

                local baseH = 54
                if config.Content ~= "" then
                    local ts = game:GetService("TextService"):GetTextSize(config.Content, 11, Enum.Font.Gotham, Vector2.new(270,1000))
                    baseH = baseH + math.min(ts.Y, 50)
                end
                if config.Actions then baseH = baseH + 34 end
                local finalH = math.min(baseH, 180)

                local notifData = {notification = Notification, height = finalH, close = nil}
                table.insert(activeNotifications, 1, notifData)

                local closeConnection
                local function closeNotification()
                    if closeConnection then closeConnection:Disconnect() end
                    for i, nd in ipairs(activeNotifications) do
                        if nd.notification == Notification then table.remove(activeNotifications, i); break end
                    end
                    TweenService:Create(Icon, TweenInfo.new(0.2), {ImageTransparency = 1}):Play()
                    TweenService:Create(Title, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
                    TweenService:Create(Desc, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
                    TweenService:Create(CloseBtn, TweenInfo.new(0.2), {ImageTransparency = 1}):Play()
                    for _, b in ipairs(actionButtons) do TweenService:Create(b, TweenInfo.new(0.2), {TextTransparency = 1}):Play() end
                    wait(0.2)
                    TweenService:Create(Notification, TweenInfo.new(0.35, Enum.EasingStyle.Quint), {
                        BackgroundTransparency = 1, Size = UDim2.new(0, 310, 0, 0)
                    }):Play()
                    wait(0.35)
                    local tot, sp = 0, 8
                    for _, nd in ipairs(activeNotifications) do
                        if nd.notification.Parent then
                            local ty = 1 - (tot + nd.height) / NotificationList.AbsoluteSize.Y
                            TweenService:Create(nd.notification, TweenInfo.new(0.25), {Position = UDim2.new(1,0,ty,0)}):Play()
                            tot = tot + nd.height + sp
                        end
                    end
                    if Notification.Parent then Notification:Destroy() end
                end

                notifData.close = closeNotification
                CloseBtn.MouseButton1Click:Connect(closeNotification)
                CloseBtn.MouseEnter:Connect(function() TweenService:Create(CloseBtn, TweenInfo.new(0.15), {ImageColor3 = _G.Danger or Color3.fromRGB(239,68,68)}):Play() end)
                CloseBtn.MouseLeave:Connect(function() TweenService:Create(CloseBtn, TweenInfo.new(0.15), {ImageColor3 = _G.TextSecondary}):Play() end)

                Notification.Position = UDim2.new(1, 40, 1, 0)
                Notification.AnchorPoint = Vector2.new(1, 1)

                TweenService:Create(Notification, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
                    BackgroundTransparency = 0, Size = UDim2.new(0, 310, 0, finalH)
                }):Play()
                TweenService:Create(NS, TweenInfo.new(0.4), {Transparency = 0}):Play()

                local tot, sp = 0, 8
                for _, nd in ipairs(activeNotifications) do
                    if nd.notification.Parent then
                        local ty = 1 - (tot + nd.height) / NotificationList.AbsoluteSize.Y
                        TweenService:Create(nd.notification, TweenInfo.new(0.3), {Position = UDim2.new(1,0,ty,0)}):Play()
                        tot = tot + nd.height + sp
                    end
                end

                wait(0.25)
                TweenService:Create(Icon, TweenInfo.new(0.3), {ImageTransparency = 0}):Play()
                TweenService:Create(Title, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
                TweenService:Create(CloseBtn, TweenInfo.new(0.3), {ImageTransparency = 0}):Play()
                if config.Content ~= "" then TweenService:Create(Desc, TweenInfo.new(0.3), {TextTransparency = 0.15}):Play() end
                if config.Actions then
                    for _, b in ipairs(actionButtons) do
                        TweenService:Create(b, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
                        wait(0.04)
                    end
                end

                if config.Duration > 0 then
                    closeConnection = RunService.Heartbeat:Connect(function(dt)
                        config.Duration = config.Duration - dt
                        if config.Duration <= 0 then closeConnection:Disconnect(); closeNotification() end
                    end)
                end

                return {Close = closeNotification}
            end)
        end

        function NotificationService:CloseAll()
            for i = #activeNotifications, 1, -1 do
                local nd = activeNotifications[i]
                if nd.close then nd.close() end
            end
            activeNotifications = {}
        end

        function library:Notify(settings)
            return NotificationService:Notify(settings)
        end
        function library:CloseAllNotifications()
            NotificationService:CloseAll()
        end

        
        
        
        function library:SetTheme(themeName)
            return ThemeManager:SetTheme(themeName)
        end
        function library:SetBackground(imageId, transparency, blur)
            transparency = transparency or 0.5
            blur = blur or 0
            
            -- Remove existing background image if any
            local existing = Main:FindFirstChild("BackgroundImage")
            if existing then existing:Destroy() end
            
            if not imageId then return end
            
            local BgImage = Instance.new("ImageLabel")
            BgImage.Name = "BackgroundImage"
            BgImage.Parent = Main
            BgImage.BackgroundTransparency = 1
            BgImage.Size = UDim2.new(1, 0, 1, 0)
            BgImage.Position = UDim2.new(0, 0, 0, 0)
            BgImage.ZIndex = 0
            BgImage.ScaleType = Enum.ScaleType.Crop
            BgImage.ImageTransparency = transparency
            BgImage.Image = typeof(imageId) == "number" and ("rbxassetid://" .. imageId) or imageId
            
            -- Push it behind everything but keep it inside Main
            BgImage.ZIndex = 1
            Main.ZIndex = 0
            
            -- Optional blur effect on the ScreenGui
            local existingBlur = ShadcnUI:FindFirstChildOfClass("BlurEffect")
            if existingBlur then existingBlur:Destroy() end
            
            if blur > 0 then
                local Blur = Instance.new("BlurEffect")
                Blur.Size = blur
                Blur.Parent = ShadcnUI
            end
            
            -- Also slightly dim the background frame so image shows through
            MainGrad.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.15),
                NumberSequenceKeypoint.new(1, 0.3),
            })
            
            return BgImage
        end

        function library:ClearBackground()
            local existing = Main:FindFirstChild("BackgroundImage")
            if existing then existing:Destroy() end
            local existingBlur = ShadcnUI:FindFirstChildOfClass("BlurEffect")
            if existingBlur then existingBlur:Destroy() end
            MainGrad.Transparency = NumberSequence.new(0)
        end
        function library:GetCurrentTheme()
            return ThemeManager:GetCurrentTheme()
        end
        
        function library:GetAllThemes()
            return ThemeManager:GetAllThemes()
        end
        
        function library:RegisterTheme(name, themeData)
            return ThemeManager:RegisterTheme(name, themeData)
        end
        
        function library:CreateCustomTheme(name, baseTheme, modifications)
            return ThemeManager:CreateCustomTheme(name, baseTheme, modifications)
        end
        
        function library:GetThemeManager()
            return ThemeManager
        end

        
        
        
        local uitab = {}
        function uitab:Tab(text, iconName)
            local iconAsset = GetIcon(iconName)

            local TabButton = Instance.new("TextButton")
            TabButton.Parent = ScrollTab
            TabButton.Name = text .. "_TabBtn"
            TabButton.BackgroundColor3 = Color3.fromRGB(26, 26, 32)
            TabButton.BackgroundTransparency = 1
            TabButton.Size = UDim2.new(0, tabWidth - 12, 0, isMobileLayout and 32 or 36)
            TabButton.Font = Enum.Font.GothamMedium
            TabButton.Text = ""
            TabButton.AutoButtonColor = false
            TabButton.ZIndex = 5

            local TBC = Instance.new("UICorner"); TBC.CornerRadius = UDim.new(0,7); TBC.Parent = TabButton

            local TBST = Instance.new("UIStroke")
            TBST.Color = _G.Border; TBST.Thickness = 1; TBST.Transparency = 1; TBST.Parent = TabButton

            local TBLayout = Instance.new("UIListLayout")
            TBLayout.FillDirection = Enum.FillDirection.Horizontal
            TBLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            TBLayout.SortOrder = Enum.SortOrder.LayoutOrder
            TBLayout.Padding = UDim.new(0, 6)
            TBLayout.Parent = TabButton

            local TBPad = Instance.new("UIPadding")
            TBPad.PaddingLeft = UDim.new(0, iconAsset and 8 or 10)
            TBPad.Parent = TabButton

            local TabIcon
            if iconAsset then
                TabIcon = Instance.new("ImageLabel")
                TabIcon.BackgroundTransparency = 1
                TabIcon.Size = UDim2.new(0, 14, 0, 14)
                TabIcon.Image = iconAsset
                TabIcon.ImageColor3 = _G.TextSecondary
                TabIcon.ZIndex = 6
                TabIcon.Parent = TabButton
            end

            local TabText = Instance.new("TextLabel")
            TabText.BackgroundTransparency = 1
            TabText.Size = UDim2.new(1, iconAsset and -28 or -10, 1, 0)
            TabText.Font = Enum.Font.GothamMedium
            TabText.Text = isMobileLayout and string.sub(text, 1, 9) or text
            TabText.TextColor3 = _G.TextSecondary
            TabText.TextSize = isMobileLayout and 10 or 13
            TabText.TextXAlignment = Enum.TextXAlignment.Left
            TabText.ZIndex = 6
            TabText.Parent = TabButton

            local ActiveBar = Instance.new("Frame")
            ActiveBar.Name = "ActiveBar"
            ActiveBar.BackgroundColor3 = _G.Accent
            ActiveBar.BorderSizePixel = 0
            ActiveBar.Position = UDim2.new(0, -2, 0.2, 0)
            ActiveBar.Size = UDim2.new(0, 3, 0.6, 0)
            ActiveBar.BackgroundTransparency = 1
            ActiveBar.ZIndex = 7
            ActiveBar.Parent = TabButton
            local ActiveBarCorner = Instance.new("UICorner"); ActiveBarCorner.CornerRadius = UDim.new(1,0); ActiveBarCorner.Parent = ActiveBar

            local MainFramePage = Instance.new("ScrollingFrame")
            MainFramePage.Name = text .. "_Page"
            MainFramePage.Parent = PageList
            MainFramePage.Active = true
            MainFramePage.BackgroundTransparency = 1
            MainFramePage.BorderSizePixel = 0
            MainFramePage.Size = UDim2.new(1, 0, 1, 0)
            MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
            MainFramePage.ScrollBarThickness = isMobileLayout and 3 or 4
            MainFramePage.ScrollBarImageColor3 = _G.Border
            MainFramePage.ClipsDescendants = true

            local UIPadding = Instance.new("UIPadding")
            UIPadding.Parent = MainFramePage
            UIPadding.PaddingLeft = UDim.new(0, isMobileLayout and 10 or 14)
            UIPadding.PaddingTop = UDim.new(0, isMobileLayout and 10 or 14)
            UIPadding.PaddingRight = UDim.new(0, isMobileLayout and 10 or 14)
            UIPadding.PaddingBottom = UDim.new(0, 10)

            local UIListLayout = Instance.new("UIListLayout")
            UIListLayout.Padding = UDim.new(0, isMobileLayout and 6 or 8)
            UIListLayout.Parent = MainFramePage
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

            local function setActive(active)
                if active then
                    TweenService:Create(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                        BackgroundColor3 = Color3.fromRGB(30,30,40),
                        BackgroundTransparency = 0
                    }):Play()
                    TweenService:Create(TabText, TweenInfo.new(0.2), {TextColor3 = _G.TextPrimary}):Play()
                    TweenService:Create(TBST, TweenInfo.new(0.2), {Transparency = 0.4, Color = _G.Accent}):Play()
                    TweenService:Create(ActiveBar, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
                    if TabIcon then TweenService:Create(TabIcon, TweenInfo.new(0.2), {ImageColor3 = _G.Accent}):Play() end
                else
                    TweenService:Create(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                        BackgroundColor3 = Color3.fromRGB(26,26,32),
                        BackgroundTransparency = 1
                    }):Play()
                    TweenService:Create(TabText, TweenInfo.new(0.2), {TextColor3 = _G.TextSecondary}):Play()
                    TweenService:Create(TBST, TweenInfo.new(0.2), {Transparency = 1}):Play()
                    TweenService:Create(ActiveBar, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
                    if TabIcon then TweenService:Create(TabIcon, TweenInfo.new(0.2), {ImageColor3 = _G.TextSecondary}):Play() end
                end
            end

            TabButton.MouseButton1Click:Connect(function()
                for _, v in next, ScrollTab:GetChildren() do
                    if v:IsA("TextButton") then
                        local bar = v:FindFirstChild("Frame")
                        TweenService:Create(v, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(26,26,32), BackgroundTransparency = 1}):Play()
                        for _, lbl in next, v:GetChildren() do
                            if lbl:IsA("TextLabel") then TweenService:Create(lbl, TweenInfo.new(0.2), {TextColor3 = _G.TextSecondary}):Play() end
                            if lbl:IsA("ImageLabel") then TweenService:Create(lbl, TweenInfo.new(0.2), {ImageColor3 = _G.TextSecondary}):Play() end
                            if lbl:IsA("UIStroke") then TweenService:Create(lbl, TweenInfo.new(0.2), {Transparency = 1}):Play() end
                            if lbl:IsA("Frame") then TweenService:Create(lbl, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play() end
                        end
                    end
                end
                activeTabButton = TabButton
                setActive(true)
                currentpage = text .. "_Page"
                for _, v in next, PageList:GetChildren() do
                    if v.Name == currentpage then UIPageLayout:JumpTo(v) end
                end
            end)

            TabButton.MouseEnter:Connect(function()
                if TabText.TextColor3 ~= _G.TextPrimary then
                    TweenService:Create(TabButton, TweenInfo.new(0.15), {BackgroundTransparency = 0.6, BackgroundColor3 = Color3.fromRGB(28,28,36)}):Play()
                end
            end)
            TabButton.MouseLeave:Connect(function()
                if TabText.TextColor3 ~= _G.TextPrimary then
                    TweenService:Create(TabButton, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
                end
            end)

            if abc == false then
                activeTabButton = TabButton
                setActive(true)
                UIPageLayout:JumpToIndex(1)
                abc = true
            end

            RunService.Stepped:Connect(function()
                pcall(function()
                    MainFramePage.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 30)
                    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, TabListLayout.AbsoluteContentSize.Y + 20)
                end)
            end)

            
            
            
            local main = {}

            local function createElementIcon(parent, iconName, posX, iconColor)
                local asset = GetIcon(iconName)
                if not asset then return nil, 0 end
                local img = Instance.new("ImageLabel")
                img.BackgroundTransparency = 1
                img.Position = UDim2.new(0, posX, 0.5, -8)
                img.Size = UDim2.new(0, 16, 0, 16)
                img.Image = asset
                img.ImageColor3 = iconColor or _G.TextSecondary
                img.Parent = parent
                img.ZIndex = parent.ZIndex + 1
                return img, 22
            end

            function main:Button(text, callback, iconName)
                local iconAsset = GetIcon(iconName)
                local iconOffset = iconAsset and (isMobileLayout and 20 or 24) or 0

                local Btn = Instance.new("TextButton")
                Btn.Name = "Button"
                Btn.Parent = MainFramePage
                Btn.BackgroundColor3 = _G.SurfaceAlt
                Btn.BackgroundTransparency = 0.4
                Btn.Size = UDim2.new(0, elementWidth, 0, isMobileLayout and 32 or 36)
                Btn.Font = Enum.Font.GothamMedium
                Btn.Text = ""
                Btn.AutoButtonColor = false
                Btn.ZIndex = 3

                local BC = Instance.new("UICorner"); BC.CornerRadius = UDim.new(0,7); BC.Parent = Btn
                local BS = Instance.new("UIStroke"); BS.Color = _G.Border; BS.Thickness = 1; BS.Parent = Btn

                local BtnIcon
                if iconAsset then
                    BtnIcon = Instance.new("ImageLabel")
                    BtnIcon.BackgroundTransparency = 1
                    BtnIcon.Position = UDim2.new(0, isMobileLayout and 10 or 12, 0.5, -8)
                    BtnIcon.Size = UDim2.new(0, 16, 0, 16)
                    BtnIcon.Image = iconAsset
                    BtnIcon.ImageColor3 = _G.TextSecondary
                    BtnIcon.ZIndex = 4
                    BtnIcon.Parent = Btn
                end

                local BtnText = Instance.new("TextLabel")
                BtnText.BackgroundTransparency = 1
                BtnText.Position = UDim2.new(0, (iconAsset and (isMobileLayout and 30 or 34) or (isMobileLayout and 10 or 12)), 0, 0)
                BtnText.Size = UDim2.new(1, -(iconAsset and (isMobileLayout and 34 or 38) or (isMobileLayout and 10 or 12)), 1, 0)
                BtnText.Font = Enum.Font.GothamMedium
                BtnText.Text = text
                BtnText.TextColor3 = _G.TextPrimary
                BtnText.TextSize = isMobileLayout and 12 or 13
                BtnText.TextXAlignment = Enum.TextXAlignment.Left
                BtnText.ZIndex = 4
                BtnText.Parent = Btn

                local ArrowIcon = Instance.new("ImageLabel")
                ArrowIcon.BackgroundTransparency = 1
                ArrowIcon.Position = UDim2.new(1, -24, 0.5, -7)
                ArrowIcon.Size = UDim2.new(0, 14, 0, 14)
                ArrowIcon.Image = "rbxassetid://10709791437"
                ArrowIcon.ImageColor3 = _G.Border
                ArrowIcon.ZIndex = 4
                ArrowIcon.Parent = Btn

                Btn.MouseEnter:Connect(function()
                    TweenService:Create(Btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.1, BackgroundColor3 = Color3.fromRGB(32,32,42)}):Play()
                    TweenService:Create(BS, TweenInfo.new(0.15), {Color = _G.Accent}):Play()
                    TweenService:Create(BtnText, TweenInfo.new(0.15), {TextColor3 = _G.Accent}):Play()
                    TweenService:Create(ArrowIcon, TweenInfo.new(0.15), {ImageColor3 = _G.Accent}):Play()
                    if BtnIcon then TweenService:Create(BtnIcon, TweenInfo.new(0.15), {ImageColor3 = _G.Accent}):Play() end
                end)
                Btn.MouseLeave:Connect(function()
                    TweenService:Create(Btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.4, BackgroundColor3 = _G.SurfaceAlt}):Play()
                    TweenService:Create(BS, TweenInfo.new(0.15), {Color = _G.Border}):Play()
                    TweenService:Create(BtnText, TweenInfo.new(0.15), {TextColor3 = _G.TextPrimary}):Play()
                    TweenService:Create(ArrowIcon, TweenInfo.new(0.15), {ImageColor3 = _G.Border}):Play()
                    if BtnIcon then TweenService:Create(BtnIcon, TweenInfo.new(0.15), {ImageColor3 = _G.TextSecondary}):Play() end
                end)
                Btn.MouseButton1Down:Connect(function()
                    TweenService:Create(Btn, TweenInfo.new(0.08), {BackgroundColor3 = _G.Accent, BackgroundTransparency = 0.6}):Play()
                    TweenService:Create(BS, TweenInfo.new(0.08), {Color = _G.Accent}):Play()
                    TweenService:Create(BtnText, TweenInfo.new(0.08), {TextColor3 = Color3.new(1,1,1)}):Play()
                end)
                Btn.MouseButton1Up:Connect(function()
                    TweenService:Create(Btn, TweenInfo.new(0.2), {BackgroundColor3 = _G.SurfaceAlt, BackgroundTransparency = 0.4}):Play()
                    TweenService:Create(BS, TweenInfo.new(0.2), {Color = _G.Border}):Play()
                    TweenService:Create(BtnText, TweenInfo.new(0.2), {TextColor3 = _G.TextPrimary}):Play()
                end)
                Btn.MouseButton1Click:Connect(function() pcall(callback) end)

                local BtnObj = {}
                table.insert(allElements, function()
                    Btn.BackgroundColor3 = _G.SurfaceAlt
                    BS.Color = _G.Border
                    BtnText.TextColor3 = _G.TextPrimary
                    ArrowIcon.ImageColor3 = _G.Border
                    if BtnIcon then BtnIcon.ImageColor3 = _G.TextSecondary end
                end)
                function BtnObj:Set(newText, newCb)
                    if newText then BtnText.Text = newText end
                    if newCb then callback = newCb end
                    return BtnObj
                end
                function BtnObj:SetEnabled(enabled)
                    Btn.Active = enabled
                    BtnText.TextColor3 = enabled and _G.TextPrimary or _G.TextSecondary
                    Btn.BackgroundTransparency = enabled and 0.4 or 0.7
                    return BtnObj
                end
                function BtnObj:SetVisible(visible)
                    Btn.Visible = visible
                    return BtnObj
                end
                function BtnObj:GetText() return BtnText.Text end
                BtnObj.Frame = Btn
                return BtnObj
            end
            function main:Toggle(text, config, callback, iconName)
                config = config or false
                local toggled = config
                local iconAsset = GetIcon(iconName)
                local connections = {} -- Store connections for cleanup

                local TogFrame = Instance.new("Frame")
                TogFrame.Name = "Toggle"
                TogFrame.Parent = MainFramePage
                TogFrame.BackgroundColor3 = _G.SurfaceAlt
                TogFrame.BackgroundTransparency = 0.4
                TogFrame.Size = UDim2.new(0, elementWidth, 0, isMobileLayout and 34 or 38)
                TogFrame.ZIndex = 3

                local TC = Instance.new("UICorner"); TC.CornerRadius = UDim.new(0,7); TC.Parent = TogFrame
                local TS = Instance.new("UIStroke"); TS.Color = _G.Border; TS.Thickness = 1; TS.Parent = TogFrame

                local TogIcon
                if iconAsset then
                    TogIcon = Instance.new("ImageLabel")
                    TogIcon.BackgroundTransparency = 1
                    TogIcon.Position = UDim2.new(0, isMobileLayout and 10 or 12, 0.5, -8)
                    TogIcon.Size = UDim2.new(0, 16, 0, 16)
                    TogIcon.Image = iconAsset
                    TogIcon.ImageColor3 = _G.TextSecondary
                    TogIcon.ZIndex = 4
                    TogIcon.Parent = TogFrame
                end

                local TogLabel = Instance.new("TextLabel")
                TogLabel.Name = "Label"
                TogLabel.Parent = TogFrame
                TogLabel.BackgroundTransparency = 1
                TogLabel.Position = UDim2.new(0, (iconAsset and (isMobileLayout and 32 or 36) or (isMobileLayout and 10 or 12)), 0, 0)
                TogLabel.Size = UDim2.new(0, isMobileLayout and 170 or 220, 1, 0)
                TogLabel.Font = Enum.Font.GothamMedium
                TogLabel.Text = text
                TogLabel.TextColor3 = _G.TextPrimary
                TogLabel.TextSize = isMobileLayout and 12 or 13
                TogLabel.TextXAlignment = Enum.TextXAlignment.Left
                TogLabel.ZIndex = 4

                local TogSwitch = Instance.new("TextButton")
                TogSwitch.Parent = TogFrame
                TogSwitch.BackgroundColor3 = _G.Border
                TogSwitch.Position = UDim2.new(1, isMobileLayout and -48 or -54, 0.5, isMobileLayout and -9 or -10)
                TogSwitch.Size = isMobileLayout and UDim2.new(0, 36, 0, 18) or UDim2.new(0, 40, 0, 20)
                TogSwitch.Text = ""
                TogSwitch.AutoButtonColor = false
                TogSwitch.ZIndex = 5

                local TSC = Instance.new("UICorner"); TSC.CornerRadius = UDim.new(1,0); TSC.Parent = TogSwitch

                local Knob = Instance.new("Frame")
                Knob.BackgroundColor3 = Color3.fromRGB(160,160,180)
                Knob.Position = UDim2.new(0, 2, 0, 2)
                Knob.Size = isMobileLayout and UDim2.new(0, 14, 0, 14) or UDim2.new(0, 16, 0, 16)
                Knob.ZIndex = 6
                Knob.Parent = TogSwitch
                local KC = Instance.new("UICorner"); KC.CornerRadius = UDim.new(1,0); KC.Parent = Knob

                local function updateState(state)
                    toggled = state
                    if toggled then
                        TweenService:Create(TogSwitch, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = _G.Accent}):Play()
                        TweenService:Create(Knob, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                            BackgroundColor3 = Color3.new(1,1,1),
                            Position = UDim2.new(1, isMobileLayout and -16 or -18, 0, 2)
                        }):Play()
                        TweenService:Create(TS, TweenInfo.new(0.2), {Color = _G.Accent}):Play()
                        if TogIcon then TweenService:Create(TogIcon, TweenInfo.new(0.2), {ImageColor3 = _G.Accent}):Play() end
                    else
                        TweenService:Create(TogSwitch, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = _G.Border}):Play()
                        TweenService:Create(Knob, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                            BackgroundColor3 = Color3.fromRGB(160,160,180),
                            Position = UDim2.new(0, 2, 0, 2)
                        }):Play()
                        TweenService:Create(TS, TweenInfo.new(0.2), {Color = _G.Border}):Play()
                        if TogIcon then TweenService:Create(TogIcon, TweenInfo.new(0.2), {ImageColor3 = _G.TextSecondary}):Play() end
                    end
                    pcall(callback, toggled)
                end

                -- Store button connections
                table.insert(connections, TogSwitch.MouseButton1Click:Connect(function() 
                    updateState(not toggled) 
                end))
                
                local ClickOverlay = Instance.new("TextButton")
                ClickOverlay.BackgroundTransparency = 1
                ClickOverlay.Size = UDim2.new(1, -60, 1, 0)
                ClickOverlay.Text = ""
                ClickOverlay.ZIndex = 4
                ClickOverlay.Parent = TogFrame
                
                table.insert(connections, ClickOverlay.MouseButton1Click:Connect(function() 
                    updateState(not toggled) 
                end))

                -- Track ancestry for cleanup
                local ancestryConn
                ancestryConn = TogFrame.AncestryChanged:Connect(function()
                    if not TogFrame.Parent then
                        if ancestryConn then ancestryConn:Disconnect() end
                    end
                end)
                table.insert(connections, ancestryConn)

                if config == true then updateState(true) end

                local TogObj = {}
                table.insert(allElements, function()
                    TogFrame.BackgroundColor3 = _G.SurfaceAlt
                    TS.Color = toggled and _G.Accent or _G.Border
                    TogLabel.TextColor3 = _G.TextPrimary
                    TogSwitch.BackgroundColor3 = toggled and _G.Accent or _G.Border
                    if TogIcon then TogIcon.ImageColor3 = toggled and _G.Accent or _G.TextSecondary end
                end)
                
                function TogObj:Set(state, newText)
                    if state ~= nil then updateState(state) end
                    if newText then TogLabel.Text = newText end
                    return TogObj
                end
                function TogObj:SetValue(state)
                    return TogObj:Set(state)
                end
                function TogObj:SetText(newText)
                    if newText then TogLabel.Text = newText end
                    return TogObj
                end
                function TogObj:SetVisible(visible)
                    TogFrame.Visible = visible
                    return TogObj
                end
                function TogObj:Get() 
                    return toggled 
                end
                
                -- NEW DESTROY FUNCTION
                function TogObj:Destroy()
                    -- Disconnect all connections
                    for _, conn in ipairs(connections) do
                        if conn and conn.Disconnect then
                            conn:Disconnect()
                        end
                    end
                    connections = {}
                    
                    -- Destroy the main frame and all children
                    if TogFrame and TogFrame.Parent then
                        TogFrame:Destroy()
                    end
                    
                    -- Remove from allElements tracking if needed
                    local idx = table.find(allElements, TogObj)
                    if idx then
                        table.remove(allElements, idx)
                    end
                    
                    -- Nullify references to prevent memory leaks
                    TogFrame = nil
                    TogLabel = nil
                    TogSwitch = nil
                    Knob = nil
                    TogIcon = nil
                    TC = nil
                    TS = nil
                    TSC = nil
                    KC = nil
                    ClickOverlay = nil
                    
                    return true
                end
                
                TogObj.Frame = TogFrame
                return TogObj
            end

            function main:Slider(text, min, max, set, callback, iconName)
                local iconAsset = GetIcon(iconName)

                local SliderFrame = Instance.new("Frame")
                SliderFrame.Name = "Slider"
                SliderFrame.Parent = MainFramePage
                SliderFrame.BackgroundColor3 = _G.SurfaceAlt
                SliderFrame.BackgroundTransparency = 0.4
                SliderFrame.Size = UDim2.new(0, elementWidth, 0, isMobileLayout and 52 or 58)
                SliderFrame.ZIndex = 3

                local SC = Instance.new("UICorner"); SC.CornerRadius = UDim.new(0,7); SC.Parent = SliderFrame
                local SS = Instance.new("UIStroke"); SS.Color = _G.Border; SS.Thickness = 1; SS.Parent = SliderFrame

                if iconAsset then
                    local Simg = Instance.new("ImageLabel")
                    Simg.BackgroundTransparency = 1
                    Simg.Position = UDim2.new(0, isMobileLayout and 10 or 12, 0, isMobileLayout and 6 or 8)
                    Simg.Size = UDim2.new(0, 14, 0, 14)
                    Simg.Image = iconAsset
                    Simg.ImageColor3 = _G.TextSecondary
                    Simg.ZIndex = 4
                    Simg.Parent = SliderFrame
                end

                local labelX = iconAsset and (isMobileLayout and 30 or 34) or (isMobileLayout and 10 or 12)

                local SliderLabel = Instance.new("TextLabel")
                SliderLabel.Parent = SliderFrame
                SliderLabel.BackgroundTransparency = 1
                SliderLabel.Position = UDim2.new(0, labelX, 0, isMobileLayout and 6 or 8)
                SliderLabel.Size = UDim2.new(0, isMobileLayout and 160 or 200, 0, 18)
                SliderLabel.Font = Enum.Font.GothamMedium
                SliderLabel.Text = text
                SliderLabel.TextColor3 = _G.TextPrimary
                SliderLabel.TextSize = isMobileLayout and 11 or 13
                SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
                SliderLabel.ZIndex = 4

                local ValueLabel = Instance.new("TextLabel")
                ValueLabel.Parent = SliderFrame
                ValueLabel.BackgroundTransparency = 1
                ValueLabel.Position = UDim2.new(1, isMobileLayout and -50 or -58, 0, isMobileLayout and 6 or 8)
                ValueLabel.Size = UDim2.new(0, isMobileLayout and 40 or 50, 0, 18)
                ValueLabel.Font = Enum.Font.GothamBold
                ValueLabel.Text = tostring(set)
                ValueLabel.TextColor3 = _G.Accent
                ValueLabel.TextSize = isMobileLayout and 11 or 13
                ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
                ValueLabel.ZIndex = 4

                local TrackBg = Instance.new("Frame")
                TrackBg.Parent = SliderFrame
                TrackBg.BackgroundColor3 = Color3.fromRGB(38,38,50)
                TrackBg.Position = UDim2.new(0, isMobileLayout and 10 or 12, 0, isMobileLayout and 30 or 36)
                TrackBg.Size = UDim2.new(0, elementWidth - (isMobileLayout and 20 or 24), 0, isMobileLayout and 5 or 6)
                TrackBg.ZIndex = 4
                local TBC2 = Instance.new("UICorner"); TBC2.CornerRadius = UDim.new(1,0); TBC2.Parent = TrackBg

                local Fill = Instance.new("Frame")
                Fill.Parent = TrackBg
                Fill.BackgroundColor3 = _G.Accent
                Fill.Size = UDim2.new(0, 0, 1, 0)
                Fill.ZIndex = 5
                local FC = Instance.new("UICorner"); FC.CornerRadius = UDim.new(1,0); FC.Parent = Fill

                local SliderBtn = Instance.new("TextButton")
                SliderBtn.Parent = TrackBg
                SliderBtn.BackgroundTransparency = 1
                SliderBtn.Size = UDim2.new(1, 0, 0, isMobileLayout and 20 or 24)
                SliderBtn.Position = UDim2.new(0, 0, 0.5, isMobileLayout and -10 or -12)
                SliderBtn.Text = ""
                SliderBtn.ZIndex = 7

                local Knob2 = Instance.new("Frame")
                Knob2.Parent = TrackBg
                Knob2.BackgroundColor3 = Color3.new(1,1,1)
                Knob2.Size = isMobileLayout and UDim2.new(0,12,0,12) or UDim2.new(0,14,0,14)
                Knob2.AnchorPoint = Vector2.new(0.5,0.5)
                Knob2.Position = UDim2.new(0, 0, 0.5, 0)
                Knob2.ZIndex = 6
                local KC2 = Instance.new("UICorner"); KC2.CornerRadius = UDim.new(1,0); KC2.Parent = Knob2
                local KS2 = Instance.new("UIStroke"); KS2.Color = _G.Border; KS2.Thickness = 1.5; KS2.Parent = Knob2

                local mouse = LocalPlayer:GetMouse()
                local uis = UserInputService
                local Value = set

                local function UpdateSlider(val)
                    val = math.clamp(math.floor(val), min, max)
                    Value = val
                    ValueLabel.Text = tostring(val)
                    local pct = (val - min) / (max - min)
                    Fill.Size = UDim2.new(pct, 0, 1, 0)
                    Knob2.Position = UDim2.new(pct, 0, 0.5, 0)
                    pcall(callback, val)
                end

                UpdateSlider(set)

                SliderBtn.MouseButton1Down:Connect(function()
                    TweenService:Create(Knob2, TweenInfo.new(0.1), {Size = isMobileLayout and UDim2.new(0,15,0,15) or UDim2.new(0,17,0,17)}):Play()
                    local mc, rc
                    mc = mouse.Move:Connect(function()
                        local pct = math.clamp((mouse.X - TrackBg.AbsolutePosition.X) / TrackBg.AbsoluteSize.X, 0, 1)
                        UpdateSlider(min + (max - min) * pct)
                    end)
                    rc = uis.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            mc:Disconnect(); rc:Disconnect()
                            TweenService:Create(Knob2, TweenInfo.new(0.1), {Size = isMobileLayout and UDim2.new(0,12,0,12) or UDim2.new(0,14,0,14)}):Play()
                        end
                    end)
                end)

                local SliderObj = {}
                table.insert(allElements, function()
                    SliderFrame.BackgroundColor3 = _G.SurfaceAlt
                    SS.Color = _G.Border
                    SliderLabel.TextColor3 = _G.TextPrimary
                    ValueLabel.TextColor3 = _G.Accent
                    Fill.BackgroundColor3 = _G.Accent
                end)
                function SliderObj:Set(val) UpdateSlider(val) end
                function SliderObj:SetValue(val) UpdateSlider(val) end
                function SliderObj:SetText(newText)
                    if newText then SliderLabel.Text = newText end
                    return SliderObj
                end
                function SliderObj:SetVisible(visible)
                    SliderFrame.Visible = visible
                    return SliderObj
                end
                function SliderObj:Get() return Value end
                SliderObj.Frame = SliderFrame
                return SliderObj
            end

            function main:Textbox(text, placeholder, callback, iconName)
                local iconAsset = GetIcon(iconName)
                local connections = {} -- Store connections for cleanup

                local TBFrame = Instance.new("Frame")
                TBFrame.Name = "Textbox"
                TBFrame.Parent = MainFramePage
                TBFrame.BackgroundColor3 = _G.SurfaceAlt
                TBFrame.BackgroundTransparency = 0.4
                TBFrame.Size = UDim2.new(0, elementWidth, 0, isMobileLayout and 34 or 38)
                TBFrame.ZIndex = 3

                local TBC3 = Instance.new("UICorner"); TBC3.CornerRadius = UDim.new(0,7); TBC3.Parent = TBFrame
                local TBS = Instance.new("UIStroke"); TBS.Color = _G.Border; TBS.Thickness = 1; TBS.Parent = TBFrame

                if iconAsset then
                    local Timg = Instance.new("ImageLabel")
                    Timg.BackgroundTransparency = 1
                    Timg.Position = UDim2.new(0, isMobileLayout and 10 or 12, 0.5, -8)
                    Timg.Size = UDim2.new(0, 16, 0, 16)
                    Timg.Image = iconAsset
                    Timg.ImageColor3 = _G.TextSecondary
                    Timg.ZIndex = 4
                    Timg.Parent = TBFrame
                end

                local labelX = iconAsset and (isMobileLayout and 32 or 36) or (isMobileLayout and 10 or 12)

                local TBLabel = Instance.new("TextLabel")
                TBLabel.Parent = TBFrame
                TBLabel.BackgroundTransparency = 1
                TBLabel.Position = UDim2.new(0, labelX, 0, 0)
                TBLabel.Size = UDim2.new(0, isMobileLayout and 110 or 140, 1, 0)
                TBLabel.Font = Enum.Font.GothamMedium
                TBLabel.Text = text
                TBLabel.TextColor3 = _G.TextPrimary
                TBLabel.TextSize = isMobileLayout and 12 or 13
                TBLabel.TextXAlignment = Enum.TextXAlignment.Left
                TBLabel.ZIndex = 4

                local InputCont = Instance.new("Frame")
                InputCont.Parent = TBFrame
                InputCont.BackgroundColor3 = Color3.fromRGB(12,12,16)
                InputCont.BackgroundTransparency = 0.2
                InputCont.Position = UDim2.new(0, labelX + (isMobileLayout and 118 or 150), 0, isMobileLayout and 5 or 7)
                InputCont.Size = UDim2.new(0, elementWidth - labelX - (isMobileLayout and 128 or 162), 0, isMobileLayout and 24 or 24)
                InputCont.ClipsDescendants = true
                InputCont.ZIndex = 4

                local ICC = Instance.new("UICorner"); ICC.CornerRadius = UDim.new(0,5); ICC.Parent = InputCont
                local ICS = Instance.new("UIStroke"); ICS.Color = _G.Border; ICS.Thickness = 1; ICS.Parent = InputCont

                local Input = Instance.new("TextBox")
                Input.Parent = InputCont
                Input.BackgroundTransparency = 1
                Input.Position = UDim2.new(0, 7, 0, 0)
                Input.Size = UDim2.new(1, -14, 1, 0)
                Input.Font = Enum.Font.GothamMedium
                Input.PlaceholderText = placeholder or ""
                Input.PlaceholderColor3 = _G.TextSecondary
                Input.Text = ""
                Input.TextColor3 = _G.TextPrimary
                Input.TextSize = isMobileLayout and 11 or 12
                Input.ClearTextOnFocus = false
                Input.TextXAlignment = Enum.TextXAlignment.Left
                Input.ZIndex = 5

                -- Store focus connections
                table.insert(connections, Input.Focused:Connect(function()
                    TweenService:Create(ICS, TweenInfo.new(0.15), {Color = _G.Accent}):Play()
                    TweenService:Create(TBS, TweenInfo.new(0.15), {Color = _G.Accent}):Play()
                end))
                
                table.insert(connections, Input.FocusLost:Connect(function()
                    TweenService:Create(ICS, TweenInfo.new(0.15), {Color = _G.Border}):Play()
                    TweenService:Create(TBS, TweenInfo.new(0.15), {Color = _G.Border}):Play()
                    pcall(callback, Input.Text)
                end))

                -- Track ancestry for cleanup
                local ancestryConn
                ancestryConn = TBFrame.AncestryChanged:Connect(function()
                    if not TBFrame.Parent then
                        if ancestryConn then ancestryConn:Disconnect() end
                    end
                end)
                table.insert(connections, ancestryConn)

                local TBObj = {}
                table.insert(allElements, function()
                    TBFrame.BackgroundColor3 = _G.SurfaceAlt
                    TBS.Color = _G.Border
                    TBLabel.TextColor3 = _G.TextPrimary
                    Input.TextColor3 = _G.TextPrimary
                    Input.PlaceholderColor3 = _G.TextSecondary
                    ICS.Color = _G.Border
                end)
                
                function TBObj:Set(v) 
                    Input.Text = tostring(v or "") 
                end
                function TBObj:SetValue(v) 
                    Input.Text = tostring(v or "") 
                end
                function TBObj:SetText(t) 
                    if t then TBLabel.Text = t end 
                    return TBObj 
                end
                function TBObj:SetVisible(visible) 
                    TBFrame.Visible = visible 
                    return TBObj 
                end
                function TBObj:Get() 
                    return Input.Text 
                end
                function TBObj:Clear() 
                    Input.Text = "" 
                end
                function TBObj:Focus() 
                    Input:CaptureFocus() 
                end
                
                -- NEW DESTROY FUNCTION
                function TBObj:Destroy()
                    -- Disconnect all connections
                    for _, conn in ipairs(connections) do
                        if conn and conn.Disconnect then
                            conn:Disconnect()
                        end
                    end
                    connections = {}
                    
                    -- Destroy the main frame and all children
                    if TBFrame and TBFrame.Parent then
                        TBFrame:Destroy()
                    end
                    
                    -- Remove from allElements tracking if needed
                    local idx = table.find(allElements, TBObj)
                    if idx then
                        table.remove(allElements, idx)
                    end
                    
                    -- Nullify references to prevent memory leaks
                    TBFrame = nil
                    TBLabel = nil
                    InputCont = nil
                    Input = nil
                    TBC3 = nil
                    TBS = nil
                    ICC = nil
                    ICS = nil
                    
                    return true
                end
                
                TBObj.Frame = TBFrame
                return TBObj
            end

            function main:Dropdown(text, old, options, mode, callback, iconName)
                assert(typeof(text) == "string")
                assert(typeof(options) == "table")
                assert(typeof(callback) == "function")
                mode = string.lower(mode or "single")
                local isMulti = (mode == "multi")
                local iconAsset = GetIcon(iconName)

                local selections = isMulti and {} or nil
                if old ~= nil then
                    selections = isMulti and (typeof(old) == "table" and old or {old}) or old
                end

                local isDropped = false
                local itemMap = {}
                local allOptions = table.clone(options)
                local connections = {} -- Store connections for cleanup

                local DDFrame = Instance.new("Frame")
                DDFrame.Name = "Dropdown"
                DDFrame.Parent = MainFramePage
                DDFrame.BackgroundColor3 = _G.SurfaceAlt
                DDFrame.BackgroundTransparency = 0.4
                DDFrame.Size = UDim2.new(0, elementWidth, 0, isMobileLayout and 34 or 38)
                DDFrame.ClipsDescendants = true
                DDFrame.ZIndex = 3

                local DDC = Instance.new("UICorner"); DDC.CornerRadius = UDim.new(0,7); DDC.Parent = DDFrame
                local DDS = Instance.new("UIStroke"); DDS.Color = _G.Border; DDS.Thickness = 1; DDS.Parent = DDFrame

                if iconAsset then
                    local DDimg = Instance.new("ImageLabel")
                    DDimg.BackgroundTransparency = 1
                    DDimg.Position = UDim2.new(0, isMobileLayout and 10 or 12, 0, (isMobileLayout and 34 or 38)/2 - 8)
                    DDimg.Size = UDim2.new(0, 16, 0, 16)
                    DDimg.Image = iconAsset
                    DDimg.ImageColor3 = _G.TextSecondary
                    DDimg.ZIndex = 4
                    DDimg.Parent = DDFrame
                end

                local labelX2 = iconAsset and (isMobileLayout and 32 or 36) or (isMobileLayout and 10 or 12)

                local DDHeader = Instance.new("Frame")
                DDHeader.BackgroundTransparency = 1
                DDHeader.Size = UDim2.new(1, 0, 0, isMobileLayout and 34 or 38)
                DDHeader.ZIndex = 4
                DDHeader.Parent = DDFrame

                local DDTitle = Instance.new("TextLabel")
                DDTitle.BackgroundTransparency = 1
                DDTitle.Position = UDim2.fromOffset(labelX2, 0)
                DDTitle.Size = UDim2.new(1, -(labelX2 + 28), 1, 0)
                DDTitle.Font = Enum.Font.GothamMedium
                DDTitle.TextColor3 = _G.TextPrimary
                DDTitle.TextSize = isMobileLayout and 12 or 13
                DDTitle.TextXAlignment = Enum.TextXAlignment.Left
                DDTitle.ZIndex = 5
                DDTitle.Parent = DDHeader

                local ChevronImg = Instance.new("ImageLabel")
                ChevronImg.BackgroundTransparency = 1
                ChevronImg.Position = UDim2.new(1, isMobileLayout and -22 or -26, 0.5, -8)
                ChevronImg.Size = UDim2.new(0, 16, 0, 16)
                ChevronImg.Image = "rbxassetid://10709790948"
                ChevronImg.ImageColor3 = _G.TextSecondary
                ChevronImg.ZIndex = 5
                ChevronImg.Parent = DDHeader

                local DropBtn = Instance.new("TextButton")
                DropBtn.BackgroundTransparency = 1
                DropBtn.Size = UDim2.new(1, 0, 1, 0)
                DropBtn.Text = ""
                DropBtn.ZIndex = 6
                DropBtn.Parent = DDHeader

                local SearchCont = Instance.new("Frame")
                SearchCont.BackgroundColor3 = Color3.fromRGB(12,12,16)
                SearchCont.BackgroundTransparency = 0.3
                SearchCont.Position = UDim2.fromOffset(isMobileLayout and 8 or 10, isMobileLayout and 38 or 42)
                SearchCont.Size = UDim2.new(1, isMobileLayout and -16 or -20, 0, isMobileLayout and 26 or 28)
                SearchCont.Visible = false
                SearchCont.ZIndex = 4
                SearchCont.Parent = DDFrame
                local SCC = Instance.new("UICorner"); SCC.CornerRadius = UDim.new(0,5); SCC.Parent = SearchCont
                local SCS = Instance.new("UIStroke"); SCS.Color = _G.Border; SCS.Thickness = 1; SCS.Parent = SearchCont

                local SearchBox = Instance.new("TextBox")
                SearchBox.BackgroundTransparency = 1
                SearchBox.Size = UDim2.new(1, -10, 1, 0)
                SearchBox.Position = UDim2.fromOffset(5,0)
                SearchBox.Font = Enum.Font.GothamMedium
                SearchBox.PlaceholderText = "Search..."
                SearchBox.PlaceholderColor3 = _G.TextSecondary
                SearchBox.TextColor3 = _G.TextPrimary
                SearchBox.TextSize = isMobileLayout and 11 or 12
                SearchBox.Text = ""
                SearchBox.ClearTextOnFocus = false
                SearchBox.ZIndex = 5
                SearchBox.Parent = SearchCont
                
                -- Store search box connections
                table.insert(connections, SearchBox.Focused:Connect(function() 
                    TweenService:Create(SCS, TweenInfo.new(0.15), {Color = _G.Accent}):Play() 
                end))
                table.insert(connections, SearchBox.FocusLost:Connect(function() 
                    TweenService:Create(SCS, TweenInfo.new(0.15), {Color = _G.Border}):Play() 
                end))

                local OptionsCont = Instance.new("Frame")
                OptionsCont.BackgroundTransparency = 1
                OptionsCont.Position = UDim2.fromOffset(0, isMobileLayout and 68 or 74)
                OptionsCont.Size = UDim2.new(1, 0, 0, 0)
                OptionsCont.Visible = false
                OptionsCont.ClipsDescendants = true
                OptionsCont.ZIndex = 4
                OptionsCont.Parent = DDFrame

                local DropScroll = Instance.new("ScrollingFrame")
                DropScroll.Active = true
                DropScroll.BackgroundTransparency = 1
                DropScroll.BorderSizePixel = 0
                DropScroll.Size = UDim2.new(1, 0, 1, 0)
                DropScroll.ScrollBarThickness = 3
                DropScroll.ScrollBarImageColor3 = _G.Border
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
                DropScroll.ZIndex = 4
                DropScroll.Parent = OptionsCont

                local DSLL = Instance.new("UIListLayout")
                DSLL.SortOrder = Enum.SortOrder.LayoutOrder
                DSLL.Padding = UDim.new(0, 3)
                DSLL.Parent = DropScroll

                local DSPad = Instance.new("UIPadding")
                DSPad.PaddingLeft = UDim.new(0, isMobileLayout and 6 or 8)
                DSPad.PaddingTop = UDim.new(0, 4)
                DSPad.PaddingRight = UDim.new(0, isMobileLayout and 6 or 8)
                DSPad.PaddingBottom = UDim.new(0, 4)
                DSPad.Parent = DropScroll

                local function updateTitle()
                    if isMulti then
                        DDTitle.Text = #selections == 0 and (text.." :") or (#selections == 1 and (text.." : "..tostring(selections[1])) or (text.." : "..#selections.." selected"))
                    else
                        DDTitle.Text = text .. " : " .. (selections and tostring(selections) or "")
                    end
                end

                local function isSelected(val)
                    return isMulti and (table.find(selections, val) ~= nil) or (selections == val)
                end

                local createOption, refreshOptions
                local optionConnections = {} -- Store option-specific connections

                createOption = function(value)
                    local opt = Instance.new("TextButton")
                    opt.Name = "Option_"..tostring(value)
                    opt.BackgroundColor3 = Color3.fromRGB(28,28,36)
                    opt.BackgroundTransparency = isSelected(value) and 0.5 or 1
                    opt.Size = UDim2.new(1, 0, 0, isMobileLayout and 26 or 30)
                    opt.Font = Enum.Font.GothamMedium
                    opt.Text = tostring(value)
                    opt.TextColor3 = isSelected(value) and _G.Accent or _G.TextPrimary
                    opt.TextSize = isMobileLayout and 11 or 12
                    opt.TextXAlignment = Enum.TextXAlignment.Left
                    opt.AutoButtonColor = false
                    opt.ZIndex = 5
                    opt.Parent = DropScroll

                    local OPC = Instance.new("UICorner"); OPC.CornerRadius = UDim.new(0,5); OPC.Parent = opt
                    local OPP = Instance.new("UIPadding"); OPP.PaddingLeft = UDim.new(0,10); OPP.Parent = opt

                    if isSelected(value) then
                        local ck = Instance.new("TextLabel")
                        ck.Name = "Checkmark"; ck.BackgroundTransparency = 1
                        ck.Size = UDim2.new(0,20,1,0); ck.Position = UDim2.new(1,-24,0,0)
                        ck.Font = Enum.Font.GothamBold; ck.Text = "✓"
                        ck.TextColor3 = _G.Accent; ck.TextSize = isMobileLayout and 11 or 13
                        ck.ZIndex = 6; ck.Parent = opt
                    end

                    -- Store option connections
                    local optConns = {}
                    table.insert(optConns, opt.MouseEnter:Connect(function()
                        if not isSelected(value) then 
                            TweenService:Create(opt, TweenInfo.new(0.12), {BackgroundTransparency = 0.7, TextColor3 = _G.Accent}):Play() 
                        end
                    end))
                    table.insert(optConns, opt.MouseLeave:Connect(function()
                        if not isSelected(value) then 
                            TweenService:Create(opt, TweenInfo.new(0.12), {BackgroundTransparency = 1, TextColor3 = _G.TextPrimary}):Play() 
                        end
                    end))
                    table.insert(optConns, opt.MouseButton1Click:Connect(function()
                        if isMulti then
                            local idx = table.find(selections, value)
                            if idx then table.remove(selections, idx) else table.insert(selections, value) end
                            callback(table.clone(selections))
                        else
                            selections = value; callback(selections)
                            isDropped = false
                            DDFrame:TweenSize(UDim2.new(0,elementWidth,0,isMobileLayout and 34 or 38), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                            TweenService:Create(ChevronImg, TweenInfo.new(0.2), {Rotation = 0}):Play()
                            SearchCont.Visible = false; OptionsCont.Visible = false
                        end
                        refreshOptions(SearchBox.Text)
                        updateTitle()
                    end))

                    itemMap[value] = {Button = opt, Value = value, Connections = optConns}
                end

                local function clearOptions()
                    -- Disconnect all option connections
                    for _, item in pairs(itemMap) do
                        if item.Connections then
                            for _, conn in ipairs(item.Connections) do
                                conn:Disconnect()
                            end
                        end
                    end
                    itemMap = {}
                    
                    for _, c in ipairs(DropScroll:GetChildren()) do
                        if c.Name:find("Option_") or c.Name:find("Sep_") then 
                            c:Destroy() 
                        end
                    end
                end

                refreshOptions = function(filter)
                    clearOptions()
                    filter = filter and string.lower(tostring(filter)) or ""
                    local sel, unsel = {}, {}
                    for _, opt in ipairs(allOptions) do
                        local s = tostring(opt)
                        if filter == "" or string.lower(s):find(filter,1,true) then
                            if isSelected(opt) then table.insert(sel, opt) else table.insert(unsel, opt) end
                        end
                    end
                    if #sel > 0 then
                        local sepLabel = Instance.new("TextLabel"); sepLabel.Name = "Sep_Sel"
                        sepLabel.BackgroundTransparency = 1; sepLabel.Size = UDim2.new(1,-16,0,18)
                        sepLabel.Font = Enum.Font.GothamBold; sepLabel.Text = "SELECTED ("..#sel..")"
                        sepLabel.TextColor3 = _G.Accent; sepLabel.TextSize = isMobileLayout and 9 or 10
                        sepLabel.TextXAlignment = Enum.TextXAlignment.Left; sepLabel.ZIndex = 5; sepLabel.Parent = DropScroll
                    end
                    for _, o in ipairs(sel) do createOption(o) end
                    if #sel > 0 and #unsel > 0 then
                        local sep2 = Instance.new("TextLabel"); sep2.Name = "Sep_All"
                        sep2.BackgroundTransparency = 1; sep2.Size = UDim2.new(1,-16,0,18)
                        sep2.Font = Enum.Font.GothamBold; sep2.Text = "ALL"
                        sep2.TextColor3 = _G.TextSecondary; sep2.TextSize = isMobileLayout and 9 or 10
                        sep2.TextXAlignment = Enum.TextXAlignment.Left; sep2.ZIndex = 5; sep2.Parent = DropScroll
                    end
                    for _, o in ipairs(unsel) do createOption(o) end

                    task.wait(0.01)
                    local itemH = isMobileLayout and 28 or 33
                    local separatorH = 18
                    local totalItems = #sel + #unsel
                    local totalSeparators = 0

                    if #sel > 0 then totalSeparators = totalSeparators + 1 end
                    if #sel > 0 and #unsel > 0 then totalSeparators = totalSeparators + 1 end

                    local totalHeight = (totalItems * itemH) + (totalSeparators * separatorH) + 20
                    local maxVisibleHeight = 5 * itemH + (2 * separatorH) + 20
                    local contH = math.min(totalHeight, maxVisibleHeight)

                    OptionsCont.Size = UDim2.new(1, 0, 0, contH)
                    DropScroll.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
                    if isDropped then
                        local ddH = (isMobileLayout and 34 or 38) + (isMobileLayout and 30 or 32) + contH + 4
                        DDFrame:TweenSize(UDim2.new(0,elementWidth,0,ddH), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                    end
                end

                table.insert(connections, SearchBox.Changed:Connect(function(p) 
                    if p == "Text" then refreshOptions(SearchBox.Text) end 
                end))

                table.insert(connections, DropBtn.MouseButton1Click:Connect(function()
                    isDropped = not isDropped
                    if isDropped then
                        SearchCont.Visible = true; OptionsCont.Visible = true
                        TweenService:Create(ChevronImg, TweenInfo.new(0.2), {Rotation = 180}):Play()
                        refreshOptions("")
                        task.delay(0.05, function() if SearchBox and SearchBox.Parent then SearchBox:CaptureFocus() end end)
                    else
                        DDFrame:TweenSize(UDim2.new(0,elementWidth,0,isMobileLayout and 34 or 38), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                        TweenService:Create(ChevronImg, TweenInfo.new(0.2), {Rotation = 0}):Play()
                        SearchCont.Visible = false; OptionsCont.Visible = false
                    end
                end))

                local ibc = UserInputService.InputBegan:Connect(function(input, gp)
                    if gp or input.UserInputType ~= Enum.UserInputType.MouseButton1 or not isDropped then return end
                    local mp = UserInputService:GetMouseLocation()
                    local ap, as = DDFrame.AbsolutePosition, DDFrame.AbsoluteSize
                    if not (mp.X >= ap.X and mp.X <= ap.X+as.X and mp.Y >= ap.Y and mp.Y <= ap.Y+as.Y) then
                        isDropped = false
                        DDFrame:TweenSize(UDim2.new(0,elementWidth,0,isMobileLayout and 34 or 38), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                        TweenService:Create(ChevronImg, TweenInfo.new(0.2), {Rotation = 0}):Play()
                        SearchCont.Visible = false; OptionsCont.Visible = false
                    end
                end)
                
                table.insert(connections, ibc)
                
                local ancestryConn
                ancestryConn = DDFrame.AncestryChanged:Connect(function() 
                    if not DDFrame.Parent then 
                        if ibc then ibc:Disconnect() end
                        if ancestryConn then ancestryConn:Disconnect() end
                    end 
                end)
                table.insert(connections, ancestryConn)

                updateTitle(); refreshOptions("")

                local api = {}
                table.insert(allElements, function()
                    DDFrame.BackgroundColor3 = _G.SurfaceAlt
                    DDS.Color = _G.Border
                    DDTitle.TextColor3 = _G.TextPrimary
                    ChevronImg.ImageColor3 = _G.TextSecondary
                    SearchBox.TextColor3 = _G.TextPrimary
                    SearchBox.PlaceholderColor3 = _G.TextSecondary
                    SCS.Color = _G.Border
                    DropScroll.ScrollBarImageColor3 = _G.Border
                end)
                
                function api:Get() return isMulti and table.clone(selections) or selections end
                function api:Set(val)
                    selections = isMulti and (typeof(val)=="table" and table.clone(val) or {val}) or val
                    updateTitle(); refreshOptions(""); callback(api:Get())
                end
                function api:SetValue(val)
                    return api:Set(val)
                end
                function api:SetValues(values)
                    allOptions = table.clone(values or {})
                    refreshOptions(SearchBox.Text)
                    updateTitle()
                    return api
                end
                function api:SetText(newText)
                    if newText then
                        text = tostring(newText)
                        updateTitle()
                    end
                    return api
                end
                function api:SetVisible(visible)
                    DDFrame.Visible = visible
                    return api
                end
                function api:Add(val) 
                    if not table.find(allOptions,val) then 
                        table.insert(allOptions,val) 
                    end
                    if isDropped then refreshOptions(SearchBox.Text) end 
                end
                function api:Remove(val)
                    local idx = table.find(allOptions,val); 
                    if idx then table.remove(allOptions,idx) end
                    if isMulti then 
                        local si = table.find(selections,val); 
                        if si then table.remove(selections,si) end 
                    elseif selections==val then selections=nil end
                    updateTitle(); 
                    if isDropped then refreshOptions(SearchBox.Text) end; 
                    callback(api:Get())
                end
                function api:Clear() 
                    selections = isMulti and {} or nil; 
                    allOptions = {}; 
                    clearOptions(); 
                    updateTitle(); 
                    callback(api:Get()) 
                end
                function api:GetOptions() return table.clone(allOptions) end
                
                -- NEW DESTROY FUNCTION
                function api:Destroy()
                    -- Disconnect all connections
                    for _, conn in ipairs(connections) do
                        if conn and conn.Disconnect then
                            conn:Disconnect()
                        end
                    end
                    connections = {}
                    
                    -- Clear all option connections
                    clearOptions()
                    
                    -- Destroy the main frame and all children
                    if DDFrame and DDFrame.Parent then
                        DDFrame:Destroy()
                    end
                    
                    -- Clear references
                    itemMap = {}
                    allOptions = {}
                    selections = nil
                    
                    -- Remove from allElements tracking if needed
                    local idx = table.find(allElements, api)
                    if idx then
                        table.remove(allElements, idx)
                    end
                    
                    -- Nullify all references to prevent memory leaks
                    DDFrame = nil
                    DDHeader = nil
                    DDTitle = nil
                    ChevronImg = nil
                    DropBtn = nil
                    SearchCont = nil
                    SearchBox = nil
                    OptionsCont = nil
                    DropScroll = nil
                    DSLL = nil
                    DSPad = nil
                    DDC = nil
                    DDS = nil
                    SCC = nil
                    SCS = nil
                    
                    return true
                end
                
                api.Frame = DDFrame
                return api
            end

            function main:Keybind(text, defaultKey, callback, iconName)
                local currentKey = defaultKey or Enum.KeyCode.RightControl
                local listening = false
                local listenConn = nil
                local isCleared = false
                local iconAsset = GetIcon(iconName)
                local debounce = false  -- Add debounce to prevent multiple rapid triggers

                local KBFrame = Instance.new("Frame")
                KBFrame.Name = "Keybind"
                KBFrame.Parent = MainFramePage
                KBFrame.BackgroundColor3 = _G.SurfaceAlt
                KBFrame.BackgroundTransparency = 0.4
                KBFrame.Size = UDim2.new(0, elementWidth, 0, isMobileLayout and 34 or 38)
                KBFrame.ZIndex = 3

                local KBC = Instance.new("UICorner"); KBC.CornerRadius = UDim.new(0,7); KBC.Parent = KBFrame
                local KBS = Instance.new("UIStroke"); KBS.Color = _G.Border; KBS.Thickness = 1; KBS.Parent = KBFrame

                if iconAsset then
                    local KBimg = Instance.new("ImageLabel")
                    KBimg.BackgroundTransparency = 1
                    KBimg.Position = UDim2.new(0, isMobileLayout and 10 or 12, 0.5, -8)
                    KBimg.Size = UDim2.new(0, 16, 0, 16)
                    KBimg.Image = iconAsset
                    KBimg.ImageColor3 = _G.TextSecondary
                    KBimg.ZIndex = 4
                    KBimg.Parent = KBFrame
                end

                local labelX3 = iconAsset and (isMobileLayout and 32 or 36) or (isMobileLayout and 10 or 12)

                local KBLabel = Instance.new("TextLabel")
                KBLabel.Parent = KBFrame
                KBLabel.BackgroundTransparency = 1
                KBLabel.Position = UDim2.new(0, labelX3, 0, 0)
                KBLabel.Size = UDim2.new(0, isMobileLayout and 130 or 150, 1, 0)
                KBLabel.Font = Enum.Font.GothamMedium
                KBLabel.Text = text
                KBLabel.TextColor3 = _G.TextPrimary
                KBLabel.TextSize = isMobileLayout and 12 or 13
                KBLabel.TextXAlignment = Enum.TextXAlignment.Left
                KBLabel.ZIndex = 4

                local KeyPillCont = Instance.new("Frame")
                KeyPillCont.Parent = KBFrame
                KeyPillCont.BackgroundColor3 = Color3.fromRGB(12,12,16)
                KeyPillCont.BackgroundTransparency = 0.2
                KeyPillCont.Position = UDim2.new(1, isMobileLayout and -112 or -128, 0.5, isMobileLayout and -12 or -13)
                KeyPillCont.Size = UDim2.new(0, isMobileLayout and 70 or 80, 0, isMobileLayout and 24 or 26)
                KeyPillCont.ZIndex = 5

                local KPCC = Instance.new("UICorner"); KPCC.CornerRadius = UDim.new(0,5); KPCC.Parent = KeyPillCont
                local KPCS = Instance.new("UIStroke"); KPCS.Color = _G.Border; KPCS.Thickness = 1; KPCS.Parent = KeyPillCont

                local KeyBtn = Instance.new("TextButton")
                KeyBtn.BackgroundTransparency = 1
                KeyBtn.Size = UDim2.new(1, 0, 1, 0)
                KeyBtn.Font = Enum.Font.GothamMedium
                KeyBtn.Text = currentKey.Name
                KeyBtn.TextColor3 = _G.TextPrimary
                KeyBtn.TextSize = isMobileLayout and 10 or 11
                KeyBtn.ZIndex = 6
                KeyBtn.Parent = KeyPillCont

                local PulseDot = Instance.new("Frame")
                PulseDot.BackgroundColor3 = _G.Accent
                PulseDot.BackgroundTransparency = 1
                PulseDot.Size = UDim2.new(0, 6, 0, 6)
                PulseDot.Position = UDim2.new(0, 4, 0.5, -3)
                PulseDot.ZIndex = 7
                PulseDot.Parent = KeyPillCont
                local PDC = Instance.new("UICorner"); PDC.CornerRadius = UDim.new(1,0); PDC.Parent = PulseDot

                local ClearBtn = Instance.new("TextButton")
                ClearBtn.Parent = KBFrame
                ClearBtn.BackgroundColor3 = Color3.fromRGB(12,12,16)
                ClearBtn.BackgroundTransparency = 0.2
                ClearBtn.Position = UDim2.new(1, isMobileLayout and -36 or -40, 0.5, isMobileLayout and -12 or -13)
                ClearBtn.Size = UDim2.new(0, isMobileLayout and 26 or 30, 0, isMobileLayout and 24 or 26)
                ClearBtn.Font = Enum.Font.GothamBold
                ClearBtn.Text = "×"
                ClearBtn.TextColor3 = _G.TextSecondary
                ClearBtn.TextSize = isMobileLayout and 14 or 16
                ClearBtn.AutoButtonColor = false
                ClearBtn.ZIndex = 5

                local ClearBtnC = Instance.new("UICorner"); ClearBtnC.CornerRadius = UDim.new(0,5); ClearBtnC.Parent = ClearBtn
                local ClearBtnS = Instance.new("UIStroke"); ClearBtnS.Color = _G.Border; ClearBtnS.Thickness = 1; ClearBtnS.Parent = ClearBtn

                local pulseConn
                local pulseTween1, pulseTween2
                
                local function StartPulse()
                    if pulseConn then pulseConn:Disconnect() end
                    if pulseTween1 then pulseTween1:Cancel() end
                    if pulseTween2 then pulseTween2:Cancel() end
                    
                    pulseConn = RunService.RenderStepped:Connect(function()
                        pulseTween1 = TweenService:Create(PulseDot, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            BackgroundTransparency = 0.2, 
                            Size = UDim2.new(0, 9, 0, 9), 
                            Position = UDim2.new(0, 3, 0.5, -4.5)
                        })
                        pulseTween1:Play()
                        pulseTween1.Completed:Connect(function()
                            pulseTween2 = TweenService:Create(PulseDot, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(0, 6, 0, 6), 
                                Position = UDim2.new(0, 4, 0.5, -3)
                            })
                            pulseTween2:Play()
                        end)
                    end)
                end
                
                local function StopPulse()
                    if pulseConn then pulseConn:Disconnect(); pulseConn = nil end
                    if pulseTween1 then pulseTween1:Cancel() end
                    if pulseTween2 then pulseTween2:Cancel() end
                    PulseDot.BackgroundTransparency = 1
                    PulseDot.Size = UDim2.new(0, 6, 0, 6)
                    PulseDot.Position = UDim2.new(0, 4, 0.5, -3)
                end

                local function UpdateDisplay()
                    if listening then
                        KeyBtn.Text = "..."
                        KeyBtn.TextColor3 = _G.Accent
                        TweenService:Create(KPCS, TweenInfo.new(0.15), {Color = _G.Accent}):Play()
                        TweenService:Create(KBS, TweenInfo.new(0.15), {Color = _G.Accent}):Play()
                        PulseDot.BackgroundTransparency = 0.5
                        StartPulse()
                    else
                        KeyBtn.Text = isCleared and "None" or currentKey.Name
                        KeyBtn.TextColor3 = isCleared and _G.TextSecondary or _G.TextPrimary
                        TweenService:Create(KPCS, TweenInfo.new(0.15), {Color = _G.Border}):Play()
                        TweenService:Create(KBS, TweenInfo.new(0.15), {Color = _G.Border}):Play()
                        StopPulse()
                    end
                end

                -- Global input handler for detecting the keybind outside the UI
                local globalConn = nil
                
                local function SetupGlobalListener()
                    if globalConn then globalConn:Disconnect() end
                    
                    globalConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                        -- Don't trigger if typing in a textbox or if UI is processing the input
                        if gameProcessed then return end
                        
                        -- Check if the key matches and not cleared
                        if not isCleared and currentKey and input.KeyCode == currentKey then
                            -- Debounce to prevent rapid triggering
                            if debounce then return end
                            debounce = true
                            
                            -- Call the callback
                            pcall(callback, currentKey)
                            
                            -- Visual feedback
                            TweenService:Create(KeyPillCont, TweenInfo.new(0.1), {
                                BackgroundColor3 = _G.Accent,
                                BackgroundTransparency = 0.5
                            }):Play()
                            task.wait(0.1)
                            TweenService:Create(KeyPillCont, TweenInfo.new(0.2), {
                                BackgroundColor3 = Color3.fromRGB(12,12,16),
                                BackgroundTransparency = 0.2
                            }):Play()
                            
                            -- Reset debounce after delay
                            task.delay(0.2, function()
                                debounce = false
                            end)
                        end
                    end)
                end
                
                local function StopListening()
                    if not listening then return end
                    listening = false
                    if listenConn then 
                        listenConn:Disconnect() 
                        listenConn = nil 
                    end
                    UpdateDisplay()
                end

                local function StartListening()
                    if listening then 
                        StopListening()
                        return 
                    end
                    listening = true
                    UpdateDisplay()
                    
                    listenConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                        if not listening or gameProcessed then return end
                        
                        -- Handle keyboard keys
                        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode ~= Enum.KeyCode.Unknown then
                            -- Don't allow modifier keys alone
                            local forbiddenKeys = {
                                Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift,
                                Enum.KeyCode.LeftControl, Enum.KeyCode.RightControl,
                                Enum.KeyCode.LeftAlt, Enum.KeyCode.RightAlt,
                                Enum.KeyCode.CapsLock, Enum.KeyCode.NumLock,
                                Enum.KeyCode.ScrollLock, Enum.KeyCode.Insert
                            }
                            
                            local isForbidden = false
                            for _, forbidden in ipairs(forbiddenKeys) do
                                if input.KeyCode == forbidden then
                                    isForbidden = true
                                    break
                                end
                            end
                            
                            if not isForbidden then
                                currentKey = input.KeyCode
                                isCleared = false
                                StopListening()
                                pcall(callback, currentKey)
                                SetupGlobalListener() -- Re-setup global listener with new key
                            end
                        end
                        
                        -- Optional: Handle mouse buttons as keybinds
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            currentKey = Enum.KeyCode[input.UserInputType.Name]
                            isCleared = false
                            StopListening()
                            pcall(callback, currentKey)
                            SetupGlobalListener()
                        end
                    end)
                    
                    -- Auto-stop after 5 seconds of inactivity
                    task.delay(5, function() 
                        if listening then 
                            StopListening()
                        end 
                    end)
                end

                KeyBtn.MouseButton1Click:Connect(StartListening)
                
                KeyPillCont.MouseEnter:Connect(function()
                    if not listening then 
                        TweenService:Create(KPCS, TweenInfo.new(0.12), {Color = _G.Accent}):Play()
                    end
                end)
                
                KeyPillCont.MouseLeave:Connect(function()
                    if not listening then 
                        TweenService:Create(KPCS, TweenInfo.new(0.12), {Color = _G.Border}):Play()
                    end
                end)

                ClearBtn.MouseEnter:Connect(function()
                    TweenService:Create(ClearBtn, TweenInfo.new(0.12), {
                        BackgroundColor3 = _G.Danger or Color3.fromRGB(239,68,68), 
                        BackgroundTransparency = 0.3
                    }):Play()
                    ClearBtn.TextColor3 = Color3.new(1,1,1)
                end)
                
                ClearBtn.MouseLeave:Connect(function()
                    TweenService:Create(ClearBtn, TweenInfo.new(0.12), {
                        BackgroundColor3 = Color3.fromRGB(12,12,16), 
                        BackgroundTransparency = 0.2
                    }):Play()
                    ClearBtn.TextColor3 = _G.TextSecondary
                end)
                
                ClearBtn.MouseButton1Click:Connect(function()
                    isCleared = true
                    StopListening()
                    UpdateDisplay()
                    pcall(callback, nil)
                    -- Remove global listener when cleared
                    if globalConn then 
                        globalConn:Disconnect()
                        globalConn = nil
                    end
                end)

                KBFrame.AncestryChanged:Connect(function()
                    if not KBFrame.Parent then 
                        StopListening()
                        StopPulse()
                        if globalConn then 
                            globalConn:Disconnect()
                            globalConn = nil
                        end
                    end
                end)

                -- Setup initial global listener
                SetupGlobalListener()
                UpdateDisplay()

                local KBObj = {}
                
                table.insert(allElements, function()
                    KBFrame.BackgroundColor3 = _G.SurfaceAlt
                    KBS.Color = _G.Border
                    KBLabel.TextColor3 = _G.TextPrimary
                    if not listening then
                        KeyBtn.TextColor3 = isCleared and _G.TextSecondary or _G.TextPrimary
                    end
                    KPCS.Color = _G.Border
                    ClearBtn.TextColor3 = _G.TextSecondary
                    ClearBtnS.Color = _G.Border
                    PulseDot.BackgroundColor3 = _G.Accent
                end)
                
                function KBObj:Get() 
                    return isCleared and nil or currentKey 
                end
                
                function KBObj:Set(key)
                    isCleared = (key == nil)
                    if key then 
                        currentKey = key 
                    end
                    StopListening()
                    UpdateDisplay()
                    pcall(callback, self:Get())
                    SetupGlobalListener()
                    return KBObj
                end
                
                function KBObj:SetValue(key)
                    return KBObj:Set(key)
                end
                
                function KBObj:SetText(t) 
                    KBLabel.Text = t 
                    return KBObj
                end
                
                function KBObj:SetVisible(visible)
                    KBFrame.Visible = visible
                    return KBObj
                end
                
                function KBObj:Clear() 
                    isCleared = true
                    StopListening()
                    UpdateDisplay()
                    pcall(callback, nil)
                    if globalConn then 
                        globalConn:Disconnect()
                        globalConn = nil
                    end
                    return KBObj
                end
                
                function KBObj:IsListening() 
                    return listening 
                end
                
                function KBObj:Destroy()
                    if globalConn then globalConn:Disconnect() end
                    if listenConn then listenConn:Disconnect() end
                    StopPulse()
                    KBFrame:Destroy()
                end
                
                KBObj.Frame = KBFrame
                return KBObj
            end


            
            function main:ColorPicker(text, defaultColor, callback, iconName)
                local currentColor = defaultColor or Color3.fromRGB(255,255,255)
                local expanded = false
                local iconAsset = GetIcon(iconName)

                local CPFrame = Instance.new("Frame")
                CPFrame.Name = "ColorPicker"
                CPFrame.Parent = MainFramePage
                CPFrame.BackgroundColor3 = _G.SurfaceAlt
                CPFrame.BackgroundTransparency = 0.4
                CPFrame.Size = UDim2.new(0, elementWidth, 0, isMobileLayout and 34 or 38)
                CPFrame.ZIndex = 3

                local CPC = Instance.new("UICorner"); CPC.CornerRadius = UDim.new(0,7); CPC.Parent = CPFrame
                local CPS = Instance.new("UIStroke"); CPS.Color = _G.Border; CPS.Thickness = 1; CPS.Parent = CPFrame

                if iconAsset then
                    local CPimg = Instance.new("ImageLabel")
                    CPimg.BackgroundTransparency = 1
                    CPimg.Position = UDim2.new(0, isMobileLayout and 10 or 12, 0.5, -8)
                    CPimg.Size = UDim2.new(0, 16, 0, 16)
                    CPimg.Image = iconAsset
                    CPimg.ImageColor3 = _G.TextSecondary
                    CPimg.ZIndex = 4
                    CPimg.Parent = CPFrame
                end

                local labelX4 = iconAsset and (isMobileLayout and 32 or 36) or (isMobileLayout and 10 or 12)

                local CPLabel = Instance.new("TextLabel")
                CPLabel.Parent = CPFrame
                CPLabel.BackgroundTransparency = 1
                CPLabel.Position = UDim2.new(0, labelX4, 0, 0)
                CPLabel.Size = UDim2.new(0, isMobileLayout and 140 or 170, 1, 0)
                CPLabel.Font = Enum.Font.GothamMedium
                CPLabel.Text = text
                CPLabel.TextColor3 = _G.TextPrimary
                CPLabel.TextSize = isMobileLayout and 12 or 13
                CPLabel.TextXAlignment = Enum.TextXAlignment.Left
                CPLabel.ZIndex = 4

                local Swatch = Instance.new("Frame")
                Swatch.Parent = CPFrame
                Swatch.BackgroundColor3 = currentColor
                Swatch.Position = UDim2.new(1, isMobileLayout and -90 or -100, 0.5, isMobileLayout and -9 or -10)
                Swatch.Size = isMobileLayout and UDim2.new(0,32,0,18) or UDim2.new(0,38,0,20)
                Swatch.ZIndex = 5
                local SwatchC = Instance.new("UICorner"); SwatchC.CornerRadius = UDim.new(0,5); SwatchC.Parent = Swatch
                local SwatchS = Instance.new("UIStroke"); SwatchS.Color = _G.Border; SwatchS.Thickness = 1; SwatchS.Parent = Swatch
                
                
                local ValueText = Instance.new("TextLabel")
                ValueText.Parent = CPFrame
                ValueText.BackgroundTransparency = 1
                ValueText.Position = UDim2.new(1, isMobileLayout and -52 or -58, 0, 0)
                ValueText.Size = UDim2.new(0, isMobileLayout and 40 or 48, 1, 0)
                ValueText.Font = Enum.Font.GothamMedium
                ValueText.Text = string.format("#%02x%02x%02x", currentColor.R*255, currentColor.G*255, currentColor.B*255)
                ValueText.TextColor3 = _G.TextSecondary
                ValueText.TextSize = isMobileLayout and 9 or 10
                ValueText.TextXAlignment = Enum.TextXAlignment.Right
                ValueText.ZIndex = 4

                local PickerPop = Instance.new("Frame")
                PickerPop.Parent = ShadcnUI
                PickerPop.BackgroundColor3 = _G.SurfaceAlt
                PickerPop.BorderSizePixel = 0
                PickerPop.Size = UDim2.new(0, 260, 0, 220)
                PickerPop.Visible = false
                PickerPop.ZIndex = 1000
                PickerPop.ClipsDescendants = true

                local PPC = Instance.new("UICorner"); PPC.CornerRadius = UDim.new(0,9); PPC.Parent = PickerPop
                local PPS = Instance.new("UIStroke"); PPS.Color = _G.Border; PPS.Thickness = 1; PPS.Parent = PickerPop

                
                local SVPicker = Instance.new("Frame")
                SVPicker.Parent = PickerPop
                SVPicker.BackgroundColor3 = Color3.fromHSV(currentColor:ToHSV(),1,1)
                SVPicker.Position = UDim2.new(0, 10, 0, 10)
                SVPicker.Size = UDim2.new(1, -65, 0, 140)
                SVPicker.ZIndex = 1001
                local SVPC = Instance.new("UICorner"); SVPC.CornerRadius = UDim.new(0,5); SVPC.Parent = SVPicker

                local WL = Instance.new("Frame"); WL.Parent = SVPicker; WL.BackgroundColor3 = Color3.new(1,1,1); WL.Size = UDim2.new(1,0,1,0); WL.ZIndex = 1002
                local WG = Instance.new("UIGradient"); WG.Color = ColorSequence.new(Color3.new(1,1,1)); WG.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}); WG.Parent = WL
                local BL = Instance.new("Frame"); BL.Parent = SVPicker; BL.BackgroundColor3 = Color3.new(0,0,0); BL.Size = UDim2.new(1,0,1,0); BL.ZIndex = 1003
                local BG = Instance.new("UIGradient"); BG.Color = ColorSequence.new(Color3.new(0,0,0)); BG.Rotation = 90; BG.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)}); BG.Parent = BL

                local SVCursor = Instance.new("Frame")
                SVCursor.Parent = SVPicker; SVCursor.BackgroundTransparency = 1
                SVCursor.AnchorPoint = Vector2.new(0.5,0.5)
                SVCursor.Size = UDim2.new(0,10,0,10); SVCursor.ZIndex = 1004
                local SVCC = Instance.new("UICorner"); SVCC.CornerRadius = UDim.new(1,0); SVCC.Parent = SVCursor
                local SVCS = Instance.new("UIStroke"); SVCS.Thickness = 2; SVCS.Color = Color3.new(1,1,1); SVCS.Parent = SVCursor

                
                local HueSlider = Instance.new("Frame")
                HueSlider.Parent = PickerPop
                HueSlider.Position = UDim2.new(1,-52,0,10)
                HueSlider.Size = UDim2.new(0,28,0,140)
                HueSlider.ZIndex = 1001
                local HSC = Instance.new("UICorner"); HSC.CornerRadius = UDim.new(0,5); HSC.Parent = HueSlider
                local HG = Instance.new("UIGradient"); HG.Rotation = 90
                HG.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0,Color3.fromHSV(0,1,1)),
                    ColorSequenceKeypoint.new(0.167,Color3.fromHSV(0.167,1,1)),
                    ColorSequenceKeypoint.new(0.333,Color3.fromHSV(0.333,1,1)),
                    ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),
                    ColorSequenceKeypoint.new(0.667,Color3.fromHSV(0.667,1,1)),
                    ColorSequenceKeypoint.new(0.833,Color3.fromHSV(0.833,1,1)),
                    ColorSequenceKeypoint.new(1,Color3.fromHSV(1,1,1)),
                }); HG.Parent = HueSlider

                local HueCursor = Instance.new("Frame")
                HueCursor.Parent = HueSlider
                HueCursor.BackgroundColor3 = Color3.new(1,1,1)
                HueCursor.AnchorPoint = Vector2.new(0.5,0.5)
                HueCursor.Size = UDim2.new(0,14,0,6)
                HueCursor.ZIndex = 1002
                local HCC = Instance.new("UICorner"); HCC.CornerRadius = UDim.new(0,3); HCC.Parent = HueCursor
                local HCS = Instance.new("UIStroke"); HCS.Thickness = 1; HCS.Color = Color3.fromRGB(20,20,20); HCS.Parent = HueCursor

                
                local InputFrame = Instance.new("Frame")
                InputFrame.Parent = PickerPop
                InputFrame.BackgroundColor3 = _G.Surface
                InputFrame.BackgroundTransparency = 0.5
                InputFrame.Position = UDim2.new(0, 10, 1, -48)
                InputFrame.Size = UDim2.new(1, -20, 0, 38)
                InputFrame.ZIndex = 1001
                local IFC = Instance.new("UICorner"); IFC.CornerRadius = UDim.new(0,5); IFC.Parent = InputFrame
                
                local HexInput = Instance.new("TextBox")
                HexInput.Parent = InputFrame
                HexInput.BackgroundColor3 = _G.SurfaceAlt
                HexInput.Position = UDim2.new(0, 5, 0, 5)
                HexInput.Size = UDim2.new(0, 80, 0, 28)
                HexInput.Font = Enum.Font.GothamMedium
                HexInput.PlaceholderText = "#RRGGBB"
                HexInput.Text = string.format("#%02x%02x%02x", currentColor.R*255, currentColor.G*255, currentColor.B*255)
                HexInput.TextColor3 = _G.TextPrimary
                HexInput.TextSize = 11
                HexInput.ZIndex = 1002
                local HIC = Instance.new("UICorner"); HIC.CornerRadius = UDim.new(0,4); HIC.Parent = HexInput
                
                local RGBInputs = {}
                local rgbLabels = {"R", "G", "B"}

                local startX = 102      
                local spacing = 45     

                for i, label in ipairs(rgbLabels) do
                    local frame = Instance.new("Frame")
                    frame.Parent = InputFrame
                    frame.BackgroundTransparency = 1
                    frame.Position = UDim2.new(0, startX + (i-1)*spacing, 0, 7)
                    frame.Size = UDim2.new(0, 42, 0, 22) 

                    local lbl = Instance.new("TextLabel")
                    lbl.Parent = frame
                    lbl.BackgroundTransparency = 1
                    lbl.Size = UDim2.new(0, 10, 1, 0)
                    lbl.Font = Enum.Font.GothamBold
                    lbl.Text = label
                    lbl.TextColor3 = _G.Accent
                    lbl.TextSize = 9 
                    lbl.TextXAlignment = Enum.TextXAlignment.Left

                    local input = Instance.new("TextBox")
                    input.Parent = frame
                    input.BackgroundColor3 = _G.SurfaceAlt
                    input.Position = UDim2.new(0, 12, 0, 0) 
                    input.Size = UDim2.new(1, -12, 1, 0)
                    input.Font = Enum.Font.GothamMedium
                    input.PlaceholderText = "255"
                    input.Text = tostring(math.floor(
                        (i==1 and currentColor.R or i==2 and currentColor.G or currentColor.B)*255
                    ))
                    input.TextColor3 = _G.TextPrimary
                    input.TextSize = 9 

                    local IC = Instance.new("UICorner")
                    IC.CornerRadius = UDim.new(0,3)
                    IC.Parent = input

                    RGBInputs[label] = input
                end

                local function RGBToHex(r,g,b)
                    return string.format("#%02x%02x%02x", r, g, b)
                end
                
                local function HexToRGB(hex)
                    hex = hex:gsub("#", "")
                    local r = tonumber(hex:sub(1,2), 16) or 0
                    local g = tonumber(hex:sub(3,4), 16) or 0
                    local b = tonumber(hex:sub(5,6), 16) or 0
                    return r, g, b
                end
                
                local function UpdateColorFromRGB(r,g,b)
                    r = math.clamp(r, 0, 255)
                    g = math.clamp(g, 0, 255)
                    b = math.clamp(b, 0, 255)
                    currentColor = Color3.fromRGB(r, g, b)
                    local h, s, v = currentColor:ToHSV()
                    Swatch.BackgroundColor3 = currentColor
                    SVPicker.BackgroundColor3 = Color3.fromHSV(h,1,1)
                    
                    SVCursor.Position = UDim2.new(s,0,1-v,0)
                    HueCursor.Position = UDim2.new(0.5,0,h,0)
                    ValueText.Text = RGBToHex(r,g,b)
                    HexInput.Text = RGBToHex(r,g,b)
                    RGBInputs["R"].Text = tostring(r)
                    RGBInputs["G"].Text = tostring(g)
                    RGBInputs["B"].Text = tostring(b)
                    pcall(callback, currentColor)
                end
                
                local function UpdateColorFromHSV(h,s,v)
                    currentColor = Color3.fromHSV(h,s,v)
                    local r,g,b = currentColor.R*255, currentColor.G*255, currentColor.B*255
                    Swatch.BackgroundColor3 = currentColor
                    ValueText.Text = RGBToHex(r,g,b)
                    HexInput.Text = RGBToHex(r,g,b)
                    RGBInputs["R"].Text = tostring(math.floor(r))
                    RGBInputs["G"].Text = tostring(math.floor(g))
                    RGBInputs["B"].Text = tostring(math.floor(b))
                    pcall(callback, currentColor)
                end
                
                
                do
                    local h, s, v = currentColor:ToHSV()

                    
                    SVPicker.BackgroundColor3 = Color3.fromHSV(h, 1, 1)

                    
                    SVCursor.Position = UDim2.new(s, 0, 1 - v, 0)
                    HueCursor.Position = UDim2.new(0.5, 0, h, 0)

                    
                    local r, g, b = currentColor.R * 255, currentColor.G * 255, currentColor.B * 255
                    ValueText.Text = string.format("#%02x%02x%02x", r, g, b)
                    HexInput.Text = ValueText.Text

                    RGBInputs["R"].Text = tostring(math.floor(r))
                    RGBInputs["G"].Text = tostring(math.floor(g))
                    RGBInputs["B"].Text = tostring(math.floor(b))

                    
                    Swatch.BackgroundColor3 = currentColor

                    
                    pcall(callback, currentColor)
                end
                
                HexInput.FocusLost:Connect(function(enterPressed)
                    local hex = HexInput.Text

                    
                    hex = hex:gsub("%s+", "") 
                    if hex:sub(1,1) ~= "#" then
                        hex = "#" .. hex
                    end

                    
                    if hex:match("^#%x%x%x%x%x%x💰 ") then
                        local r, g, b = HexToRGB(hex)
                        UpdateColorFromRGB(r, g, b)
                    else
                        
                        HexInput.Text = ValueText.Text
                    end
                end)
                
                
                for label, input in pairs(RGBInputs) do
                    input.FocusLost:Connect(function()
                        local val = tonumber(input.Text)
                        if val then
                            local r = tonumber(RGBInputs["R"].Text) or 0
                            local g = tonumber(RGBInputs["G"].Text) or 0
                            local b = tonumber(RGBInputs["B"].Text) or 0
                            UpdateColorFromRGB(r,g,b)
                        else
                            local r,g,b = currentColor.R*255, currentColor.G*255, currentColor.B*255
                            RGBInputs["R"].Text = tostring(math.floor(r))
                            RGBInputs["G"].Text = tostring(math.floor(g))
                            RGBInputs["B"].Text = tostring(math.floor(b))
                        end
                    end)
                end
                
                local function UpdateColor()
                    local h = HueCursor.Position.Y.Scale
                    local s = SVCursor.Position.X.Scale
                    local v = 1 - SVCursor.Position.Y.Scale
                    UpdateColorFromHSV(h,s,v)
                end

                local svDrag, hueDrag = false, false

                SVPicker.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        svDrag = true
                        local sz, ps = SVPicker.AbsoluteSize, SVPicker.AbsolutePosition
                        local s = math.clamp((input.Position.X-ps.X)/sz.X,0,1)
                        local v = math.clamp((input.Position.Y-ps.Y)/sz.Y,0,1)
                        SVCursor.Position = UDim2.new(s,0,v,0)
                        UpdateColor()
                    end
                end)
                
                HueSlider.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        hueDrag = true
                        local sz, ps = HueSlider.AbsoluteSize, HueSlider.AbsolutePosition
                        local h = math.clamp((input.Position.Y-ps.Y)/sz.Y,0,1)
                        HueCursor.Position = UDim2.new(0.5,0,h,0)
                        SVPicker.BackgroundColor3 = Color3.fromHSV(h,1,1)
                        UpdateColor()
                    end
                end)
                
                UserInputService.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        if svDrag then
                            local sz, ps = SVPicker.AbsoluteSize, SVPicker.AbsolutePosition
                            local s = math.clamp((input.Position.X-ps.X)/sz.X,0,1)
                            local v = math.clamp((input.Position.Y-ps.Y)/sz.Y,0,1)
                            SVCursor.Position = UDim2.new(s,0,v,0)
                            UpdateColor()
                        elseif hueDrag then
                            local sz, ps = HueSlider.AbsoluteSize, HueSlider.AbsolutePosition
                            local h = math.clamp((input.Position.Y-ps.Y)/sz.Y,0,1)
                            HueCursor.Position = UDim2.new(0.5,0,h,0)
                            SVPicker.BackgroundColor3 = Color3.fromHSV(h,1,1)
                            UpdateColor()
                        end
                    end
                end)
                
                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then 
                        svDrag = false
                        hueDrag = false
                    end
                end)

                local function ClosePicker()
                    PickerPop.Visible = false
                    expanded = false
                    if _G.ActivePicker then _G.ActivePicker = nil end
                end
                
                local function OpenPicker()
                    if _G.ActivePicker then _G.ActivePicker() end
                    _G.ActivePicker = ClosePicker
                    local bp = Swatch.AbsolutePosition
                    local vp = workspace.CurrentCamera.ViewportSize
                    local tx = bp.X - 260
                    local ty = bp.Y - 10
                    if ty + 220 > vp.Y then ty = vp.Y - 230 end
                    if tx < 0 then tx = bp.X + 46 end
                    if tx + 260 > vp.X then tx = vp.X - 270 end
                    PickerPop.Position = UDim2.new(0,tx,0,ty)
                    PickerPop.Visible = true
                    expanded = true
                end

                Swatch.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if expanded then ClosePicker() else OpenPicker() end
                    end
                end)
                
                UserInputService.InputBegan:Connect(function(input, gp)
                    if gp or not expanded or input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                    local mp = UserInputService:GetMouseLocation()
                    local pp, ps = PickerPop.AbsolutePosition, PickerPop.AbsoluteSize
                    local sp2, ss = Swatch.AbsolutePosition, Swatch.AbsoluteSize
                    local inPicker = mp.X>=pp.X and mp.X<=pp.X+ps.X and mp.Y>=pp.Y and mp.Y<=pp.Y+ps.Y
                    local inSwatch = mp.X>=sp2.X and mp.X<=sp2.X+ss.X and mp.Y>=sp2.Y and mp.Y<=sp2.Y+ss.Y
                    if not inPicker and not inSwatch then ClosePicker() end
                end)
                
                CPFrame.AncestryChanged:Connect(function()
                    if not CPFrame.Parent then ClosePicker() end
                end)

                local CPObj = {}
                table.insert(allElements, function()
                    CPFrame.BackgroundColor3 = _G.SurfaceAlt
                    CPS.Color = _G.Border
                    CPLabel.TextColor3 = _G.TextPrimary
                    ValueText.TextColor3 = _G.TextSecondary
                    SwatchS.Color = _G.Border
                    PPS.Color = _G.Border
                    PickerPop.BackgroundColor3 = _G.SurfaceAlt
                end)
                function CPObj:Get() return currentColor end
                function CPObj:Set(color) 
                    currentColor = color
                    local r,g,b = color.R*255, color.G*255, color.B*255
                    Swatch.BackgroundColor3 = color
                    ValueText.Text = RGBToHex(r,g,b)
                    if PickerPop.Visible then
                        local h,s,v = color:ToHSV()
                        SVPicker.BackgroundColor3 = Color3.fromHSV(h,1,1)
                        SVCursor.Position = UDim2.new(s,0,1-v,0)
                        HueCursor.Position = UDim2.new(0.5,0,h,0)
                        HexInput.Text = RGBToHex(r,g,b)
                        RGBInputs["R"].Text = tostring(math.floor(r))
                        RGBInputs["G"].Text = tostring(math.floor(g))
                        RGBInputs["B"].Text = tostring(math.floor(b))
                    end
                    pcall(callback, color)
                end
                function CPObj:SetText(t) CPLabel.Text = t end
                function CPObj:SetVisible(visible)
                    CPFrame.Visible = visible
                    return CPObj
                end
                function CPObj:GetHex() 
                    local r,g,b = currentColor.R*255, currentColor.G*255, currentColor.B*255
                    return string.format("#%02x%02x%02x", r, g, b)
                end
                function CPObj:SetHex(hex)
                    if hex:match("^#?[%da-fA-F]{6}💰 ") then
                        local r,g,b = HexToRGB(hex)
                        self:Set(Color3.fromRGB(r,g,b))
                    end
                end
                CPObj.Frame = CPFrame
                return CPObj
            end
            function main:Label(text)
                local Lbl = Instance.new("TextLabel")
                Lbl.Name = "Label"; Lbl.Parent = MainFramePage
                Lbl.BackgroundTransparency = 1
                Lbl.Size = UDim2.new(0, elementWidth, 0, isMobileLayout and 22 or 26)
                Lbl.Font = Enum.Font.GothamMedium
                Lbl.Text = text
                Lbl.TextColor3 = _G.TextSecondary
                Lbl.TextSize = isMobileLayout and 11 or 12
                Lbl.TextXAlignment = Enum.TextXAlignment.Center
                Lbl.ZIndex = 3

                local LblObj = {}
                table.insert(allElements, function()
                    Lbl.TextColor3 = _G.TextSecondary
                end)
                function LblObj:Set(t) Lbl.Text = t end
                function LblObj:SetText(t) Lbl.Text = t return LblObj end
                function LblObj:SetVisible(visible) Lbl.Visible = visible return LblObj end
                function LblObj:Get() return Lbl.Text end
                LblObj.Frame = Lbl
                return LblObj
            end


            function main:Seperator(text)
                local Sep = Instance.new("Frame")
                Sep.Name = "Seperator"; Sep.Parent = MainFramePage
                Sep.BackgroundTransparency = 1
                Sep.Size = UDim2.new(0, elementWidth, 0, isMobileLayout and 18 or 22)
                Sep.ZIndex = 3

                local L1 = Instance.new("Frame")
                L1.BackgroundColor3 = _G.Border; L1.BorderSizePixel = 0
                L1.AnchorPoint = Vector2.new(0,0.5); L1.Position = UDim2.new(0,0,0.5,0)
                L1.Size = UDim2.new(0.4,-8,0,1); L1.Parent = Sep

                local SepLbl = Instance.new("TextLabel")
                SepLbl.BackgroundTransparency = 1
                SepLbl.AnchorPoint = Vector2.new(0.5,0)
                SepLbl.Position = UDim2.new(0.5,0,0,0)
                SepLbl.Size = UDim2.new(0, isMobileLayout and 110 or 150, 1, 0)
                SepLbl.Font = Enum.Font.GothamMedium
                SepLbl.RichText = true
                SepLbl.Text = gradient(text or "", gradientText)
                SepLbl.TextColor3 = _G.TextSecondary
                SepLbl.TextSize = isMobileLayout and 9 or 11
                SepLbl.ZIndex = 3
                SepLbl.Parent = Sep

                local L2 = Instance.new("Frame")
                L2.BackgroundColor3 = _G.Border; L2.BorderSizePixel = 0
                L2.AnchorPoint = Vector2.new(1,0.5); L2.Position = UDim2.new(1,0,0.5,0)
                L2.Size = UDim2.new(0.4,-8,0,1); L2.Parent = Sep
            end

            function main:RichParagraph(text, options, color)
                options = options or {}
                local textSize = options.TextSize or (isMobileLayout and 11 or 13)
                local lineHeight = options.LineHeight or 1.3
                local textColor = options.TextColor or _G.TextPrimary
                local backgroundColor = options.BackgroundColor or _G.SurfaceAlt
                local backgroundTransparency = options.BackgroundTransparency or 0.4
                local richText = options.RichText or true
                local maxHeight = options.MaxHeight or (isMobileLayout and 200 or 280)

                local Paragraph = Instance.new("Frame")
                Paragraph.Name = "RichParagraph"
                Paragraph.Parent = MainFramePage
                Paragraph.BackgroundColor3 = backgroundColor
                Paragraph.BackgroundTransparency = backgroundTransparency
                Paragraph.Size = UDim2.new(0, elementWidth, 0, 0)
                Paragraph.ClipsDescendants = true
                Paragraph.ZIndex = 3

                -- 🔥 Color/Gradient handling
                if color then
                    if typeof(color) == "Color3" then
                        Paragraph.BackgroundColor3 = color
                        
                    elseif typeof(color) == "table" then
                        Paragraph.BackgroundColor3 = Color3.new(1, 1, 1)
                        Paragraph.BackgroundTransparency = 0
                        
                        local Gradient = Instance.new("UIGradient")
                        Gradient.Parent = Paragraph
                        Gradient.Rotation = options.GradientRotation or 90
                        
                        local keypoints = {}
                        for i, col in ipairs(color) do
                            local alpha = (#color > 1) and ((i - 1) / (#color - 1)) or 0
                            table.insert(keypoints, ColorSequenceKeypoint.new(alpha, col))
                        end
                        Gradient.Color = ColorSequence.new(keypoints)
                        
                    elseif typeof(color) == "ColorSequence" then
                        local Gradient = Instance.new("UIGradient")
                        Gradient.Parent = Paragraph
                        Gradient.Color = color
                        Gradient.Rotation = options.GradientRotation or 90
                        Paragraph.BackgroundTransparency = 0
                    end
                end

                -- Corner and Stroke
                local ParagraphCorner = Instance.new("UICorner")
                ParagraphCorner.CornerRadius = UDim.new(0, 7)
                ParagraphCorner.Parent = Paragraph
                
                local ParagraphStroke = Instance.new("UIStroke")
                ParagraphStroke.Color = _G.Border
                ParagraphStroke.Thickness = 1
                ParagraphStroke.Parent = Paragraph

                -- ScrollingFrame
                local ScrollFrame = Instance.new("ScrollingFrame")
                ScrollFrame.BackgroundTransparency = 1
                ScrollFrame.BorderSizePixel = 0
                ScrollFrame.Size = UDim2.new(1, 0, 1, 0)
                ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
                ScrollFrame.ScrollBarThickness = 3
                ScrollFrame.ScrollBarImageColor3 = _G.Border
                ScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
                ScrollFrame.ZIndex = 4
                ScrollFrame.Parent = Paragraph

                -- Text Container
                local TextContainer = Instance.new("Frame")
                TextContainer.BackgroundTransparency = 1
                TextContainer.Position = UDim2.new(0, isMobileLayout and 10 or 14, 0, isMobileLayout and 10 or 12)
                TextContainer.Size = UDim2.new(1, isMobileLayout and -20 or -28, 0, 0)
                TextContainer.ZIndex = 4
                TextContainer.Parent = ScrollFrame

                -- Main Text
                local ParagraphText = Instance.new("TextLabel")
                ParagraphText.BackgroundTransparency = 1
                ParagraphText.Size = UDim2.new(1, 0, 0, 0)
                ParagraphText.Font = Enum.Font.Gotham
                ParagraphText.Text = text or ""
                ParagraphText.TextColor3 = textColor
                ParagraphText.TextSize = textSize
                ParagraphText.TextWrapped = true
                ParagraphText.TextXAlignment = Enum.TextXAlignment.Left
                ParagraphText.TextYAlignment = Enum.TextYAlignment.Top
                ParagraphText.RichText = richText
                ParagraphText.LineHeight = lineHeight
                ParagraphText.ZIndex = 5
                ParagraphText.Parent = TextContainer
                ParagraphText.AutomaticSize = Enum.AutomaticSize.Y

                -- Update function with multiple delay attempts
                local updateTimer = nil
                local function updateSize(immediate)
                    if updateTimer then
                        task.cancel(updateTimer)
                    end
                    
                    local function performUpdate()
                        -- Force TextBounds to update by temporarily changing a property
                        local oldSize = ParagraphText.TextSize
                        ParagraphText.TextSize = oldSize + 0.01
                        ParagraphText.TextSize = oldSize
                        
                        local textBounds = ParagraphText.TextBounds
                        local padding = isMobileLayout and 22 or 28
                        local requiredHeight = math.max(textBounds.Y + padding, isMobileLayout and 50 or 60)
                        local finalHeight = math.min(requiredHeight, maxHeight)
                        
                        ParagraphText.Size = UDim2.new(1, 0, 0, textBounds.Y)
                        TextContainer.Size = UDim2.new(1, 0, 0, textBounds.Y)
                        ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, textBounds.Y + padding)
                        Paragraph.Size = UDim2.new(0, elementWidth, 0, finalHeight)
                        ScrollFrame.ScrollBarThickness = (requiredHeight > maxHeight) and 3 or 0
                    end
                    
                    if immediate then
                        performUpdate()
                    else
                        updateTimer = task.delay(0.05, performUpdate)
                    end
                end
                
                -- Initial update
                updateSize(true)
                
                -- Connect signals
                ParagraphText:GetPropertyChangedSignal("Text"):Connect(function()
                    updateSize(false)
                end)
                ParagraphText:GetPropertyChangedSignal("TextSize"):Connect(function()
                    updateSize(true)
                end)
                ParagraphText:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                    updateSize(true)
                end)

                -- API with immediate updates
                local ParagraphAPI = {}
                
                local function forceUpdate()
                    updateSize(true)
                end
                
                function ParagraphAPI:Set(newText)
                    ParagraphText.Text = tostring(newText or "")
                    forceUpdate()
                    return ParagraphAPI
                end
                
                function ParagraphAPI:Get()
                    return ParagraphText.Text
                end
                
                function ParagraphAPI:SetColor(color)
                    ParagraphText.TextColor3 = color
                    return ParagraphAPI
                end
                
                function ParagraphAPI:SetTextSize(size)
                    ParagraphText.TextSize = size
                    return ParagraphAPI
                end
                
                function ParagraphAPI:SetLineHeight(height)
                    ParagraphText.LineHeight = height
                    forceUpdate()
                    return ParagraphAPI
                end
                
                function ParagraphAPI:SetRichText(enabled)
                    ParagraphText.RichText = enabled
                    forceUpdate()
                    return ParagraphAPI
                end
                
                function ParagraphAPI:AddText(newText)
                    ParagraphText.Text = ParagraphText.Text .. tostring(newText)
                    forceUpdate()
                    return ParagraphAPI
                end
                
                function ParagraphAPI:Clear()
                    ParagraphText.Text = ""
                    forceUpdate()
                    return ParagraphAPI
                end
                
                function ParagraphAPI:SetBackgroundColor(color)
                    Paragraph.BackgroundColor3 = color
                    return ParagraphAPI
                end
                
                function ParagraphAPI:SetBackgroundTransparency(transparency)
                    Paragraph.BackgroundTransparency = transparency
                    return ParagraphAPI
                end
                
                function ParagraphAPI:SetMaxHeight(height)
                    maxHeight = height
                    forceUpdate()
                    return ParagraphAPI
                end
                
                -- Gradient control
                function ParagraphAPI:SetGradient(colorInput, rotation)
                    local existing = Paragraph:FindFirstChildOfClass("UIGradient")
                    if not existing then
                        existing = Instance.new("UIGradient")
                        existing.Parent = Paragraph
                    end
                    
                    if typeof(colorInput) == "ColorSequence" then
                        existing.Color = colorInput
                    elseif typeof(colorInput) == "table" then
                        local keypoints = {}
                        for i, col in ipairs(colorInput) do
                            local alpha = (#colorInput > 1) and ((i - 1) / (#colorInput - 1)) or 0
                            table.insert(keypoints, ColorSequenceKeypoint.new(alpha, col))
                        end
                        existing.Color = ColorSequence.new(keypoints)
                    end
                    
                    existing.Rotation = rotation or existing.Rotation
                    Paragraph.BackgroundTransparency = 0
                    return ParagraphAPI
                end
                
                -- Formatting helpers
                function ParagraphAPI:AddHeader(text, level)
                    level = level or 1
                    local headerSize = (isMobileLayout and 14 or 16) - (level - 1) * 2
                    local headerText = string.format("\n<font size=\"%d\"><b>%s</b></font>\n", headerSize, text)
                    ParagraphText.Text = ParagraphText.Text .. headerText
                    forceUpdate()
                    return ParagraphAPI
                end
                
                function ParagraphAPI:AddListItem(text)
                    ParagraphText.Text = ParagraphText.Text .. "\n• " .. text
                    forceUpdate()
                    return ParagraphAPI
                end
                
                function ParagraphAPI:AddLineBreak()
                    ParagraphText.Text = ParagraphText.Text .. "\n"
                    forceUpdate()
                    return ParagraphAPI
                end
                
                function ParagraphAPI:AddSeparator()
                    ParagraphText.Text = ParagraphText.Text .. "\n────────────────\n"
                    forceUpdate()
                    return ParagraphAPI
                end
                
                function ParagraphAPI:AddCode(text)
                    ParagraphText.Text = ParagraphText.Text .. string.format('\n<font color="#60A5FA">`%s`</font>', text)
                    forceUpdate()
                    return ParagraphAPI
                end
                
                function ParagraphAPI:AddWarning(text)
                    ParagraphText.Text = ParagraphText.Text .. string.format('\n<font color="#FBBF24">⚠ %s</font>', text)
                    forceUpdate()
                    return ParagraphAPI
                end
                
                function ParagraphAPI:AddSuccess(text)
                    ParagraphText.Text = ParagraphText.Text .. string.format('\n<font color="#34D399">✓ %s</font>', text)
                    forceUpdate()
                    return ParagraphAPI
                end
                
                function ParagraphAPI:AddError(text)
                    ParagraphText.Text = ParagraphText.Text .. string.format('\n<font color="#F87171">× %s</font>', text)
                    forceUpdate()
                    return ParagraphAPI
                end

                return ParagraphAPI
            end

            return main
        end

        return uitab
    end

    function library:GetIcon(name)
        return GetIcon(name)
    end

end

return library
