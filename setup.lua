-- setupcasino.lua - skachivaet vse fayly kazino odnoy komandoy.
-- Zapusk: setupcasino

local fs = require("filesystem")

local BASE = "https://raw.githubusercontent.com/asph1xslvts/oc-casino/main/"

-- biblioteki s originalnyh repozitoriev IgorTimofeev (proverennye ssylki)
local LIBS = {
    {"https://raw.githubusercontent.com/IgorTimofeev/AdvancedLua/master/AdvancedLua.lua",     "/usr/lib/advancedLua.lua"},
    {"https://raw.githubusercontent.com/IgorTimofeev/Color/master/Color.lua",                 "/usr/lib/color.lua"},
    {"https://raw.githubusercontent.com/IgorTimofeev/DoubleBuffering/master/DoubleBuffering.lua", "/usr/lib/doubleBuffering.lua"},
    {"https://raw.githubusercontent.com/IgorTimofeev/Image/master/Image.lua",                 "/usr/lib/image.lua"},
    {"https://raw.githubusercontent.com/IgorTimofeev/Image/master/Image.lua",                 "/usr/lib/Image.lua"},
}

-- fayly kazino i ikonki s tvoego repozitoriya {na_github, kuda}
local FILES = {
    {"opencasino.lua", "/home/opencasino.lua"},
    {"economy.lua",    "/home/economy.lua"},
    {"icons/gold_ingot.pic",    "/home/icons/gold_ingot.pic"},
    {"icons/diamond.pic",       "/home/icons/diamond.pic"},
    {"icons/nether_star.pic",   "/home/icons/nether_star.pic"},
    {"icons/ender_eye.pic",     "/home/icons/ender_eye.pic"},
    {"icons/nitor.pic",         "/home/icons/nitor.pic"},
    {"icons/ruby.pic",          "/home/icons/ruby.pic"},
    {"icons/iron_ingot.pic",    "/home/icons/iron_ingot.pic"},
    {"icons/emerald.pic",       "/home/icons/emerald.pic"},
    {"icons/crystal_ingot.pic", "/home/icons/crystal_ingot.pic"},
}

if not fs.exists("/home/icons") then fs.makeDirectory("/home/icons") end
if not fs.exists("/usr/lib") then fs.makeDirectory("/usr/lib") end

local function download(url, dest)
    if fs.exists(dest) then fs.remove(dest) end
    local ok = os.execute("wget -fq \"" .. url .. "\" " .. dest)
    if ok then print("  OK   " .. dest)
    else print("  FAIL " .. dest) end
end

print("=== Библиотеки ===")
for _, l in ipairs(LIBS) do download(l[1], l[2]) end

print("=== Казино+иконки ===")
for _, f in ipairs(FILES) do download(BASE .. f[1], f[2]) end

print("=== Готово! запуск: opencasino ===")
