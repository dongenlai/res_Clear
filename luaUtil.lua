#!/usr/bin/env lua5.3
local UtilRes = UtilRes or {}

--[[
    lua 路径匹配接口增值
    返回值 为print subprocess监听不同于return
]]

function UtilRes.propani(fname, prePath)
    prePath = prePath or ""
    local resultPath = UtilRes.checkFXPath(fname, "amodule/xlvalueadd/hallprop/propani_/"..prePath)
    print(resultPath ..".csb")
end

function UtilRes.nodeAddAni( name, node, isui, isloop, prePath)
    --local path = isui and "uiani_/" or "propani_/"
    prePath = prePath or ""
    local fPath = UtilRes.checkFXPath(name, "amodule/xlvalueadd/hallprop/".."uiani_/" .. prePath )
    local csbName =  fPath ..".csb"
    print(csbName)
    local fPath = UtilRes.checkFXPath(name, "amodule/xlvalueadd/hallprop/".."propani_/" .. prePath )
    local csbName =  fPath ..".csb"
    print(csbName)
end

--修正资源路径
function UtilRes.checkFXPath(fName, fPath )
    if string.find(fName,"ZZ_") == 1 then
        if string.find(fName,"ZZ_CardFX_") == 1 then
            return "amodule/xlvalueadd/Art_Resources/Effects/CardFX/" .. fName
        elseif string.find(fName,"ZZ_EmoticonFX_") == 1 or string.find(fName,"ZZ_EFX_") == 1 then
            return "amodule/xlvalueadd/Art_Resources/Effects/EmoticonFX/" .. fName
        elseif string.find(fName,"ZZ_UIFX_") == 1 then
            return "amodule/xlvalueadd/Art_Resources/Effects/UIFX/" .. fName
        end
    end
    return fPath .. fName
end

local function doStart(arg)
    local file = arg[1]
    local flag =arg[2]
    if flag == "propani" then
        UtilRes.propani(file)
    elseif flag == "nodeAddAni" then
        UtilRes.nodeAddAni(file)
    end
end

doStart(arg)