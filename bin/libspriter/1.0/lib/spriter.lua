-- Prism@Spriter
-- Not installed by default
-- Library for displaying Sprites

lib = {}

function lib.show(x,y,sprite)
    local lines = require("cc.strings").split(sprite,"\n")
    local sw, sh = term.getSize()
    if sh < y+#lines then
        y = sh-#lines
    end
    local width = 0
    for i, v in pairs(lines) do
        term.setCursorPos(x,y+i-1)
        if #v > width then
            width = #v
        end
        term.blit(v,v,v)
    end
    return y, width, #lines -- Width & Height
end

function lib.fshow(x,y,sprite_file)
    local f = fs.open(sprite_file,"r")
    local data = f.readAll()
    f.close()
    return lib.show(x,y,data)
    
end

return lib