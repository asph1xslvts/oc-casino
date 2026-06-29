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
    -- OCIF - format-modul dlya chteniya .pic.
    -- image.lua ishet ego po puti /lib/FormatModules/OCIF.lua (zahardkozheno)
    {"https://raw.githubusercontent.com/IgorTimofeev/Image/master/OCIF.lua", "/lib/FormatModules/OCIF.lua"},
    {"https://raw.githubusercontent.com/IgorTimofeev/Image/master/OCIF.lua", "/usr/lib/FormatModules/OCIF.lua"},
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

-- papki sozdayutsya avtomaticheski v funkcii download

local function download(url, dest)
    -- sozdaem roditelskuyu papku esli eyo net
    local dir = fs.path(dest)
    if dir and not fs.exists(dir) then
        fs.makeDirectory(dir)
    end
    if fs.exists(dest) then fs.remove(dest) end
    local ok = os.execute("wget -fq \"" .. url .. "\" " .. dest)
    if ok then print("  OK   " .. dest)
    else print("  FAIL " .. dest) end
end

print("=== Biblioteki ===")
for _, l in ipairs(LIBS) do download(l[1], l[2]) end

print("=== Kazino i ikonki ===")
for _, f in ipairs(FILES) do download(BASE .. f[1], f[2]) end

print("=== Gotovo! Zapusti: opencasino ===")
