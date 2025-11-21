local spriter = photon.lib.spriter

local x,y = term.getCursorPos()
local y,w,h = spriter.fshow(1, y+1,"/etc/arcfetch/sprite.spr")

function at(off, text)
    term.setCursorPos(x+w+1,y+off)
    term.write(text)
end

function label(off, lbl, text)
    term.setCursorPos(x+w+1,y+off)

    local before = term.getTextColor()
    term.setTextColor(colors.yellow)
    term.write(lbl)

    term.setTextColor(before)
    term.write(text)
end

local name = os.getComputerLabel()

if name == nil then
    name = "pc"
end
at(0, "photon@"..name)
at(1, "-------"..string.rep("-", #name))
label(2, "OS: ",os.version())
label(3, "Kernel: ", _G.photon_version)
local sw, sh = term.getSize()
label(4, "Resolution: ", sw.."x"..sh)
label(5, "ID: ", os.getComputerID())

-- Color Table
term.setCursorPos(x+w+1,y+7)
local a = "ffeeddccbbaa9988"
term.blit(a,a,a)
term.setCursorPos(x+w+1,y+8)
local b = "7766554433221100"
term.blit(b,b,b)

-- Fix Cursor
term.setCursorPos(1,y+h)
