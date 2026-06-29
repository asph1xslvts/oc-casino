-- install.lua - skachivaet vse fayly kazino s GitHub odnoy komandoy.
-- Zapusk: install
-- Menyay BRANCH i BASE pod svoy repozitoriy esli nuzhno.

local BASE = "https://raw.githubusercontent.com/asph1xslvts/oc-casino/main/"

-- spisok faylov: {put_na_github, kuda_sohranit_v_igre}
local files = {
    -- glavnye fayly
    {"opencasino.lua", "/home/opencasino.lua"},
    {"economy.lua",    "/home/economy.lua"},

    -- BIBLIOTEKI (nuzhny dlya raboty, klast v /usr/lib)
    {"lib/doubleBuffering.lua", "/usr/lib/doubleBuffering.lua"},
    {"lib/image.lua",           "/usr/lib/image.lua"},
    {"lib/advancedLua.lua",     "/usr/lib/advancedLua.lua"},
    {"lib/color.lua",           "/usr/lib/color.lua"},

    -- ikonki (dobav svoi .pic syuda)
    {"icons/gold_ingot.pic",       "/home/icons/gold_ingot.pic"},
    {"icons/diamond.pic",    "/home/icons/diamond.pic"},
    {"icons/nether_star.pic", "/home/icons/nether_star.pic"},
    {"icons/ender_eye.pic",      "/home/icons/ender_eye.pic"},
    {"icons/nitor.pic",      "/home/icons/nitor.pic"},
    {"icons/ruby.pic",      "/home/icons/ruby.pic"},
    {"icons/iron_ingot.pic",      "/home/icons/iron_ingot.pic"},
    {"icons/emerald.pic",      "/home/icons/emerald.pic"},
    {"icons/crystal_ingot.pic",      "/home/icons/crystal_ingot.pic"},
}

local fs = require("filesystem")

-- sozdaem papki esli ih net
if not fs.exists("/home/icons") then fs.makeDirectory("/home/icons") end
if not fs.exists("/usr/lib") then fs.makeDirectory("/usr/lib") end

print("=== Ustanovka kazino ===")
for _, f in ipairs(files) do
    local url = BASE .. f[1]
    local dest = f[2]
    -- udalyaem staryy fayl
    if fs.exists(dest) then fs.remove(dest) end
    print("Kachayu: " .. f[1])
    local ok = os.execute("wget -fq \"" .. url .. "\" " .. dest)
    if not ok then
        print("  OSHIBKA pri skachivanii " .. f[1])
    end
end
print("=== Gotovo! Zapusti: opencasino ===")
